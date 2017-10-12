Module: memmove
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000004D bytes
0000				memmove_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  89 D9				mov		ecx,ebx
0005  39 C2				cmp		edx,eax
0007  74 40				je		L$2
0009  73 28				jae		L$1
000B  8D 3C 1A				lea		edi,[edx+ebx]
000E  39 C7				cmp		edi,eax
0010  76 21				jbe		L$1
0012  8D 77 FF				lea		esi,-0x1[edi]
0015  8D 3C 18				lea		edi,[eax+ebx]
0018  8C DA				mov		edx,ds
001A  4F				dec		edi
001B  06				push		es
001C  8E C2				mov		es,edx
001E  FD				std		
001F  4E				dec		esi
0020  4F				dec		edi
0021  D1 E9				shr		ecx,0x01
0023  66 F3 A5				rep movsw	
0026  11 C9				adc		ecx,ecx
0028  46				inc		esi
0029  47				inc		edi
002A  66 F3 A4				rep movsb	
002D  07				pop		es
002E  FC				cld		
002F  5F				pop		edi
0030  5E				pop		esi
0031  59				pop		ecx
0032  C3				ret		
0033				L$1:
0033  89 D6				mov		esi,edx
0035  89 C7				mov		edi,eax
0037  8C DA				mov		edx,ds
0039  06				push		es
003A  8E C2				mov		es,edx
003C  51				push		ecx
003D  C1 E9 02				shr		ecx,0x02
0040  F3 A5				rep movsd	
0042  59				pop		ecx
0043  83 E1 03				and		ecx,0x00000003
0046  F3 A4				rep movsb	
0048  07				pop		es
0049				L$2:
0049  5F				pop		edi
004A  5E				pop		esi
004B  59				pop		ecx
004C  C3				ret		

Routine Size: 77 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

