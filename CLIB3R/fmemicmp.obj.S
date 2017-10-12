Module: fmemicmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000005A bytes
0000				_fmemicmp_:
0000  56				push		esi
0001  06				push		es
0002  0F A0				push		fs
0004  8B 74 24 10			mov		esi,dword ptr 0x10[esp]
0008  8E E2				mov		fs,edx
000A  8E C1				mov		es,ecx
000C  89 C2				mov		edx,eax
000E  EB 3D				jmp		L$5
0010				L$1:
0010  64 8A 22				mov		ah,byte ptr fs:[edx]
0013  31 C9				xor		ecx,ecx
0015  88 E1				mov		cl,ah
0017  83 F9 41				cmp		ecx,0x00000041
001A  7C 08				jl		L$2
001C  83 F9 5A				cmp		ecx,0x0000005a
001F  7F 03				jg		L$2
0021  80 C4 20				add		ah,0x20
0024				L$2:
0024  26 8A 03				mov		al,byte ptr es:[ebx]
0027  31 C9				xor		ecx,ecx
0029  88 C1				mov		cl,al
002B  83 F9 41				cmp		ecx,0x00000041
002E  7C 07				jl		L$3
0030  83 F9 5A				cmp		ecx,0x0000005a
0033  7F 02				jg		L$3
0035  04 20				add		al,0x20
0037				L$3:
0037  38 C4				cmp		ah,al
0039  74 0F				je		L$4
003B  31 D2				xor		edx,edx
003D  88 E2				mov		dl,ah
003F  25 FF 00 00 00			and		eax,0x000000ff
0044  29 C2				sub		edx,eax
0046  89 D0				mov		eax,edx
0048  EB 09				jmp		L$6
004A				L$4:
004A  42				inc		edx
004B  43				inc		ebx
004C  4E				dec		esi
004D				L$5:
004D  85 F6				test		esi,esi
004F  75 BF				jne		L$1
0051  31 C0				xor		eax,eax
0053				L$6:
0053  0F A1				pop		fs
0055  07				pop		es
0056  5E				pop		esi
0057  C2 04 00				ret		0x0004

Routine Size: 90 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

