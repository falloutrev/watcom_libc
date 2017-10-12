Module: setefg
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001B bytes
0000				__setEFGfmt_:
0000  53				push		ebx
0001  52				push		edx
0002  BA 00 00 00 00			mov		edx,offset _EFG_Format_
0007  BB 00 00 00 00			mov		ebx,offset __cnvs2d_
000C  89 15 00 00 00 00			mov		dword ptr ___EFG_printf,edx
0012  89 1D 00 00 00 00			mov		dword ptr ___EFG_scanf,ebx
0018  5A				pop		edx
0019  5B				pop		ebx
001A  C3				ret		

Routine Size: 27 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

