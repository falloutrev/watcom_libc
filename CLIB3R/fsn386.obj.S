Module: fsn386
GROUP: 'DGROUP' _DATA

Segment: _TEXT WORD USE32 0000000A bytes
0000				__FSN:
0000  09 C0				or		eax,eax
0002  74 05				je		L$1
0004  35 00 00 00 80			xor		eax,0x80000000
0009				L$1:
0009  C3				ret		

Routine Size: 10 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes

