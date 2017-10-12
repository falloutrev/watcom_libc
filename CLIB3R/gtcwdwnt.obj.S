Module: gtcwdwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000079 bytes
0000				getcwd_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  57				push		edi
0004  81 EC 04 01 00 00			sub		esp,0x00000104
000A  89 C3				mov		ebx,eax
000C  89 D6				mov		esi,edx
000E  89 E0				mov		eax,esp
0010  50				push		eax
0011  68 04 01 00 00			push		0x00000104
0016  E8 00 00 00 00			call		_GetCurrentDirectoryA
001B  89 C1				mov		ecx,eax
001D  85 C0				test		eax,eax
001F  75 07				jne		L$1
0021  E8 00 00 00 00			call		__set_errno_nt_
0026  EB 1A				jmp		L$3
0028				L$1:
0028  85 DB				test		ebx,ebx
002A  75 1A				jne		L$4
002C  40				inc		eax
002D  E8 00 00 00 00			call		malloc_
0032  89 C3				mov		ebx,eax
0034  85 C0				test		eax,eax
0036  75 19				jne		L$5
0038  B8 05 00 00 00			mov		eax,0x00000005
003D				L$2:
003D  E8 00 00 00 00			call		__set_errno_
0042				L$3:
0042  31 C0				xor		eax,eax
0044  EB 28				jmp		L$6
0046				L$4:
0046  39 F0				cmp		eax,esi
0048  76 07				jbe		L$5
004A  B8 0E 00 00 00			mov		eax,0x0000000e
004F  EB EC				jmp		L$2
0051				L$5:
0051  89 E6				mov		esi,esp
0053  41				inc		ecx
0054  89 DF				mov		edi,ebx
0056  06				push		es
0057  8C D8				mov		eax,ds
0059  8E C0				mov		es,eax
005B  57				push		edi
005C  89 C8				mov		eax,ecx
005E  C1 E9 02				shr		ecx,0x02
0061  F2 A5				repne movsd	
0063  8A C8				mov		cl,al
0065  80 E1 03				and		cl,0x03
0068  F2 A4				repne movsb	
006A  5F				pop		edi
006B  07				pop		es
006C  89 D8				mov		eax,ebx
006E				L$6:
006E  81 C4 04 01 00 00			add		esp,0x00000104
0074  5F				pop		edi
0075  5E				pop		esi
0076  59				pop		ecx
0077  5B				pop		ebx
0078  C3				ret		

Routine Size: 121 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

