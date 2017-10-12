Module: utolower
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000000E bytes
0000				_utolower_:
0000  83 F8 41				cmp		eax,0x00000041
0003  7C 08				jl		L$1
0005  83 F8 5A				cmp		eax,0x0000005a
0008  7F 03				jg		L$1
000A  83 C0 20				add		eax,0x00000020
000D				L$1:
000D  C3				ret		

Routine Size: 14 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

