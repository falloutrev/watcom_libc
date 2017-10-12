Module: mbscat
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000002D3 bytes
0000				_mbscat_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  57				push		edi
0004  89 C3				mov		ebx,eax
0006  89 D7				mov		edi,edx
0008  06				push		es
0009  8C D8				mov		eax,ds
000B  8E C0				mov		es,eax
000D  29 C9				sub		ecx,ecx
000F  49				dec		ecx
0010  31 C0				xor		eax,eax
0012  F2 AE				repne scasb	
0014  F7 D1				not		ecx
0016  49				dec		ecx
0017  07				pop		es
0018  8D 71 01				lea		esi,0x1[ecx]
001B  89 DF				mov		edi,ebx
001D  06				push		es
001E  8C D8				mov		eax,ds
0020  8E C0				mov		es,eax
0022  29 C9				sub		ecx,ecx
0024  49				dec		ecx
0025  31 C0				xor		eax,eax
0027  F2 AE				repne scasb	
0029  F7 D1				not		ecx
002B  49				dec		ecx
002C  07				pop		es
002D  8D 3C 0B				lea		edi,[ebx+ecx]
0030  89 F1				mov		ecx,esi
0032  89 D6				mov		esi,edx
0034				L$1:
0034  06				push		es
0035  8C D8				mov		eax,ds
0037  8E C0				mov		es,eax
0039  57				push		edi
003A  89 C8				mov		eax,ecx
003C  C1 E9 02				shr		ecx,0x02
003F  F2 A5				repne movsd	
0041  8A C8				mov		cl,al
0043  80 E1 03				and		cl,0x03
0046  F2 A4				repne movsb	
0048  5F				pop		edi
0049  07				pop		es
004A  89 F8				mov		eax,edi
004C  5F				pop		edi
004D  5E				pop		esi
004E  59				pop		ecx
004F  5B				pop		ebx
0050  C3				ret		

Routine Size: 81 bytes,    Routine Base: _TEXT + 0000

0051				_mbscpy_:
0051  53				push		ebx
0052  51				push		ecx
0053  56				push		esi
0054  57				push		edi
0055  89 C3				mov		ebx,eax
0057  89 D7				mov		edi,edx
0059  06				push		es
005A  8C D8				mov		eax,ds
005C  8E C0				mov		es,eax
005E  29 C9				sub		ecx,ecx
0060  49				dec		ecx
0061  31 C0				xor		eax,eax
0063  F2 AE				repne scasb	
0065  F7 D1				not		ecx
0067  49				dec		ecx
0068  07				pop		es
0069  89 D6				mov		esi,edx
006B  41				inc		ecx
006C  89 DF				mov		edi,ebx
006E  EB C4				jmp		L$1

Routine Size: 31 bytes,    Routine Base: _TEXT + 0051

0070				_mbsdup_:
0070  51				push		ecx
0071  56				push		esi
0072  57				push		edi
0073  89 C6				mov		esi,eax
0075  89 C7				mov		edi,eax
0077  06				push		es
0078  8C D8				mov		eax,ds
007A  8E C0				mov		es,eax
007C  29 C9				sub		ecx,ecx
007E  49				dec		ecx
007F  31 C0				xor		eax,eax
0081  F2 AE				repne scasb	
0083  F7 D1				not		ecx
0085  49				dec		ecx
0086  07				pop		es
0087  41				inc		ecx
0088  89 C8				mov		eax,ecx
008A  E8 00 00 00 00			call		malloc_
008F  89 C7				mov		edi,eax
0091  85 C0				test		eax,eax
0093  74 16				je		L$2
0095  06				push		es
0096  8C D8				mov		eax,ds
0098  8E C0				mov		es,eax
009A  57				push		edi
009B  89 C8				mov		eax,ecx
009D  C1 E9 02				shr		ecx,0x02
00A0  F2 A5				repne movsd	
00A2  8A C8				mov		cl,al
00A4  80 E1 03				and		cl,0x03
00A7  F2 A4				repne movsb	
00A9  5F				pop		edi
00AA  07				pop		es
00AB				L$2:
00AB  89 F8				mov		eax,edi
00AD  5F				pop		edi
00AE  5E				pop		esi
00AF  59				pop		ecx
00B0  C3				ret		

Routine Size: 65 bytes,    Routine Base: _TEXT + 0070

00B1				_mbsncat_:
00B1  51				push		ecx
00B2  56				push		esi
00B3  57				push		edi
00B4  55				push		ebp
00B5  89 C5				mov		ebp,eax
00B7  89 D6				mov		esi,edx
00B9  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
00C0  74 3E				je		L$3
00C2  89 C7				mov		edi,eax
00C4  06				push		es
00C5  8C D8				mov		eax,ds
00C7  8E C0				mov		es,eax
00C9  29 C9				sub		ecx,ecx
00CB  49				dec		ecx
00CC  31 C0				xor		eax,eax
00CE  F2 AE				repne scasb	
00D0  F7 D1				not		ecx
00D2  49				dec		ecx
00D3  07				pop		es
00D4  8D 3C 29				lea		edi,[ecx+ebp]
00D7  89 DA				mov		edx,ebx
00D9  89 E8				mov		eax,ebp
00DB  E8 00 00 00 00			call		_mbsnbcnt_
00E0  89 C1				mov		ecx,eax
00E2  89 C3				mov		ebx,eax
00E4  06				push		es
00E5  8C D8				mov		eax,ds
00E7  8E C0				mov		es,eax
00E9  57				push		edi
00EA  89 C8				mov		eax,ecx
00EC  C1 E9 02				shr		ecx,0x02
00EF  F2 A5				repne movsd	
00F1  8A C8				mov		cl,al
00F3  80 E1 03				and		cl,0x03
00F6  F2 A4				repne movsb	
00F8  5F				pop		edi
00F9  07				pop		es
00FA  C6 04 1F 00			mov		byte ptr [edi+ebx],0x00
00FE  EB 07				jmp		L$4
0100				L$3:
0100  89 F2				mov		edx,esi
0102  E8 00 00 00 00			call		strncat_
0107				L$4:
0107  89 E8				mov		eax,ebp
0109  5D				pop		ebp
010A  5F				pop		edi
010B  5E				pop		esi
010C  59				pop		ecx
010D  C3				ret		

Routine Size: 93 bytes,    Routine Base: _TEXT + 00B1

010E				_mbsnbcat_:
010E  51				push		ecx
010F  56				push		esi
0110  57				push		edi
0111  55				push		ebp
0112  83 EC 08				sub		esp,0x00000008
0115  89 C5				mov		ebp,eax
0117  89 54 24 04			mov		dword ptr 0x4[esp],edx
011B  89 1C 24				mov		dword ptr [esp],ebx
011E  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
0125  0F 84 C2 00 00 00			je		L$16
012B  80 38 00				cmp		byte ptr [eax],0x00
012E  0F 84 7E 00 00 00			je		L$15
0134  89 EE				mov		esi,ebp
0136  30 D2				xor		dl,dl
0138				L$5:
0138  8A 06				mov		al,byte ptr [esi]
013A  3A C2				cmp		al,dl
013C  74 12				je		L$7
013E  3C 00				cmp		al,0x00
0140  74 0C				je		L$6
0142  46				inc		esi
0143  8A 06				mov		al,byte ptr [esi]
0145  3A C2				cmp		al,dl
0147  74 07				je		L$7
0149  46				inc		esi
014A  3C 00				cmp		al,0x00
014C  75 EA				jne		L$5
014E				L$6:
014E  2B F6				sub		esi,esi
0150				L$7:
0150  8B 0D 00 00 00 00			mov		ecx,dword ptr ___IsDBCS
0156  8D 5E FF				lea		ebx,-0x1[esi]
0159  89 E8				mov		eax,ebp
015B  8B 35 00 00 00 00			mov		esi,dword ptr ___IsDBCS
0161				L$8:
0161  80 38 00				cmp		byte ptr [eax],0x00
0164  74 45				je		L$14
0166  39 D8				cmp		eax,ebx
0168  75 21				jne		L$11
016A  85 C9				test		ecx,ecx
016C  74 15				je		L$9
016E  31 D2				xor		edx,edx
0170  8A 13				mov		dl,byte ptr [ebx]
0172  8A 92 01 00 00 00			mov		dl,byte ptr ___MBCSIsTable+0x1[edx]
0178  80 E2 01				and		dl,0x01
017B  81 E2 FF 00 00 00			and		edx,0x000000ff
0181  EB 02				jmp		L$10
0183				L$9:
0183  31 D2				xor		edx,edx
0185				L$10:
0185  74 04				je		L$11
0187  89 DD				mov		ebp,ebx
0189  EB 20				jmp		L$14
018B				L$11:
018B  85 F6				test		esi,esi
018D  74 15				je		L$12
018F  31 D2				xor		edx,edx
0191  8A 10				mov		dl,byte ptr [eax]
0193  8A 92 01 00 00 00			mov		dl,byte ptr ___MBCSIsTable+0x1[edx]
0199  80 E2 01				and		dl,0x01
019C  81 E2 FF 00 00 00			and		edx,0x000000ff
01A2  EB 02				jmp		L$13
01A4				L$12:
01A4  31 D2				xor		edx,edx
01A6				L$13:
01A6  40				inc		eax
01A7  01 D0				add		eax,edx
01A9  EB B6				jmp		L$8
01AB				L$14:
01AB  39 DD				cmp		ebp,ebx
01AD  74 03				je		L$15
01AF  8D 6B 01				lea		ebp,0x1[ebx]
01B2				L$15:
01B2  89 EF				mov		edi,ebp
01B4  8B 74 24 04			mov		esi,dword ptr 0x4[esp]
01B8  06				push		es
01B9  8C D8				mov		eax,ds
01BB  8E C0				mov		es,eax
01BD  29 C9				sub		ecx,ecx
01BF  49				dec		ecx
01C0  31 C0				xor		eax,eax
01C2  F2 AE				repne scasb	
01C4  F7 D1				not		ecx
01C6  49				dec		ecx
01C7  07				pop		es
01C8  8D 3C 29				lea		edi,[ecx+ebp]
01CB  8B 0C 24				mov		ecx,dword ptr [esp]
01CE  06				push		es
01CF  8C D8				mov		eax,ds
01D1  8E C0				mov		es,eax
01D3  57				push		edi
01D4  89 C8				mov		eax,ecx
01D6  C1 E9 02				shr		ecx,0x02
01D9  F2 A5				repne movsd	
01DB  8A C8				mov		cl,al
01DD  80 E1 03				and		cl,0x03
01E0  F2 A4				repne movsb	
01E2  5F				pop		edi
01E3  07				pop		es
01E4  8B 04 24				mov		eax,dword ptr [esp]
01E7  C6 04 07 00			mov		byte ptr [edi+eax],0x00
01EB  EB 09				jmp		L$17
01ED				L$16:
01ED  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
01F1  E8 00 00 00 00			call		strncat_
01F6				L$17:
01F6  89 E8				mov		eax,ebp
01F8  83 C4 08				add		esp,0x00000008
01FB  5D				pop		ebp
01FC  5F				pop		edi
01FD  5E				pop		esi
01FE  59				pop		ecx
01FF  C3				ret		

Routine Size: 242 bytes,    Routine Base: _TEXT + 010E

0200				_mbsncpy_:
0200  51				push		ecx
0201  56				push		esi
0202  89 C1				mov		ecx,eax
0204  89 D6				mov		esi,edx
0206  89 DA				mov		edx,ebx
0208  89 F0				mov		eax,esi
020A  E8 00 00 00 00			call		_mbsnbcnt_
020F  89 C3				mov		ebx,eax
0211  89 F2				mov		edx,esi
0213  89 C8				mov		eax,ecx
0215  E8 00 00 00 00			call		_mbsnbcpy_
021A  89 C8				mov		eax,ecx
021C  5E				pop		esi
021D  59				pop		ecx
021E  C3				ret		

Routine Size: 31 bytes,    Routine Base: _TEXT + 0200

021F				_mbsnbcpy_:
021F  51				push		ecx
0220  56				push		esi
0221  57				push		edi
0222  55				push		ebp
0223  89 C5				mov		ebp,eax
0225  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
022C  0F 84 97 00 00 00			je		L$23
0232  89 D7				mov		edi,edx
0234  06				push		es
0235  8C D8				mov		eax,ds
0237  8E C0				mov		es,eax
0239  29 C9				sub		ecx,ecx
023B  49				dec		ecx
023C  31 C0				xor		eax,eax
023E  F2 AE				repne scasb	
0240  F7 D1				not		ecx
0242  49				dec		ecx
0243  07				pop		es
0244  8B 35 00 00 00 00			mov		esi,dword ptr ___IsDBCS
024A  85 F6				test		esi,esi
024C  74 0F				je		L$18
024E  0F B6 34 1A			movzx		esi,byte ptr [edx+ebx]
0252  8A 86 01 00 00 00			mov		al,byte ptr ___MBCSIsTable+0x1[esi]
0258  24 01				and		al,0x01
025A  0F B6 F0				movzx		esi,al
025D				L$18:
025D  85 F6				test		esi,esi
025F  74 05				je		L$19
0261  39 CB				cmp		ebx,ecx
0263  7D 01				jge		L$19
0265  4B				dec		ebx
0266				L$19:
0266  8D 41 01				lea		eax,0x1[ecx]
0269  39 D8				cmp		eax,ebx
026B  7D 21				jge		L$20
026D  89 C1				mov		ecx,eax
026F  89 D6				mov		esi,edx
0271  89 EF				mov		edi,ebp
0273  06				push		es
0274  8C D8				mov		eax,ds
0276  8E C0				mov		es,eax
0278  57				push		edi
0279  89 C8				mov		eax,ecx
027B  C1 E9 02				shr		ecx,0x02
027E  F2 A5				repne movsd	
0280  8A C8				mov		cl,al
0282  80 E1 03				and		cl,0x03
0285  F2 A4				repne movsb	
0287  5F				pop		edi
0288  07				pop		es
0289  E9 79 FE FF FF			jmp		L$4
028E				L$20:
028E  89 D6				mov		esi,edx
0290  89 EF				mov		edi,ebp
0292  57				push		edi
0293				L$21:
0293  8A 06				mov		al,byte ptr [esi]
0295  88 07				mov		byte ptr [edi],al
0297  3C 00				cmp		al,0x00
0299  74 10				je		L$22
029B  8A 46 01				mov		al,byte ptr 0x1[esi]
029E  83 C6 02				add		esi,0x00000002
02A1  88 47 01				mov		byte ptr 0x1[edi],al
02A4  83 C7 02				add		edi,0x00000002
02A7  3C 00				cmp		al,0x00
02A9  75 E8				jne		L$21
02AB				L$22:
02AB  5F				pop		edi
02AC  39 D9				cmp		ecx,ebx
02AE  0F 84 53 FE FF FF			je		L$4
02B4  89 C8				mov		eax,ecx
02B6  29 D8				sub		eax,ebx
02B8  31 D2				xor		edx,edx
02BA  89 C3				mov		ebx,eax
02BC  8D 04 29				lea		eax,[ecx+ebp]
02BF  E8 00 00 00 00			call		memset_
02C4  E9 3E FE FF FF			jmp		L$4
02C9				L$23:
02C9  E8 00 00 00 00			call		strncpy_
02CE  E9 34 FE FF FF			jmp		L$4

Routine Size: 180 bytes,    Routine Base: _TEXT + 021F

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

