Module: fdu4386
GROUP: 'DGROUP' _DATA

Segment: _TEXT WORD USE32 00000081 bytes
0000				__RDU4:
0000  B0 A0				mov		al,0xa0
0002  EB 0A				jmp		L$1

Routine Size: 4 bytes,    Routine Base: _TEXT + 0000

0004				__RDI4:
0004  B0 9F				mov		al,0x9f
0006  EB 06				jmp		L$1

Routine Size: 4 bytes,    Routine Base: _TEXT + 0004

0008				__FDI4:
0008  B0 1F				mov		al,0x1f
000A  EB 02				jmp		L$1

Routine Size: 4 bytes,    Routine Base: _TEXT + 0008

000C				__FDU4:
000C  B0 20				mov		al,0x20
000E				L$1:
000E  01 D2				add		edx,edx
0010  D0 DC				rcr		ah,0x01
0012  D0 EC				shr		ah,0x01
0014  08 C4				or		ah,al
0016  D1 EA				shr		edx,0x01
0018  51				push		ecx
0019  89 D1				mov		ecx,edx
001B  C1 F9 14				sar		ecx,0x14
001E  66 81 E1 FF 07			and		cx,0x07ff
0023  66 81 E9 FE 03			sub		cx,0x03fe
0028  7C 53				jl		L$6
002A  66 83 F9 20			cmp		cx,0x0020
002E  7F 46				jg		L$5
0030  24 3F				and		al,0x3f
0032  38 C1				cmp		cl,al
0034  7F 40				jg		L$5
0036  88 E5				mov		ch,ah
0038  81 E2 FF FF 0F 00			and		edx,0x000fffff
003E  25 00 00 F0 FF			and		eax,0xfff00000
0043  09 C2				or		edx,eax
0045  C1 C2 0C				rol		edx,0x0c
0048  F9				stc		
0049  D1 DA				rcr		edx,0x01
004B  D0 DD				rcr		ch,0x01
004D  80 F9 20				cmp		cl,0x20
0050  75 06				jne		L$2
0052  89 D0				mov		eax,edx
0054  00 ED				add		ch,ch
0056  EB 0B				jmp		L$3
0058				L$2:
0058  29 C0				sub		eax,eax
005A  0F A5 D0				shld		eax,edx,cl
005D  D3 E2				shl		edx,cl
005F  00 ED				add		ch,ch
0061  01 D2				add		edx,edx
0063				L$3:
0063  B1 FF				mov		cl,0xff
0065  D0 D9				rcr		cl,0x01
0067  20 CD				and		ch,cl
0069  00 ED				add		ch,ch
006B  83 D0 00				adc		eax,0x00000000
006E  00 ED				add		ch,ch
0070  73 02				jae		L$4
0072  F7 D8				neg		eax
0074				L$4:
0074  59				pop		ecx
0075  C3				ret		
0076				L$5:
0076  B8 00 00 00 80			mov		eax,0x80000000
007B  59				pop		ecx
007C  C3				ret		
007D				L$6:
007D  29 C0				sub		eax,eax
007F  59				pop		ecx
0080  C3				ret		

Routine Size: 117 bytes,    Routine Base: _TEXT + 000C

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes

