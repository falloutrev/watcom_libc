Module: fstat386
GROUP: 'DGROUP' _DATA

Segment: _TEXT WORD USE32 00000065 bytes
0000				F8UnderFlow:
0000  29 D2				sub		edx,edx

Routine Size: 2 bytes,    Routine Base: _TEXT + 0000

0002				F4UnderFlow:
0002  29 C0				sub		eax,eax
0004  C3				ret		

Routine Size: 3 bytes,    Routine Base: _TEXT + 0002

0005				F8InvalidOp:
0005  B8 83 00 00 00			mov		eax,0x00000083
000A  E8 00 00 00 00			call		__FPE_exception_
000F  EB 1D				jmp		L$1

Routine Size: 12 bytes,    Routine Base: _TEXT + 0005

0011				F8DivZero:
0011  B8 83 00 00 00			mov		eax,0x00000083
0016  E8 00 00 00 00			call		__FPE_exception_
001B  EB 11				jmp		L$1

Routine Size: 12 bytes,    Routine Base: _TEXT + 0011

001D				_F8RetInf_:

Routine Size: 0 bytes,    Routine Base: _TEXT + 001D

001D				F8RetInf_:

Routine Size: 0 bytes,    Routine Base: _TEXT + 001D

001D				F8OverFlow:
001D  50				push		eax
001E  E8 00 00 00 00			call		__set_ERANGE_
0023  B8 84 00 00 00			mov		eax,0x00000084
0028  E8 00 00 00 00			call		__FPE_exception_
002D  58				pop		eax
002E				L$1:
002E  25 00 00 00 80			and		eax,0x80000000
0033  0D 00 00 F0 7F			or		eax,0x7ff00000
0038  89 C2				mov		edx,eax
003A  29 C0				sub		eax,eax
003C  C3				ret		

Routine Size: 32 bytes,    Routine Base: _TEXT + 001D

003D				F4DivZero:
003D  B8 83 00 00 00			mov		eax,0x00000083
0042  E8 00 00 00 00			call		__FPE_exception_
0047  EB 11				jmp		L$2
0049				F4RetInf:

Routine Size: 12 bytes,    Routine Base: _TEXT + 003D

0049				F4OverFlow:
0049  50				push		eax
004A  E8 00 00 00 00			call		__set_ERANGE_
004F  B8 84 00 00 00			mov		eax,0x00000084
0054  E8 00 00 00 00			call		__FPE_exception_
0059  58				pop		eax
005A				L$2:
005A  25 00 00 00 80			and		eax,0x80000000
005F  0D 00 00 80 7F			or		eax,0x7f800000
0064  C3				ret		

Routine Size: 28 bytes,    Routine Base: _TEXT + 0049

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes

