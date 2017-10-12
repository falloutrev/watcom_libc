Module: ungetch
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000015 bytes
0000				ungetch_:
0000  83 3D 00 00 00 00 00		cmp		dword ptr __cbyte,0x00000000
0007  74 06				je		L$1
0009  B8 FF FF FF FF			mov		eax,0xffffffff
000E  C3				ret		
000F				L$1:
000F  A3 00 00 00 00			mov		dword ptr __cbyte,eax
0014  C3				ret		

Routine Size: 21 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

