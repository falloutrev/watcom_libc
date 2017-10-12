Module: calloc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000018 bytes
0000				calloc_:
0000  53				push		ebx
0001  0F AF C2				imul		eax,edx
0004  89 C3				mov		ebx,eax
0006  E8 00 00 00 00			call		malloc_
000B  85 C0				test		eax,eax
000D  74 07				je		L$1
000F  31 D2				xor		edx,edx
0011  E8 00 00 00 00			call		memset_
0016				L$1:
0016  5B				pop		ebx
0017  C3				ret		

Routine Size: 24 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

