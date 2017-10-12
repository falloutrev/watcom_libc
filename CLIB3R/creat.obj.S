Module: creat
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000000D bytes
0000				creat_:
0000  52				push		edx
0001  6A 62				push		0x00000062
0003  50				push		eax
0004  E8 00 00 00 00			call		open_
0009  83 C4 0C				add		esp,0x0000000c
000C  C3				ret		

Routine Size: 13 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

