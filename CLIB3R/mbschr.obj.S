Module: mbschr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001E8 bytes
0000				_mbstok_:
0000  53				push		ebx
0001  51				push		ecx
0002  57				push		edi
0003  89 D3				mov		ebx,edx
0005  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
000C  0F 84 78 00 00 00			je		L$8
0012  85 C0				test		eax,eax
0014  75 05				jne		L$1
0016  A1 00 00 00 00			mov		eax,dword ptr _tokn
001B				L$1:
001B  85 C0				test		eax,eax
001D  0F 84 6E 00 00 00			je		L$9
0023  89 DA				mov		edx,ebx
0025  E8 00 00 00 00			call		_mbsspnp_
002A  8A 10				mov		dl,byte ptr [eax]
002C  89 C1				mov		ecx,eax
002E  84 D2				test		dl,dl
0030  75 06				jne		L$2
0032  31 C0				xor		eax,eax
0034  5F				pop		edi
0035  59				pop		ecx
0036  5B				pop		ebx
0037  C3				ret		
0038				L$2:
0038  89 DA				mov		edx,ebx
003A  E8 00 00 00 00			call		_mbspbrk_
003F  8A 30				mov		dh,byte ptr [eax]
0041  89 C3				mov		ebx,eax
0043  84 F6				test		dh,dh
0045  75 0A				jne		L$3
0047  31 FF				xor		edi,edi
0049  89 3D 00 00 00 00			mov		dword ptr _tokn,edi
004F  EB 33				jmp		L$7
0051				L$3:
0051  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
0058  74 19				je		L$4
005A  88 F3				mov		bl,dh
005C  81 E3 FF 00 00 00			and		ebx,0x000000ff
0062  8A 9B 01 00 00 00			mov		bl,byte ptr ___MBCSIsTable+0x1[ebx]
0068  80 E3 01				and		bl,0x01
006B  81 E3 FF 00 00 00			and		ebx,0x000000ff
0071  EB 02				jmp		L$5
0073				L$4:
0073  31 C3				xor		ebx,eax
0075				L$5:
0075  74 04				je		L$6
0077  C6 00 00				mov		byte ptr [eax],0x00
007A  40				inc		eax
007B				L$6:
007B  C6 00 00				mov		byte ptr [eax],0x00
007E  40				inc		eax
007F  A3 00 00 00 00			mov		dword ptr _tokn,eax
0084				L$7:
0084  89 C8				mov		eax,ecx
0086  5F				pop		edi
0087  59				pop		ecx
0088  5B				pop		ebx
0089  C3				ret		
008A				L$8:
008A  89 DA				mov		edx,ebx
008C  E8 00 00 00 00			call		strtok_
0091				L$9:
0091  5F				pop		edi
0092  59				pop		ecx
0093  5B				pop		ebx
0094  C3				ret		

Routine Size: 149 bytes,    Routine Base: _TEXT + 0000

0095				_mbschr_:
0095  53				push		ebx
0096  51				push		ecx
0097  56				push		esi
0098  83 EC 04				sub		esp,0x00000004
009B  89 C6				mov		esi,eax
009D  89 D3				mov		ebx,edx
009F  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
00A6  74 1A				je		L$11
00A8				L$10:
00A8  89 E2				mov		edx,esp
00AA  89 F0				mov		eax,esi
00AC  E8 00 00 00 00			call		_mbgetcode_
00B1  8B 0C 24				mov		ecx,dword ptr [esp]
00B4  39 CB				cmp		ebx,ecx
00B6  74 24				je		L$14
00B8  89 C6				mov		esi,eax
00BA  85 C9				test		ecx,ecx
00BC  75 EA				jne		L$10
00BE  31 C0				xor		eax,eax
00C0  EB 1C				jmp		L$15
00C2				L$11:
00C2  88 DA				mov		dl,bl
00C4				L$12:
00C4  8A 06				mov		al,byte ptr [esi]
00C6  3A C2				cmp		al,dl
00C8  74 12				je		L$14
00CA  3C 00				cmp		al,0x00
00CC  74 0C				je		L$13
00CE  46				inc		esi
00CF  8A 06				mov		al,byte ptr [esi]
00D1  3A C2				cmp		al,dl
00D3  74 07				je		L$14
00D5  46				inc		esi
00D6  3C 00				cmp		al,0x00
00D8  75 EA				jne		L$12
00DA				L$13:
00DA  2B F6				sub		esi,esi
00DC				L$14:
00DC  89 F0				mov		eax,esi
00DE				L$15:
00DE  83 C4 04				add		esp,0x00000004
00E1  5E				pop		esi
00E2  59				pop		ecx
00E3  5B				pop		ebx
00E4  C3				ret		

Routine Size: 80 bytes,    Routine Base: _TEXT + 0095

00E5				_mbsrchr_:
00E5  53				push		ebx
00E6  51				push		ecx
00E7  56				push		esi
00E8  57				push		edi
00E9  83 EC 04				sub		esp,0x00000004
00EC  89 C3				mov		ebx,eax
00EE  89 D1				mov		ecx,edx
00F0  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
00F7  74 20				je		L$19
00F9  31 F6				xor		esi,esi
00FB				L$16:
00FB  89 E2				mov		edx,esp
00FD  89 D8				mov		eax,ebx
00FF  E8 00 00 00 00			call		_mbgetcode_
0104  8B 3C 24				mov		edi,dword ptr [esp]
0107  85 FF				test		edi,edi
0109  74 0A				je		L$18
010B  39 F9				cmp		ecx,edi
010D  75 02				jne		L$17
010F  89 DE				mov		esi,ebx
0111				L$17:
0111  89 C3				mov		ebx,eax
0113  EB E6				jmp		L$16
0115				L$18:
0115  89 F0				mov		eax,esi
0117  EB 07				jmp		L$20
0119				L$19:
0119  89 CA				mov		edx,ecx
011B  E8 00 00 00 00			call		strrchr_
0120				L$20:
0120  83 C4 04				add		esp,0x00000004
0123  5F				pop		edi
0124  5E				pop		esi
0125  59				pop		ecx
0126  5B				pop		ebx
0127  C3				ret		

Routine Size: 67 bytes,    Routine Base: _TEXT + 00E5

0128				_mbspbrk_:
0128  53				push		ebx
0129  51				push		ecx
012A  56				push		esi
012B  57				push		edi
012C  55				push		ebp
012D  83 EC 08				sub		esp,0x00000008
0130  89 C1				mov		ecx,eax
0132  89 D7				mov		edi,edx
0134  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
013B  75 25				jne		L$24
013D  EB 3E				jmp		L$26
013F				L$21:
013F  89 FB				mov		ebx,edi
0141				L$22:
0141  89 E2				mov		edx,esp
0143  89 D8				mov		eax,ebx
0145  E8 00 00 00 00			call		_mbgetcode_
014A  89 C3				mov		ebx,eax
014C  3B 2C 24				cmp		ebp,dword ptr [esp]
014F  75 04				jne		L$23
0151  89 F1				mov		ecx,esi
0153  EB 0F				jmp		L$25
0155				L$23:
0155  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0159  3B 04 24				cmp		eax,dword ptr [esp]
015C  75 E3				jne		L$22
015E  89 C8				mov		eax,ecx
0160  EB 22				jmp		L$27
0162				L$24:
0162  31 ED				xor		ebp,ebp
0164				L$25:
0164  8D 54 24 04			lea		edx,0x4[esp]
0168  89 C8				mov		eax,ecx
016A  E8 00 00 00 00			call		_mbgetcode_
016F  8B 5C 24 04			mov		ebx,dword ptr 0x4[esp]
0173  89 C6				mov		esi,eax
0175  39 DD				cmp		ebp,ebx
0177  75 C6				jne		L$21
0179  31 C0				xor		eax,eax
017B  EB 07				jmp		L$27
017D				L$26:
017D  89 FA				mov		edx,edi
017F  E8 00 00 00 00			call		strpbrk_
0184				L$27:
0184  83 C4 08				add		esp,0x00000008
0187  5D				pop		ebp
0188  5F				pop		edi
0189  5E				pop		esi
018A  59				pop		ecx
018B  5B				pop		ebx
018C  C3				ret		

Routine Size: 101 bytes,    Routine Base: _TEXT + 0128

018D				_mbscspn_:
018D  53				push		ebx
018E  51				push		ecx
018F  56				push		esi
0190  57				push		edi
0191  55				push		ebp
0192  83 EC 08				sub		esp,0x00000008
0195  89 C1				mov		ecx,eax
0197  89 D7				mov		edi,edx
0199  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
01A0  74 3D				je		L$33
01A2  31 F6				xor		esi,esi
01A4  31 ED				xor		ebp,ebp
01A6  EB 13				jmp		L$30
01A8				L$28:
01A8  89 FB				mov		ebx,edi
01AA				L$29:
01AA  89 E2				mov		edx,esp
01AC  89 D8				mov		eax,ebx
01AE  E8 00 00 00 00			call		_mbgetcode_
01B3  89 C3				mov		ebx,eax
01B5  3B 2C 24				cmp		ebp,dword ptr [esp]
01B8  75 18				jne		L$31
01BA  46				inc		esi
01BB				L$30:
01BB  8D 54 24 04			lea		edx,0x4[esp]
01BF  89 C8				mov		eax,ecx
01C1  E8 00 00 00 00			call		_mbgetcode_
01C6  8B 5C 24 04			mov		ebx,dword ptr 0x4[esp]
01CA  89 C1				mov		ecx,eax
01CC  39 DD				cmp		ebp,ebx
01CE  75 D8				jne		L$28
01D0  EB 09				jmp		L$32
01D2				L$31:
01D2  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
01D6  3B 04 24				cmp		eax,dword ptr [esp]
01D9  75 CF				jne		L$29
01DB				L$32:
01DB  89 F0				mov		eax,esi
01DD  EB A5				jmp		L$27
01DF				L$33:
01DF  89 FA				mov		edx,edi
01E1  E8 00 00 00 00			call		strcspn_
01E6  EB 9C				jmp		L$27

Routine Size: 91 bytes,    Routine Base: _TEXT + 018D

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000004 bytes
0000				_tokn:

BSS Size: 4 bytes

