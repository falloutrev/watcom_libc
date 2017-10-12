Module: fjstrchr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000044 bytes
0000				_fjstrchr_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  83 EC 08				sub		esp,0x00000008
0006  89 D6				mov		esi,edx
0008  89 C7				mov		edi,eax
000A  89 1C 24				mov		dword ptr [esp],ebx
000D				L$1:
000D  8D 5C 24 04			lea		ebx,0x4[esp]
0011  8C D9				mov		ecx,ds
0013  89 F2				mov		edx,esi
0015  89 F8				mov		eax,edi
0017  9A 00 00 00 00 00 00		call		_fjgetmoji_
001E  8B 1C 24				mov		ebx,dword ptr [esp]
0021  8B 4C 24 04			mov		ecx,dword ptr 0x4[esp]
0025  66 39 CB				cmp		bx,cx
0028  75 06				jne		L$2
002A  89 F2				mov		edx,esi
002C  89 F8				mov		eax,edi
002E  EB 0D				jmp		L$3
0030				L$2:
0030  89 D6				mov		esi,edx
0032  89 C7				mov		edi,eax
0034  66 85 C9				test		cx,cx
0037  75 D4				jne		L$1
0039  31 D2				xor		edx,edx
003B  31 C0				xor		eax,eax
003D				L$3:
003D  83 C4 08				add		esp,0x00000008
0040  5F				pop		edi
0041  5E				pop		esi
0042  59				pop		ecx
0043  CB				retf		

Routine Size: 68 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

