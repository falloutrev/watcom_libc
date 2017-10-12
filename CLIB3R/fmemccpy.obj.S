Module: fmemccpy
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000037 bytes
0000				_fmemccpy_:
0000  56				push		esi
0001  06				push		es
0002  0F A0				push		fs
0004  8B 74 24 10			mov		esi,dword ptr 0x10[esp]
0008  8E E2				mov		fs,edx
000A  8E C1				mov		es,ecx
000C  8B 54 24 14			mov		edx,dword ptr 0x14[esp]
0010				L$1:
0010  85 D2				test		edx,edx
0012  74 18				je		L$3
0014  26 8A 0B				mov		cl,byte ptr es:[ebx]
0017  64 88 08				mov		byte ptr fs:[eax],cl
001A  31 C9				xor		ecx,ecx
001C  26 8A 0B				mov		cl,byte ptr es:[ebx]
001F  40				inc		eax
0020  39 F1				cmp		ecx,esi
0022  75 04				jne		L$2
0024  8C E2				mov		edx,fs
0026  EB 08				jmp		L$4
0028				L$2:
0028  43				inc		ebx
0029  4A				dec		edx
002A  EB E4				jmp		L$1
002C				L$3:
002C  31 D2				xor		edx,edx
002E  31 C0				xor		eax,eax
0030				L$4:
0030  0F A1				pop		fs
0032  07				pop		es
0033  5E				pop		esi
0034  C2 08 00				ret		0x0008

Routine Size: 55 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

