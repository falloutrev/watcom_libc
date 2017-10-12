Module: fputchar
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000000D bytes
0000				fputchar_:
0000  52				push		edx
0001  BA 1A 00 00 00			mov		edx,offset ___iob+0x1a
0006  E8 00 00 00 00			call		fputc_
000B  5A				pop		edx
000C  C3				ret		

Routine Size: 13 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

