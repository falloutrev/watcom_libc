Module: ljmphdl
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000001 bytes
0000				default_handler_:
0000  C3				ret		

Routine Size: 1 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000004 bytes
0000				___longjmp_handler:
0000  00 00 00 00                                     DD	offset default_handler_

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

