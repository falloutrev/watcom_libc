Module: dosret
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000006B bytes
0000				_dosret0_:
0000  85 D2				test		edx,edx
0002  75 03				jne		_dosretax_
0004  31 C0				xor		eax,eax
0006				L$1:
0006  C3				ret		

Routine Size: 7 bytes,    Routine Base: _TEXT + 0000

0007				_dosretax_:
0007  85 D2				test		edx,edx
0009  74 FB				je		L$1

Routine Size: 4 bytes,    Routine Base: _TEXT + 0007

000B				__set_errno_dos_:
000B  52				push		edx
000C  89 C2				mov		edx,eax
000E  E8 00 00 00 00			call		__set_doserrno_
0013  83 FA 7B				cmp		edx,0x0000007b
0016  75 07				jne		L$2
0018  B8 01 00 00 00			mov		eax,0x00000001
001D  EB 31				jmp		L$6
001F				L$2:
001F  81 FA CE 00 00 00			cmp		edx,0x000000ce
0025  75 07				jne		L$3
0027  B8 09 00 00 00			mov		eax,0x00000009
002C  EB 22				jmp		L$6
002E				L$3:
002E  81 FA B7 00 00 00			cmp		edx,0x000000b7
0034  75 07				jne		L$4
0036  B8 07 00 00 00			mov		eax,0x00000007
003B  EB 13				jmp		L$6
003D				L$4:
003D  83 FA 13				cmp		edx,0x00000013
0040  76 05				jbe		L$5
0042  BA 13 00 00 00			mov		edx,0x00000013
0047				L$5:
0047  8B 82 FD FF FF FF			mov		eax,dword ptr _xlat-0x3[edx]
004D  C1 F8 18				sar		eax,0x18
0050				L$6:
0050  E8 00 00 00 00			call		__set_errno_
0055  B8 FF FF FF FF			mov		eax,0xffffffff
005A  5A				pop		edx
005B  C3				ret		

Routine Size: 81 bytes,    Routine Base: _TEXT + 000B

005C				__set_errno_nt_:
005C  51				push		ecx
005D  52				push		edx
005E  E8 00 00 00 00			call		_GetLastError
0063  E8 00 00 00 00			call		__set_errno_dos_
0068  5A				pop		edx
0069  59				pop		ecx
006A  C3				ret		

Routine Size: 15 bytes,    Routine Base: _TEXT + 005C

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000014 bytes
0000				_xlat:
0000  00 09 01 01 0B 06 04 05 05 05 02 03 FF FF 07 08 ................
0010  06 08 01 FF                                     ....

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

