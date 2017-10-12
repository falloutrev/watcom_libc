Module: wmain
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000020 bytes
0000				_WinMain@16:
0000  53				push		ebx
0001  56				push		esi
0002  8B 54 24 18			mov		edx,dword ptr 0x18[esp]
0006  52				push		edx
0007  8B 5C 24 18			mov		ebx,dword ptr 0x18[esp]
000B  53				push		ebx
000C  8B 4C 24 18			mov		ecx,dword ptr 0x18[esp]
0010  51				push		ecx
0011  8B 74 24 18			mov		esi,dword ptr 0x18[esp]
0015  56				push		esi
0016  E8 00 00 00 00			call		_DefaultWinMain
001B  5E				pop		esi
001C  5B				pop		ebx
001D  C2 10 00				ret		0x0010

Routine Size: 32 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

