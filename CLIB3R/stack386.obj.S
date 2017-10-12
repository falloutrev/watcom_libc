Module: stack386
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002F bytes
0000				stackavail_:
0000  52				push		edx
0001  64 A1 08 00 00 00			mov		eax,dword ptr fs:[0x8]
0007  89 C2				mov		edx,eax
0009  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
000F  3B 10				cmp		edx,dword ptr [eax]
0011  76 06				jbe		L$1
0013  89 E0				mov		eax,esp
0015  29 D0				sub		eax,edx
0017  5A				pop		edx
0018  C3				ret		
0019				L$1:
0019  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
001F  89 10				mov		dword ptr [eax],edx
0021  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0027  89 C2				mov		edx,eax
0029  89 E0				mov		eax,esp
002B  2B 02				sub		eax,dword ptr [edx]
002D  5A				pop		edx
002E  C3				ret		

Routine Size: 47 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

