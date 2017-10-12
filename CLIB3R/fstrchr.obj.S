Module: fstrchr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002D bytes
0000				_fstrchr_:
0000  51				push		ecx
0001  06				push		es
0002  0F A0				push		fs
0004  8E C2				mov		es,edx
0006				L$1:
0006  31 D2				xor		edx,edx
0008  26 8A 10				mov		dl,byte ptr es:[eax]
000B  39 DA				cmp		edx,ebx
000D  75 07				jne		L$2
000F  8C C2				mov		edx,es
0011  0F A1				pop		fs
0013  07				pop		es
0014  59				pop		ecx
0015  C3				ret		
0016				L$2:
0016  8C C2				mov		edx,es
0018  8E E2				mov		fs,edx
001A  89 C2				mov		edx,eax
001C  64 8A 0A				mov		cl,byte ptr fs:[edx]
001F  40				inc		eax
0020  84 C9				test		cl,cl
0022  75 E2				jne		L$1
0024  31 D2				xor		edx,edx
0026  31 C0				xor		eax,eax
0028  0F A1				pop		fs
002A  07				pop		es
002B  59				pop		ecx
002C  C3				ret		

Routine Size: 45 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

