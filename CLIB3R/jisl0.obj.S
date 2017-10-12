Module: jisl0
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000024 bytes
0000				jisl0_:
0000  52				push		edx
0001  31 D2				xor		edx,edx
0003  66 89 C2				mov		dx,ax
0006  89 D0				mov		eax,edx
0008  E8 00 00 00 00			call		jiszen_
000D  85 C0				test		eax,eax
000F  74 0F				je		L$1
0011  81 FA 9E 88 00 00			cmp		edx,0x0000889e
0017  7F 07				jg		L$1
0019  B8 01 00 00 00			mov		eax,0x00000001
001E  5A				pop		edx
001F  C3				ret		
0020				L$1:
0020  31 C0				xor		eax,eax
0022  5A				pop		edx
0023  C3				ret		

Routine Size: 36 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

