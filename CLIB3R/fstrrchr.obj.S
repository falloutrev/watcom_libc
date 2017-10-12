Module: fstrrchr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000034 bytes
0000				_fstrrchr_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  06				push		es
0004  0F A0				push		fs
0006  8E C2				mov		es,edx
0008  89 DF				mov		edi,ebx
000A  31 F6				xor		esi,esi
000C  31 DB				xor		ebx,ebx
000E				L$1:
000E  31 D2				xor		edx,edx
0010  26 8A 10				mov		dl,byte ptr es:[eax]
0013  39 FA				cmp		edx,edi
0015  75 04				jne		L$2
0017  8C C6				mov		esi,es
0019  89 C3				mov		ebx,eax
001B				L$2:
001B  8C C2				mov		edx,es
001D  8E E2				mov		fs,edx
001F  89 C2				mov		edx,eax
0021  64 8A 0A				mov		cl,byte ptr fs:[edx]
0024  40				inc		eax
0025  84 C9				test		cl,cl
0027  75 E5				jne		L$1
0029  89 F2				mov		edx,esi
002B  89 D8				mov		eax,ebx
002D  0F A1				pop		fs
002F  07				pop		es
0030  5F				pop		edi
0031  5E				pop		esi
0032  59				pop		ecx
0033  C3				ret		

Routine Size: 52 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

