Module: ustrdup
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000027 bytes
0000				_ustrdup_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  89 C2				mov		edx,eax
0005  E8 00 00 00 00			call		_ustrlen_
000A  8D 58 01				lea		ebx,0x1[eax]
000D  01 DB				add		ebx,ebx
000F  89 D8				mov		eax,ebx
0011  E8 00 00 00 00			call		malloc_
0016  89 C1				mov		ecx,eax
0018  85 C0				test		eax,eax
001A  74 05				je		L$1
001C  E8 00 00 00 00			call		memcpy_
0021				L$1:
0021  89 C8				mov		eax,ecx
0023  5A				pop		edx
0024  59				pop		ecx
0025  5B				pop		ebx
0026  C3				ret		

Routine Size: 39 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

