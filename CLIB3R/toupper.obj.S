Module: toupper
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000000E bytes
0000				_toupper_:
0000				toupper_:
0000  83 F8 61				cmp		eax,0x00000061
0003  7C 08				jl		L$1
0005  83 F8 7A				cmp		eax,0x0000007a
0008  7F 03				jg		L$1
000A  83 E8 20				sub		eax,0x00000020
000D				L$1:
000D  C3				ret		

Routine Size: 14 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

