Module: ftell
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000051 bytes
0000				ftell_:
0000  53				push		ebx
0001  52				push		edx
0002  89 C2				mov		edx,eax
0004  8B 40 10				mov		eax,dword ptr 0x10[eax]
0007  E8 00 00 00 00			call		tell_
000C  89 C3				mov		ebx,eax
000E  83 F8 FF				cmp		eax,0xffffffff
0011  74 3B				je		L$4
0013  8B 42 10				mov		eax,dword ptr 0x10[edx]
0016  FF 15 00 00 00 00			call		dword ptr __AccessFileH
001C  F6 42 0C 80			test		byte ptr 0xc[edx],0x80
0020  74 0D				je		L$1
0022  F6 42 0D 10			test		byte ptr 0xd[edx],0x10
0026  74 07				je		L$1
0028  89 D0				mov		eax,edx
002A  E8 00 00 00 00			call		fflush_
002F				L$1:
002F  83 7A 04 00			cmp		dword ptr 0x4[edx],0x00000000
0033  74 0E				je		L$3
0035  F6 42 0D 10			test		byte ptr 0xd[edx],0x10
0039  74 05				je		L$2
003B  03 5A 04				add		ebx,dword ptr 0x4[edx]
003E  EB 03				jmp		L$3
0040				L$2:
0040  2B 5A 04				sub		ebx,dword ptr 0x4[edx]
0043				L$3:
0043  8B 42 10				mov		eax,dword ptr 0x10[edx]
0046  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
004C  89 D8				mov		eax,ebx
004E				L$4:
004E  5A				pop		edx
004F  5B				pop		ebx
0050  C3				ret		

Routine Size: 81 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

