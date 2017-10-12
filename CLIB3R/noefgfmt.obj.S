Module: noefgfmt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000012 bytes
0000				_no_support_loaded_:
0000  52				push		edx
0001  BA 01 00 00 00			mov		edx,0x00000001
0006  B8 00 00 00 00			mov		eax,offset DGROUP:L$1
000B  E8 00 00 00 00			call		__fatal_runtime_error_
0010  5A				pop		edx
0011  C3				ret		

Routine Size: 18 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000024 bytes
0000				L$1:
0000  46 6C 6F 61 74 69 6E 67 2D 70 6F 69 6E 74 20 73 Floating-point s
0010  75 70 70 6F 72 74 20 6E 6F 74 20 6C 6F 61 64 65 upport not loade
0020  64 0D 0A 00                                     d...

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000008 bytes
0000				___EFG_printf:
0000  00 00 00 00                                     DD	offset _no_support_loaded_
0004				___EFG_scanf:
0004  00 00 00 00                                     DD	offset _no_support_loaded_

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

