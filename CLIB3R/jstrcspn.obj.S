Module: jstrcspn
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000050 bytes
0000				jstrcspn_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  57				push		edi
0004  83 EC 08				sub		esp,0x00000008
0007  89 C1				mov		ecx,eax
0009  89 D7				mov		edi,edx
000B  31 F6				xor		esi,esi
000D  EB 21				jmp		L$4
000F				L$1:
000F  89 FB				mov		ebx,edi
0011  EB 0A				jmp		L$3
0013				L$2:
0013  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0017  66 3B 04 24			cmp		ax,word ptr [esp]
001B  74 29				je		L$5
001D				L$3:
001D  89 E2				mov		edx,esp
001F  89 D8				mov		eax,ebx
0021  E8 00 00 00 00			call		jgetmoji_
0026  89 C3				mov		ebx,eax
0028  66 83 3C 24 00			cmp		word ptr [esp],0x0000
002D  75 E4				jne		L$2
002F  46				inc		esi
0030				L$4:
0030  8D 54 24 04			lea		edx,0x4[esp]
0034  89 C8				mov		eax,ecx
0036  E8 00 00 00 00			call		jgetmoji_
003B  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
003F  89 C1				mov		ecx,eax
0041  66 85 D2				test		dx,dx
0044  75 C9				jne		L$1
0046				L$5:
0046  89 F0				mov		eax,esi
0048  83 C4 08				add		esp,0x00000008
004B  5F				pop		edi
004C  5E				pop		esi
004D  59				pop		ecx
004E  5B				pop		ebx
004F  C3				ret		

Routine Size: 80 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

