Module: onexit
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000012 bytes
0000				onexit_:
0000  52				push		edx
0001  89 C2				mov		edx,eax
0003  E8 00 00 00 00			call		atexit_
0008  85 C0				test		eax,eax
000A  74 02				je		L$1
000C  31 D2				xor		edx,edx
000E				L$1:
000E  89 D0				mov		eax,edx
0010  5A				pop		edx
0011  C3				ret		

Routine Size: 18 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

