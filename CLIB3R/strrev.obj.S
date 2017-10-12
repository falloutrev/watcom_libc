Module: strrev
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000037 bytes
0000				_strrev_:
0000				strrev_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  57				push		edi
0005  89 C6				mov		esi,eax
0007  89 C7				mov		edi,eax
0009  89 C2				mov		edx,eax
000B  06				push		es
000C  8C D8				mov		eax,ds
000E  8E C0				mov		es,eax
0010  29 C9				sub		ecx,ecx
0012  49				dec		ecx
0013  31 C0				xor		eax,eax
0015  F2 AE				repne scasb	
0017  F7 D1				not		ecx
0019  49				dec		ecx
001A  07				pop		es
001B  8D 44 0E FF			lea		eax,-0x1[esi+ecx]
001F				L$1:
001F  39 C2				cmp		edx,eax
0021  73 0C				jae		L$2
0023  8A 1A				mov		bl,byte ptr [edx]
0025  8A 38				mov		bh,byte ptr [eax]
0027  88 3A				mov		byte ptr [edx],bh
0029  42				inc		edx
002A  88 18				mov		byte ptr [eax],bl
002C  48				dec		eax
002D  EB F0				jmp		L$1
002F				L$2:
002F  89 F0				mov		eax,esi
0031  5F				pop		edi
0032  5E				pop		esi
0033  5A				pop		edx
0034  59				pop		ecx
0035  5B				pop		ebx
0036  C3				ret		

Routine Size: 55 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

