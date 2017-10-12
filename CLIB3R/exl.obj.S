Module: exl
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000018 bytes
0000				execl_:
0000  53				push		ebx
0001  52				push		edx
0002  8D 54 24 10			lea		edx,0x10[esp]
0006  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
000A  8B 1D 00 00 00 00			mov		ebx,dword ptr _environ
0010  E8 00 00 00 00			call		execve_
0015  5A				pop		edx
0016  5B				pop		ebx
0017  C3				ret		

Routine Size: 24 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

