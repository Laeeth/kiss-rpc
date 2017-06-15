﻿module IDL.idl_parse_interface;

import std.array;
import std.regex;
import std.conv;
import std.stdio;
import std.array : appender;
import std.format;

import IDL.idl_base_interface;
import IDL.idl_unit;
import IDL.idl_inerface_create_code;
import IDL.idl_parse_struct;

class function_arg
{
	this(string type, string var)
	{
		type_name = type;
		var_name = var;

		writefln("function argument: %s:%s", var_name, type_name);
	}


	string get_struct_var_name()
	{
		auto struct_interface = idl_struct_list.get(type_name, null);
		
		if(struct_interface !is null)
		{
			auto strings = appender!string();
			
			foreach(k,v ;struct_interface.member_attr_info)
			{
				formattedWrite(strings, "%s.%s, ", this.var_name, v.member_name);
			}
			
			return strings.data;

		}else
		{
			return var_name;
		}
	}

	string get_var_name()
	{
		return var_name;
	}

	string get_type_name()
	{
		return type_name;
	}

public:
	string type_name;
	string var_name;
}

class function_attr
{
	this(string flag_attr, string func_tlp)
	{
		this.flag = flag_attr;

		auto format_func_tlp = replaceAll(func_tlp, regex(`\(|\)`), " ");

		format_func_tlp = replaceAll(format_func_tlp, regex(`\,`),"");
		format_func_tlp = replaceAll(format_func_tlp, regex(`^\s*`), "");
		format_func_tlp = replaceAll(format_func_tlp, regex(`\s*$`), "");

		auto func_tlp_list = split(format_func_tlp, " ");

		if(func_tlp_list.length < 4 && func_tlp_list.length % 2 == 0)
		{
			throw new Exception("parse function arguments is failed, " ~ func_tlp);
		}

		ret_type = func_tlp_list[0];
		func_name = func_tlp_list[1];

		int func_arg_index = 0;
		writeln("********************************");
		writefln("function name:%s, return value:%s", func_name, ret_type);

		for(int i = 2; i<func_tlp_list.length; i+=2)
		{
			func_arg_map[func_arg_index++] = new function_arg(func_tlp_list[i], func_tlp_list[i+1]);
		}

		writeln("********************************\n");
	}

	string get_func_name()
	{
		return this.func_name;
	}

public:
	string flag;
	string ret_type;
	string func_name;

	function_arg[int] func_arg_map;
}

class idl_parse_interface : idl_base_interface
{
	bool parse(string name, string struct_bodys)
	{
		this.interface_name = name;

		auto  member_attr_list  = split(struct_bodys, ";");

		if(member_attr_list.length < 1)
		{
			throw new Exception("parse service member attr is failed, " ~ struct_bodys);
		}

		writeln("----------------------------");
		writefln("serivce name:%s", name);

		foreach(attr; member_attr_list)
		{
			auto member = split(attr, ":");
			
			if(member.length > 1)
			{
				string 	flag = member[0];
				string func_tlp = member[1];

				function_list[func_index++] = new function_attr(member[0], member[1]);
			}
		}

		writeln("----------------------------\n\n");
	
		return true;
	}

	string get_name()
	{
		return this.interface_name;
	}

	string create_server_code_for_language(CODE_LANGUAGE language)
	{
		string code_text;

		switch(language)
		{
			case CODE_LANGUAGE.CL_CPP:break;
			case CODE_LANGUAGE.CL_DLANG: code_text = idl_inerface_dlang_code.create_server_code(this); break;
			case CODE_LANGUAGE.CL_GOLANG:break;
			case CODE_LANGUAGE.CL_JAVA:break;
			
			default:
				new Exception("language is not exits!!");
		}

		return code_text;
	}


public:
	int func_index;
	string interface_name;
	function_attr[int] function_list;
}