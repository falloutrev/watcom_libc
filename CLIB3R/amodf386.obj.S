Module: amodf386
GROUP: 'DGROUP' _DATA

Segment: _TEXT WORD USE32 0000012C bytes
0000				__ModF:
0000  55				push		ebp
0001  56				push		esi
0002  57				push		edi
0003  51				push		ecx
0004  53				push		ebx
0005  89 D6				mov		esi,edx
0007  89 C5				mov		ebp,eax
0009  8B 45 00				mov		eax,dword ptr [ebp]
000C  8B 55 04				mov		edx,dword ptr 0x4[ebp]
000F  87 EE				xchg		esi,ebp
0011  89 45 00				mov		dword ptr [ebp],eax
0014  89 55 04				mov		dword ptr 0x4[ebp],edx
0017  89 D1				mov		ecx,edx
0019  81 E1 00 00 F0 7F			and		ecx,0x7ff00000
001F  74 0A				je		L$1
0021  81 F9 00 00 30 43			cmp		ecx,0x43300000
0027  72 10				jb		L$2
0029  87 F5				xchg		ebp,esi
002B				L$1:
002B  29 C0				sub		eax,eax
002D  89 45 04				mov		dword ptr 0x4[ebp],eax
0030  89 45 00				mov		dword ptr [ebp],eax
0033  5B				pop		ebx
0034  59				pop		ecx
0035  5F				pop		edi
0036  5E				pop		esi
0037  5D				pop		ebp
0038  C3				ret		
0039				L$2:
0039  89 CF				mov		edi,ecx
003B  C1 E9 14				shr		ecx,0x14
003E  66 81 E9 FF 03			sub		cx,0x03ff
0043  72 E6				jb		L$1
0045  52				push		edx
0046  29 C0				sub		eax,eax
0048  BA 00 00 F0 FF			mov		edx,0xfff00000
004D  80 F9 14				cmp		cl,0x14
0050  76 0C				jbe		L$3
0052  C1 FA 15				sar		edx,0x15
0055  D1 D8				rcr		eax,0x01
0057  80 E9 15				sub		cl,0x15
005A  D3 F8				sar		eax,cl
005C  EB 02				jmp		L$4
005E				L$3:
005E  D3 FA				sar		edx,cl
0060				L$4:
0060  21 55 04				and		dword ptr 0x4[ebp],edx
0063  21 45 00				and		dword ptr [ebp],eax
0066  F7 D2				not		edx
0068  F7 D0				not		eax
006A  89 F5				mov		ebp,esi
006C  23 55 04				and		edx,dword ptr 0x4[ebp]
006F  23 45 00				and		eax,dword ptr [ebp]
0072  E8 64 00 00 00			call		L$8
0077  5E				pop		esi
0078  09 D2				or		edx,edx
007A  74 08				je		L$5
007C  81 E6 00 00 00 80			and		esi,0x80000000
0082  09 F2				or		edx,esi
0084				L$5:
0084  89 55 04				mov		dword ptr 0x4[ebp],edx
0087  89 45 00				mov		dword ptr [ebp],eax
008A  5B				pop		ebx
008B  59				pop		ecx
008C  5F				pop		edi
008D  5E				pop		esi
008E  5D				pop		ebp
008F  C3				ret		

Routine Size: 144 bytes,    Routine Base: _TEXT + 0000

0090				__ZBuf2F:
0090  55				push		ebp
0091  56				push		esi
0092  57				push		edi
0093  51				push		ecx
0094  53				push		ebx
0095  52				push		edx
0096  89 C6				mov		esi,eax
0098  29 D2				sub		edx,edx
009A  29 C9				sub		ecx,ecx
009C  29 C0				sub		eax,eax
009E				L$6:
009E  8A 06				mov		al,byte ptr [esi]
00A0  3C 00				cmp		al,0x00
00A2  74 1E				je		L$7
00A4  89 D7				mov		edi,edx
00A6  89 CB				mov		ebx,ecx
00A8  01 C9				add		ecx,ecx
00AA  11 D2				adc		edx,edx
00AC  01 C9				add		ecx,ecx
00AE  11 D2				adc		edx,edx
00B0  01 D9				add		ecx,ebx
00B2  11 FA				adc		edx,edi
00B4  01 C9				add		ecx,ecx
00B6  11 D2				adc		edx,edx
00B8  24 0F				and		al,0x0f
00BA  01 C1				add		ecx,eax
00BC  83 D2 00				adc		edx,0x00000000
00BF  46				inc		esi
00C0  EB DC				jmp		L$6
00C2				L$7:
00C2  89 C8				mov		eax,ecx
00C4  BF 00 00 30 43			mov		edi,0x43300000
00C9  E8 0D 00 00 00			call		L$8
00CE  5D				pop		ebp
00CF  89 55 04				mov		dword ptr 0x4[ebp],edx
00D2  89 45 00				mov		dword ptr [ebp],eax
00D5  5B				pop		ebx
00D6  59				pop		ecx
00D7  5F				pop		edi
00D8  5E				pop		esi
00D9  5D				pop		ebp
00DA  C3				ret		
00DB				L$8:
00DB  29 F6				sub		esi,esi
00DD  09 C6				or		esi,eax
00DF  09 D6				or		esi,edx
00E1  74 48				je		L$13
00E3  F7 C2 00 00 F0 FF			test		edx,0xfff00000
00E9  75 14				jne		L$10
00EB				L$9:
00EB  81 EF 00 00 10 00			sub		edi,0x00100000
00F1  01 C0				add		eax,eax
00F3  11 D2				adc		edx,edx
00F5  F7 C2 00 00 F0 FF			test		edx,0xfff00000
00FB  74 EE				je		L$9
00FD  EB 24				jmp		L$12
00FF				L$10:
00FF  F7 C2 00 00 E0 FF			test		edx,0xffe00000
0105  74 1C				je		L$12
0107				L$11:
0107  81 C7 00 00 10 00			add		edi,0x00100000
010D  D1 EA				shr		edx,0x01
010F  D1 D8				rcr		eax,0x01
0111  D1 DE				rcr		esi,0x01
0113  F7 C2 00 00 E0 FF			test		edx,0xffe00000
0119  75 EC				jne		L$11
011B  11 F6				adc		esi,esi
011D  83 D0 00				adc		eax,0x00000000
0120  83 D2 00				adc		edx,0x00000000
0123				L$12:
0123  81 E2 FF FF 0F 00			and		edx,0x000fffff
0129  09 FA				or		edx,edi
012B				L$13:
012B  C3				ret		

Routine Size: 156 bytes,    Routine Base: _TEXT + 0090

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes

