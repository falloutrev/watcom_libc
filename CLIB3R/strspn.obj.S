Module: strspn
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000044 bytes
0000				strspn_:
0000  53				push		ebx
0001  51				push		ecx
0002  83 EC 20				sub		esp,0x00000020
0005  89 C3				mov		ebx,eax
0007  89 E0				mov		eax,esp
0009  E8 00 00 00 00			call		__setbits_
000E  31 C9				xor		ecx,ecx
0010  EB 22				jmp		L$2
0012				L$1:
0012  89 C2				mov		edx,eax
0014  C1 EA 03				shr		edx,0x03
0017  8A 14 14				mov		dl,byte ptr [esp+edx]
001A  83 E0 07				and		eax,0x00000007
001D  81 E2 FF 00 00 00			and		edx,0x000000ff
0023  8A 80 00 00 00 00			mov		al,byte ptr __Bits[eax]
0029  25 FF 00 00 00			and		eax,0x000000ff
002E  85 C2				test		edx,eax
0030  74 0A				je		L$3
0032  43				inc		ebx
0033  41				inc		ecx
0034				L$2:
0034  31 C0				xor		eax,eax
0036  8A 03				mov		al,byte ptr [ebx]
0038  85 C0				test		eax,eax
003A  75 D6				jne		L$1
003C				L$3:
003C  89 C8				mov		eax,ecx
003E  83 C4 20				add		esp,0x00000020
0041  59				pop		ecx
0042  5B				pop		ebx
0043  C3				ret		

Routine Size: 68 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

