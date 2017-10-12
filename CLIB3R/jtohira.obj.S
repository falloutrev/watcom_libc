Module: jtohira
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000003C bytes
0000				jtohira_:
0000  53				push		ebx
0001  52				push		edx
0002  89 C2				mov		edx,eax
0004  31 DB				xor		ebx,ebx
0006  66 89 C3				mov		bx,ax
0009  89 D8				mov		eax,ebx
000B  E8 00 00 00 00			call		jiskana_
0010  85 C0				test		eax,eax
0012  74 23				je		L$1
0014  81 FB 93 83 00 00			cmp		ebx,0x00008393
001A  7F 1B				jg		L$1
001C  81 FB 7F 83 00 00			cmp		ebx,0x0000837f
0022  0F 9D C0				setge		al
0025  25 FF 00 00 00			and		eax,0x000000ff
002A  05 A1 00 00 00			add		eax,0x000000a1
002F  81 E2 FF FF 00 00			and		edx,0x0000ffff
0035  29 C2				sub		edx,eax
0037				L$1:
0037  89 D0				mov		eax,edx
0039  5A				pop		edx
003A  5B				pop		ebx
003B  C3				ret		

Routine Size: 60 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

