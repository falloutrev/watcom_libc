Module: isgraph
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000019 bytes
0000				isgraph_:
0000  8A 80 01 00 00 00			mov		al,byte ptr __IsTable+0x1[eax]
0006  24 0A				and		al,0x0a
0008  25 FF 00 00 00			and		eax,0x000000ff
000D  83 F8 08				cmp		eax,0x00000008
0010  0F 94 C0				sete		al
0013  25 FF 00 00 00			and		eax,0x000000ff
0018  C3				ret		

Routine Size: 25 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

