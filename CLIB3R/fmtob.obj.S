Module: fmtob
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002B bytes
0000				_fmtob_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  83 EC 04				sub		esp,0x00000004
0006  89 C7				mov		edi,eax
0008  89 DE				mov		esi,ebx
000A				L$1:
000A  4E				dec		esi
000B  83 FE FF				cmp		esi,0xffffffff
000E  74 12				je		L$2
0010  89 E3				mov		ebx,esp
0012  8C D9				mov		ecx,ds
0014  9A 00 00 00 00 00 00		call		_fjgetmoji_
001B  66 83 3C 24 00			cmp		word ptr [esp],0x0000
0020  75 E8				jne		L$1
0022				L$2:
0022  29 F8				sub		eax,edi
0024  83 C4 04				add		esp,0x00000004
0027  5F				pop		edi
0028  5E				pop		esi
0029  59				pop		ecx
002A  CB				retf		

Routine Size: 43 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

