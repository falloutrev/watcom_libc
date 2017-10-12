Module: jiszen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000003F bytes
0000				jiszen_:
0000  52				push		edx
0001  31 D2				xor		edx,edx
0003  66 89 C2				mov		dx,ax
0006  C1 FA 08				sar		edx,0x08
0009  81 E2 FF 00 00 00			and		edx,0x000000ff
000F  8A 92 01 00 00 00			mov		dl,byte ptr __IsKTable+0x1[edx]
0015  80 E2 04				and		dl,0x04
0018  81 E2 FF 00 00 00			and		edx,0x000000ff
001E  74 1B				je		L$1
0020  25 FF 00 00 00			and		eax,0x000000ff
0025  8A 80 01 00 00 00			mov		al,byte ptr __IsKTable+0x1[eax]
002B  24 08				and		al,0x08
002D  25 FF 00 00 00			and		eax,0x000000ff
0032  74 07				je		L$1
0034  B8 01 00 00 00			mov		eax,0x00000001
0039  5A				pop		edx
003A  C3				ret		
003B				L$1:
003B  31 C0				xor		eax,eax
003D  5A				pop		edx
003E  C3				ret		

Routine Size: 63 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

