Module: i4fd386
GROUP: 'DGROUP' _DATA

Segment: _TEXT WORD USE32 00000040 bytes
0000				__I4FD:
0000  09 C0				or		eax,eax
0002  79 09				jns		__U4FD
0004  F7 D8				neg		eax
0006  BA FF 0B 00 00			mov		edx,0x00000bff
000B  EB 05				jmp		L$1

Routine Size: 13 bytes,    Routine Base: _TEXT + 0000

000D				__U4FD:
000D  BA FF 03 00 00			mov		edx,0x000003ff
0012				L$1:
0012  09 C0				or		eax,eax
0014  74 27				je		L$2
0016  51				push		ecx
0017  0F BD C8				bsr		ecx,eax
001A  88 CD				mov		ch,cl
001C  B1 1F				mov		cl,0x1f
001E  28 E9				sub		cl,ch
0020  D3 E0				shl		eax,cl
0022  01 C0				add		eax,eax
0024  88 E9				mov		cl,ch
0026  0F B6 CD				movzx		ecx,ch
0029  01 D1				add		ecx,edx
002B  89 C2				mov		edx,eax
002D  81 E2 00 F0 FF FF			and		edx,0xfffff000
0033  09 CA				or		edx,ecx
0035  C1 CA 0C				ror		edx,0x0c
0038  C1 E0 14				shl		eax,0x14
003B  59				pop		ecx
003C  C3				ret		
003D				L$2:
003D  29 D2				sub		edx,edx
003F  C3				ret		

Routine Size: 51 bytes,    Routine Base: _TEXT + 000D

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes

