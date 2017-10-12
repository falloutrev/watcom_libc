Module: close
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000048 bytes
0000				close_:
0000  53				push		ebx
0001  52				push		edx
0002  89 C2				mov		edx,eax
0004  85 C0				test		eax,eax
0006  7C 08				jl		L$1
0008  3B 05 00 00 00 00			cmp		eax,dword ptr ___NFiles
000E  76 14				jbe		L$2
0010				L$1:
0010  B8 04 00 00 00			mov		eax,0x00000004
0015  BB FF FF FF FF			mov		ebx,0xffffffff
001A  E8 00 00 00 00			call		__set_errno_
001F  89 D8				mov		eax,ebx
0021  5A				pop		edx
0022  5B				pop		ebx
0023  C3				ret		
0024				L$2:
0024  FF 15 00 00 00 00			call		dword ptr __AccessFileH
002A  89 D0				mov		eax,edx
002C  E8 00 00 00 00			call		__close_
0031  89 C3				mov		ebx,eax
0033  89 D0				mov		eax,edx
0035  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
003B  89 D0				mov		eax,edx
003D  FF 15 00 00 00 00			call		dword ptr __FiniAccessH
0043  89 D8				mov		eax,ebx
0045  5A				pop		edx
0046  5B				pop		ebx
0047  C3				ret		

Routine Size: 72 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

