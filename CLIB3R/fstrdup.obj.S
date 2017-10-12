Module: fstrdup
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000059 bytes
0000				_fstrdup_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  57				push		edi
0004  55				push		ebp
0005  89 C6				mov		esi,eax
0007  89 D1				mov		ecx,edx
0009  89 C7				mov		edi,eax
000B  06				push		es
000C  8E C1				mov		es,ecx
000E  31 C0				xor		eax,eax
0010  89 C1				mov		ecx,eax
0012  49				dec		ecx
0013  F2 AE				repne scasb	
0015  F7 D1				not		ecx
0017  49				dec		ecx
0018  07				pop		es
0019  41				inc		ecx
001A  89 C8				mov		eax,ecx
001C  8C DB				mov		ebx,ds
001E  E8 00 00 00 00			call		malloc_
0023  89 C7				mov		edi,eax
0025  89 C5				mov		ebp,eax
0027  85 C0				test		eax,eax
0029  75 05				jne		L$1
002B  66 85 DB				test		bx,bx
002E  74 1F				je		L$2
0030				L$1:
0030  89 C8				mov		eax,ecx
0032  89 D1				mov		ecx,edx
0034  8C DA				mov		edx,ds
0036  1E				push		ds
0037  06				push		es
0038  57				push		edi
0039  91				xchg		eax,ecx
003A  8E D8				mov		ds,eax
003C  8E C2				mov		es,edx
003E  89 C8				mov		eax,ecx
0040  C1 E9 02				shr		ecx,0x02
0043  F2 A5				repne movsd	
0045  8A C8				mov		cl,al
0047  80 E1 03				and		cl,0x03
004A  F2 A4				repne movsb	
004C  58				pop		eax
004D  07				pop		es
004E  1F				pop		ds
004F				L$2:
004F  89 DA				mov		edx,ebx
0051  89 E8				mov		eax,ebp
0053  5D				pop		ebp
0054  5F				pop		edi
0055  5E				pop		esi
0056  59				pop		ecx
0057  5B				pop		ebx
0058  C3				ret		

Routine Size: 89 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

