Module: uatoi
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000005D bytes
0000				_uatoi_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  89 C2				mov		edx,eax
0005				L$1:
0005  31 C0				xor		eax,eax
0007  66 8B 02				mov		ax,word ptr [edx]
000A  E8 00 00 00 00			call		_uisspace_
000F  85 C0				test		eax,eax
0011  74 05				je		L$2
0013  83 C2 02				add		edx,0x00000002
0016  EB ED				jmp		L$1
0018				L$2:
0018  66 8B 0A				mov		cx,word ptr [edx]
001B  66 89 C8				mov		ax,cx
001E  83 F8 2B				cmp		eax,0x0000002b
0021  74 05				je		L$3
0023  83 F8 2D				cmp		eax,0x0000002d
0026  75 03				jne		L$4
0028				L$3:
0028  83 C2 02				add		edx,0x00000002
002B				L$4:
002B  31 DB				xor		ebx,ebx
002D				L$5:
002D  31 C0				xor		eax,eax
002F  66 8B 02				mov		ax,word ptr [edx]
0032  E8 00 00 00 00			call		_uisdigit_
0037  85 C0				test		eax,eax
0039  74 12				je		L$6
003B  6B DB 0A				imul		ebx,0x0000000a
003E  31 C0				xor		eax,eax
0040  66 8B 02				mov		ax,word ptr [edx]
0043  01 D8				add		eax,ebx
0045  83 C2 02				add		edx,0x00000002
0048  8D 58 D0				lea		ebx,-0x30[eax]
004B  EB E0				jmp		L$5
004D				L$6:
004D  66 89 C8				mov		ax,cx
0050  83 F8 2D				cmp		eax,0x0000002d
0053  75 02				jne		L$7
0055  F7 DB				neg		ebx
0057				L$7:
0057  89 D8				mov		eax,ebx
0059  5A				pop		edx
005A  59				pop		ecx
005B  5B				pop		ebx
005C  C3				ret		

Routine Size: 93 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

