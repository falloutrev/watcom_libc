Module: setenv
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000320 bytes
0000				setenv_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 08				sub		esp,0x00000008
0007  50				push		eax
0008  52				push		edx
0009  85 C0				test		eax,eax
000B  75 0A				jne		L$2
000D				L$1:
000D  B8 FF FF FF FF			mov		eax,0xffffffff
0012  E9 E8 01 00 00			jmp		L$13
0017				L$2:
0017  80 38 00				cmp		byte ptr [eax],0x00
001A  74 F1				je		L$1
001C  A1 00 00 00 00			mov		eax,dword ptr _environ
0021  89 44 24 0C			mov		dword ptr 0xc[esp],eax
0025  85 C0				test		eax,eax
0027  75 3D				jne		L$3
0029  83 3C 24 00			cmp		dword ptr [esp],0x00000000
002D  0F 84 CC 01 00 00			je		L$13
0033  B8 09 00 00 00			mov		eax,0x00000009
0038  E8 00 00 00 00			call		malloc_
003D  89 44 24 0C			mov		dword ptr 0xc[esp],eax
0041  85 C0				test		eax,eax
0043  74 C8				je		L$1
0045  C7 00 00 00 00 00			mov		dword ptr [eax],0x00000000
004B  A3 00 00 00 00			mov		dword ptr _environ,eax
0050  C7 40 04 00 00 00 00		mov		dword ptr 0x4[eax],0x00000000
0057  83 C0 08				add		eax,0x00000008
005A  31 ED				xor		ebp,ebp
005C  A3 00 00 00 00			mov		dword ptr ___env_mask,eax
0061  E9 E1 00 00 00			jmp		L$7
0066				L$3:
0066  8B 14 24				mov		edx,dword ptr [esp]
0069  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
006D  8B 34 24				mov		esi,dword ptr [esp]
0070  E8 00 00 00 00			call		findenv_
0075  85 F6				test		esi,esi
0077  0F 84 80 01 00 00			je		L$12
007D  85 C0				test		eax,eax
007F  0F 8F B7 00 00 00			jg		L$6
0085  F7 D8				neg		eax
0087  89 C5				mov		ebp,eax
0089  89 E9				mov		ecx,ebp
008B  8B 3D 00 00 00 00			mov		edi,dword ptr ___env_mask
0091  C1 E1 02				shl		ecx,0x02
0094  40				inc		eax
0095  8D 59 08				lea		ebx,0x8[ecx]
0098  89 44 24 08			mov		dword ptr 0x8[esp],eax
009C  01 D8				add		eax,ebx
009E  85 FF				test		edi,edi
00A0  75 48				jne		L$4
00A2  E8 00 00 00 00			call		malloc_
00A7  89 C2				mov		edx,eax
00A9  89 44 24 0C			mov		dword ptr 0xc[esp],eax
00AD  85 C0				test		eax,eax
00AF  0F 84 58 FF FF FF			je		L$1
00B5  8B 35 00 00 00 00			mov		esi,dword ptr _environ
00BB  89 C7				mov		edi,eax
00BD  06				push		es
00BE  8C D8				mov		eax,ds
00C0  8E C0				mov		es,eax
00C2  57				push		edi
00C3  89 C8				mov		eax,ecx
00C5  C1 E9 02				shr		ecx,0x02
00C8  F2 A5				repne movsd	
00CA  8A C8				mov		cl,al
00CC  80 E1 03				and		cl,0x03
00CF  F2 A4				repne movsb	
00D1  5F				pop		edi
00D2  07				pop		es
00D3  01 DA				add		edx,ebx
00D5  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
00D9  89 15 00 00 00 00			mov		dword ptr ___env_mask,edx
00DF  89 D0				mov		eax,edx
00E1  31 D2				xor		edx,edx
00E3  E8 00 00 00 00			call		memset_
00E8  EB 2F				jmp		L$5
00EA				L$4:
00EA  89 C2				mov		edx,eax
00EC  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
00F0  E8 00 00 00 00			call		realloc_
00F5  89 44 24 0C			mov		dword ptr 0xc[esp],eax
00F9  85 C0				test		eax,eax
00FB  0F 84 0C FF FF FF			je		L$1
0101  8B 15 00 00 00 00			mov		edx,dword ptr ___env_mask
0107  8D 0C 18				lea		ecx,[eax+ebx]
010A  89 EB				mov		ebx,ebp
010C  89 C8				mov		eax,ecx
010E  E8 00 00 00 00			call		memmove_
0113  89 0D 00 00 00 00			mov		dword ptr ___env_mask,ecx
0119				L$5:
0119  89 E8				mov		eax,ebp
011B  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
011F  C1 E0 02				shl		eax,0x02
0122  01 D0				add		eax,edx
0124  C7 40 04 00 00 00 00		mov		dword ptr 0x4[eax],0x00000000
012B  A1 00 00 00 00			mov		eax,dword ptr ___env_mask
0130  89 15 00 00 00 00			mov		dword ptr _environ,edx
0136  C6 04 28 00			mov		byte ptr [eax+ebp],0x00
013A  EB 0B				jmp		L$7
013C				L$6:
013C  85 DB				test		ebx,ebx
013E  0F 84 B9 00 00 00			je		L$12
0144  8D 68 FF				lea		ebp,-0x1[eax]
0147				L$7:
0147  8B 7C 24 04			mov		edi,dword ptr 0x4[esp]
014B  06				push		es
014C  8C D8				mov		eax,ds
014E  8E C0				mov		es,eax
0150  29 C9				sub		ecx,ecx
0152  49				dec		ecx
0153  31 C0				xor		eax,eax
0155  F2 AE				repne scasb	
0157  F7 D1				not		ecx
0159  49				dec		ecx
015A  07				pop		es
015B  A1 00 00 00 00			mov		eax,dword ptr ___env_mask
0160  8A 34 28				mov		dh,byte ptr [eax+ebp]
0163  89 CB				mov		ebx,ecx
0165  84 F6				test		dh,dh
0167  74 0F				je		L$8
0169  89 EE				mov		esi,ebp
016B  8B 4C 24 0C			mov		ecx,dword ptr 0xc[esp]
016F  C1 E6 02				shl		esi,0x02
0172  01 CE				add		esi,ecx
0174  8B 36				mov		esi,dword ptr [esi]
0176  EB 02				jmp		L$9
0178				L$8:
0178  31 F6				xor		esi,esi
017A				L$9:
017A  8B 3C 24				mov		edi,dword ptr [esp]
017D  06				push		es
017E  8C D8				mov		eax,ds
0180  8E C0				mov		es,eax
0182  29 C9				sub		ecx,ecx
0184  49				dec		ecx
0185  31 C0				xor		eax,eax
0187  F2 AE				repne scasb	
0189  F7 D1				not		ecx
018B  49				dec		ecx
018C  07				pop		es
018D  8D 14 0B				lea		edx,[ebx+ecx]
0190  89 F0				mov		eax,esi
0192  83 C2 02				add		edx,0x00000002
0195  E8 00 00 00 00			call		realloc_
019A  89 C2				mov		edx,eax
019C  85 C0				test		eax,eax
019E  0F 84 69 FE FF FF			je		L$1
01A4  8B 74 24 04			mov		esi,dword ptr 0x4[esp]
01A8  89 D9				mov		ecx,ebx
01AA  89 C7				mov		edi,eax
01AC  06				push		es
01AD  8C D8				mov		eax,ds
01AF  8E C0				mov		es,eax
01B1  57				push		edi
01B2  89 C8				mov		eax,ecx
01B4  C1 E9 02				shr		ecx,0x02
01B7  F2 A5				repne movsd	
01B9  8A C8				mov		cl,al
01BB  80 E1 03				and		cl,0x03
01BE  F2 A4				repne movsb	
01C0  5F				pop		edi
01C1  07				pop		es
01C2  C6 04 1A 3D			mov		byte ptr [edx+ebx],0x3d
01C6  43				inc		ebx
01C7  8B 34 24				mov		esi,dword ptr [esp]
01CA  8D 3C 1A				lea		edi,[edx+ebx]
01CD  57				push		edi
01CE				L$10:
01CE  8A 06				mov		al,byte ptr [esi]
01D0  88 07				mov		byte ptr [edi],al
01D2  3C 00				cmp		al,0x00
01D4  74 10				je		L$11
01D6  8A 46 01				mov		al,byte ptr 0x1[esi]
01D9  83 C6 02				add		esi,0x00000002
01DC  88 47 01				mov		byte ptr 0x1[edi],al
01DF  83 C7 02				add		edi,0x00000002
01E2  3C 00				cmp		al,0x00
01E4  75 E8				jne		L$10
01E6				L$11:
01E6  5F				pop		edi
01E7  89 E8				mov		eax,ebp
01E9  8B 74 24 0C			mov		esi,dword ptr 0xc[esp]
01ED  C1 E0 02				shl		eax,0x02
01F0  01 F0				add		eax,esi
01F2  89 10				mov		dword ptr [eax],edx
01F4  A1 00 00 00 00			mov		eax,dword ptr ___env_mask
01F9  C6 04 28 01			mov		byte ptr [eax+ebp],0x01
01FD				L$12:
01FD  31 C0				xor		eax,eax
01FF				L$13:
01FF  83 C4 10				add		esp,0x00000010
0202  5D				pop		ebp
0203  5F				pop		edi
0204  5E				pop		esi
0205  59				pop		ecx
0206  C3				ret		
0207				findenv_:
0207  53				push		ebx
0208  51				push		ecx
0209  56				push		esi
020A  57				push		edi
020B  55				push		ebp
020C  83 EC 08				sub		esp,0x00000008
020F  50				push		eax
0210  52				push		edx
0211  A1 00 00 00 00			mov		eax,dword ptr _environ
0216  89 44 24 08			mov		dword ptr 0x8[esp],eax
021A  E9 D8 00 00 00			jmp		L$24
021F				L$14:
021F  8B 6C 24 04			mov		ebp,dword ptr 0x4[esp]
0223				L$15:
0223  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
0227  31 C0				xor		eax,eax
0229  8A 02				mov		al,byte ptr [edx]
022B  83 F8 3D				cmp		eax,0x0000003d
022E  0F 85 8C 00 00 00			jne		L$22
0234  80 7D 00 00			cmp		byte ptr [ebp],0x00
0238  0F 85 82 00 00 00			jne		L$22
023E  8B 74 24 08			mov		esi,dword ptr 0x8[esp]
0242  2B 35 00 00 00 00			sub		esi,dword ptr _environ
0248  8B 3C 24				mov		edi,dword ptr [esp]
024B  C1 FE 02				sar		esi,0x02
024E  85 FF				test		edi,edi
0250  0F 85 65 00 00 00			jne		L$21
0256  8B 7C 24 08			mov		edi,dword ptr 0x8[esp]
025A  8B 4C 24 08			mov		ecx,dword ptr 0x8[esp]
025E  8B 3F				mov		edi,dword ptr [edi]
0260  EB 08				jmp		L$17
0262				L$16:
0262  8B 41 04				mov		eax,dword ptr 0x4[ecx]
0265  89 01				mov		dword ptr [ecx],eax
0267  83 C1 04				add		ecx,0x00000004
026A				L$17:
026A  83 39 00				cmp		dword ptr [ecx],0x00000000
026D  75 F3				jne		L$16
026F  8B 15 00 00 00 00			mov		edx,dword ptr ___env_mask
0275  85 D2				test		edx,edx
0277  74 47				je		L$22
0279  89 D0				mov		eax,edx
027B  80 3C 06 00			cmp		byte ptr [esi+eax],0x00
027F  74 07				je		L$18
0281  89 F8				mov		eax,edi
0283  E8 00 00 00 00			call		free_
0288				L$18:
0288  8B 1D 00 00 00 00			mov		ebx,dword ptr _environ
028E  89 CF				mov		edi,ecx
0290  29 DF				sub		edi,ebx
0292  8B 15 00 00 00 00			mov		edx,dword ptr ___env_mask
0298  C1 FF 02				sar		edi,0x02
029B  89 C8				mov		eax,ecx
029D  89 FB				mov		ebx,edi
029F  E8 00 00 00 00			call		memmove_
02A4  89 0D 00 00 00 00			mov		dword ptr ___env_mask,ecx
02AA  01 F1				add		ecx,esi
02AC  EB 07				jmp		L$20
02AE				L$19:
02AE  8A 41 01				mov		al,byte ptr 0x1[ecx]
02B1  46				inc		esi
02B2  88 01				mov		byte ptr [ecx],al
02B4  41				inc		ecx
02B5				L$20:
02B5  39 FE				cmp		esi,edi
02B7  7D 07				jge		L$22
02B9  EB F3				jmp		L$19
02BB				L$21:
02BB  8D 46 01				lea		eax,0x1[esi]
02BE  EB 57				jmp		L$25
02C0				L$22:
02C0  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
02C4  31 C0				xor		eax,eax
02C6  8A 02				mov		al,byte ptr [edx]
02C8  E8 00 00 00 00			call		toupper_
02CD  89 C1				mov		ecx,eax
02CF  31 C0				xor		eax,eax
02D1  8A 45 00				mov		al,byte ptr [ebp]
02D4  E8 00 00 00 00			call		toupper_
02D9  39 C1				cmp		ecx,eax
02DB  75 15				jne		L$23
02DD  80 7D 00 00			cmp		byte ptr [ebp],0x00
02E1  74 0F				je		L$23
02E3  8B 4C 24 0C			mov		ecx,dword ptr 0xc[esp]
02E7  41				inc		ecx
02E8  45				inc		ebp
02E9  89 4C 24 0C			mov		dword ptr 0xc[esp],ecx
02ED  E9 31 FF FF FF			jmp		L$15
02F2				L$23:
02F2  83 44 24 08 04			add		dword ptr 0x8[esp],0x00000004
02F7				L$24:
02F7  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
02FB  8B 00				mov		eax,dword ptr [eax]
02FD  89 44 24 0C			mov		dword ptr 0xc[esp],eax
0301  85 C0				test		eax,eax
0303  0F 85 16 FF FF FF			jne		L$14
0309  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
030D  A1 00 00 00 00			mov		eax,dword ptr _environ
0312  29 D8				sub		eax,ebx
0314  C1 F8 02				sar		eax,0x02
0317				L$25:
0317  83 C4 10				add		esp,0x00000010
031A  5D				pop		ebp
031B  5F				pop		edi
031C  5E				pop		esi
031D  59				pop		ecx
031E  5B				pop		ebx
031F  C3				ret		

Routine Size: 800 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

