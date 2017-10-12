Module: memicmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000004F bytes
0000				_memicmp_:
0000				memicmp_:
0000  51				push		ecx
0001  56				push		esi
0002  89 C1				mov		ecx,eax
0004  89 DE				mov		esi,ebx
0006  EB 3E				jmp		L$5
0008				L$1:
0008  8A 01				mov		al,byte ptr [ecx]
000A  31 DB				xor		ebx,ebx
000C  8A 22				mov		ah,byte ptr [edx]
000E  88 C3				mov		bl,al
0010  83 FB 41				cmp		ebx,0x00000041
0013  7C 07				jl		L$2
0015  83 FB 5A				cmp		ebx,0x0000005a
0018  7F 02				jg		L$2
001A  04 20				add		al,0x20
001C				L$2:
001C  31 DB				xor		ebx,ebx
001E  88 E3				mov		bl,ah
0020  83 FB 41				cmp		ebx,0x00000041
0023  7C 08				jl		L$3
0025  83 FB 5A				cmp		ebx,0x0000005a
0028  7F 03				jg		L$3
002A  80 C4 20				add		ah,0x20
002D				L$3:
002D  38 E0				cmp		al,ah
002F  74 12				je		L$4
0031  31 D2				xor		edx,edx
0033  88 C2				mov		dl,al
0035  88 E0				mov		al,ah
0037  25 FF 00 00 00			and		eax,0x000000ff
003C  29 C2				sub		edx,eax
003E  89 D0				mov		eax,edx
0040  5E				pop		esi
0041  59				pop		ecx
0042  C3				ret		
0043				L$4:
0043  41				inc		ecx
0044  42				inc		edx
0045  4E				dec		esi
0046				L$5:
0046  85 F6				test		esi,esi
0048  75 BE				jne		L$1
004A  31 C0				xor		eax,eax
004C  5E				pop		esi
004D  59				pop		ecx
004E  C3				ret		

Routine Size: 79 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

