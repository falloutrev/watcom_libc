Module: winlsem
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000004A bytes
0000				__InitWinLinesSem_:
0000  51				push		ecx
0001  52				push		edx
0002  6A 00				push		0x00000000
0004  6A 00				push		0x00000000
0006  6A 00				push		0x00000000
0008  E8 00 00 00 00			call		_CreateMutexA
000D  A3 00 00 00 00			mov		dword ptr ___WinLines_sem,eax
0012  5A				pop		edx
0013  59				pop		ecx
0014  C3				ret		

Routine Size: 21 bytes,    Routine Base: _TEXT + 0000

0015				__FiniWinLinesSem_:
0015  51				push		ecx
0016  52				push		edx
0017  8B 15 00 00 00 00			mov		edx,dword ptr ___WinLines_sem
001D  52				push		edx
001E  E8 00 00 00 00			call		_CloseHandle
0023  5A				pop		edx
0024  59				pop		ecx
0025  C3				ret		

Routine Size: 17 bytes,    Routine Base: _TEXT + 0015

0026				_AccessWinLines_:
0026  51				push		ecx
0027  52				push		edx
0028  6A FF				push		0xffffffff
002A  8B 15 00 00 00 00			mov		edx,dword ptr ___WinLines_sem
0030  52				push		edx
0031  E8 00 00 00 00			call		_WaitForSingleObject
0036  5A				pop		edx
0037  59				pop		ecx
0038  C3				ret		

Routine Size: 19 bytes,    Routine Base: _TEXT + 0026

0039				_ReleaseWinLines_:
0039  51				push		ecx
003A  52				push		edx
003B  8B 15 00 00 00 00			mov		edx,dword ptr ___WinLines_sem
0041  52				push		edx
0042  E8 00 00 00 00			call		_ReleaseMutex
0047  5A				pop		edx
0048  59				pop		ecx
0049  C3				ret		

Routine Size: 17 bytes,    Routine Base: _TEXT + 0039

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

