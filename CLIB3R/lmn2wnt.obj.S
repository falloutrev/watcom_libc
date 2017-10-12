Module: lmn2wnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000008 bytes
0000				_DLLMain@12:
0000  B8 01 00 00 00			mov		eax,0x00000001
0005  C2 0C 00				ret		0x000c

Routine Size: 8 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000004 bytes
0000				___p:
0000  00 00 00 00                                     DD	offset __DLLstart_

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

