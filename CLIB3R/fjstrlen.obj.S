Module: fjstrlen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000026 bytes
0000				_fjstrlen_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  83 EC 04				sub		esp,0x00000004
0006  31 F6				xor		esi,esi
0008				L$1:
0008  89 E3				mov		ebx,esp
000A  8C D9				mov		ecx,ds
000C  9A 00 00 00 00 00 00		call		_fjgetmoji_
0013  66 83 3C 24 00			cmp		word ptr [esp],0x0000
0018  74 03				je		L$2
001A  46				inc		esi
001B  EB EB				jmp		L$1
001D				L$2:
001D  89 F0				mov		eax,esi
001F  83 C4 04				add		esp,0x00000004
0022  5E				pop		esi
0023  59				pop		ecx
0024  5B				pop		ebx
0025  CB				retf		

Routine Size: 38 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

