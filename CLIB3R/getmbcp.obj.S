Module: getmbcp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000010 bytes
0000				_getmbcp_:
0000  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
0007  0F 95 C0				setne		al
000A  25 FF 00 00 00			and		eax,0x000000ff
000F  C3				ret		

Routine Size: 16 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

