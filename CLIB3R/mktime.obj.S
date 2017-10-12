Module: mktime
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000154 bytes
0000				mktime_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  57				push		edi
0005  55				push		ebp
0006  89 C5				mov		ebp,eax
0008  BE 0C 00 00 00			mov		esi,0x0000000c
000D  8B 55 10				mov		edx,dword ptr 0x10[ebp]
0010  8B 40 10				mov		eax,dword ptr 0x10[eax]
0013  C1 FA 1F				sar		edx,0x1f
0016  F7 FE				idiv		esi
0018  BB 00 00 00 00			mov		ebx,offset ___diyr
001D  8B 75 14				mov		esi,dword ptr 0x14[ebp]
0020  89 D7				mov		edi,edx
0022  81 FE A1 7E FB F4			cmp		esi,0xf4fb7ea1
0028  7D 0A				jge		L$2
002A				L$1:
002A  B8 FF FF FF FF			mov		eax,0xffffffff
002F  E9 19 01 00 00			jmp		L$14
0034				L$2:
0034  8B 45 10				mov		eax,dword ptr 0x10[ebp]
0037  89 C2				mov		edx,eax
0039  B9 0C 00 00 00			mov		ecx,0x0000000c
003E  C1 FA 1F				sar		edx,0x1f
0041  F7 F9				idiv		ecx
0043  01 C6				add		esi,eax
0045				L$3:
0045  85 FF				test		edi,edi
0047  7D 06				jge		L$4
0049  4E				dec		esi
004A  83 C7 0C				add		edi,0x0000000c
004D  EB F6				jmp		L$3
004F				L$4:
004F  85 F6				test		esi,esi
0051  7C D7				jl		L$1
0053  8D 86 6C 07 00 00			lea		eax,0x76c[esi]
0059  E8 00 00 00 00			call		__leapyear_
005E  85 C0				test		eax,eax
0060  74 05				je		L$5
0062  BB 00 00 00 00			mov		ebx,offset ___dilyr
0067				L$5:
0067  8D 4E 03				lea		ecx,0x3[esi]
006A  89 F0				mov		eax,esi
006C  C1 E0 03				shl		eax,0x03
006F  01 F0				add		eax,esi
0071  C1 E0 03				shl		eax,0x03
0074  01 F0				add		eax,esi
0076  89 C2				mov		edx,eax
0078  C1 E0 02				shl		eax,0x02
007B  C1 F9 02				sar		ecx,0x02
007E  01 D0				add		eax,edx
0080  8D 14 08				lea		edx,[eax+ecx]
0083  0F BF 04 7B			movsx		eax,word ptr [ebx+edi*2]
0087  8B 7D 0C				mov		edi,dword ptr 0xc[ebp]
008A  01 D0				add		eax,edx
008C  01 C7				add		edi,eax
008E  4F				dec		edi
008F  85 F6				test		esi,esi
0091  74 01				je		L$6
0093  4F				dec		edi
0094				L$6:
0094  8B 55 08				mov		edx,dword ptr 0x8[ebp]
0097  89 D0				mov		eax,edx
0099  C1 E0 04				shl		eax,0x04
009C  29 D0				sub		eax,edx
009E  C1 E0 02				shl		eax,0x02
00A1  8B 55 04				mov		edx,dword ptr 0x4[ebp]
00A4  01 C2				add		edx,eax
00A6  89 D0				mov		eax,edx
00A8  C1 E0 04				shl		eax,0x04
00AB  29 D0				sub		eax,edx
00AD  8B 75 00				mov		esi,dword ptr [ebp]
00B0  C1 E0 02				shl		eax,0x02
00B3  01 C6				add		esi,eax
00B5				L$7:
00B5  85 F6				test		esi,esi
00B7  7D 09				jge		L$8
00B9  4F				dec		edi
00BA  81 C6 80 51 01 00			add		esi,0x00015180
00C0  EB F3				jmp		L$7
00C2				L$8:
00C2  89 E9				mov		ecx,ebp
00C4  89 F2				mov		edx,esi
00C6  89 F8				mov		eax,edi
00C8  31 DB				xor		ebx,ebx
00CA  E8 00 00 00 00			call		__brktime_
00CF  E8 00 00 00 00			call		tzset_
00D4  8B 15 00 00 00 00			mov		edx,dword ptr _timezone
00DA  8B 5D 20				mov		ebx,dword ptr 0x20[ebp]
00DD  01 D6				add		esi,edx
00DF  85 DB				test		ebx,ebx
00E1  7D 07				jge		L$9
00E3  89 E8				mov		eax,ebp
00E5  E8 00 00 00 00			call		__isindst_
00EA				L$9:
00EA  83 7D 20 00			cmp		dword ptr 0x20[ebp],0x00000000
00EE  7E 06				jle		L$10
00F0  2B 35 00 00 00 00			sub		esi,dword ptr ___dst_adjust
00F6				L$10:
00F6  85 F6				test		esi,esi
00F8  7D 09				jge		L$11
00FA  4F				dec		edi
00FB  81 C6 80 51 01 00			add		esi,0x00015180
0101  EB F3				jmp		L$10
0103				L$11:
0103  81 FF DE 63 00 00			cmp		edi,0x000063de
0109  0F 8C 1B FF FF FF			jl		L$1
010F  75 1C				jne		L$12
0111  A1 00 00 00 00			mov		eax,dword ptr _timezone
0116  81 EE 80 51 01 00			sub		esi,0x00015180
011C  85 C0				test		eax,eax
011E  0F 8E 06 FF FF FF			jle		L$1
0124  85 F6				test		esi,esi
0126  7D 23				jge		L$13
0128  E9 FD FE FF FF			jmp		L$1
012D				L$12:
012D  8D 87 21 9C FF FF			lea		eax,-0x63df[edi]
0133  89 C7				mov		edi,eax
0135  C1 E7 03				shl		edi,0x03
0138  29 C7				sub		edi,eax
013A  C1 E7 05				shl		edi,0x05
013D  01 C7				add		edi,eax
013F  C1 E7 07				shl		edi,0x07
0142  89 F8				mov		eax,edi
0144  C1 E7 02				shl		edi,0x02
0147  29 C7				sub		edi,eax
0149  01 FE				add		esi,edi
014B				L$13:
014B  89 F0				mov		eax,esi
014D				L$14:
014D  5D				pop		ebp
014E  5F				pop		edi
014F  5E				pop		esi
0150  5A				pop		edx
0151  59				pop		ecx
0152  5B				pop		ebx
0153  C3				ret		

Routine Size: 340 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

