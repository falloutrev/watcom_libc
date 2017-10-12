Module: chkctype
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000044 bytes
0000				chkctype_:
0000  84 C0				test		al,al
0002  74 1F				je		L$1
0004  83 FA 01				cmp		edx,0x00000001
0007  75 20				jne		L$2
0009  25 FF 00 00 00			and		eax,0x000000ff
000E  8A 80 01 00 00 00			mov		al,byte ptr __IsKTable+0x1[eax]
0014  24 08				and		al,0x08
0016  25 FF 00 00 00			and		eax,0x000000ff
001B  74 06				je		L$1
001D  B8 02 00 00 00			mov		eax,0x00000002
0022  C3				ret		
0023				L$1:
0023  B8 FF FF FF FF			mov		eax,0xffffffff
0028  C3				ret		
0029				L$2:
0029  25 FF 00 00 00			and		eax,0x000000ff
002E  8A 80 01 00 00 00			mov		al,byte ptr __IsKTable+0x1[eax]
0034  24 04				and		al,0x04
0036  25 FF 00 00 00			and		eax,0x000000ff
003B  0F 95 C0				setne		al
003E  25 FF 00 00 00			and		eax,0x000000ff
0043  C3				ret		

Routine Size: 68 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

