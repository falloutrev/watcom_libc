Module: uputs
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002D bytes
0000				_uputs_:
0000  53				push		ebx
0001  52				push		edx
0002  BA 1A 00 00 00			mov		edx,offset ___iob+0x1a
0007  E8 00 00 00 00			call		_ufputs_
000C  89 C3				mov		ebx,eax
000E  83 F8 FF				cmp		eax,0xffffffff
0011  74 17				je		L$1
0013  BA 1A 00 00 00			mov		edx,offset ___iob+0x1a
0018  B8 0A 00 00 00			mov		eax,0x0000000a
001D  E8 00 00 00 00			call		_ufputc_
0022  83 F8 0A				cmp		eax,0x0000000a
0025  75 03				jne		L$1
0027  8D 43 01				lea		eax,0x1[ebx]
002A				L$1:
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

