Module: semwlne
GROUP: 'DGROUP' YIE,YI,YIB,XIE,XI,XIB,_DATA

Segment: _TEXT WORD USE32 00000000 bytes

Routine Size: 0 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: _DATA DWORD USE32 00000004 bytes
0000				___WinLines_sem:
0000  00 00 00 00                                     ....

Segment: XIB WORD USE32 00000000 bytes

Segment: XI WORD USE32 00000006 bytes
0000  00 20                                           . 
0002  00 00 00 00                                     DD	offset __InitWinLinesSem_

Segment: XIE WORD USE32 00000000 bytes

Segment: YIB WORD USE32 00000000 bytes

Segment: YI WORD USE32 00000006 bytes
0000  00 20                                           . 
0002  00 00 00 00                                     DD	offset __FiniWinLinesSem_

Segment: YIE WORD USE32 00000000 bytes

