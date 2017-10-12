Module: atouni
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000003F bytes
0000				_atouni_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  57				push		edi
0004  55				push		ebp
0005  89 C5				mov		ebp,eax
0007  89 D7				mov		edi,edx
0009  06				push		es
000A  8C D8				mov		eax,ds
000C  8E C0				mov		es,eax
000E  29 C9				sub		ecx,ecx
0010  49				dec		ecx
0011  31 C0				xor		eax,eax
0013  F2 AE				repne scasb	
0015  F7 D1				not		ecx
0017  49				dec		ecx
0018  07				pop		es
0019  8D 59 01				lea		ebx,0x1[ecx]
001C  8D 04 1B				lea		eax,[ebx+ebx]
001F  89 EE				mov		esi,ebp
0021  01 E8				add		eax,ebp
0023  01 DA				add		edx,ebx
0025				L$1:
0025  39 F0				cmp		eax,esi
0027  76 0E				jbe		L$2
0029  4A				dec		edx
002A  30 ED				xor		ch,ch
002C  83 E8 02				sub		eax,0x00000002
002F  8A 0A				mov		cl,byte ptr [edx]
0031  4B				dec		ebx
0032  66 89 08				mov		word ptr [eax],cx
0035  EB EE				jmp		L$1
0037				L$2:
0037  89 E8				mov		eax,ebp
0039  5D				pop		ebp
003A  5F				pop		edi
003B  5E				pop		esi
003C  59				pop		ecx
003D  5B				pop		ebx
003E  C3				ret		

Routine Size: 63 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

