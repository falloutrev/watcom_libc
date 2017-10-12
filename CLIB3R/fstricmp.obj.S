Module: fstricmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000004F bytes
0000				_fstricmp_:
0000  06				push		es
0001  0F A0				push		fs
0003  8E C2				mov		es,edx
0005  8E E1				mov		fs,ecx
0007  89 C2				mov		edx,eax
0009				L$1:
0009  26 8A 02				mov		al,byte ptr es:[edx]
000C  31 C9				xor		ecx,ecx
000E  88 C1				mov		cl,al
0010  83 F9 41				cmp		ecx,0x00000041
0013  7C 07				jl		L$2
0015  83 F9 5A				cmp		ecx,0x0000005a
0018  7F 02				jg		L$2
001A  04 20				add		al,0x20
001C				L$2:
001C  64 8A 23				mov		ah,byte ptr fs:[ebx]
001F  31 C9				xor		ecx,ecx
0021  88 E1				mov		cl,ah
0023  83 F9 41				cmp		ecx,0x00000041
0026  7C 08				jl		L$3
0028  83 F9 5A				cmp		ecx,0x0000005a
002B  7F 03				jg		L$3
002D  80 C4 20				add		ah,0x20
0030				L$3:
0030  38 E0				cmp		al,ah
0032  75 08				jne		L$4
0034  84 E4				test		ah,ah
0036  74 04				je		L$4
0038  42				inc		edx
0039  43				inc		ebx
003A  EB CD				jmp		L$1
003C				L$4:
003C  31 D2				xor		edx,edx
003E  88 C2				mov		dl,al
0040  88 E0				mov		al,ah
0042  25 FF 00 00 00			and		eax,0x000000ff
0047  29 C2				sub		edx,eax
0049  89 D0				mov		eax,edx
004B  0F A1				pop		fs
004D  07				pop		es
004E  C3				ret		

Routine Size: 79 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

