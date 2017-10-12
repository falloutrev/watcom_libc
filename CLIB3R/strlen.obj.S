Module: strlen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000019 bytes
0000				strlen_:
0000  51				push		ecx
0001  57				push		edi
0002  89 C7				mov		edi,eax
0004  06				push		es
0005  8C D8				mov		eax,ds
0007  8E C0				mov		es,eax
0009  29 C9				sub		ecx,ecx
000B  49				dec		ecx
000C  31 C0				xor		eax,eax
000E  F2 AE				repne scasb	
0010  F7 D1				not		ecx
0012  49				dec		ecx
0013  07				pop		es
0014  89 C8				mov		eax,ecx
0016  5F				pop		edi
0017  59				pop		ecx
0018  C3				ret		

Routine Size: 25 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

