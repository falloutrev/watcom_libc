Module: jstrstr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000009F bytes
0000				jstrstr_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  57				push		edi
0004  83 EC 08				sub		esp,0x00000008
0007  89 C3				mov		ebx,eax
0009  89 D7				mov		edi,edx
000B  8D 54 24 04			lea		edx,0x4[esp]
000F  89 F8				mov		eax,edi
0011  E8 00 00 00 00			call		jgetmoji_
0016  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
001A  89 C1				mov		ecx,eax
001C  66 85 D2				test		dx,dx
001F  75 07				jne		L$1
0021  89 D8				mov		eax,ebx
0023  E9 6F 00 00 00			jmp		L$6
0028				L$1:
0028  89 E2				mov		edx,esp
002A  89 D8				mov		eax,ebx
002C  89 DE				mov		esi,ebx
002E  E8 00 00 00 00			call		jgetmoji_
0033  89 C3				mov		ebx,eax
0035  66 83 3C 24 00			cmp		word ptr [esp],0x0000
003A  75 04				jne		L$3
003C				L$2:
003C  31 C0				xor		eax,eax
003E  EB 57				jmp		L$6
0040				L$3:
0040  8B 04 24				mov		eax,dword ptr [esp]
0043  66 3B 44 24 04			cmp		ax,word ptr 0x4[esp]
0048  75 DE				jne		L$1
004A				L$4:
004A  89 E2				mov		edx,esp
004C  89 D8				mov		eax,ebx
004E  E8 00 00 00 00			call		jgetmoji_
0053  8D 54 24 04			lea		edx,0x4[esp]
0057  89 C3				mov		ebx,eax
0059  89 C8				mov		eax,ecx
005B  E8 00 00 00 00			call		jgetmoji_
0060  89 C1				mov		ecx,eax
0062  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0066  66 85 C0				test		ax,ax
0069  75 04				jne		L$5
006B  89 F0				mov		eax,esi
006D  EB 28				jmp		L$6
006F				L$5:
006F  8B 14 24				mov		edx,dword ptr [esp]
0072  66 85 D2				test		dx,dx
0075  74 C5				je		L$2
0077  66 39 D0				cmp		ax,dx
007A  74 CE				je		L$4
007C  46				inc		esi
007D  89 E2				mov		edx,esp
007F  89 F0				mov		eax,esi
0081  E8 00 00 00 00			call		jgetmoji_
0086  8D 54 24 04			lea		edx,0x4[esp]
008A  89 C3				mov		ebx,eax
008C  89 F8				mov		eax,edi
008E  E8 00 00 00 00			call		jgetmoji_
0093  89 C1				mov		ecx,eax
0095  EB A9				jmp		L$3
0097				L$6:
0097  83 C4 08				add		esp,0x00000008
009A  5F				pop		edi
009B  5E				pop		esi
009C  59				pop		ecx
009D  5B				pop		ebx
009E  C3				ret		

Routine Size: 159 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

