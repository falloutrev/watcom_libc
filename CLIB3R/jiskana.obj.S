Module: jiskana
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000023 bytes
0000				jiskana_:
0000  25 FF FF 00 00			and		eax,0x0000ffff
0005  3D 40 83 00 00			cmp		eax,0x00008340
000A  7C 14				jl		L$1
000C  3D 96 83 00 00			cmp		eax,0x00008396
0011  7F 0D				jg		L$1
0013  3D 7F 83 00 00			cmp		eax,0x0000837f
0018  74 06				je		L$1
001A  B8 01 00 00 00			mov		eax,0x00000001
001F  C3				ret		
0020				L$1:
0020  31 C0				xor		eax,eax
0022  C3				ret		

Routine Size: 35 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

