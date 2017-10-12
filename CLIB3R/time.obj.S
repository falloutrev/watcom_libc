Module: time
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002F bytes
0000				time_:
0000  53				push		ebx
0001  52				push		edx
0002  83 EC 24				sub		esp,0x00000024
0005  89 C2				mov		edx,eax
0007  89 E0				mov		eax,esp
0009  E8 00 00 00 00			call		__getctime_
000E  3D F4 01 00 00			cmp		eax,0x000001f4
0013  7C 03				jl		L$1
0015  FF 04 24				inc		dword ptr [esp]
0018				L$1:
0018  89 E0				mov		eax,esp
001A  E8 00 00 00 00			call		mktime_
001F  89 C3				mov		ebx,eax
0021  85 D2				test		edx,edx
0023  74 02				je		L$2
0025  89 02				mov		dword ptr [edx],eax
0027				L$2:
0027  89 D8				mov		eax,ebx
0029  83 C4 24				add		esp,0x00000024
002C  5A				pop		edx
002D  5B				pop		ebx
002E  C3				ret		

Routine Size: 47 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

