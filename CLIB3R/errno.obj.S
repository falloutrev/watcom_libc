Module: errno
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000014 bytes
0000				__get_errno_ptr_:
0000  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0006  83 C0 04				add		eax,0x00000004
0009  C3				ret		

Routine Size: 10 bytes,    Routine Base: _TEXT + 0000

000A				__get_doserrno_ptr_:
000A  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0010  83 C0 08				add		eax,0x00000008
0013  C3				ret		

Routine Size: 10 bytes,    Routine Base: _TEXT + 000A

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

