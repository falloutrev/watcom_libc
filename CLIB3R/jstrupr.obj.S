Module: jstrupr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000042 bytes
0000				jstrupr_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  83 EC 04				sub		esp,0x00000004
0007  89 C3				mov		ebx,eax
0009  89 C6				mov		esi,eax
000B  EB 16				jmp		L$2
000D				L$1:
000D  31 C0				xor		eax,eax
000F  66 89 D0				mov		ax,dx
0012  31 D2				xor		edx,edx
0014  E8 00 00 00 00			call		jtoupper_
0019  66 89 C2				mov		dx,ax
001C  89 C8				mov		eax,ecx
001E  E8 00 00 00 00			call		jputmoji_
0023				L$2:
0023  89 C1				mov		ecx,eax
0025  89 E2				mov		edx,esp
0027  89 D8				mov		eax,ebx
0029  E8 00 00 00 00			call		jgetmoji_
002E  8B 14 24				mov		edx,dword ptr [esp]
0031  89 C3				mov		ebx,eax
0033  66 85 D2				test		dx,dx
0036  75 D5				jne		L$1
0038  89 F0				mov		eax,esi
003A  83 C4 04				add		esp,0x00000004
003D  5E				pop		esi
003E  5A				pop		edx
003F  59				pop		ecx
0040  5B				pop		ebx
0041  C3				ret		

Routine Size: 66 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

