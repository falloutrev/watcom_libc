Module: mbsinc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000018B bytes
0000				_mbgetcode_:
0000  53				push		ebx
0001  51				push		ecx
0002  57				push		edi
0003  8B 0D 00 00 00 00			mov		ecx,dword ptr ___IsDBCS
0009  8D 58 01				lea		ebx,0x1[eax]
000C  85 C9				test		ecx,ecx
000E  74 4E				je		L$4
0010  31 C9				xor		ecx,ecx
0012  8A 08				mov		cl,byte ptr [eax]
0014  89 0A				mov		dword ptr [edx],ecx
0016  85 C9				test		ecx,ecx
0018  74 4F				je		L$5
001A  8B 3D 00 00 00 00			mov		edi,dword ptr ___IsDBCS
0020  89 D8				mov		eax,ebx
0022  85 FF				test		edi,edi
0024  74 15				je		L$1
0026  31 DB				xor		ebx,ebx
0028  8A 1A				mov		bl,byte ptr [edx]
002A  8A 9B 01 00 00 00			mov		bl,byte ptr ___MBCSIsTable+0x1[ebx]
0030  80 E3 01				and		bl,0x01
0033  81 E3 FF 00 00 00			and		ebx,0x000000ff
0039  EB 02				jmp		L$2
003B				L$1:
003B  31 DB				xor		ebx,ebx
003D				L$2:
003D  74 2A				je		L$5
003F  8A 18				mov		bl,byte ptr [eax]
0041  84 DB				test		bl,bl
0043  74 12				je		L$3
0045  8B 0A				mov		ecx,dword ptr [edx]
0047  31 DB				xor		ebx,ebx
0049  C1 E1 08				shl		ecx,0x08
004C  8A 18				mov		bl,byte ptr [eax]
004E  09 D9				or		ecx,ebx
0050  40				inc		eax
0051  89 0A				mov		dword ptr [edx],ecx
0053  5F				pop		edi
0054  59				pop		ecx
0055  5B				pop		ebx
0056  C3				ret		
0057				L$3:
0057  48				dec		eax
0058  88 18				mov		byte ptr [eax],bl
005A  5F				pop		edi
005B  59				pop		ecx
005C  5B				pop		ebx
005D  C3				ret		
005E				L$4:
005E  8A 00				mov		al,byte ptr [eax]
0060  25 FF 00 00 00			and		eax,0x000000ff
0065  89 02				mov		dword ptr [edx],eax
0067  89 D8				mov		eax,ebx
0069				L$5:
0069  5F				pop		edi
006A  59				pop		ecx
006B  5B				pop		ebx
006C  C3				ret		

Routine Size: 109 bytes,    Routine Base: _TEXT + 0000

006D				_mbsnextc_:
006D  53				push		ebx
006E  52				push		edx
006F  8B 15 00 00 00 00			mov		edx,dword ptr ___IsDBCS
0075  85 D2				test		edx,edx
0077  74 3F				je		L$7
0079  31 D2				xor		edx,edx
007B  8A 10				mov		dl,byte ptr [eax]
007D  85 D2				test		edx,edx
007F  74 39				je		L$8
0081  8B 1D 00 00 00 00			mov		ebx,dword ptr ___IsDBCS
0087  40				inc		eax
0088  85 DB				test		ebx,ebx
008A  74 13				je		L$6
008C  31 DB				xor		ebx,ebx
008E  88 D3				mov		bl,dl
0090  8A 9B 01 00 00 00			mov		bl,byte ptr ___MBCSIsTable+0x1[ebx]
0096  80 E3 01				and		bl,0x01
0099  81 E3 FF 00 00 00			and		ebx,0x000000ff
009F				L$6:
009F  85 DB				test		ebx,ebx
00A1  74 17				je		L$8
00A3  80 38 00				cmp		byte ptr [eax],0x00
00A6  74 12				je		L$8
00A8  89 D3				mov		ebx,edx
00AA  31 D2				xor		edx,edx
00AC  C1 E3 08				shl		ebx,0x08
00AF  8A 10				mov		dl,byte ptr [eax]
00B1  09 DA				or		edx,ebx
00B3  89 D0				mov		eax,edx
00B5  5A				pop		edx
00B6  5B				pop		ebx
00B7  C3				ret		
00B8				L$7:
00B8  8A 10				mov		dl,byte ptr [eax]
00BA				L$8:
00BA  89 D0				mov		eax,edx
00BC  5A				pop		edx
00BD  5B				pop		ebx
00BE  C3				ret		

Routine Size: 82 bytes,    Routine Base: _TEXT + 006D

00BF				_mbsinc_:
00BF  53				push		ebx
00C0  52				push		edx
00C1  8B 15 00 00 00 00			mov		edx,dword ptr ___IsDBCS
00C7  8D 58 01				lea		ebx,0x1[eax]
00CA  85 D2				test		edx,edx
00CC  74 32				je		L$11
00CE  31 D2				xor		edx,edx
00D0  8A 10				mov		dl,byte ptr [eax]
00D2  85 D2				test		edx,edx
00D4  74 2C				je		L$12
00D6  89 D8				mov		eax,ebx
00D8  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
00DF  74 17				je		L$9
00E1  81 E2 FF 00 00 00			and		edx,0x000000ff
00E7  8A 92 01 00 00 00			mov		dl,byte ptr ___MBCSIsTable+0x1[edx]
00ED  80 E2 01				and		dl,0x01
00F0  81 E2 FF 00 00 00			and		edx,0x000000ff
00F6  EB 02				jmp		L$10
00F8				L$9:
00F8  31 D2				xor		edx,edx
00FA				L$10:
00FA  74 06				je		L$12
00FC  40				inc		eax
00FD  5A				pop		edx
00FE  5B				pop		ebx
00FF  C3				ret		
0100				L$11:
0100  89 D8				mov		eax,ebx
0102				L$12:
0102  5A				pop		edx
0103  5B				pop		ebx
0104  C3				ret		

Routine Size: 70 bytes,    Routine Base: _TEXT + 00BF

0105				_mbsdec_:
0105  53				push		ebx
0106  56				push		esi
0107  57				push		edi
0108  8B 35 00 00 00 00			mov		esi,dword ptr ___IsDBCS
010E  89 C3				mov		ebx,eax
0110  89 D7				mov		edi,edx
0112  39 D0				cmp		eax,edx
0114  72 07				jb		L$13
0116  31 D2				xor		edx,edx
0118  E9 62 00 00 00			jmp		L$20
011D				L$13:
011D  4A				dec		edx
011E  85 F6				test		esi,esi
0120  74 5D				je		L$20
0122  89 D0				mov		eax,edx
0124  74 19				je		L$14
0126  8A 12				mov		dl,byte ptr [edx]
0128  81 E2 FF 00 00 00			and		edx,0x000000ff
012E  8A 92 01 00 00 00			mov		dl,byte ptr ___MBCSIsTable+0x1[edx]
0134  80 E2 01				and		dl,0x01
0137  81 E2 FF 00 00 00			and		edx,0x000000ff
013D  EB 02				jmp		L$15
013F				L$14:
013F  31 D2				xor		edx,edx
0141				L$15:
0141  74 05				je		L$16
0143  8D 50 FF				lea		edx,-0x1[eax]
0146  EB 37				jmp		L$20
0148				L$16:
0148  48				dec		eax
0149  39 C3				cmp		ebx,eax
014B  77 1D				ja		L$19
014D  85 F6				test		esi,esi
014F  74 15				je		L$17
0151  31 D2				xor		edx,edx
0153  8A 10				mov		dl,byte ptr [eax]
0155  8A 92 01 00 00 00			mov		dl,byte ptr ___MBCSIsTable+0x1[edx]
015B  80 E2 01				and		dl,0x01
015E  81 E2 FF 00 00 00			and		edx,0x000000ff
0164  EB 02				jmp		L$18
0166				L$17:
0166  31 D2				xor		edx,edx
0168				L$18:
0168  75 DE				jne		L$16
016A				L$19:
016A  89 FA				mov		edx,edi
016C  29 C2				sub		edx,eax
016E  BB 02 00 00 00			mov		ebx,0x00000002
0173  89 D0				mov		eax,edx
0175  C1 FA 1F				sar		edx,0x1f
0178  F7 FB				idiv		ebx
017A  4F				dec		edi
017B  29 D7				sub		edi,edx
017D  89 FA				mov		edx,edi
017F				L$20:
017F  89 D0				mov		eax,edx
0181  89 35 00 00 00 00			mov		dword ptr ___IsDBCS,esi
0187  5F				pop		edi
0188  5E				pop		esi
0189  5B				pop		ebx
018A  C3				ret		

Routine Size: 134 bytes,    Routine Base: _TEXT + 0105

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

