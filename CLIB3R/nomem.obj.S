Module: nomem
GROUP: 'DGROUP' CONST,CONST2,_DATA

Segment: _TEXT BYTE USE32 00000012 bytes
0000				_Not_Enough_Memory_:
0000  52				push		edx
0001  BA 01 00 00 00			mov		edx,0x00000001
0006  B8 00 00 00 00			mov		eax,offset DGROUP:L$1
000B  E8 00 00 00 00			call		__fatal_runtime_error_
0010  5A				pop		edx
0011  C3				ret		

Routine Size: 18 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000014 bytes
0000				L$1:
0000  4E 6F 74 20 65 6E 6F 75 67 68 20 6D 65 6D 6F 72 Not enough memor
0010  79 0D 0A 00                                     y...

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

