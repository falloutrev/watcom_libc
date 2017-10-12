Module: fsi386
GROUP: 'DGROUP' _DATA

Segment: _TEXT WORD USE32 00000084 bytes
0000				__FSI4:
0000  51				push		ecx
0001  B1 9E				mov		cl,0x9e
0003  E8 34 00 00 00			call		L$1
0008  59				pop		ecx
0009  C3				ret		

Routine Size: 10 bytes,    Routine Base: _TEXT + 0000

000A				__FSU4:
000A  51				push		ecx
000B  B1 9F				mov		cl,0x9f
000D  E8 2A 00 00 00			call		L$1
0012  59				pop		ecx
0013  C3				ret		

Routine Size: 10 bytes,    Routine Base: _TEXT + 000A

0014				__FSI2:
0014  51				push		ecx
0015  B1 8E				mov		cl,0x8e
0017  E8 20 00 00 00			call		L$1
001C  59				pop		ecx
001D  C3				ret		

Routine Size: 10 bytes,    Routine Base: _TEXT + 0014

001E				__FSU2:
001E  51				push		ecx
001F  B1 8F				mov		cl,0x8f
0021  E8 16 00 00 00			call		L$1
0026  59				pop		ecx
0027  C3				ret		

Routine Size: 10 bytes,    Routine Base: _TEXT + 001E

0028				__FSI1:
0028  51				push		ecx
0029  B1 86				mov		cl,0x86
002B  E8 0C 00 00 00			call		L$1
0030  59				pop		ecx
0031  C3				ret		

Routine Size: 10 bytes,    Routine Base: _TEXT + 0028

0032				__FSU1:
0032  51				push		ecx
0033  B1 87				mov		cl,0x87
0035  E8 02 00 00 00			call		L$1
003A  59				pop		ecx
003B  C3				ret		
003C				L$1:
003C  09 C0				or		eax,eax
003E  79 08				jns		L$2
0040  E8 03 00 00 00			call		L$2
0045  F7 D8				neg		eax
0047  C3				ret		
0048				L$2:
0048  09 C0				or		eax,eax
004A  74 35				je		L$6
004C  01 C0				add		eax,eax
004E  C1 C0 08				rol		eax,0x08
0051  3C 7F				cmp		al,0x7f
0053  72 2C				jb		L$6
0055  88 C5				mov		ch,al
0057  F9				stc		
0058  D1 D8				rcr		eax,0x01
005A  C1 E8 08				shr		eax,0x08
005D  38 CD				cmp		ch,cl
005F  73 13				jae		L$5
0061  80 ED 96				sub		ch,0x96
0064  73 07				jae		L$3
0066  86 CD				xchg		ch,cl
0068  F6 D9				neg		cl
006A  D3 E8				shr		eax,cl
006C  C3				ret		
006D				L$3:
006D  74 04				je		L$4
006F  88 E9				mov		cl,ch
0071  D3 E0				shl		eax,cl
0073				L$4:
0073  C3				ret		
0074				L$5:
0074  B8 FF FF FF FF			mov		eax,0xffffffff
0079  80 E9 9F				sub		cl,0x9f
007C  F6 D9				neg		cl
007E  D3 E8				shr		eax,cl
0080  C3				ret		
0081				L$6:
0081  29 C0				sub		eax,eax
0083  C3				ret		

Routine Size: 82 bytes,    Routine Base: _TEXT + 0032

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes

