Module: cvtbuf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000000C bytes
0000				__CVTBuffer_:
0000  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0006  05 C6 00 00 00			add		eax,0x000000c6
000B  C3				ret		

Routine Size: 12 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

