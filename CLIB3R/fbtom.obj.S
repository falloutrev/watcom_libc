Module: fbtom
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000036 bytes
0000				_fbtom_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 04				sub		esp,0x00000004
0007  89 C6				mov		esi,eax
0009  31 FF				xor		edi,edi
000B  8D 2C 18				lea		ebp,[eax+ebx]
000E				L$1:
000E  89 E3				mov		ebx,esp
0010  8C D9				mov		ecx,ds
0012  89 F0				mov		eax,esi
0014  9A 00 00 00 00 00 00		call		_fjgetmoji_
001B  8B 1C 24				mov		ebx,dword ptr [esp]
001E  89 C6				mov		esi,eax
0020  66 85 DB				test		bx,bx
0023  74 07				je		L$2
0025  39 E8				cmp		eax,ebp
0027  77 03				ja		L$2
0029  47				inc		edi
002A  EB E2				jmp		L$1
002C				L$2:
002C  89 F8				mov		eax,edi
002E  83 C4 04				add		esp,0x00000004
0031  5D				pop		ebp
0032  5F				pop		edi
0033  5E				pop		esi
0034  59				pop		ecx
0035  CB				retf		

Routine Size: 54 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

