Module: strnicmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000053 bytes
0000				_strnicmp_:
0000				strnicmp_:
0000  51				push		ecx
0001  56				push		esi
0002  89 C1				mov		ecx,eax
0004  89 DE				mov		esi,ebx
0006				L$1:
0006  85 F6				test		esi,esi
0008  75 05				jne		L$3
000A				L$2:
000A  31 C0				xor		eax,eax
000C  5E				pop		esi
000D  59				pop		ecx
000E  C3				ret		
000F				L$3:
000F  8A 01				mov		al,byte ptr [ecx]
0011  31 DB				xor		ebx,ebx
0013  8A 22				mov		ah,byte ptr [edx]
0015  88 C3				mov		bl,al
0017  83 FB 41				cmp		ebx,0x00000041
001A  7C 07				jl		L$4
001C  83 FB 5A				cmp		ebx,0x0000005a
001F  7F 02				jg		L$4
0021  04 20				add		al,0x20
0023				L$4:
0023  31 DB				xor		ebx,ebx
0025  88 E3				mov		bl,ah
0027  83 FB 41				cmp		ebx,0x00000041
002A  7C 08				jl		L$5
002C  83 FB 5A				cmp		ebx,0x0000005a
002F  7F 03				jg		L$5
0031  80 C4 20				add		ah,0x20
0034				L$5:
0034  38 E0				cmp		al,ah
0036  74 12				je		L$6
0038  31 D2				xor		edx,edx
003A  88 C2				mov		dl,al
003C  88 E0				mov		al,ah
003E  25 FF 00 00 00			and		eax,0x000000ff
0043  29 C2				sub		edx,eax
0045  89 D0				mov		eax,edx
0047  5E				pop		esi
0048  59				pop		ecx
0049  C3				ret		
004A				L$6:
004A  84 E4				test		ah,ah
004C  74 BC				je		L$2
004E  41				inc		ecx
004F  42				inc		edx
0050  4E				dec		esi
0051  EB B3				jmp		L$1

Routine Size: 83 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

