Module: fdc386
GROUP: 'DGROUP' _DATA

Segment: _TEXT WORD USE32 00000038 bytes
0000				__FDC:
0000  55				push		ebp
0001  F7 C2 00 00 F0 7F			test		edx,0x7ff00000
0007  75 02				jne		L$1
0009  29 D2				sub		edx,edx
000B				L$1:
000B  F7 C1 00 00 F0 7F			test		ecx,0x7ff00000
0011  75 02				jne		L$2
0013  29 C9				sub		ecx,ecx
0015				L$2:
0015  89 CD				mov		ebp,ecx
0017  31 D5				xor		ebp,edx
0019  BD 00 00 00 00			mov		ebp,0x00000000
001E  78 0C				js		L$4
0020  39 CA				cmp		edx,ecx
0022  75 02				jne		L$3
0024  39 D8				cmp		eax,ebx
0026				L$3:
0026  74 0C				je		L$5
0028  D1 D9				rcr		ecx,0x01
002A  31 CA				xor		edx,ecx
002C				L$4:
002C  01 D2				add		edx,edx
002E  83 DD 00				sbb		ebp,0x00000000
0031  01 ED				add		ebp,ebp
0033  45				inc		ebp
0034				L$5:
0034  89 E8				mov		eax,ebp
0036  5D				pop		ebp
0037  C3				ret		

Routine Size: 56 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes

