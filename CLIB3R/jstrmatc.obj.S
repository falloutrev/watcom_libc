Module: jstrmatc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000051 bytes
0000				jstrmatch_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  57				push		edi
0004  83 EC 08				sub		esp,0x00000008
0007  89 C1				mov		ecx,eax
0009  89 D7				mov		edi,edx
000B  EB 16				jmp		L$3
000D				L$1:
000D  89 FB				mov		ebx,edi
000F				L$2:
000F  89 E2				mov		edx,esp
0011  89 D8				mov		eax,ebx
0013  E8 00 00 00 00			call		jgetmoji_
0018  89 C3				mov		ebx,eax
001A  66 83 3C 24 00			cmp		word ptr [esp],0x0000
001F  75 22				jne		L$5
0021  89 F1				mov		ecx,esi
0023				L$3:
0023  8D 54 24 04			lea		edx,0x4[esp]
0027  89 C8				mov		eax,ecx
0029  E8 00 00 00 00			call		jgetmoji_
002E  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0032  89 C6				mov		esi,eax
0034  66 85 D2				test		dx,dx
0037  75 D4				jne		L$1
0039  31 C0				xor		eax,eax
003B				L$4:
003B  83 C4 08				add		esp,0x00000008
003E  5F				pop		edi
003F  5E				pop		esi
0040  59				pop		ecx
0041  5B				pop		ebx
0042  C3				ret		
0043				L$5:
0043  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0047  66 3B 04 24			cmp		ax,word ptr [esp]
004B  75 C2				jne		L$2
004D  89 C8				mov		eax,ecx
004F  EB EA				jmp		L$4

Routine Size: 81 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

