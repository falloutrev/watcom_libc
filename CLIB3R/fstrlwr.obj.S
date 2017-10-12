Module: fstrlwr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002F bytes
0000				_fstrlwr_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  06				push		es
0004  89 D1				mov		ecx,edx
0006  89 C6				mov		esi,eax
0008  8E C2				mov		es,edx
000A  89 C2				mov		edx,eax
000C				L$1:
000C  26 8A 02				mov		al,byte ptr es:[edx]
000F  84 C0				test		al,al
0011  74 13				je		L$3
0013  2C 41				sub		al,0x41
0015  31 DB				xor		ebx,ebx
0017  88 C3				mov		bl,al
0019  83 FB 19				cmp		ebx,0x00000019
001C  7F 05				jg		L$2
001E  04 61				add		al,0x61
0020  26 88 02				mov		byte ptr es:[edx],al
0023				L$2:
0023  42				inc		edx
0024  EB E6				jmp		L$1
0026				L$3:
0026  89 CA				mov		edx,ecx
0028  89 F0				mov		eax,esi
002A  07				pop		es
002B  5E				pop		esi
002C  59				pop		ecx
002D  5B				pop		ebx
002E  C3				ret		

Routine Size: 47 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

