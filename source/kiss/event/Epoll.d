﻿/*
 * Kiss - A simple base net library
 *
 * Copyright (C) 2017 Shanghai Putao Technology Co., Ltd 
 *
 * Developer: putao's Dlang team
 *
 * Licensed under the Apache-2.0 License.
 *
 */

module kiss.event.Epoll;

import kiss.event.Event;
import kiss.event.Poll;
import kiss.time.Timer;
import KissRpc.Logs;

import std.conv;
import std.stdio;
import std.string;

import core.thread;
import core.stdc.errno;
import core.stdc.string;

version(linux):
extern(C){
	alias int c_int;
	alias uint uint32_t;
	alias ulong uint64_t;
	
	union epoll_data {
		void	*ptr;
		int	  fd;
		uint32_t u32;
		uint64_t u64;
	}
	
	align(1) struct epoll_event {
	align(1):uint32_t   events;	/* Epoll events */
			epoll_data data;	  /* User data variable */
	}
	
	enum EPOLL_CTL_ADD = 1;
	enum EPOLL_CTL_DEL = 2;
	enum EPOLL_CTL_MOD = 3;
	
	
	import std.conv : octal;
	enum {
		EPOLL_CLOEXEC = octal!"2000000",
		EPOLL_NONBLOCK = octal!"4000"
	}
	
	enum EPOLL_EVENTS {
		EPOLLIN = 0x001,
		EPOLLPRI = 0x002,
		EPOLLOUT = 0x004,
		EPOLLRDNORM = 0x040,
		EPOLLRDBAND = 0x080,
		EPOLLWRNORM = 0x100,
		EPOLLWRBAND = 0x200,
		EPOLLMSG = 0x400,
		EPOLLERR = 0x008,
		EPOLLHUP = 0x010,
		EPOLLRDHUP = 0x2000,
		EPOLLONESHOT = (1 << 30),
		EPOLLET = (1 << 31)
	}
	
	int epoll_create1(int flags);
	int epoll_ctl(int epfd, int op, int fd, epoll_event* event);
	int epoll_wait(int epfd, epoll_event* events, int maxevents, int
		timeout);
	int close(int fd);
	
	import core.sys.posix.sys.time;
}



final class Epoll :Thread , Poll 
{
	this(int timeout = -1)
	{
		_efd = epoll_create1(0);
		if(_efd == -1)
		{
			int err = errno();
			string errstr = cast(string)fromStringz(strerror(err));
			logFatal(errstr ~ " errno:" ~ to!string(err));
		}
		_timeout = timeout;
		_wheeltimer = new WheelTimer();
		super(&run);
	}



	~this()
	{
		close(_efd);
		_wheeltimer.destroy();
	}

	TimerFd addTimer(Timer timer , ulong interval , WheelType type)
	{
		stNodeLink st = new stNodeLink(timer , interval ,type);
		_wheeltimer.add(st);
		return st;
	}

	void delTimer(TimerFd fd)
	{
		_wheeltimer.del(cast(stNodeLink)fd);
	}

	bool opEvent(Event event  , int fd, int op , int type)
	{
		epoll_event ev;
		uint mask = 0;
		if(type & IOEventType.IO_EVENT_READ) mask |= EPOLL_EVENTS.EPOLLIN;
		if(type & IOEventType.IO_EVENT_WRITE) mask |= EPOLL_EVENTS.EPOLLOUT;
		if(type & IOEventType.IO_EVENT_ERROR) mask |= EPOLL_EVENTS.EPOLLERR; 

		ev.events = mask;

		if(op == EPOLL_CTL_ADD)
		{
			//assert(fd !in _mapEvents);			
			_mapEvents[fd]  = event;
		}
		else if(op == EPOLL_CTL_DEL)
		{
			//assert(fd in _mapEvents);			
			_mapEvents.remove(fd);
		}
		else
		{
			//assert(fd in _mapEvents);
		}

		ev.data.ptr = cast(void *)event;

	


		if(epoll_ctl(_efd , op , fd , &ev) < 0)
		{
			int err = errno();
			string errstr = cast(string)fromStringz(strerror(err));
			logFatal( to!string(op) ~ errstr ~ " errno:" ~ to!string(err));
			return false;
		}
		
		
		return true;
	}

	bool addEvent(Event event , int fd ,  IOEventType type) 
	{
		return opEvent(event , fd ,  EPOLL_CTL_ADD , type);
	}

	bool delEvent(Event event , int fd , IOEventType type)
	{
		return opEvent(event , fd , EPOLL_CTL_DEL , type);
	}

	bool modEvent(Event event , int fd , IOEventType type)
	{
		return opEvent(event ,fd ,  EPOLL_CTL_MOD , type);
	}

	void start()
	{
		if(_flag)
		{
			logWarning("already started");
			return ;
		}
		_flag = true;

		super.start();

	}


	void run()
	{
		while(_flag)
			poll(_timeout);
	}


	void stop()
	{
		_flag = false;
	}


	void wait()
	{
		super.join();
	}


	bool poll(int milltimeout)
	{

		scope(exit) _wheeltimer.poll();

		int result = epoll_wait(_efd , _pollEvents.ptr , _pollEvents.length , milltimeout);
		if(result < 0)
		{
			int err = errno();
			if(err == EINTR)
				return true;

			string errstr = cast(string)fromStringz(strerror(err));
			logFatal(errstr ~ " errno:" ~ to!string(err));
			return false;
		}
		else if(result == 0)
		{
			return true;
		}

	

		for(int i = 0 ; i < result ; i++)
		{
		
			Event event = cast(Event)_pollEvents[i].data.ptr;

			if(event.isReadyClose())
			{	
				if(event.onClose())
					delete event;
				continue;
			}

			uint mask = _pollEvents[i].events;

			if(mask &( EPOLL_EVENTS.EPOLLERR | EPOLL_EVENTS.EPOLLHUP))
			{
				if(event.onClose())
					delete event;
				continue;
			}

			if(mask & EPOLL_EVENTS.EPOLLIN)
			{
				if(!event.onRead())
				{
					if(event.onClose())
						delete event;
					continue;
				}
			}

			if(mask & EPOLL_EVENTS.EPOLLOUT)
			{
				if(!event.onWrite())
				{
					if(event.onClose())
						delete event;
					continue;
				}
			}
		}
		return true;
	}


	private Event[int]  		_mapEvents;					//only for save. not gc.
	private	bool				_flag;
	private int					_timeout;
	private int 				_efd;
	private epoll_event[256] 	_pollEvents;
	private WheelTimer			_wheeltimer;
}


