Module: stricmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000047 bytes
0000				strcmpi_:
0000				_stricmp_:
0000				stricmp_:
0000  53				push		ebx
0001  51				push		ecx
0002  89 C3				mov		ebx,eax
0004				L$1:
0004  8A 03				mov		al,byte ptr [ebx]
0006  31 C9				xor		ecx,ecx
0008  8A 22				mov		ah,byte ptr [edx]
000A  88 C1				mov		cl,al
000C  83 F9 41				cmp		ecx,0x00000041
000F  7C 07				jl		L$2
0011  83 F9 5A				cmp		ecx,0x0000005a
0014  7F 02				jg		L$2
0016  04 20				add		al,0x20
0018				L$2:
0018  31 C9				xor		ecx,ecx
001A  88 E1				mov		cl,ah
001C  83 F9 41				cmp		ecx,0x00000041
001F  7C 08				jl		L$3
0021  83 F9 5A				cmp		ecx,0x0000005a
0024  7F 03				jg		L$3
0026  80 C4 20				add		ah,0x20
0029				L$3:
0029  38 E0				cmp		al,ah
002B  75 08				jne		L$4
002D  84 E4				test		ah,ah
002F  74 04				je		L$4
0031  43				inc		ebx
0032  42				inc		edx
0033  EB CF				jmp		L$1
0035				L$4:
0035  31 D2				xor		edx,edx
0037  88 C2				mov		dl,al
0039  88 E0				mov		al,ah
003B  25 FF 00 00 00			and		eax,0x000000ff
0040  29 C2				sub		edx,eax
0042  89 D0				mov		eax,edx
0044  59				pop		ecx
0045  5B				pop		ebx
0046  C3				ret		

Routine Size: 71 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

