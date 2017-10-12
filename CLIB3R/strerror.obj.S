Module: strerror
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000017 bytes
0000				strerror_:
0000  85 C0				test		eax,eax
0002  7C 05				jl		L$1
0004  83 F8 0F				cmp		eax,0x0000000f
0007  7E 06				jle		L$2
0009				L$1:
0009  B8 2F 01 00 00			mov		eax,offset DGROUP:L$19
000E  C3				ret		
000F				L$2:
000F  8B 04 85 00 00 00 00		mov		eax,dword ptr _sys_errlist[eax*4]
0016  C3				ret		

Routine Size: 23 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 0000013D bytes
0000				L$3:
0000  45 72 72 6F 72 20 30 00                         Error 0.
0008				L$4:
0008  4E 6F 20 73 75 63 68 20 66 69 6C 65 20 6F 72 20 No such file or 
0018  64 69 72 65 63 74 6F 72 79 00                   directory.
0022				L$5:
0022  41 72 67 75 6D 65 6E 74 20 6C 69 73 74 20 74 6F Argument list to
0032  6F 20 62 69 67 00                               o big.
0038				L$6:
0038  45 78 65 63 20 66 6F 72 6D 61 74 20 65 72 72 6F Exec format erro
0048  72 00                                           r.
004A				L$7:
004A  42 61 64 20 66 69 6C 65 20 6E 75 6D 62 65 72 00 Bad file number.
005A				L$8:
005A  4E 6F 74 20 65 6E 6F 75 67 68 20 6D 65 6D 6F 72 Not enough memor
006A  79 00                                           y.
006C				L$9:
006C  50 65 72 6D 69 73 73 69 6F 6E 20 64 65 6E 69 65 Permission denie
007C  64 00                                           d.
007E				L$10:
007E  46 69 6C 65 20 65 78 69 73 74 73 00             File exists.
008A				L$11:
008A  43 72 6F 73 73 2D 64 65 76 69 63 65 20 6C 69 6E Cross-device lin
009A  6B 00                                           k.
009C				L$12:
009C  49 6E 76 61 6C 69 64 20 61 72 67 75 6D 65 6E 74 Invalid argument
00AC  00                                              .
00AD				L$13:
00AD  46 69 6C 65 20 74 61 62 6C 65 20 6F 76 65 72 66 File table overf
00BD  6C 6F 77 00                                     low.
00C1				L$14:
00C1  54 6F 6F 20 6D 61 6E 79 20 6F 70 65 6E 20 66 69 Too many open fi
00D1  6C 65 73 00                                     les.
00D5				L$15:
00D5  4E 6F 20 73 70 61 63 65 20 6C 65 66 74 20 6F 6E No space left on
00E5  20 64 65 76 69 63 65 00                          device.
00ED				L$16:
00ED  41 72 67 75 6D 65 6E 74 20 74 6F 6F 20 6C 61 72 Argument too lar
00FD  67 65 00                                        ge.
0100				L$17:
0100  52 65 73 75 6C 74 20 74 6F 6F 20 6C 61 72 67 65 Result too large
0110  00                                              .
0111				L$18:
0111  52 65 73 6F 75 72 63 65 20 64 65 61 64 6C 6F 63 Resource deadloc
0121  6B 20 77 6F 75 6C 64 20 6F 63 63 75 72 00       k would occur.
012F				L$19:
012F  75 6E 6B 6E 6F 77 6E 20 65 72 72 6F 72 00       unknown error.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000044 bytes
0000				_sys_nerr:
0000  0F 00 00 00                                     ....
0004				_sys_errlist:
0004  00 00 00 00                                     DD	offset DGROUP:L$3
0008  08 00 00 00                                     DD	offset DGROUP:L$4
000C  22 00 00 00                                     DD	offset DGROUP:L$5
0010  38 00 00 00                                     DD	offset DGROUP:L$6
0014  4A 00 00 00                                     DD	offset DGROUP:L$7
0018  5A 00 00 00                                     DD	offset DGROUP:L$8
001C  6C 00 00 00                                     DD	offset DGROUP:L$9
0020  7E 00 00 00                                     DD	offset DGROUP:L$10
0024  8A 00 00 00                                     DD	offset DGROUP:L$11
0028  9C 00 00 00                                     DD	offset DGROUP:L$12
002C  AD 00 00 00                                     DD	offset DGROUP:L$13
0030  C1 00 00 00                                     DD	offset DGROUP:L$14
0034  D5 00 00 00                                     DD	offset DGROUP:L$15
0038  ED 00 00 00                                     DD	offset DGROUP:L$16
003C  00 01 00 00                                     DD	offset DGROUP:L$17
0040  11 01 00 00                                     DD	offset DGROUP:L$18

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

