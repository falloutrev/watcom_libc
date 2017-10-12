Module: eof
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002D bytes
0000				eof_:
0000  53				push		ebx
0001  52				push		edx
0002  89 C2				mov		edx,eax
0004  E8 00 00 00 00			call		filelength_
0009  89 C3				mov		ebx,eax
000B  83 F8 FF				cmp		eax,0xffffffff
000E  74 1A				je		L$2
0010  89 D0				mov		eax,edx
0012  E8 00 00 00 00			call		tell_
0017  83 F8 FF				cmp		eax,0xffffffff
001A  74 0E				je		L$2
001C  39 D8				cmp		eax,ebx
001E  75 08				jne		L$1
0020  B8 01 00 00 00			mov		eax,0x00000001
0025  5A				pop		edx
0026  5B				pop		ebx
0027  C3				ret		
0028				L$1:
0028  31 C0				xor		eax,eax
002A				L$2:
002A  5A				pop		edx
002B  5B				pop		ebx
002C  C3				ret		

Routine Size: 45 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

