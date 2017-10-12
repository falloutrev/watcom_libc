Module: strdup
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000045 bytes
0000				_strdup_:
0000				strdup_:
0000  51				push		ecx
0001  52				push		edx
0002  56				push		esi
0003  57				push		edi
0004  89 C6				mov		esi,eax
0006  89 C7				mov		edi,eax
0008  06				push		es
0009  8C D8				mov		eax,ds
000B  8E C0				mov		es,eax
000D  29 C9				sub		ecx,ecx
000F  49				dec		ecx
0010  31 C0				xor		eax,eax
0012  F2 AE				repne scasb	
0014  F7 D1				not		ecx
0016  49				dec		ecx
0017  07				pop		es
0018  41				inc		ecx
0019  89 C8				mov		eax,ecx
001B  E8 00 00 00 00			call		malloc_
0020  89 C2				mov		edx,eax
0022  85 C0				test		eax,eax
0024  74 18				je		L$1
0026  89 C7				mov		edi,eax
0028  06				push		es
0029  8C D8				mov		eax,ds
002B  8E C0				mov		es,eax
002D  57				push		edi
002E  89 C8				mov		eax,ecx
0030  C1 E9 02				shr		ecx,0x02
0033  F2 A5				repne movsd	
0035  8A C8				mov		cl,al
0037  80 E1 03				and		cl,0x03
003A  F2 A4				repne movsb	
003C  5F				pop		edi
003D  07				pop		es
003E				L$1:
003E  89 D0				mov		eax,edx
0040  5F				pop		edi
0041  5E				pop		esi
0042  5A				pop		edx
0043  59				pop		ecx
0044  C3				ret		

Routine Size: 69 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

