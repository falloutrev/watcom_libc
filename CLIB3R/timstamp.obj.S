Module: timstamp
GROUP: 'DGROUP' CONST,CONST2,_DATA

Segment: _TEXT BYTE USE32 00000000 bytes

Routine Size: 0 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000015 bytes
0000				L$1:
0000  46 65 62 20 32 31 20 31 39 39 36 20 31 36 3A 31 Feb 21 1996 16:1
0010  34 3A 33 30 00                                  4:30.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000004 bytes
0000				___lmt:
0000  00 00 00 00                                     DD	offset DGROUP:L$1

