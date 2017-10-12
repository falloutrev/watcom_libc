Module: main2wnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000046 bytes
0000				__NTMain:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  55				push		ebp
0004  89 E5				mov		ebp,esp
0006  83 EC 08				sub		esp,0x00000008
0009  B8 01 00 00 00			mov		eax,0x00000001
000E  E8 00 00 00 00			call		__InitRtns
0013  A1 00 00 00 00			mov		eax,dword ptr ___ThreadDataSize
0018  83 C0 03				add		eax,0x00000003
001B  24 FC				and		al,0xfc
001D  31 D2				xor		edx,edx
001F  29 C4				sub		esp,eax
0021  89 E1				mov		ecx,esp
0023  8B 1D 00 00 00 00			mov		ebx,dword ptr ___ThreadDataSize
0029  89 C8				mov		eax,ecx
002B  E8 00 00 00 00			call		memset_
0030  8D 45 F8				lea		eax,-0x8[ebp]
0033  89 CA				mov		edx,ecx
0035  E8 00 00 00 00			call		__NTMainInit_
003A  E8 00 00 00 00			call		__CMain
003F  89 EC				mov		esp,ebp
0041  5D				pop		ebp
0042  5A				pop		edx
0043  59				pop		ecx
0044  5B				pop		ebx
0045  C3				ret		

Routine Size: 70 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

