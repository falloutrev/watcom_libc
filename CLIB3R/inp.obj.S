Module: inp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000008 bytes
0000				inp_:
0000  52				push		edx
0001  89 C2				mov		edx,eax
0003  29 C0				sub		eax,eax
0005  EC				in		al,dx
0006  5A				pop		edx
0007  C3				ret		

Routine Size: 8 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

