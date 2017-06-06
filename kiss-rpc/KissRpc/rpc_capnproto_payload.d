//Generated by Cap'n Proto compiler, DO NOT EDIT.
//source: kiss-capnp-buf.capnp

module KissRpc.rpc_capnproto_payload;

import capnproto;

struct ArgsType
{
public:
	static immutable structSize = cast(immutable)StructSize(1, 1);
	
	static struct Builder
	{
	public:
		this(SegmentBuilder* segment, int data, int pointers, int dataSize, short pointerCount)
		{
			b = StructBuilder(segment, data, pointers, dataSize, pointerCount);
		}
		
		
		auto asReader()
		{
			return b.asReader!Reader();
		}
		
		.ArgsType.Type getType()
		{
			switch(b._getUshortField(0))
			{
				case 0: return .ArgsType.Type.tVoid;
				case 1: return .ArgsType.Type.tBool;
				case 2: return .ArgsType.Type.tByte;
				case 3: return .ArgsType.Type.tShort;
				case 4: return .ArgsType.Type.tInt;
				case 5: return .ArgsType.Type.tLong;
				case 6: return .ArgsType.Type.tUbyte;
				case 7: return .ArgsType.Type.tUshort;
				case 8: return .ArgsType.Type.tUint;
				case 9: return .ArgsType.Type.tUlong;
				case 10: return .ArgsType.Type.tFloat;
				case 11: return .ArgsType.Type.tDouble;
				case 12: return .ArgsType.Type.tReal;
				case 13: return .ArgsType.Type.tChar;
				case 14: return .ArgsType.Type.tWchar;
				case 15: return .ArgsType.Type.tDchar;
				case 16: return .ArgsType.Type.tClass;
				case 17: return .ArgsType.Type.string;
				default: return .ArgsType.Type._NOT_IN_SCHEMA;
			}
		}
		void setType(.ArgsType.Type value)
		{
			b._setShortField(0, cast(ushort)value);
		}
		
		bool hasPayload()
		{
			return !b._pointerFieldIsNull(0);
		}
		Text.Builder getPayload()
		{
			return b._getPointerField!Text(0, null, 0, 0);
		}
		void setPayload(Text.Reader value)
		{
			b._setPointerField!Text(0, value);
		}
		void setPayload(string value)
		{
			b._setPointerField!Text(0, Text.Reader(value));
		}
		Text.Builder initPayload(int size)
		{
			return b._initPointerField!Text(0, size);
		}
		
	public:
		StructBuilder b;
	}
	
	static struct Reader
	{
	public:
		this(SegmentReader* segment, int data, int pointers, int dataSize, short pointerCount, int nestingLimit)
		{
			b = StructReader(segment, data, pointers, dataSize, pointerCount, nestingLimit);
		}
		
		.ArgsType.Type getType()
		{
			switch(b._getUshortField(0))
			{
				case 0: return .ArgsType.Type.tVoid;
				case 1: return .ArgsType.Type.tBool;
				case 2: return .ArgsType.Type.tByte;
				case 3: return .ArgsType.Type.tShort;
				case 4: return .ArgsType.Type.tInt;
				case 5: return .ArgsType.Type.tLong;
				case 6: return .ArgsType.Type.tUbyte;
				case 7: return .ArgsType.Type.tUshort;
				case 8: return .ArgsType.Type.tUint;
				case 9: return .ArgsType.Type.tUlong;
				case 10: return .ArgsType.Type.tFloat;
				case 11: return .ArgsType.Type.tDouble;
				case 12: return .ArgsType.Type.tReal;
				case 13: return .ArgsType.Type.tChar;
				case 14: return .ArgsType.Type.tWchar;
				case 15: return .ArgsType.Type.tDchar;
				case 16: return .ArgsType.Type.tClass;
				case 17: return .ArgsType.Type.string;
				default: return .ArgsType.Type._NOT_IN_SCHEMA;
			}
		}
		
		bool hasPayload()
		{
			return !b._pointerFieldIsNull(0);
		}
		string getPayload()
		{
			return b._getPointerField!Text(0, null, 0, 0).toString();
		}
		
	public:
		StructReader b;
	}
	
	enum Type : ushort
	{
		tVoid,
		tBool,
		tByte,
		tShort,
		tInt,
		tLong,
		tUbyte,
		tUshort,
		tUint,
		tUlong,
		tFloat,
		tDouble,
		tReal,
		tChar,
		tWchar,
		tDchar,
		tClass,
		string,
		_NOT_IN_SCHEMA,
	}
	
}

struct Payload
{
public:
	static immutable structSize = cast(immutable)StructSize(0, 3);
	
	static struct Builder
	{
	public:
		this(SegmentBuilder* segment, int data, int pointers, int dataSize, short pointerCount)
		{
			b = StructBuilder(segment, data, pointers, dataSize, pointerCount);
		}
		
		
		auto asReader()
		{
			return b.asReader!Reader();
		}
		
		bool hasCallInterface()
		{
			return !b._pointerFieldIsNull(0);
		}
		Text.Builder getCallInterface()
		{
			return b._getPointerField!Text(0, null, 0, 0);
		}
		void setCallInterface(Text.Reader value)
		{
			b._setPointerField!Text(0, value);
		}
		void setCallInterface(string value)
		{
			b._setPointerField!Text(0, Text.Reader(value));
		}
		Text.Builder initCallInterface(int size)
		{
			return b._initPointerField!Text(0, size);
		}
		
		bool hasArgs()
		{
			return !b._pointerFieldIsNull(1);
		}
		StructList!(.ArgsType).Builder getArgs()
		{
			return b._getPointerField!(StructList!(.ArgsType))(1, null, 0);
		}
		void setArgs(StructList!(.ArgsType).Reader value)
		{
			b._setPointerField!(StructList!(.ArgsType))(1, value);
		}
		StructList!(.ArgsType).Builder initArgs(int size)
		{
			return b._initPointerField!(StructList!(.ArgsType))(1, size);
		}
		
		bool hasStatusString()
		{
			return !b._pointerFieldIsNull(2);
		}
		Text.Builder getStatusString()
		{
			return b._getPointerField!Text(2, null, 0, 0);
		}
		void setStatusString(Text.Reader value)
		{
			b._setPointerField!Text(2, value);
		}
		void setStatusString(string value)
		{
			b._setPointerField!Text(2, Text.Reader(value));
		}
		Text.Builder initStatusString(int size)
		{
			return b._initPointerField!Text(2, size);
		}
		
	public:
		StructBuilder b;
	}
	
	static struct Reader
	{
	public:
		this(SegmentReader* segment, int data, int pointers, int dataSize, short pointerCount, int nestingLimit)
		{
			b = StructReader(segment, data, pointers, dataSize, pointerCount, nestingLimit);
		}
		
		bool hasCallInterface()
		{
			return !b._pointerFieldIsNull(0);
		}
		string getCallInterface()
		{
			return b._getPointerField!Text(0, null, 0, 0).toString();
		}
		
		bool hasArgs()
		{
			return !b._pointerFieldIsNull(1);
		}
		StructList!(.ArgsType).Reader getArgs()
		{
			return b._getPointerField!(StructList!(.ArgsType))(1, null, 0);
		}
		
		bool hasStatusString()
		{
			return !b._pointerFieldIsNull(2);
		}
		string getStatusString()
		{
			return b._getPointerField!Text(2, null, 0, 0).toString();
		}
		
	public:
		StructReader b;
	}
	
}

struct Schemas
{
public:
	__gshared static SegmentReader b_d947381878985c3c = GeneratedClassSupport.decodeRawBytes([
			0x0,0x0,0x0,0x0,0x5,0x0,0x6,0x0,
			0x3c,0x5c,0x98,0x78,0x18,0x38,0x47,0xd9,
			0x22,0x0,0x0,0x0,0x1,0x0,0x1,0x0,
			0xc6,0x41,0xec,0xa9,0x26,0xb5,0x50,0x94,
			0x1,0x0,0x7,0x0,0x0,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x15,0x0,0x0,0x0,0x5a,0x1,0x0,0x0,
			0x29,0x0,0x0,0x0,0x17,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x31,0x0,0x0,0x0,0x77,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x2f,0x72,0x6f,0x6f,0x74,0x2f,0xe6,0xa1,
			0x8c,0xe9,0x9d,0xa2,0x2f,0x6b,0x69,0x73,
			0x73,0x2d,0x63,0x61,0x70,0x6e,0x70,0x2d,
			0x62,0x75,0x66,0x2e,0x63,0x61,0x70,0x6e,
			0x70,0x3a,0x41,0x72,0x67,0x73,0x54,0x79,
			0x70,0x65,0x0,0x0,0x0,0x0,0x0,0x0,
			0x4,0x0,0x0,0x0,0x1,0x0,0x1,0x0,
			0xb,0xd9,0xa0,0x2d,0xe9,0x1f,0x8c,0xf7,
			0x1,0x0,0x0,0x0,0x2a,0x0,0x0,0x0,
			0x54,0x79,0x70,0x65,0x0,0x0,0x0,0x0,
			0x8,0x0,0x0,0x0,0x3,0x0,0x4,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x0,0x0,0x1,0x0,0x0,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x29,0x0,0x0,0x0,0x2a,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x24,0x0,0x0,0x0,0x3,0x0,0x1,0x0,
			0x30,0x0,0x0,0x0,0x2,0x0,0x1,0x0,
			0x1,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x0,0x0,0x1,0x0,0x1,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x2d,0x0,0x0,0x0,0x42,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x28,0x0,0x0,0x0,0x3,0x0,0x1,0x0,
			0x34,0x0,0x0,0x0,0x2,0x0,0x1,0x0,
			0x74,0x79,0x70,0x65,0x0,0x0,0x0,0x0,
			0xf,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0xb,0xd9,0xa0,0x2d,0xe9,0x1f,0x8c,0xf7,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0xf,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x70,0x61,0x79,0x6c,0x6f,0x61,0x64,0x0,
			0xc,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0xc,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
		]);
	__gshared static SegmentReader b_f78c1fe92da0d90b = GeneratedClassSupport.decodeRawBytes([
			0x0,0x0,0x0,0x0,0x5,0x0,0x6,0x0,
			0xb,0xd9,0xa0,0x2d,0xe9,0x1f,0x8c,0xf7,
			0x2b,0x0,0x0,0x0,0x2,0x0,0x0,0x0,
			0x3c,0x5c,0x98,0x78,0x18,0x38,0x47,0xd9,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x15,0x0,0x0,0x0,0x82,0x1,0x0,0x0,
			0x29,0x0,0x0,0x0,0x7,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x25,0x0,0x0,0x0,0xb7,0x1,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x2f,0x72,0x6f,0x6f,0x74,0x2f,0xe6,0xa1,
			0x8c,0xe9,0x9d,0xa2,0x2f,0x6b,0x69,0x73,
			0x73,0x2d,0x63,0x61,0x70,0x6e,0x70,0x2d,
			0x62,0x75,0x66,0x2e,0x63,0x61,0x70,0x6e,
			0x70,0x3a,0x41,0x72,0x67,0x73,0x54,0x79,
			0x70,0x65,0x2e,0x54,0x79,0x70,0x65,0x0,
			0x0,0x0,0x0,0x0,0x1,0x0,0x1,0x0,
			0x48,0x0,0x0,0x0,0x1,0x0,0x2,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0xd1,0x0,0x0,0x0,0x32,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x1,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0xc9,0x0,0x0,0x0,0x32,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x2,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0xc1,0x0,0x0,0x0,0x32,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x3,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0xb9,0x0,0x0,0x0,0x3a,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x4,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0xb1,0x0,0x0,0x0,0x2a,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x5,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0xa9,0x0,0x0,0x0,0x32,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x6,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0xa1,0x0,0x0,0x0,0x3a,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x7,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x99,0x0,0x0,0x0,0x42,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x8,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x91,0x0,0x0,0x0,0x32,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x9,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x89,0x0,0x0,0x0,0x3a,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0xa,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x81,0x0,0x0,0x0,0x3a,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0xb,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x79,0x0,0x0,0x0,0x42,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0xc,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x71,0x0,0x0,0x0,0x32,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0xd,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x69,0x0,0x0,0x0,0x32,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0xe,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x61,0x0,0x0,0x0,0x3a,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0xf,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x59,0x0,0x0,0x0,0x3a,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x10,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x51,0x0,0x0,0x0,0x3a,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x11,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x49,0x0,0x0,0x0,0x3a,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x74,0x56,0x6f,0x69,0x64,0x0,0x0,0x0,
			0x74,0x42,0x6f,0x6f,0x6c,0x0,0x0,0x0,
			0x74,0x42,0x79,0x74,0x65,0x0,0x0,0x0,
			0x74,0x53,0x68,0x6f,0x72,0x74,0x0,0x0,
			0x74,0x49,0x6e,0x74,0x0,0x0,0x0,0x0,
			0x74,0x4c,0x6f,0x6e,0x67,0x0,0x0,0x0,
			0x74,0x55,0x62,0x79,0x74,0x65,0x0,0x0,
			0x74,0x55,0x73,0x68,0x6f,0x72,0x74,0x0,
			0x74,0x55,0x69,0x6e,0x74,0x0,0x0,0x0,
			0x74,0x55,0x6c,0x6f,0x6e,0x67,0x0,0x0,
			0x74,0x46,0x6c,0x6f,0x61,0x74,0x0,0x0,
			0x74,0x44,0x6f,0x75,0x62,0x6c,0x65,0x0,
			0x74,0x52,0x65,0x61,0x6c,0x0,0x0,0x0,
			0x74,0x43,0x68,0x61,0x72,0x0,0x0,0x0,
			0x74,0x57,0x63,0x68,0x61,0x72,0x0,0x0,
			0x74,0x44,0x63,0x68,0x61,0x72,0x0,0x0,
			0x74,0x43,0x6c,0x61,0x73,0x73,0x0,0x0,
			0x73,0x74,0x72,0x69,0x6e,0x67,0x0,0x0,
		]);
	__gshared static SegmentReader b_82ee7a1398d1fa2b = GeneratedClassSupport.decodeRawBytes([
			0x0,0x0,0x0,0x0,0x5,0x0,0x6,0x0,
			0x2b,0xfa,0xd1,0x98,0x13,0x7a,0xee,0x82,
			0x22,0x0,0x0,0x0,0x1,0x0,0x0,0x0,
			0xc6,0x41,0xec,0xa9,0x26,0xb5,0x50,0x94,
			0x3,0x0,0x7,0x0,0x0,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x15,0x0,0x0,0x0,0x52,0x1,0x0,0x0,
			0x29,0x0,0x0,0x0,0x7,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x25,0x0,0x0,0x0,0xaf,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x2f,0x72,0x6f,0x6f,0x74,0x2f,0xe6,0xa1,
			0x8c,0xe9,0x9d,0xa2,0x2f,0x6b,0x69,0x73,
			0x73,0x2d,0x63,0x61,0x70,0x6e,0x70,0x2d,
			0x62,0x75,0x66,0x2e,0x63,0x61,0x70,0x6e,
			0x70,0x3a,0x50,0x61,0x79,0x6c,0x6f,0x61,
			0x64,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x1,0x0,0x1,0x0,
			0xc,0x0,0x0,0x0,0x3,0x0,0x4,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x0,0x0,0x1,0x0,0x0,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x45,0x0,0x0,0x0,0x72,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x44,0x0,0x0,0x0,0x3,0x0,0x1,0x0,
			0x50,0x0,0x0,0x0,0x2,0x0,0x1,0x0,
			0x1,0x0,0x0,0x0,0x1,0x0,0x0,0x0,
			0x0,0x0,0x1,0x0,0x1,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x4d,0x0,0x0,0x0,0x2a,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x48,0x0,0x0,0x0,0x3,0x0,0x1,0x0,
			0x64,0x0,0x0,0x0,0x2,0x0,0x1,0x0,
			0x2,0x0,0x0,0x0,0x2,0x0,0x0,0x0,
			0x0,0x0,0x1,0x0,0x2,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x61,0x0,0x0,0x0,0x6a,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x60,0x0,0x0,0x0,0x3,0x0,0x1,0x0,
			0x6c,0x0,0x0,0x0,0x2,0x0,0x1,0x0,
			0x63,0x61,0x6c,0x6c,0x49,0x6e,0x74,0x65,
			0x72,0x66,0x61,0x63,0x65,0x0,0x0,0x0,
			0xc,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0xc,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x61,0x72,0x67,0x73,0x0,0x0,0x0,0x0,
			0xe,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x3,0x0,0x1,0x0,
			0x10,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x3c,0x5c,0x98,0x78,0x18,0x38,0x47,0xd9,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0xe,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x73,0x74,0x61,0x74,0x75,0x73,0x53,0x74,
			0x72,0x69,0x6e,0x67,0x0,0x0,0x0,0x0,
			0xc,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0xc,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
		]);
}
