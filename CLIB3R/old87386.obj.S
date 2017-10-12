Module: old87386
GROUP: 'DGROUP' YIE,YI,YIB,XIE,XI,XIB,_DATA

Segment: _TEXT DWORD USE32 00000009 bytes
0000				__old_8087:
0000  D9 EE				fldz		
0002  D9 EE				fldz		
0004  D9 EE				fldz		
0006  D9 EE				fldz		
0008  C3				ret		

Routine Size: 9 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes

Segment: XIB WORD USE32 00000000 bytes

Segment: XI WORD USE32 00000006 bytes
0000  00 03                                           ..
0002  00 00 00 00                                     DD	offset __old_8087

Segment: XIE WORD USE32 00000000 bytes

Segment: YIB WORD USE32 00000000 bytes

Segment: YI WORD USE32 00000000 bytes

Segment: YIE WORD USE32 00000000 bytes

