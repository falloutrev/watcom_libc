Module: fdfs386
GROUP: 'DGROUP' _DATA

Segment: _TEXT WORD USE32 0000004C bytes
0000				__FDFS:
0000  53				push		ebx
0001  F7 C2 00 00 F0 7F			test		edx,0x7ff00000
0007  74 3F				je		L$2
0009  29 DB				sub		ebx,ebx
000B  01 C0				add		eax,eax
000D  11 D2				adc		edx,edx
000F  D1 DB				rcr		ebx,0x01
0011  05 00 00 00 20			add		eax,0x20000000
0016  83 D2 00				adc		edx,0x00000000
0019  74 24				je		L$1
001B  81 FA 00 00 E0 8F			cmp		edx,0x8fe00000
0021  73 1C				jae		L$1
0023  81 FA 00 00 20 70			cmp		edx,0x70200000
0029  72 1D				jb		L$2
002B  81 EA 00 00 00 70			sub		edx,0x70000000
0031  01 C0				add		eax,eax
0033  11 D2				adc		edx,edx
0035  01 C0				add		eax,eax
0037  11 D2				adc		edx,edx
0039  09 DA				or		edx,ebx
003B  89 D0				mov		eax,edx
003D  5B				pop		ebx
003E  C3				ret		
003F				L$1:
003F  B8 00 00 80 7F			mov		eax,0x7f800000
0044  09 D8				or		eax,ebx
0046  5B				pop		ebx
0047  C3				ret		
0048				L$2:
0048  29 C0				sub		eax,eax
004A  5B				pop		ebx
004B  C3				ret		

Routine Size: 76 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes

