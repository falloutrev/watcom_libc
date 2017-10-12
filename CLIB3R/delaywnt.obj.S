Module: delaywnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000000B bytes
0000				delay_:
0000  51				push		ecx
0001  52				push		edx
0002  50				push		eax
0003  E8 00 00 00 00			call		_Sleep
0008  5A				pop		edx
0009  59				pop		ecx
000A  C3				ret		

Routine Size: 11 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

