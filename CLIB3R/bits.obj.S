Module: bits
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000003E bytes
0000				__setbits_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  89 C6				mov		esi,eax
0005  89 D1				mov		ecx,edx
0007  BB 20 00 00 00			mov		ebx,0x00000020
000C  31 D2				xor		edx,edx
000E  E8 00 00 00 00			call		memset_
0013  EB 1F				jmp		L$2
0015				L$1:
0015  31 C0				xor		eax,eax
0017  88 D0				mov		al,dl
0019  C1 F8 03				sar		eax,0x03
001C  80 E2 07				and		dl,0x07
001F  81 E2 FF 00 00 00			and		edx,0x000000ff
0025  8A 92 00 00 00 00			mov		dl,byte ptr __Bits[edx]
002B  8A 34 06				mov		dh,byte ptr [esi+eax]
002E  08 D6				or		dh,dl
0030  41				inc		ecx
0031  88 34 06				mov		byte ptr [esi+eax],dh
0034				L$2:
0034  8A 11				mov		dl,byte ptr [ecx]
0036  84 D2				test		dl,dl
0038  75 DB				jne		L$1
003A  5E				pop		esi
003B  59				pop		ecx
003C  5B				pop		ebx
003D  C3				ret		

Routine Size: 62 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000008 bytes
0000				__Bits:
0000  01 02 04 08 10 20 40 80                         ..... @.

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

