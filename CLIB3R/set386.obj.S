Module: set386
GROUP: 'DGROUP' _DATA

Segment: _TEXT PARA USE32 00000018 bytes
0000				memset_:
0000  50				push		eax
0001  51				push		ecx
0002  88 D6				mov		dh,dl
0004  C1 E2 08				shl		edx,0x08
0007  88 F2				mov		dl,dh
0009  C1 E2 08				shl		edx,0x08
000C  88 F2				mov		dl,dh
000E  89 D9				mov		ecx,ebx
0010  E8 00 00 00 00			call		__STOSB
0015  59				pop		ecx
0016  58				pop		eax
0017  C3				ret		

Routine Size: 24 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes

