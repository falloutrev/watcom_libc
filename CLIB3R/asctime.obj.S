Module: asctime
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000155 bytes
0000				convDec_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  83 EC 08				sub		esp,0x00000008
0006  89 D7				mov		edi,edx
0008  B9 0A 00 00 00			mov		ecx,0x0000000a
000D  89 E6				mov		esi,esp
000F  99				cdq		
0010  F7 F9				idiv		ecx
0012  89 06				mov		dword ptr [esi],eax
0014  89 56 04				mov		dword ptr 0x4[esi],edx
0017  8A 14 24				mov		dl,byte ptr [esp]
001A  8D 04 3B				lea		eax,[ebx+edi]
001D  80 C2 30				add		dl,0x30
0020  88 10				mov		byte ptr [eax],dl
0022  8A 5C 24 04			mov		bl,byte ptr 0x4[esp]
0026  80 C3 30				add		bl,0x30
0029  88 58 01				mov		byte ptr 0x1[eax],bl
002C  83 C4 08				add		esp,0x00000008
002F  5F				pop		edi
0030  5E				pop		esi
0031  59				pop		ecx
0032  C3				ret		

Routine Size: 51 bytes,    Routine Base: _TEXT + 0000

0033				_asctime_:
0033  53				push		ebx
0034  51				push		ecx
0035  56				push		esi
0036  57				push		edi
0037  83 EC 08				sub		esp,0x00000008
003A  89 C1				mov		ecx,eax
003C  89 D7				mov		edi,edx
003E  8B 40 18				mov		eax,dword ptr 0x18[eax]
0041  8A 90 24 00 00 00			mov		dl,byte ptr DGROUP:L$5[eax]
0047  88 17				mov		byte ptr [edi],dl
0049  8A 90 2B 00 00 00			mov		dl,byte ptr DGROUP:L$6[eax]
004F  88 57 01				mov		byte ptr 0x1[edi],dl
0052  8A 80 32 00 00 00			mov		al,byte ptr DGROUP:L$7[eax]
0058  C6 47 03 20			mov		byte ptr 0x3[edi],0x20
005C  88 47 02				mov		byte ptr 0x2[edi],al
005F  8B 41 10				mov		eax,dword ptr 0x10[ecx]
0062  8A 90 00 00 00 00			mov		dl,byte ptr DGROUP:L$2[eax]
0068  88 57 04				mov		byte ptr 0x4[edi],dl
006B  8A 90 0C 00 00 00			mov		dl,byte ptr DGROUP:L$3[eax]
0071  88 57 05				mov		byte ptr 0x5[edi],dl
0074  8A 80 18 00 00 00			mov		al,byte ptr DGROUP:L$4[eax]
007A  C6 47 07 20			mov		byte ptr 0x7[edi],0x20
007E  89 FB				mov		ebx,edi
0080  88 47 06				mov		byte ptr 0x6[edi],al
0083  BA 08 00 00 00			mov		edx,0x00000008
0088  8B 41 0C				mov		eax,dword ptr 0xc[ecx]
008B  E8 00 00 00 00			call		convDec_
0090  31 C0				xor		eax,eax
0092  8A 47 08				mov		al,byte ptr 0x8[edi]
0095  83 F8 30				cmp		eax,0x00000030
0098  75 04				jne		L$1
009A  C6 47 08 20			mov		byte ptr 0x8[edi],0x20
009E				L$1:
009E  BA 0B 00 00 00			mov		edx,0x0000000b
00A3  C6 47 0A 20			mov		byte ptr 0xa[edi],0x20
00A7  89 FB				mov		ebx,edi
00A9  8B 41 08				mov		eax,dword ptr 0x8[ecx]
00AC  E8 00 00 00 00			call		convDec_
00B1  BA 0E 00 00 00			mov		edx,0x0000000e
00B6  C6 47 0D 3A			mov		byte ptr 0xd[edi],0x3a
00BA  89 FB				mov		ebx,edi
00BC  8B 41 04				mov		eax,dword ptr 0x4[ecx]
00BF  E8 00 00 00 00			call		convDec_
00C4  BA 11 00 00 00			mov		edx,0x00000011
00C9  C6 47 10 3A			mov		byte ptr 0x10[edi],0x3a
00CD  89 FB				mov		ebx,edi
00CF  8B 01				mov		eax,dword ptr [ecx]
00D1  E8 00 00 00 00			call		convDec_
00D6  C6 47 13 20			mov		byte ptr 0x13[edi],0x20
00DA  89 E6				mov		esi,esp
00DC  8B 41 14				mov		eax,dword ptr 0x14[ecx]
00DF  B9 64 00 00 00			mov		ecx,0x00000064
00E4  89 FB				mov		ebx,edi
00E6  99				cdq		
00E7  F7 F9				idiv		ecx
00E9  89 06				mov		dword ptr [esi],eax
00EB  89 56 04				mov		dword ptr 0x4[esi],edx
00EE  8B 04 24				mov		eax,dword ptr [esp]
00F1  BA 14 00 00 00			mov		edx,0x00000014
00F6  83 C0 13				add		eax,0x00000013
00F9  E8 00 00 00 00			call		convDec_
00FE  BA 16 00 00 00			mov		edx,0x00000016
0103  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0107  89 FB				mov		ebx,edi
0109  E8 00 00 00 00			call		convDec_
010E  C6 47 18 0A			mov		byte ptr 0x18[edi],0x0a
0112  89 F8				mov		eax,edi
0114  C6 47 19 00			mov		byte ptr 0x19[edi],0x00
0118  83 C4 08				add		esp,0x00000008
011B  5F				pop		edi
011C  5E				pop		esi
011D  59				pop		ecx
011E  5B				pop		ebx
011F  C3				ret		

Routine Size: 237 bytes,    Routine Base: _TEXT + 0033

0120				_ctime_:
0120  53				push		ebx
0121  83 EC 24				sub		esp,0x00000024
0124  89 D3				mov		ebx,edx
0126  89 E2				mov		edx,esp
0128  E8 00 00 00 00			call		_localtime_
012D  89 DA				mov		edx,ebx
012F  E8 00 00 00 00			call		_asctime_
0134  83 C4 24				add		esp,0x00000024
0137  5B				pop		ebx
0138  C3				ret		

Routine Size: 25 bytes,    Routine Base: _TEXT + 0120

0139				ctime_:
0139  E8 00 00 00 00			call		localtime_

Routine Size: 5 bytes,    Routine Base: _TEXT + 0139

013E				asctime_:
013E  53				push		ebx
013F  52				push		edx
0140  89 C3				mov		ebx,eax
0142  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0148  8D 50 38				lea		edx,0x38[eax]
014B  89 D8				mov		eax,ebx
014D  E8 00 00 00 00			call		_asctime_
0152  5A				pop		edx
0153  5B				pop		ebx
0154  C3				ret		

Routine Size: 23 bytes,    Routine Base: _TEXT + 013E

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000039 bytes
0000				L$2:
0000  4A 46 4D 41 4D 4A 4A 41 53 4F 4E 44             JFMAMJJASOND
000C				L$3:
000C  61 65 61 70 61 75 75 75 65 63 6F 65             aeapauuuecoe
0018				L$4:
0018  6E 62 72 72 79 6E 6C 67 70 74 76 63             nbrrynlgptvc
0024				L$5:
0024  53 4D 54 57 54 46 53                            SMTWTFS
002B				L$6:
002B  75 6F 75 65 68 72 61                            uouehra
0032				L$7:
0032  6E 6E 65 64 75 69 74                            nneduit

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

