Module: crwd386
GROUP: 'DGROUP' _DATA

Segment: _TEXT BYTE USE32 00000001 bytes
0000				__null_FPE_rtn:
0000  C3				ret		

Routine Size: 1 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: _DATA DWORD USE32 00000047 bytes
0000				__dynend:
0000  00 00 00 00                                     ....
0004				__curbrk:
0004  00 00 00 00                                     ....
0008				__LpCmdLine:
0008  00 00 00 00                                     ....
000C				__LpPgmName:
000C  00 00 00 00                                     ....
0010				__LpDllName:
0010  00 00 00 00                                     ....
0014				__psp:
0014  00 00 00 00                                     ....
0018				__STACKLOW:
0018				__x386_stacklow:
0018  00 00 00 00                                     ....
001C				__STACKTOP:
001C  00 00 00 00                                     ....
0020				__ASTACKSIZ:
0020  00 00 00 00                                     ....
0024				__ASTACKPTR:
0024  00 00 00 00                                     ....
0028				__cbyte:
0028  00 00 00 00                                     ....
002C				__cbyte2:
002C  00 00 00 00                                     ....
0030				__child:
0030  00 00 00 00                                     ....
0034				__no87:
0034  00 00                                           ..
0036				__Extender:
0036  00                                              .
0037				__ExtenderSubtype:
0037  00                                              .
0038				__X32VM:
0038  00                                              .
0039				__Envptr:
0039  00 00 00 00                                     ....
003D				__Envseg:
003D  00 00                                           ..
003F				__osmajor:
003F  00                                              .
0040				__osminor:
0040  00                                              .
0041				__osbuild:
0041  00 00                                           ..
0043				___FPE_handler:
0043				__FPE_handler:
0043  00 00 00 00                                     DD	offset __null_FPE_rtn

