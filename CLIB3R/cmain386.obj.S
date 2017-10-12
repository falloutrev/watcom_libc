Module: cmain386
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000004F bytes
0000				__CMain:
0000  52				push		edx
0001  55				push		ebp
0002  89 E5				mov		ebp,esp
0004  8B 15 00 00 00 00			mov		edx,dword ptr __ASTACKSIZ
000A  83 C2 03				add		edx,0x00000003
000D  80 E2 FC				and		dl,0xfc
0010  E8 00 00 00 00			call		stackavail_
0015  39 C2				cmp		edx,eax
0017  73 08				jae		L$1
0019  89 D0				mov		eax,edx
001B  29 C4				sub		esp,eax
001D  89 E0				mov		eax,esp
001F  EB 02				jmp		L$2
0021				L$1:
0021  31 C0				xor		eax,eax
0023				L$2:
0023  8B 15 00 00 00 00			mov		edx,dword ptr __ASTACKSIZ
0029  01 D0				add		eax,edx
002B  A3 00 00 00 00			mov		dword ptr __ASTACKPTR,eax
0030  E8 00 00 00 00			call		__CommonInit_
0035  8B 15 00 00 00 00			mov		edx,dword ptr ____Argv
003B  A1 00 00 00 00			mov		eax,dword ptr ____Argc
0040  E8 00 00 00 00			call		main_
0045  E8 00 00 00 00			call		exit_
004A  89 EC				mov		esp,ebp
004C  5D				pop		ebp
004D  5A				pop		edx
004E  C3				ret		

Routine Size: 79 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

