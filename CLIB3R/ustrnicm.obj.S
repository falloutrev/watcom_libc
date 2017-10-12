Module: ustrnicm
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000074 bytes
0000				_ustrnicmp_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  89 C1				mov		ecx,eax
0005  89 DE				mov		esi,ebx
0007				L$1:
0007  85 F6				test		esi,esi
0009  75 06				jne		L$3
000B				L$2:
000B  31 C0				xor		eax,eax
000D  5F				pop		edi
000E  5E				pop		esi
000F  59				pop		ecx
0010  C3				ret		
0011				L$3:
0011  66 8B 01				mov		ax,word ptr [ecx]
0014  89 C7				mov		edi,eax
0016  81 E7 00 FF 00 00			and		edi,0x0000ff00
001C  0F B7 FF				movzx		edi,di
001F  66 8B 1A				mov		bx,word ptr [edx]
0022  85 FF				test		edi,edi
0024  75 31				jne		L$5
0026  89 DF				mov		edi,ebx
0028  81 E7 00 FF 00 00			and		edi,0x0000ff00
002E  0F B7 FF				movzx		edi,di
0031  85 FF				test		edi,edi
0033  75 22				jne		L$5
0035  0F B7 F8				movzx		edi,ax
0038  83 FF 41				cmp		edi,0x00000041
003B  7C 0A				jl		L$4
003D  83 FF 5A				cmp		edi,0x0000005a
0040  7F 05				jg		L$4
0042  05 20 00 00 00			add		eax,0x00000020
0047				L$4:
0047  0F B7 FB				movzx		edi,bx
004A  83 FF 41				cmp		edi,0x00000041
004D  7C 08				jl		L$5
004F  83 FF 5A				cmp		edi,0x0000005a
0052  7F 03				jg		L$5
0054  83 C3 20				add		ebx,0x00000020
0057				L$5:
0057  66 39 D8				cmp		ax,bx
005A  74 0C				je		L$6
005C  0F B7 C0				movzx		eax,ax
005F  0F B7 D3				movzx		edx,bx
0062  29 D0				sub		eax,edx
0064  5F				pop		edi
0065  5E				pop		esi
0066  59				pop		ecx
0067  C3				ret		
0068				L$6:
0068  66 85 DB				test		bx,bx
006B  74 9E				je		L$2
006D  41				inc		ecx
006E  41				inc		ecx
006F  42				inc		edx
0070  42				inc		edx
0071  4E				dec		esi
0072  EB 93				jmp		L$1

Routine Size: 116 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

