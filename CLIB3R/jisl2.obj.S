Module: jisl2
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002C bytes
0000				jisl2_:
0000  52				push		edx
0001  31 D2				xor		edx,edx
0003  66 89 C2				mov		dx,ax
0006  89 D0				mov		eax,edx
0008  E8 00 00 00 00			call		jiszen_
000D  85 C0				test		eax,eax
000F  74 17				je		L$1
0011  81 FA 9F 98 00 00			cmp		edx,0x0000989f
0017  7C 0F				jl		L$1
0019  81 FA 9E EA 00 00			cmp		edx,0x0000ea9e
001F  7F 07				jg		L$1
0021  B8 01 00 00 00			mov		eax,0x00000001
0026  5A				pop		edx
0027  C3				ret		
0028				L$1:
0028  31 C0				xor		eax,eax
002A  5A				pop		edx
002B  C3				ret		

Routine Size: 44 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

