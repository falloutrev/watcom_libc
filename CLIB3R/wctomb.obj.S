Module: wctomb
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000005C bytes
0000				wctomb_:
0000  53				push		ebx
0001  51				push		ecx
0002  83 EC 04				sub		esp,0x00000004
0005  89 C1				mov		ecx,eax
0007  85 C0				test		eax,eax
0009  75 04				jne		L$1
000B  31 D2				xor		edx,edx
000D  EB 45				jmp		L$4
000F				L$1:
000F  31 C0				xor		eax,eax
0011  66 89 D0				mov		ax,dx
0014  BB 02 00 00 00			mov		ebx,0x00000002
0019  C1 F8 08				sar		eax,0x08
001C  88 14 24				mov		byte ptr [esp],dl
001F  25 FF 00 00 00			and		eax,0x000000ff
0024  89 E2				mov		edx,esp
0026  88 44 24 01			mov		byte ptr 0x1[esp],al
002A  31 C0				xor		eax,eax
002C  E8 00 00 00 00			call		mbtowc_
0031  89 C2				mov		edx,eax
0033  85 C0				test		eax,eax
0035  75 05				jne		L$2
0037  BA 01 00 00 00			mov		edx,0x00000001
003C				L$2:
003C  83 FA 01				cmp		edx,0x00000001
003F  72 13				jb		L$4
0041  76 0C				jbe		L$3
0043  83 FA 02				cmp		edx,0x00000002
0046  75 0C				jne		L$4
0048  8A 44 24 01			mov		al,byte ptr 0x1[esp]
004C  88 41 01				mov		byte ptr 0x1[ecx],al
004F				L$3:
004F  8A 04 24				mov		al,byte ptr [esp]
0052  88 01				mov		byte ptr [ecx],al
0054				L$4:
0054  89 D0				mov		eax,edx
0056  83 C4 04				add		esp,0x00000004
0059  59				pop		ecx
005A  5B				pop		ebx
005B  C3				ret		

Routine Size: 92 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

