Module: jtoupper
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000018 bytes
0000				jtoupper_:
0000  52				push		edx
0001  31 D2				xor		edx,edx
0003  66 89 C2				mov		dx,ax
0006  89 D0				mov		eax,edx
0008  E8 00 00 00 00			call		jislower_
000D  85 C0				test		eax,eax
000F  74 03				je		L$1
0011  83 EA 21				sub		edx,0x00000021
0014				L$1:
0014  89 D0				mov		eax,edx
0016  5A				pop		edx
0017  C3				ret		

Routine Size: 24 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

