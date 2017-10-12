Module: bufld386
GROUP: 'DGROUP' _DATA

Segment: _TEXT WORD USE32 000000A3 bytes
0000				__ZBuf2LD:
0000  55				push		ebp
0001  56				push		esi
0002  57				push		edi
0003  51				push		ecx
0004  53				push		ebx
0005  52				push		edx
0006  89 C6				mov		esi,eax
0008  29 D2				sub		edx,edx
000A  29 C9				sub		ecx,ecx
000C  29 ED				sub		ebp,ebp
000E  29 C0				sub		eax,eax
0010				L$1:
0010  8A 06				mov		al,byte ptr [esi]
0012  3C 00				cmp		al,0x00
0014  74 2F				je		L$2
0016  89 D7				mov		edi,edx
0018  89 CB				mov		ebx,ecx
001A  89 E8				mov		eax,ebp
001C  01 ED				add		ebp,ebp
001E  11 C9				adc		ecx,ecx
0020  11 D2				adc		edx,edx
0022  01 ED				add		ebp,ebp
0024  11 C9				adc		ecx,ecx
0026  11 D2				adc		edx,edx
0028  01 C5				add		ebp,eax
002A  11 D9				adc		ecx,ebx
002C  11 FA				adc		edx,edi
002E  01 ED				add		ebp,ebp
0030  11 C9				adc		ecx,ecx
0032  11 D2				adc		edx,edx
0034  29 C0				sub		eax,eax
0036  8A 06				mov		al,byte ptr [esi]
0038  24 0F				and		al,0x0f
003A  01 C5				add		ebp,eax
003C  83 D1 00				adc		ecx,0x00000000
003F  83 D2 00				adc		edx,0x00000000
0042  46				inc		esi
0043  EB CB				jmp		L$1
0045				L$2:
0045  89 C8				mov		eax,ecx
0047  BF 5E 40 00 00			mov		edi,0x0000405e
004C  E8 11 00 00 00			call		L$3
0051  5D				pop		ebp
0052  89 55 04				mov		dword ptr 0x4[ebp],edx
0055  89 45 00				mov		dword ptr [ebp],eax
0058  66 89 75 08			mov		word ptr 0x8[ebp],si
005C  5B				pop		ebx
005D  59				pop		ecx
005E  5F				pop		edi
005F  5E				pop		esi
0060  5D				pop		ebp
0061  C3				ret		
0062				L$3:
0062  29 F6				sub		esi,esi
0064  09 C6				or		esi,eax
0066  09 D6				or		esi,edx
0068  09 EE				or		esi,ebp
006A  74 36				je		L$8
006C  09 D2				or		edx,edx
006E  75 09				jne		L$4
0070  89 C2				mov		edx,eax
0072  89 E8				mov		eax,ebp
0074  29 ED				sub		ebp,ebp
0076  83 EF 20				sub		edi,0x00000020
0079				L$4:
0079  09 D2				or		edx,edx
007B  75 09				jne		L$5
007D  89 C2				mov		edx,eax
007F  89 E8				mov		eax,ebp
0081  29 ED				sub		ebp,ebp
0083  83 EF 20				sub		edi,0x00000020
0086				L$5:
0086  09 D2				or		edx,edx
0088  78 09				js		L$6
008A  4F				dec		edi
008B  01 ED				add		ebp,ebp
008D  11 C0				adc		eax,eax
008F  11 D2				adc		edx,edx
0091  EB F3				jmp		L$5
0093				L$6:
0093  01 ED				add		ebp,ebp
0095  83 D0 00				adc		eax,0x00000000
0098  83 D2 00				adc		edx,0x00000000
009B  73 03				jae		L$7
009D  D1 DA				rcr		edx,0x01
009F  47				inc		edi
00A0				L$7:
00A0  89 FE				mov		esi,edi
00A2				L$8:
00A2  C3				ret		

Routine Size: 163 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes

