Module: rotr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000007 bytes
0000				_rotr_:
0000  51				push		ecx
0001  89 D1				mov		ecx,edx
0003  D3 C8				ror		eax,cl
0005  59				pop		ecx
0006  C3				ret		

Routine Size: 7 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

