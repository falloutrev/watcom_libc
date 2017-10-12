Module: fstrrev
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000048 bytes
0000				_fstrrev_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  57				push		edi
0004  06				push		es
0005  0F A0				push		fs
0007  55				push		ebp
0008  89 D6				mov		esi,edx
000A  89 C5				mov		ebp,eax
000C  8E E2				mov		fs,edx
000E  89 F1				mov		ecx,esi
0010  89 C7				mov		edi,eax
0012  89 C2				mov		edx,eax
0014  06				push		es
0015  8E C1				mov		es,ecx
0017  31 C0				xor		eax,eax
0019  89 C1				mov		ecx,eax
001B  49				dec		ecx
001C  F2 AE				repne scasb	
001E  F7 D1				not		ecx
0020  49				dec		ecx
0021  07				pop		es
0022  8D 04 29				lea		eax,[ecx+ebp]
0025  8E C6				mov		es,esi
0027				L$1:
0027  48				dec		eax
0028  39 C2				cmp		edx,eax
002A  73 0F				jae		L$2
002C  64 8A 3A				mov		bh,byte ptr fs:[edx]
002F  26 8A 18				mov		bl,byte ptr es:[eax]
0032  64 88 1A				mov		byte ptr fs:[edx],bl
0035  42				inc		edx
0036  26 88 38				mov		byte ptr es:[eax],bh
0039  EB EC				jmp		L$1
003B				L$2:
003B  89 F2				mov		edx,esi
003D  89 E8				mov		eax,ebp
003F  5D				pop		ebp
0040  0F A1				pop		fs
0042  07				pop		es
0043  5F				pop		edi
0044  5E				pop		esi
0045  59				pop		ecx
0046  5B				pop		ebx
0047  C3				ret		

Routine Size: 72 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

