Module: lmainwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000019 bytes
0000				_LibMain@12:
0000  53				push		ebx
0001  8B 54 24 10			mov		edx,dword ptr 0x10[esp]
0005  52				push		edx
0006  8B 5C 24 10			mov		ebx,dword ptr 0x10[esp]
000A  53				push		ebx
000B  8B 4C 24 10			mov		ecx,dword ptr 0x10[esp]
000F  51				push		ecx
0010  E8 00 00 00 00			call		_DLLMain
0015  5B				pop		ebx
0016  C2 0C 00				ret		0x000c

Routine Size: 25 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

