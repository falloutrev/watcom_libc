Module: fstrspn
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000049 bytes
0000				_fstrspn_:
0000  56				push		esi
0001  06				push		es
0002  83 EC 20				sub		esp,0x00000020
0005  8E C2				mov		es,edx
0007  89 C6				mov		esi,eax
0009  89 E0				mov		eax,esp
000B  8C DA				mov		edx,ds
000D  E8 00 00 00 00			call		__fsetbits_
0012  31 DB				xor		ebx,ebx
0014  EB 22				jmp		L$2
0016				L$1:
0016  89 C2				mov		edx,eax
0018  C1 EA 03				shr		edx,0x03
001B  8A 14 14				mov		dl,byte ptr [esp+edx]
001E  83 E0 07				and		eax,0x00000007
0021  81 E2 FF 00 00 00			and		edx,0x000000ff
0027  8A 80 00 00 00 00			mov		al,byte ptr __Bits[eax]
002D  25 FF 00 00 00			and		eax,0x000000ff
0032  85 C2				test		edx,eax
0034  74 0B				je		L$3
0036  46				inc		esi
0037  43				inc		ebx
0038				L$2:
0038  31 C0				xor		eax,eax
003A  26 8A 06				mov		al,byte ptr es:[esi]
003D  85 C0				test		eax,eax
003F  75 D5				jne		L$1
0041				L$3:
0041  89 D8				mov		eax,ebx
0043  83 C4 20				add		esp,0x00000020
0046  07				pop		es
0047  5E				pop		esi
0048  C3				ret		

Routine Size: 73 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

