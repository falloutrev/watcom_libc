Module: cmp386
GROUP: 'DGROUP' _DATA

Segment: _TEXT PARA USE32 000000A1 bytes
0000				strcmp_:
0000  53				push		ebx
0001  51				push		ecx
0002  89 C3				mov		ebx,eax
0004  39 D0				cmp		eax,edx
0006  74 6C				je		L$2
0008				L$1:
0008  8B 03				mov		eax,dword ptr [ebx]
000A  8B 0A				mov		ecx,dword ptr [edx]
000C  39 C1				cmp		ecx,eax
000E  75 69				jne		L$3
0010  F7 D1				not		ecx
0012  05 FF FE FE FE			add		eax,0xfefefeff
0017  21 C8				and		eax,ecx
0019  25 80 80 80 80			and		eax,0x80808080
001E  75 54				jne		L$2
0020  8B 43 04				mov		eax,dword ptr 0x4[ebx]
0023  8B 4A 04				mov		ecx,dword ptr 0x4[edx]
0026  39 C1				cmp		ecx,eax
0028  75 4F				jne		L$3
002A  F7 D1				not		ecx
002C  05 FF FE FE FE			add		eax,0xfefefeff
0031  21 C8				and		eax,ecx
0033  25 80 80 80 80			and		eax,0x80808080
0038  75 3A				jne		L$2
003A  8B 43 08				mov		eax,dword ptr 0x8[ebx]
003D  8B 4A 08				mov		ecx,dword ptr 0x8[edx]
0040  39 C1				cmp		ecx,eax
0042  75 35				jne		L$3
0044  F7 D1				not		ecx
0046  05 FF FE FE FE			add		eax,0xfefefeff
004B  21 C8				and		eax,ecx
004D  25 80 80 80 80			and		eax,0x80808080
0052  75 20				jne		L$2
0054  8B 43 0C				mov		eax,dword ptr 0xc[ebx]
0057  8B 4A 0C				mov		ecx,dword ptr 0xc[edx]
005A  39 C1				cmp		ecx,eax
005C  75 1B				jne		L$3
005E  83 C3 10				add		ebx,0x00000010
0061  83 C2 10				add		edx,0x00000010
0064  F7 D1				not		ecx
0066  05 FF FE FE FE			add		eax,0xfefefeff
006B  21 C8				and		eax,ecx
006D  25 80 80 80 80			and		eax,0x80808080
0072  74 94				je		L$1
0074				L$2:
0074  29 C0				sub		eax,eax
0076  59				pop		ecx
0077  5B				pop		ebx
0078  C3				ret		
0079				L$3:
0079  38 C8				cmp		al,cl
007B  75 1D				jne		L$4
007D  3C 00				cmp		al,0x00
007F  74 F3				je		L$2
0081  38 EC				cmp		ah,ch
0083  75 15				jne		L$4
0085  80 FC 00				cmp		ah,0x00
0088  74 EA				je		L$2
008A  C1 E8 10				shr		eax,0x10
008D  C1 E9 10				shr		ecx,0x10
0090  38 C8				cmp		al,cl
0092  75 06				jne		L$4
0094  3C 00				cmp		al,0x00
0096  74 DC				je		L$2
0098  38 EC				cmp		ah,ch
009A				L$4:
009A  19 C0				sbb		eax,eax
009C  0C 01				or		al,0x01
009E  59				pop		ecx
009F  5B				pop		ebx
00A0  C3				ret		

Routine Size: 161 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes

