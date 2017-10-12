Module: regdata
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000015 bytes
0000				__RegisterThreadDataSize_:
0000  53				push		ebx
0001  52				push		edx
0002  89 C2				mov		edx,eax
0004  A1 00 00 00 00			mov		eax,dword ptr ___ThreadDataSize
0009  8D 1C 10				lea		ebx,[eax+edx]
000C  89 1D 00 00 00 00			mov		dword ptr ___ThreadDataSize,ebx
0012  5A				pop		edx
0013  5B				pop		ebx
0014  C3				ret		

Routine Size: 21 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000004 bytes
0000				___ThreadDataSize:
0000  E2 00 00 00                                     ....

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

