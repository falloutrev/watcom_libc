Module: iob
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000000 bytes

Routine Size: 0 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000211 bytes
0000				___iob:
0000  00 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00 ................
0010  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
0020  00 00 00 00 00 00 02 00 00 00 01 00 00 00 00 00 ................
0030  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
0040  02 00 00 00 02 00 00 00 00 00 00 00 00 00 00 00 ................
0050  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
	--- Above line repeats 26 times ---
0200  00 00 00 00 00 00 00 00                         ........
0208				___tmpfnext:
0208  61                                              a
0209				__fmode:
0209  00 01 00 00                                     ....
020D				_force:
020D  00 00 00 00                                     DD	offset ___OpenStreams

Segment: _BSS DWORD USE32 00000004 bytes
0000				___ClosedStreams:

BSS Size: 4 bytes

