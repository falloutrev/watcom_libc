Module: clearerr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001B bytes
0000				clearerr_:
0000  52				push		edx
0001  89 C2				mov		edx,eax
0003  8B 40 10				mov		eax,dword ptr 0x10[eax]
0006  FF 15 00 00 00 00			call		dword ptr __AccessFileH
000C  80 62 0C CF			and		byte ptr 0xc[edx],0xcf
0010  8B 42 10				mov		eax,dword ptr 0x10[edx]
0013  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
0019  5A				pop		edx
001A  C3				ret		

Routine Size: 27 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

