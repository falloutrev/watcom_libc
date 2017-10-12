Module: cinit
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000000B bytes
0000				__CommonInit_:
0000  C7 05 00 00 00 00 00 80 00 00
					mov		dword ptr __amblksiz,0x00008000
000A  C3				ret		

Routine Size: 11 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

