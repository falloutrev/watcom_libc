Module: jstrchr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002D bytes
0000				jstrchr_:
0000  53				push		ebx
0001  51				push		ecx
0002  83 EC 04				sub		esp,0x00000004
0005  89 C3				mov		ebx,eax
0007  89 D1				mov		ecx,edx
0009				L$1:
0009  89 E2				mov		edx,esp
000B  89 D8				mov		eax,ebx
000D  E8 00 00 00 00			call		jgetmoji_
0012  8B 14 24				mov		edx,dword ptr [esp]
0015  66 39 D1				cmp		cx,dx
0018  75 04				jne		L$2
001A  89 D8				mov		eax,ebx
001C  EB 09				jmp		L$3
001E				L$2:
001E  89 C3				mov		ebx,eax
0020  66 85 D2				test		dx,dx
0023  75 E4				jne		L$1
0025  31 C0				xor		eax,eax
0027				L$3:
0027  83 C4 04				add		esp,0x00000004
002A  59				pop		ecx
002B  5B				pop		ebx
002C  C3				ret		

Routine Size: 45 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

