Module: jstrncmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000053 bytes
0000				jstrncmp_:
0000  51				push		ecx
0001  56				push		esi
0002  83 EC 08				sub		esp,0x00000008
0005  89 C6				mov		esi,eax
0007  89 D1				mov		ecx,edx
0009				L$1:
0009  4B				dec		ebx
000A  83 FB FF				cmp		ebx,0xffffffff
000D  74 3C				je		L$4
000F  8D 54 24 04			lea		edx,0x4[esp]
0013  89 F0				mov		eax,esi
0015  E8 00 00 00 00			call		jgetmoji_
001A  89 E2				mov		edx,esp
001C  89 C6				mov		esi,eax
001E  89 C8				mov		eax,ecx
0020  E8 00 00 00 00			call		jgetmoji_
0025  8B 14 24				mov		edx,dword ptr [esp]
0028  89 C1				mov		ecx,eax
002A  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
002E  66 39 D0				cmp		ax,dx
0031  74 10				je		L$3
0033  73 07				jae		L$2
0035  B8 FF FF FF FF			mov		eax,0xffffffff
003A  EB 11				jmp		L$5
003C				L$2:
003C  B8 01 00 00 00			mov		eax,0x00000001
0041  EB 0A				jmp		L$5
0043				L$3:
0043  66 83 7C 24 04 00			cmp		word ptr 0x4[esp],0x0000
0049  75 BE				jne		L$1
004B				L$4:
004B  31 C0				xor		eax,eax
004D				L$5:
004D  83 C4 08				add		esp,0x00000008
0050  5E				pop		esi
0051  59				pop		ecx
0052  C3				ret		

Routine Size: 83 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

