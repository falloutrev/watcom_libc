Module: fsfd386
GROUP: 'DGROUP' _DATA

Segment: _TEXT WORD USE32 00000056 bytes
0000				__FSFD:
0000  89 C2				mov		edx,eax
0002  81 E2 FF FF FF 7F			and		edx,0x7fffffff
0008  75 02				jne		L$1
000A  EB 49				jmp		L$5
000C				L$1:
000C  81 FA 00 00 80 7F			cmp		edx,0x7f800000
0012  75 0C				jne		L$2
0014  89 C2				mov		edx,eax
0016  81 CA 00 00 F0 7F			or		edx,0x7ff00000
001C  29 C0				sub		eax,eax
001E  EB 35				jmp		L$5
0020				L$2:
0020  F7 C2 00 00 80 7F			test		edx,0x7f800000
0026  75 1A				jne		L$4
0028  31 D0				xor		eax,edx
002A  51				push		ecx
002B  29 C9				sub		ecx,ecx
002D				L$3:
002D  81 C1 00 00 80 00			add		ecx,0x00800000
0033  01 D2				add		edx,edx
0035  F7 C2 00 00 80 00			test		edx,0x00800000
003B  74 F0				je		L$3
003D  09 D0				or		eax,edx
003F  29 CA				sub		edx,ecx
0041  59				pop		ecx
0042				L$4:
0042  C1 FA 02				sar		edx,0x02
0045  01 C0				add		eax,eax
0047  D1 DA				rcr		edx,0x01
0049  83 E0 0E				and		eax,0x0000000e
004C  C1 C8 04				ror		eax,0x04
004F  81 C2 00 00 00 38			add		edx,0x38000000
0055				L$5:
0055  C3				ret		

Routine Size: 86 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes

