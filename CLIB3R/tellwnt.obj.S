Module: tellwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000003D bytes
0000				tell_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  89 C3				mov		ebx,eax
0005  89 C2				mov		edx,eax
0007  A1 00 00 00 00			mov		eax,dword ptr ___FileHandleIDs
000C  8B 14 90				mov		edx,dword ptr [eax+edx*4]
000F  89 D8				mov		eax,ebx
0011  FF 15 00 00 00 00			call		dword ptr __AccessFileH
0017  6A 01				push		0x00000001
0019  6A 00				push		0x00000000
001B  6A 00				push		0x00000000
001D  52				push		edx
001E  E8 00 00 00 00			call		_SetFilePointer
0023  89 C2				mov		edx,eax
0025  83 F8 FF				cmp		eax,0xffffffff
0028  75 05				jne		L$1
002A  E8 00 00 00 00			call		__set_errno_nt_
002F				L$1:
002F  89 D8				mov		eax,ebx
0031  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
0037  89 D0				mov		eax,edx
0039  5A				pop		edx
003A  59				pop		ecx
003B  5B				pop		ebx
003C  C3				ret		

Routine Size: 61 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

