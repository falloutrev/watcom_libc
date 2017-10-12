Module: jstrskip
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000004F bytes
0000				jstrskip_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  57				push		edi
0004  83 EC 08				sub		esp,0x00000008
0007  89 C1				mov		ecx,eax
0009  89 D7				mov		edi,edx
000B  EB 22				jmp		L$4
000D				L$1:
000D  89 FB				mov		ebx,edi
000F				L$2:
000F  89 E2				mov		edx,esp
0011  89 D8				mov		eax,ebx
0013  E8 00 00 00 00			call		jgetmoji_
0018  8B 14 24				mov		edx,dword ptr [esp]
001B  89 C3				mov		ebx,eax
001D  66 3B 54 24 04			cmp		dx,word ptr 0x4[esp]
0022  74 09				je		L$3
0024  66 85 D2				test		dx,dx
0027  75 E6				jne		L$2
0029  89 C8				mov		eax,ecx
002B  EB 1A				jmp		L$5
002D				L$3:
002D  89 F1				mov		ecx,esi
002F				L$4:
002F  8D 54 24 04			lea		edx,0x4[esp]
0033  89 C8				mov		eax,ecx
0035  E8 00 00 00 00			call		jgetmoji_
003A  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
003E  89 C6				mov		esi,eax
0040  66 85 D2				test		dx,dx
0043  75 C8				jne		L$1
0045  31 C0				xor		eax,eax
0047				L$5:
0047  83 C4 08				add		esp,0x00000008
004A  5F				pop		edi
004B  5E				pop		esi
004C  59				pop		ecx
004D  5B				pop		ebx
004E  C3				ret		

Routine Size: 79 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

