Module: strpbrk
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000004A bytes
0000				strpbrk_:
0000  53				push		ebx
0001  83 EC 20				sub		esp,0x00000020
0004  89 C3				mov		ebx,eax
0006  89 E0				mov		eax,esp
0008  E8 00 00 00 00			call		__setbits_
000D  EB 2E				jmp		L$3
000F				L$1:
000F  31 D2				xor		edx,edx
0011  88 C2				mov		dl,al
0013  C1 FA 03				sar		edx,0x03
0016  8A 14 14				mov		dl,byte ptr [esp+edx]
0019  81 E2 FF 00 00 00			and		edx,0x000000ff
001F  24 07				and		al,0x07
0021  25 FF 00 00 00			and		eax,0x000000ff
0026  8A 80 00 00 00 00			mov		al,byte ptr __Bits[eax]
002C  25 FF 00 00 00			and		eax,0x000000ff
0031  85 C2				test		edx,eax
0033  74 07				je		L$2
0035  89 D8				mov		eax,ebx
0037  83 C4 20				add		esp,0x00000020
003A  5B				pop		ebx
003B  C3				ret		
003C				L$2:
003C  43				inc		ebx
003D				L$3:
003D  8A 03				mov		al,byte ptr [ebx]
003F  84 C0				test		al,al
0041  75 CC				jne		L$1
0043  31 C0				xor		eax,eax
0045  83 C4 20				add		esp,0x00000020
0048  5B				pop		ebx
0049  C3				ret		

Routine Size: 74 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

