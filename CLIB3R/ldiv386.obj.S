Module: ldiv386
GROUP: 'DGROUP' _DATA

Segment: _TEXT WORD USE32 0000000D bytes
0000				ldiv_:
0000  53				push		ebx
0001  89 D3				mov		ebx,edx
0003  99				cdq		
0004  F7 FB				idiv		ebx
0006  89 06				mov		dword ptr [esi],eax
0008  89 56 04				mov		dword ptr 0x4[esi],edx
000B  5B				pop		ebx
000C  C3				ret		

Routine Size: 13 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes

