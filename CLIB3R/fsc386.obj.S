Module: fsc386
GROUP: 'DGROUP' _DATA

Segment: _TEXT WORD USE32 0000001A bytes
0000				__FSC:
0000  31 D0				xor		eax,edx
0002  78 0C				js		L$1
0004  31 D0				xor		eax,edx
0006  29 D0				sub		eax,edx
0008  74 0F				je		L$2
000A  D1 D8				rcr		eax,0x01
000C  31 C2				xor		edx,eax
000E  F7 D2				not		edx
0010				L$1:
0010  29 C0				sub		eax,eax
0012  01 D2				add		edx,edx
0014  11 C0				adc		eax,eax
0016  01 C0				add		eax,eax
0018  48				dec		eax
0019				L$2:
0019  C3				ret		

Routine Size: 26 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes

