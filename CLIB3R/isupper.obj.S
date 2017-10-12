Module: isupper
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000000E bytes
0000				isupper_:
0000  8A 80 01 00 00 00			mov		al,byte ptr __IsTable+0x1[eax]
0006  24 40				and		al,0x40
0008  25 FF 00 00 00			and		eax,0x000000ff
000D  C3				ret		

Routine Size: 14 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

