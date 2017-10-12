Module: lseekwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000003A bytes
0000				_lseek_:
0000				lseek_:
0000  51				push		ecx
0001  56				push		esi
0002  89 C6				mov		esi,eax
0004  89 D1				mov		ecx,edx
0006  8B 15 00 00 00 00			mov		edx,dword ptr ___FileHandleIDs
000C  8B 14 82				mov		edx,dword ptr [edx+eax*4]
000F  FF 15 00 00 00 00			call		dword ptr __AccessFileH
0015  53				push		ebx
0016  6A 00				push		0x00000000
0018  51				push		ecx
0019  52				push		edx
001A  E8 00 00 00 00			call		_SetFilePointer
001F  89 C2				mov		edx,eax
0021  89 C3				mov		ebx,eax
0023  89 F0				mov		eax,esi
0025  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
002B  83 FA FF				cmp		edx,0xffffffff
002E  75 05				jne		L$1
0030  E8 00 00 00 00			call		__set_errno_nt_
0035				L$1:
0035  89 D8				mov		eax,ebx
0037  5E				pop		esi
0038  59				pop		ecx
0039  C3				ret		

Routine Size: 58 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

