Module: jstrcmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000004C bytes
0000				jstrcmp_:
0000  53				push		ebx
0001  51				push		ecx
0002  83 EC 08				sub		esp,0x00000008
0005  89 C3				mov		ebx,eax
0007  89 D1				mov		ecx,edx
0009				L$1:
0009  89 E2				mov		edx,esp
000B  89 D8				mov		eax,ebx
000D  E8 00 00 00 00			call		jgetmoji_
0012  8D 54 24 04			lea		edx,0x4[esp]
0016  89 C3				mov		ebx,eax
0018  89 C8				mov		eax,ecx
001A  E8 00 00 00 00			call		jgetmoji_
001F  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0023  89 C1				mov		ecx,eax
0025  8B 04 24				mov		eax,dword ptr [esp]
0028  66 39 D0				cmp		ax,dx
002B  74 10				je		L$3
002D  73 07				jae		L$2
002F  B8 FF FF FF FF			mov		eax,0xffffffff
0034  EB 10				jmp		L$4
0036				L$2:
0036  B8 01 00 00 00			mov		eax,0x00000001
003B  EB 09				jmp		L$4
003D				L$3:
003D  66 83 3C 24 00			cmp		word ptr [esp],0x0000
0042  75 C5				jne		L$1
0044  31 C0				xor		eax,eax
0046				L$4:
0046  83 C4 08				add		esp,0x00000008
0049  59				pop		ecx
004A  5B				pop		ebx
004B  C3				ret		

Routine Size: 76 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

