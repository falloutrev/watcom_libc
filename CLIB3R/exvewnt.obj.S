Module: exvewnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000033 bytes
0000				execve_:
0000  51				push		ecx
0001  89 D9				mov		ecx,ebx
0003  89 D3				mov		ebx,edx
0005  89 C2				mov		edx,eax
0007  31 C0				xor		eax,eax
0009  E8 00 00 00 00			call		spawnve_
000E  89 C2				mov		edx,eax
0010  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0016  83 78 04 00			cmp		dword ptr 0x4[eax],0x00000000
001A  74 07				je		L$1
001C  B8 FF FF FF FF			mov		eax,0xffffffff
0021  59				pop		ecx
0022  C3				ret		
0023				L$1:
0023  FF 15 00 00 00 00			call		dword ptr ___int23_exit
0029  52				push		edx
002A  E8 00 00 00 00			call		_ExitProcess
002F  31 C0				xor		eax,eax
0031  59				pop		ecx
0032  C3				ret		

Routine Size: 51 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

