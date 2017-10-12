Module: localeco
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000006 bytes
0000				localeconv_:
0000  B8 00 00 00 00			mov		eax,offset _C_lconv
0005  C3				ret		

Routine Size: 6 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000003 bytes
0000				L$1:
0000  2E 00                                           ..
0002				L$2:
0002  00                                              .

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000030 bytes
0000				_C_lconv:
0000  00 00 00 00                                     DD	offset DGROUP:L$1
0004  02 00 00 00                                     DD	offset DGROUP:L$2
0008  02 00 00 00                                     DD	offset DGROUP:L$2
000C  02 00 00 00                                     DD	offset DGROUP:L$2
0010  02 00 00 00                                     DD	offset DGROUP:L$2
0014  02 00 00 00                                     DD	offset DGROUP:L$2
0018  02 00 00 00                                     DD	offset DGROUP:L$2
001C  02 00 00 00                                     DD	offset DGROUP:L$2
0020  02 00 00 00                                     DD	offset DGROUP:L$2
0024  02 00 00 00                                     DD	offset DGROUP:L$2
0028  FF FF FF FF FF FF FF FF                         ........

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

