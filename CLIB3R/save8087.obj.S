Module: save8087
GROUP: 'DGROUP' CONST,CONST2,_DATA

Segment: _TEXT BYTE USE32 00000001 bytes
0000				_do_nothing_:
0000  C3				ret		

Routine Size: 1 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000008 bytes
0000				___Save8087:
0000  00 00 00 00                                     DD	offset _do_nothing_
0004				___Rest8087:
0004  00 00 00 00                                     DD	offset _do_nothing_

