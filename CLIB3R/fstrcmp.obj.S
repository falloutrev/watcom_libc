Module: fstrcmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002D bytes
0000				_fstrcmp_:
0000  56				push		esi
0001  57				push		edi
0002  89 DF				mov		edi,ebx
0004  89 D6				mov		esi,edx
0006  1E				push		ds
0007  06				push		es
0008  96				xchg		eax,esi
0009  8E D8				mov		ds,eax
000B  8E C1				mov		es,ecx
000D  A6				cmpsb		
000E  75 11				jne		L$1
0010  4F				dec		edi
0011  4E				dec		esi
0012  31 C0				xor		eax,eax
0014  89 C1				mov		ecx,eax
0016  49				dec		ecx
0017  F2 AE				repne scasb	
0019  F7 D1				not		ecx
001B  29 CF				sub		edi,ecx
001D  F3 A6				repe cmpsb	
001F  74 05				je		L$2
0021				L$1:
0021  19 C9				sbb		ecx,ecx
0023  83 D9 FF				sbb		ecx,0xffffffff
0026				L$2:
0026  07				pop		es
0027  1F				pop		ds
0028  89 C8				mov		eax,ecx
002A  5F				pop		edi
002B  5E				pop		esi
002C  C3				ret		

Routine Size: 45 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

