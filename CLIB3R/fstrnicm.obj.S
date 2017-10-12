Module: fstrnicm
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000062 bytes
0000				_fstrnicmp_:
0000  56				push		esi
0001  06				push		es
0002  0F A0				push		fs
0004  8B 74 24 10			mov		esi,dword ptr 0x10[esp]
0008  8E E2				mov		fs,edx
000A  8E C1				mov		es,ecx
000C  89 C2				mov		edx,eax
000E				L$1:
000E  85 F6				test		esi,esi
0010  75 04				jne		L$3
0012				L$2:
0012  31 C0				xor		eax,eax
0014  EB 45				jmp		L$7
0016				L$3:
0016  64 8A 02				mov		al,byte ptr fs:[edx]
0019  31 C9				xor		ecx,ecx
001B  88 C1				mov		cl,al
001D  83 F9 41				cmp		ecx,0x00000041
0020  7C 07				jl		L$4
0022  83 F9 5A				cmp		ecx,0x0000005a
0025  7F 02				jg		L$4
0027  04 20				add		al,0x20
0029				L$4:
0029  26 8A 23				mov		ah,byte ptr es:[ebx]
002C  31 C9				xor		ecx,ecx
002E  88 E1				mov		cl,ah
0030  83 F9 41				cmp		ecx,0x00000041
0033  7C 08				jl		L$5
0035  83 F9 5A				cmp		ecx,0x0000005a
0038  7F 03				jg		L$5
003A  80 C4 20				add		ah,0x20
003D				L$5:
003D  38 E0				cmp		al,ah
003F  74 11				je		L$6
0041  31 D2				xor		edx,edx
0043  88 C2				mov		dl,al
0045  88 E0				mov		al,ah
0047  25 FF 00 00 00			and		eax,0x000000ff
004C  29 C2				sub		edx,eax
004E  89 D0				mov		eax,edx
0050  EB 09				jmp		L$7
0052				L$6:
0052  84 E4				test		ah,ah
0054  74 BC				je		L$2
0056  42				inc		edx
0057  43				inc		ebx
0058  4E				dec		esi
0059  EB B3				jmp		L$1
005B				L$7:
005B  0F A1				pop		fs
005D  07				pop		es
005E  5E				pop		esi
005F  C2 04 00				ret		0x0004

Routine Size: 98 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

