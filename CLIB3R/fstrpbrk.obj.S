Module: fstrpbrk
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000052 bytes
0000				_fstrpbrk_:
0000  56				push		esi
0001  06				push		es
0002  83 EC 20				sub		esp,0x00000020
0005  8E C2				mov		es,edx
0007  89 C6				mov		esi,eax
0009  89 E0				mov		eax,esp
000B  8C DA				mov		edx,ds
000D  E8 00 00 00 00			call		__fsetbits_
0012  EB 2D				jmp		L$3
0014				L$1:
0014  31 D2				xor		edx,edx
0016  88 C2				mov		dl,al
0018  C1 FA 03				sar		edx,0x03
001B  8A 14 14				mov		dl,byte ptr [esp+edx]
001E  81 E2 FF 00 00 00			and		edx,0x000000ff
0024  24 07				and		al,0x07
0026  25 FF 00 00 00			and		eax,0x000000ff
002B  8A 80 00 00 00 00			mov		al,byte ptr __Bits[eax]
0031  25 FF 00 00 00			and		eax,0x000000ff
0036  85 C2				test		edx,eax
0038  74 06				je		L$2
003A  8C C2				mov		edx,es
003C  89 F0				mov		eax,esi
003E  EB 0C				jmp		L$4
0040				L$2:
0040  46				inc		esi
0041				L$3:
0041  26 8A 06				mov		al,byte ptr es:[esi]
0044  84 C0				test		al,al
0046  75 CC				jne		L$1
0048  31 D2				xor		edx,edx
004A  31 C0				xor		eax,eax
004C				L$4:
004C  83 C4 20				add		esp,0x00000020
004F  07				pop		es
0050  5E				pop		esi
0051  C3				ret		

Routine Size: 82 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

