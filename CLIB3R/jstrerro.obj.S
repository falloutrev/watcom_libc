Module: jstrerro
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000013 bytes
0000				jstrerror_:
0000  85 C0				test		eax,eax
0002  7C 05				jl		L$1
0004  83 F8 0F				cmp		eax,0x0000000f
0007  7E 02				jle		L$2
0009				L$1:
0009  31 C0				xor		eax,eax
000B				L$2:
000B  8B 04 85 00 00 00 00		mov		eax,dword ptr _jsys_errlist[eax*4]
0012  C3				ret		

Routine Size: 19 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 000001ED bytes
0000				L$3:
0000  8A 59 93 96 82 B7 82 E9 83 47 83 89 81 5B 83 52 .Y.......G...[.R
0010  81 5B 83 68 82 AA 82 A0 82 E8 82 DC 82 B9 82 F1 .[.h............
0020  00                                              .
0021				L$4:
0021  82 B1 82 CC 82 E6 82 A4 82 C8 83 74 83 40 83 43 ...........t.@.C
0031  83 8B 82 DC 82 BD 82 CD 83 66 83 42 83 8C 83 4E .........f.B...N
0041  83 67 83 8A 82 CD 82 A0 82 E8 82 DC 82 B9 82 F1 .g..............
0051  00                                              .
0052				L$5:
0052  88 F8 90 94 83 8A 83 58 83 67 82 AA 92 B7 82 B7 .......X.g......
0062  82 AC 82 DC 82 B7 00                            .......
0069				L$6:
0069  8E C0 8D 73 8C 60 8E AE 83 47 83 89 81 5B 82 C5 ...s.`...G...[..
0079  82 B7 00                                        ...
007C				L$7:
007C  83 74 83 40 83 43 83 8B 94 D4 8D 86 82 AA 95 73 .t.@.C.........s
008C  93 4B 93 96 82 C5 82 B7 00                      .K.......
0095				L$8:
0095  83 81 83 82 83 8A 82 AA 95 73 91 AB 82 C5 82 B7 .........s......
00A5  00                                              .
00A6				L$9:
00A6  83 41 83 4E 83 5A 83 58 82 AA 8B D6 8E 7E 82 B3 .A.N.Z.X.....~..
00B6  82 EA 82 C4 82 A2 82 DC 82 B7 00                ...........
00C1				L$10:
00C1  83 74 83 40 83 43 83 8B 82 AA 82 B7 82 C5 82 C9 .t.@.C..........
00D1  91 B6 8D DD 82 B5 82 DC 82 B7 00                ...........
00DC				L$11:
00DC  83 8A 83 93 83 4E 82 AA 83 66 83 6F 83 43 83 58 .....N...f.o.C.X
00EC  82 F0 82 DC 82 BD 82 AA 82 C1 82 C4 82 A2 82 DC ................
00FC  82 B7 00                                        ...
00FF				L$12:
00FF  88 F8 90 94 82 AA 8A D4 88 E1 82 C1 82 C4 82 A2 ................
010F  82 DC 82 B7 00                                  .....
0114				L$13:
0114  82 B1 82 EA 88 C8 8F E3 83 74 83 40 83 43 83 8B .........t.@.C..
0124  82 F0 83 49 81 5B 83 76 83 93 82 C5 82 AB 82 DC ...I.[.v........
0134  82 B9 82 F1 00                                  .....
0139				L$14:
0139  82 B1 82 CC 83 76 83 8D 83 5A 83 58 82 C5 82 CD .....v...Z.X....
0149  82 B1 82 EA 88 C8 8F E3 83 74 83 40 83 43 83 8B .........t.@.C..
0159  82 F0 83 49 81 5B 83 76 83 93 82 C5 82 AB 82 DC ...I.[.v........
0169  82 B9 82 F1 00                                  .....
016E				L$15:
016E  83 66 83 6F 83 43 83 58 82 C9 97 5D 92 6E 82 AA .f.o.C.X...].n..
017E  82 A0 82 E8 82 DC 82 B9 82 F1 00                ...........
0189				L$16:
0189  90 94 92 6C 89 89 8E 5A 8A D6 90 94 82 CC 88 F8 ...l...Z........
0199  90 94 82 AA 83 47 83 89 81 5B 82 C5 82 B7 00    .....G...[.....
01A8				L$17:
01A8  90 94 92 6C 89 89 8E 5A 8A D6 90 94 82 CC 8C 8B ...l...Z........
01B8  89 CA 82 AA 94 CD 88 CD 82 F0 89 7A 82 A6 82 C4 ...........z....
01C8  82 A2 82 DC 82 B7 00                            .......
01CF				L$18:
01CF  52 65 73 6F 75 72 63 65 20 64 65 61 64 6C 6F 63 Resource deadloc
01DF  6B 20 77 6F 75 6C 64 20 6F 63 63 75 72 00       k would occur.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000040 bytes
0000				_jsys_errlist:
0000  00 00 00 00                                     DD	offset DGROUP:L$3
0004  21 00 00 00                                     DD	offset DGROUP:L$4
0008  52 00 00 00                                     DD	offset DGROUP:L$5
000C  69 00 00 00                                     DD	offset DGROUP:L$6
0010  7C 00 00 00                                     DD	offset DGROUP:L$7
0014  95 00 00 00                                     DD	offset DGROUP:L$8
0018  A6 00 00 00                                     DD	offset DGROUP:L$9
001C  C1 00 00 00                                     DD	offset DGROUP:L$10
0020  DC 00 00 00                                     DD	offset DGROUP:L$11
0024  FF 00 00 00                                     DD	offset DGROUP:L$12
0028  14 01 00 00                                     DD	offset DGROUP:L$13
002C  39 01 00 00                                     DD	offset DGROUP:L$14
0030  6E 01 00 00                                     DD	offset DGROUP:L$15
0034  89 01 00 00                                     DD	offset DGROUP:L$16
0038  A8 01 00 00                                     DD	offset DGROUP:L$17
003C  CF 01 00 00                                     DD	offset DGROUP:L$18

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

