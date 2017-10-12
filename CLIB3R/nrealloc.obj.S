Module: nrealloc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000007A bytes
0000				realloc_:
0000				_nrealloc_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  57				push		edi
0004  55				push		ebp
0005  89 C3				mov		ebx,eax
0007  89 D1				mov		ecx,edx
0009  85 C0				test		eax,eax
000B  75 09				jne		L$1
000D  89 D0				mov		eax,edx
000F  E8 00 00 00 00			call		_nmalloc_
0014  EB 5E				jmp		L$5
0016				L$1:
0016  85 D2				test		edx,edx
0018  75 09				jne		L$2
001A  E8 00 00 00 00			call		_nfree_
001F  31 C0				xor		eax,eax
0021  EB 51				jmp		L$5
0023				L$2:
0023  E8 00 00 00 00			call		_nmsize_
0028  89 C6				mov		esi,eax
002A  89 D8				mov		eax,ebx
002C  E8 00 00 00 00			call		_nexpand_
0031  89 C5				mov		ebp,eax
0033  85 C0				test		eax,eax
0035  75 3B				jne		L$4
0037  89 C8				mov		eax,ecx
0039  E8 00 00 00 00			call		_nmalloc_
003E  89 C5				mov		ebp,eax
0040  85 C0				test		eax,eax
0042  74 25				je		L$3
0044  89 F1				mov		ecx,esi
0046  89 C7				mov		edi,eax
0048  89 DE				mov		esi,ebx
004A  06				push		es
004B  8C D8				mov		eax,ds
004D  8E C0				mov		es,eax
004F  57				push		edi
0050  89 C8				mov		eax,ecx
0052  C1 E9 02				shr		ecx,0x02
0055  F2 A5				repne movsd	
0057  8A C8				mov		cl,al
0059  80 E1 03				and		cl,0x03
005C  F2 A4				repne movsb	
005E  5F				pop		edi
005F  07				pop		es
0060  89 D8				mov		eax,ebx
0062  E8 00 00 00 00			call		_nfree_
0067  EB 09				jmp		L$4
0069				L$3:
0069  89 F2				mov		edx,esi
006B  89 D8				mov		eax,ebx
006D  E8 00 00 00 00			call		_nexpand_
0072				L$4:
0072  89 E8				mov		eax,ebp
0074				L$5:
0074  5D				pop		ebp
0075  5F				pop		edi
0076  5E				pop		esi
0077  59				pop		ecx
0078  5B				pop		ebx
0079  C3				ret		

Routine Size: 122 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

