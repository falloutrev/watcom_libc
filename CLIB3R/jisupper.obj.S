Module: jisupper
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001C bytes
0000				jisupper_:
0000  25 FF FF 00 00			and		eax,0x0000ffff
0005  3D 60 82 00 00			cmp		eax,0x00008260
000A  7C 0D				jl		L$1
000C  3D 79 82 00 00			cmp		eax,0x00008279
0011  7F 06				jg		L$1
0013  B8 01 00 00 00			mov		eax,0x00000001
0018  C3				ret		
0019				L$1:
0019  31 C0				xor		eax,eax
001B  C3				ret		

Routine Size: 28 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

