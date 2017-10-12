Module: clockxib
GROUP: 'DGROUP' YIE,YI,YIB,XIE,XI,XIB,_DATA

Segment: _TEXT WORD USE32 00000005 bytes
0000				clock_:
0000  E9 00 00 00 00			jmp		__clock_

Routine Size: 5 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes

Segment: XIB WORD USE32 00000000 bytes

Segment: XI WORD USE32 00000006 bytes
0000  00 20                                           . 
0002  00 00 00 00                                     DD	offset __clock_init_

Segment: XIE WORD USE32 00000000 bytes

Segment: YIB WORD USE32 00000000 bytes

Segment: YI WORD USE32 00000000 bytes

Segment: YIE WORD USE32 00000000 bytes

