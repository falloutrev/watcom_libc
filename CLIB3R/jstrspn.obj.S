Module: jstrspn
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000005A bytes
0000				jstrspn_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  57				push		edi
0004  55				push		ebp
0005  83 EC 08				sub		esp,0x00000008
0008  89 C5				mov		ebp,eax
000A  89 D7				mov		edi,edx
000C  89 C1				mov		ecx,eax
000E  EB 27				jmp		L$4
0010				L$1:
0010  89 FB				mov		ebx,edi
0012				L$2:
0012  89 E2				mov		edx,esp
0014  89 D8				mov		eax,ebx
0016  E8 00 00 00 00			call		jgetmoji_
001B  89 C3				mov		ebx,eax
001D  66 83 3C 24 00			cmp		word ptr [esp],0x0000
0022  74 0A				je		L$3
0024  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0028  66 3B 04 24			cmp		ax,word ptr [esp]
002C  75 E4				jne		L$2
002E				L$3:
002E  66 83 3C 24 00			cmp		word ptr [esp],0x0000
0033  74 18				je		L$5
0035  89 F1				mov		ecx,esi
0037				L$4:
0037  8D 54 24 04			lea		edx,0x4[esp]
003B  89 C8				mov		eax,ecx
003D  E8 00 00 00 00			call		jgetmoji_
0042  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0046  89 C6				mov		esi,eax
0048  66 85 D2				test		dx,dx
004B  75 C3				jne		L$1
004D				L$5:
004D  89 C8				mov		eax,ecx
004F  29 E8				sub		eax,ebp
0051  83 C4 08				add		esp,0x00000008
0054  5D				pop		ebp
0055  5F				pop		edi
0056  5E				pop		esi
0057  59				pop		ecx
0058  5B				pop		ebx
0059  C3				ret		

Routine Size: 90 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

