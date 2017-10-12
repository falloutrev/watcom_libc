Module: stkwnt
GROUP: 'DGROUP' YIE,YI,YIB,XIE,XI,XIB,_DATA

Segment: _TEXT WORD USE32 00000060 bytes
0000				L$1:
0000  C3				ret		

Routine Size: 1 bytes,    Routine Base: _TEXT + 0000

0001				__CHK:
0001  87 44 24 04			xchg		dword ptr 0x4[esp],eax
0005  E8 07 00 00 00			call		__STK
000A  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
000E  C2 04 00				ret		0x0004

Routine Size: 16 bytes,    Routine Base: _TEXT + 0001

0011				__STK:
0011  50				push		eax
0012  39 E0				cmp		eax,esp
0014  73 1A				jae		__STKOVERFLOW_
0016  29 E0				sub		eax,esp
0018  F7 D8				neg		eax
001A  56				push		esi
001B  50				push		eax
001C  FF 15 00 00 00 00			call		dword ptr DGROUP:___GetThreadPtr
0022  89 C6				mov		esi,eax
0024  58				pop		eax
0025  3B 06				cmp		eax,dword ptr [esi]
0027  5E				pop		esi
0028  76 06				jbe		__STKOVERFLOW_
002A  E8 11 00 00 00			call		__GRO
002F  C3				ret		

Routine Size: 31 bytes,    Routine Base: _TEXT + 0011

0030				__STKOVERFLOW_:
0030  58				pop		eax
0031  B8 00 00 00 00			mov		eax,offset DGROUP:L$3
0036  BA 01 00 00 00			mov		edx,0x00000001
003B  E8 00 00 00 00			call		__fatal_runtime_error_

Routine Size: 16 bytes,    Routine Base: _TEXT + 0030

0040				__GRO:
0040  50				push		eax
0041  53				push		ebx
0042  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
0046  BB FC FF FF FF			mov		ebx,0xfffffffc
004B				L$2:
004B  89 1C 1C				mov		dword ptr [esp+ebx],ebx
004E  81 EB 00 10 00 00			sub		ebx,0x00001000
0054  2D 00 10 00 00			sub		eax,0x00001000
0059  7F F0				jg		L$2
005B  5B				pop		ebx
005C  58				pop		eax
005D  C2 04 00				ret		0x0004

Routine Size: 32 bytes,    Routine Base: _TEXT + 0040

No disassembly errors

Segment: _DATA DWORD USE32 00000012 bytes
0000				L$3:
0000  53 74 61 63 6B 20 4F 76 65 72 66 6C 6F 77 21 0D Stack Overflow!.
0010  0A 00                                           ..

Segment: XIB WORD USE32 00000000 bytes

Segment: XI WORD USE32 00000006 bytes
0000  00 20                                           . 
0002  00 00 00 00                                     DD	offset L$1

Segment: XIE WORD USE32 00000000 bytes

Segment: YIB WORD USE32 00000000 bytes

Segment: YI WORD USE32 00000000 bytes

Segment: YIE WORD USE32 00000000 bytes

