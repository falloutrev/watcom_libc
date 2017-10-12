Module: jtokata
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000034 bytes
0000				jtokata_:
0000  53				push		ebx
0001  52				push		edx
0002  89 C2				mov		edx,eax
0004  31 DB				xor		ebx,ebx
0006  66 89 C3				mov		bx,ax
0009  89 D8				mov		eax,ebx
000B  E8 00 00 00 00			call		jishira_
0010  85 C0				test		eax,eax
0012  74 1B				je		L$1
0014  81 FB DE 82 00 00			cmp		ebx,0x000082de
001A  0F 9D C0				setge		al
001D  25 FF 00 00 00			and		eax,0x000000ff
0022  05 A1 00 00 00			add		eax,0x000000a1
0027  81 E2 FF FF 00 00			and		edx,0x0000ffff
002D  01 C2				add		edx,eax
002F				L$1:
002F  89 D0				mov		eax,edx
0031  5A				pop		edx
0032  5B				pop		ebx
0033  C3				ret		

Routine Size: 52 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

