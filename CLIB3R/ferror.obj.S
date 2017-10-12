Module: ferror
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000007 bytes
0000				ferror_:
0000  8B 40 0C				mov		eax,dword ptr 0xc[eax]
0003  83 E0 20				and		eax,0x00000020
0006  C3				ret		

Routine Size: 7 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

