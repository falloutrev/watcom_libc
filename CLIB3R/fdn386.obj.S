Module: fdn386
GROUP: 'DGROUP' _DATA

Segment: _TEXT WORD USE32 0000000F bytes
0000				__FDN:
0000  85 D2				test		edx,edx
0002  75 02				jne		L$1
0004  85 C0				test		eax,eax
0006				L$1:
0006  74 06				je		L$2
0008  81 F2 00 00 00 80			xor		edx,0x80000000
000E				L$2:
000E  C3				ret		

Routine Size: 15 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes

