Module: segdefns
GROUP: 'DGROUP' STACK,_BSS,YIE,YI,YIB,XIE,XI,XIB,TIE,TI,TIB,DATA,CONST,_AFTERNULL,_NULL,_DATA

Segment: _TEXT WORD USE32 00000000 bytes

Routine Size: 0 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes

Segment: BEGTEXT WORD USE32 00000007 bytes
0000				L$1:
0000  CC				int		0x03
0001  EB FD				jmp		L$1

Routine Size: 3 bytes,    Routine Base: BEGTEXT + 0000

0003				___begtext:
0003  90				nop		
0004  90				nop		
0005  90				nop		
0006  90				nop		

Routine Size: 4 bytes,    Routine Base: BEGTEXT + 0003

No disassembly errors

Segment: _NULL PARA USE32 00000004 bytes
0000				__nullarea:
0000  01 01 01 00                                     ....

Segment: _AFTERNULL WORD USE32 00000000 bytes

Segment: CONST WORD USE32 00000000 bytes

Segment: TIB BYTE USE32 00000000 bytes

Segment: TI BYTE USE32 00000000 bytes

Segment: TIE BYTE USE32 00000000 bytes

Segment: XIB WORD USE32 00000000 bytes

Segment: XI WORD USE32 00000000 bytes

Segment: XIE WORD USE32 00000000 bytes

Segment: YIB WORD USE32 00000000 bytes

Segment: YI WORD USE32 00000000 bytes

Segment: YIE WORD USE32 00000000 bytes

Segment: DATA WORD USE32 00000000 bytes

Segment: _BSS WORD USE32 00000000 bytes

BSS Size: 0 bytes

Segment: STACK PARA USE32 00010000 bytes

BSS Size: 65536 bytes

