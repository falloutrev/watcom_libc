Module: fprem386
GROUP: 'DGROUP' _DATA

Segment: _TEXT WORD USE32 000000F9 bytes
0000				__fprem_:
0000  55				push		ebp
0001  89 E5				mov		ebp,esp
0003  52				push		edx
0004  51				push		ecx
0005  53				push		ebx
0006  50				push		eax
0007  8B 45 08				mov		eax,dword ptr 0x8[ebp]
000A  8B 55 0C				mov		edx,dword ptr 0xc[ebp]
000D  8B 5D 10				mov		ebx,dword ptr 0x10[ebp]
0010  8B 4D 14				mov		ecx,dword ptr 0x14[ebp]
0013  09 C9				or		ecx,ecx
0015  75 15				jne		L$1
0017  29 C0				sub		eax,eax
0019  8B 5D 18				mov		ebx,dword ptr 0x18[ebp]
001C  89 03				mov		dword ptr [ebx],eax
001E  8B 5D 1C				mov		ebx,dword ptr 0x1c[ebp]
0021  89 03				mov		dword ptr [ebx],eax
0023  89 43 04				mov		dword ptr 0x4[ebx],eax
0026  58				pop		eax
0027  5B				pop		ebx
0028  59				pop		ecx
0029  5A				pop		edx
002A  5D				pop		ebp
002B  C3				ret		
002C				L$1:
002C  56				push		esi
002D  57				push		edi
002E  52				push		edx
002F  51				push		ecx
0030  89 D6				mov		esi,edx
0032  89 CF				mov		edi,ecx
0034  81 E6 00 00 F0 7F			and		esi,0x7ff00000
003A  81 E7 00 00 F0 7F			and		edi,0x7ff00000
0040  81 E2 FF FF 0F 00			and		edx,0x000fffff
0046  81 E1 FF FF 0F 00			and		ecx,0x000fffff
004C  81 CA 00 00 10 00			or		edx,0x00100000
0052  81 C9 00 00 10 00			or		ecx,0x00100000
0058  29 FE				sub		esi,edi
005A  7C 68				jl		L$10
005C  29 FF				sub		edi,edi
005E				L$2:
005E  39 D1				cmp		ecx,edx
0060  75 04				jne		L$3
0062  39 C3				cmp		ebx,eax
0064  74 02				je		L$4
0066				L$3:
0066  73 05				jae		L$5
0068				L$4:
0068  29 D8				sub		eax,ebx
006A  19 CA				sbb		edx,ecx
006C  F9				stc		
006D				L$5:
006D  11 FF				adc		edi,edi
006F  81 EE 00 00 10 00			sub		esi,0x00100000
0075  7C 17				jl		L$6
0077  01 C0				add		eax,eax
0079  11 D2				adc		edx,edx
007B  81 FA 00 00 20 00			cmp		edx,0x00200000
0081  73 E5				jae		L$4
0083  81 FA 00 00 10 00			cmp		edx,0x00100000
0089  73 D3				jae		L$2
008B  F5				cmc		
008C  EB DF				jmp		L$5
008E				L$6:
008E  29 F6				sub		esi,esi
0090  09 C0				or		eax,eax
0092  75 06				jne		L$7
0094  09 D2				or		edx,edx
0096  75 02				jne		L$7
0098  EB 28				jmp		L$9
009A				L$7:
009A  F7 C2 00 00 20 00			test		edx,0x00200000
00A0  75 0C				jne		L$8
00A2  11 C0				adc		eax,eax
00A4  11 D2				adc		edx,edx
00A6  81 EE 00 00 10 00			sub		esi,0x00100000
00AC  EB EC				jmp		L$7
00AE				L$8:
00AE  D1 EA				shr		edx,0x01
00B0  D1 D8				rcr		eax,0x01
00B2  81 C6 00 00 10 00			add		esi,0x00100000
00B8  59				pop		ecx
00B9  51				push		ecx
00BA  81 E1 00 00 F0 7F			and		ecx,0x7ff00000
00C0  01 CE				add		esi,ecx
00C2				L$9:
00C2  EB 04				jmp		L$11
00C4				L$10:
00C4  01 FE				add		esi,edi
00C6  29 FF				sub		edi,edi
00C8				L$11:
00C8  81 E2 FF FF 0F 00			and		edx,0x000fffff
00CE  01 F2				add		edx,esi
00D0  59				pop		ecx
00D1  5E				pop		esi
00D2  81 E6 00 00 00 80			and		esi,0x80000000
00D8  09 D2				or		edx,edx
00DA  74 02				je		L$12
00DC  09 F2				or		edx,esi
00DE				L$12:
00DE  31 CE				xor		esi,ecx
00E0  79 02				jns		L$13
00E2  F7 DF				neg		edi
00E4				L$13:
00E4  8B 75 18				mov		esi,dword ptr 0x18[ebp]
00E7  89 3E				mov		dword ptr [esi],edi
00E9  8B 75 1C				mov		esi,dword ptr 0x1c[ebp]
00EC  89 06				mov		dword ptr [esi],eax
00EE  89 56 04				mov		dword ptr 0x4[esi],edx
00F1  5F				pop		edi
00F2  5E				pop		esi
00F3  58				pop		eax
00F4  5B				pop		ebx
00F5  59				pop		ecx
00F6  5A				pop		edx
00F7  5D				pop		ebp
00F8  C3				ret		

Routine Size: 249 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes

