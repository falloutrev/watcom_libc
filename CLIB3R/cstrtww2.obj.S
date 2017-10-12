Module: cstrtww2
GROUP: 'DGROUP' _DATA

Segment: _TEXT WORD USE32 0000007E bytes
0000				_wstart2_:
0000  C7 05 00 00 00 00 00 00 00 00
					mov		dword ptr __WinMainProc,offset _WinMain@16
000A  E9 00 00 00 00			jmp		__WinMain
000F  00 00 00 00                                     DD	offset ___begtext
0013  57 41 54 43 4F 4D 20 43 2F 43 2B 2B 33 32 20 52 WATCOM C/C++32 R
0023  75 6E 2D 54 69 6D 65 20 73 79 73 74 65 6D 2E 20 un-Time system. 
0033  28 63 29 20 43 6F 70 79 72 69 67 68 74 20 62 79 (c) Copyright by
0043  20 57 41 54 43 4F 4D 20 49 6E 74 65 72 6E 61 74  WATCOM Internat
0053  69 6F 6E 61 6C 20 43 6F 72 70 2E 20 31 39 38 38 ional Corp. 1988
0063  2D 31 39 39 35 2E 20 41 6C 6C 20 72 69 67 68 74 -1995. All right
0073  73 20 72 65 73 65 72 76 65 64 2E                s reserved.

Routine Size: 126 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes

