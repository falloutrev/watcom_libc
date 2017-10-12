Module: fjputmoj
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000028 bytes
0000				_fjputmoji_:
0000  51				push		ecx
0001  06				push		es
0002  8E C2				mov		es,edx
0004  89 C1				mov		ecx,eax
0006  31 D2				xor		edx,edx
0008  66 89 DA				mov		dx,bx
000B  89 D0				mov		eax,edx
000D  E8 00 00 00 00			call		jiszen_
0012  85 C0				test		eax,eax
0014  74 07				je		L$1
0016  C1 FA 08				sar		edx,0x08
0019  26 88 11				mov		byte ptr es:[ecx],dl
001C  41				inc		ecx
001D				L$1:
001D  8D 41 01				lea		eax,0x1[ecx]
0020  8C C2				mov		edx,es
0022  26 88 19				mov		byte ptr es:[ecx],bl
0025  07				pop		es
0026  59				pop		ecx
0027  CB				retf		

Routine Size: 40 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

