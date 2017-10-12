Module: enterdb
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000026 bytes
0000				__EnterWVIDEO_:
0000  80 3D 00 00 00 00 00		cmp		byte ptr ___WD_Present,0x00
0007  74 1A				je		L$2
0009  81 E2 FF FF 00 00			and		edx,0x0000ffff
000F  52				push		edx
0010  50				push		eax
0011  CC				int		0x03
0012  EB 06				jmp		L$1
0014  57				push		edi
0015  56				push		esi
0016  49				dec		ecx
0017  44				inc		esp
0018  45				inc		ebp
0019  4F				dec		edi
001A				L$1:
001A  B8 01 00 00 00			mov		eax,0x00000001
001F  83 C4 08				add		esp,0x00000008
0022  C3				ret		
0023				L$2:
0023  31 C0				xor		eax,eax
0025  C3				ret		

Routine Size: 38 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000001 bytes
0000				___WD_Present:
0000  00                                              .

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

