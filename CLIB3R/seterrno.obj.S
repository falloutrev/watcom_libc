Module: seterrno
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000038 bytes
0000				__set_EDOM_:
0000  B8 0D 00 00 00			mov		eax,0x0000000d

Routine Size: 5 bytes,    Routine Base: _TEXT + 0000

0005				__set_errno_:
0005  52				push		edx
0006  89 C2				mov		edx,eax
0008  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
000E  89 50 04				mov		dword ptr 0x4[eax],edx
0011  5A				pop		edx
0012  C3				ret		

Routine Size: 14 bytes,    Routine Base: _TEXT + 0005

0013				__set_ERANGE_:
0013  B8 0E 00 00 00			mov		eax,0x0000000e
0018  EB EB				jmp		__set_errno_

Routine Size: 7 bytes,    Routine Base: _TEXT + 0013

001A				__set_EINVAL_:
001A  B8 09 00 00 00			mov		eax,0x00000009
001F  E8 00 00 00 00			call		__set_errno_
0024  B8 FF FF FF FF			mov		eax,0xffffffff
0029  C3				ret		

Routine Size: 16 bytes,    Routine Base: _TEXT + 001A

002A				__set_doserrno_:
002A  52				push		edx
002B  89 C2				mov		edx,eax
002D  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0033  89 50 08				mov		dword ptr 0x8[eax],edx
0036  5A				pop		edx
0037  C3				ret		

Routine Size: 14 bytes,    Routine Base: _TEXT + 002A

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

