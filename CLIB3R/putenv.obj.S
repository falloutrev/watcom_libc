Module: putenv
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000250 bytes
0000				putenv_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  57				push		edi
0005  55				push		ebp
0006  83 EC 08				sub		esp,0x00000008
0009  50				push		eax
000A  85 C0				test		eax,eax
000C  75 14				jne		L$3
000E				L$1:
000E  B8 FF FF FF FF			mov		eax,0xffffffff
0013  E9 4A 01 00 00			jmp		L$11
0018				L$2:
0018  31 D2				xor		edx,edx
001A  8A 10				mov		dl,byte ptr [eax]
001C  83 FA 3D				cmp		edx,0x0000003d
001F  74 06				je		L$4
0021  40				inc		eax
0022				L$3:
0022  80 38 00				cmp		byte ptr [eax],0x00
0025  75 F1				jne		L$2
0027				L$4:
0027  80 38 00				cmp		byte ptr [eax],0x00
002A  74 E2				je		L$1
002C  80 78 01 00			cmp		byte ptr 0x1[eax],0x00
0030  0F 94 C0				sete		al
0033  31 DB				xor		ebx,ebx
0035  8B 2D 00 00 00 00			mov		ebp,dword ptr _environ
003B  88 C3				mov		bl,al
003D  85 ED				test		ebp,ebp
003F  75 35				jne		L$5
0041  85 DB				test		ebx,ebx
0043  0F 85 17 01 00 00			jne		L$10
0049  B8 09 00 00 00			mov		eax,0x00000009
004E  E8 00 00 00 00			call		malloc_
0053  89 C5				mov		ebp,eax
0055  85 C0				test		eax,eax
0057  74 B5				je		L$1
0059  A3 00 00 00 00			mov		dword ptr _environ,eax
005E  89 18				mov		dword ptr [eax],ebx
0060  31 FF				xor		edi,edi
0062  89 58 04				mov		dword ptr 0x4[eax],ebx
0065  83 C0 08				add		eax,0x00000008
0068  89 7C 24 08			mov		dword ptr 0x8[esp],edi
006C  A3 00 00 00 00			mov		dword ptr ___env_mask,eax
0071  E9 CD 00 00 00			jmp		L$9
0076				L$5:
0076  8B 04 24				mov		eax,dword ptr [esp]
0079  89 DA				mov		edx,ebx
007B  E8 00 00 00 00			call		findenv_
0080  85 DB				test		ebx,ebx
0082  0F 85 D8 00 00 00			jne		L$10
0088  85 C0				test		eax,eax
008A  0F 8F AE 00 00 00			jg		L$8
0090  89 C3				mov		ebx,eax
0092  89 44 24 08			mov		dword ptr 0x8[esp],eax
0096  F7 DB				neg		ebx
0098  89 5C 24 08			mov		dword ptr 0x8[esp],ebx
009C  8B 4C 24 08			mov		ecx,dword ptr 0x8[esp]
00A0  C1 E1 02				shl		ecx,0x02
00A3  8B 35 00 00 00 00			mov		esi,dword ptr ___env_mask
00A9  8D 41 08				lea		eax,0x8[ecx]
00AC  43				inc		ebx
00AD  89 44 24 04			mov		dword ptr 0x4[esp],eax
00B1  01 D8				add		eax,ebx
00B3  85 F6				test		esi,esi
00B5  75 43				jne		L$6
00B7  E8 00 00 00 00			call		malloc_
00BC  89 C2				mov		edx,eax
00BE  89 C5				mov		ebp,eax
00C0  85 C0				test		eax,eax
00C2  0F 84 46 FF FF FF			je		L$1
00C8  8B 35 00 00 00 00			mov		esi,dword ptr _environ
00CE  89 C7				mov		edi,eax
00D0  06				push		es
00D1  8C D8				mov		eax,ds
00D3  8E C0				mov		es,eax
00D5  57				push		edi
00D6  89 C8				mov		eax,ecx
00D8  C1 E9 02				shr		ecx,0x02
00DB  F2 A5				repne movsd	
00DD  8A C8				mov		cl,al
00DF  80 E1 03				and		cl,0x03
00E2  F2 A4				repne movsb	
00E4  5F				pop		edi
00E5  07				pop		es
00E6  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
00EA  01 D0				add		eax,edx
00EC  31 D2				xor		edx,edx
00EE  A3 00 00 00 00			mov		dword ptr ___env_mask,eax
00F3  E8 00 00 00 00			call		memset_
00F8  EB 30				jmp		L$7
00FA				L$6:
00FA  89 C2				mov		edx,eax
00FC  89 E8				mov		eax,ebp
00FE  E8 00 00 00 00			call		realloc_
0103  89 C5				mov		ebp,eax
0105  85 C0				test		eax,eax
0107  0F 84 01 FF FF FF			je		L$1
010D  8B 4C 24 04			mov		ecx,dword ptr 0x4[esp]
0111  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
0115  01 C1				add		ecx,eax
0117  8B 15 00 00 00 00			mov		edx,dword ptr ___env_mask
011D  89 C8				mov		eax,ecx
011F  E8 00 00 00 00			call		memmove_
0124  89 0D 00 00 00 00			mov		dword ptr ___env_mask,ecx
012A				L$7:
012A  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
012E  89 2D 00 00 00 00			mov		dword ptr _environ,ebp
0134  C7 44 85 04 00 00 00 00		mov		dword ptr 0x4[ebp+eax*4],0x00000000
013C  EB 05				jmp		L$9
013E				L$8:
013E  48				dec		eax
013F  89 44 24 08			mov		dword ptr 0x8[esp],eax
0143				L$9:
0143  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
0147  C1 E0 02				shl		eax,0x02
014A  01 C5				add		ebp,eax
014C  8B 04 24				mov		eax,dword ptr [esp]
014F  89 45 00				mov		dword ptr [ebp],eax
0152  8B 6C 24 08			mov		ebp,dword ptr 0x8[esp]
0156  A1 00 00 00 00			mov		eax,dword ptr ___env_mask
015B  01 E8				add		eax,ebp
015D  C6 00 00				mov		byte ptr [eax],0x00
0160				L$10:
0160  31 C0				xor		eax,eax
0162				L$11:
0162  83 C4 0C				add		esp,0x0000000c
0165  5D				pop		ebp
0166  5F				pop		edi
0167  5E				pop		esi
0168  5A				pop		edx
0169  59				pop		ecx
016A  5B				pop		ebx
016B  C3				ret		
016C				findenv_:
016C  53				push		ebx
016D  51				push		ecx
016E  56				push		esi
016F  57				push		edi
0170  55				push		ebp
0171  89 C7				mov		edi,eax
0173  89 D5				mov		ebp,edx
0175  8B 35 00 00 00 00			mov		esi,dword ptr _environ
017B  E9 B6 00 00 00			jmp		L$24
0180				L$12:
0180  89 FB				mov		ebx,edi
0182  E9 A3 00 00 00			jmp		L$22
0187				L$13:
0187  31 C0				xor		eax,eax
0189  8A 02				mov		al,byte ptr [edx]
018B  E8 00 00 00 00			call		toupper_
0190  89 C1				mov		ecx,eax
0192  31 C0				xor		eax,eax
0194  8A 03				mov		al,byte ptr [ebx]
0196  E8 00 00 00 00			call		toupper_
019B  39 C1				cmp		ecx,eax
019D  0F 85 90 00 00 00			jne		L$23
01A3  31 C0				xor		eax,eax
01A5  8A 02				mov		al,byte ptr [edx]
01A7  83 F8 3D				cmp		eax,0x0000003d
01AA  0F 85 78 00 00 00			jne		L$21
01B0  8B 15 00 00 00 00			mov		edx,dword ptr _environ
01B6  89 F7				mov		edi,esi
01B8  29 D7				sub		edi,edx
01BA  C1 FF 02				sar		edi,0x02
01BD  85 ED				test		ebp,ebp
01BF  74 62				je		L$20
01C1  89 F1				mov		ecx,esi
01C3  8B 16				mov		edx,dword ptr [esi]
01C5  EB 08				jmp		L$15
01C7				L$14:
01C7  8B 41 04				mov		eax,dword ptr 0x4[ecx]
01CA  89 01				mov		dword ptr [ecx],eax
01CC  83 C1 04				add		ecx,0x00000004
01CF				L$15:
01CF  83 39 00				cmp		dword ptr [ecx],0x00000000
01D2  75 F3				jne		L$14
01D4  8B 35 00 00 00 00			mov		esi,dword ptr ___env_mask
01DA  85 F6				test		esi,esi
01DC  74 41				je		L$19
01DE  89 F0				mov		eax,esi
01E0  80 3C 07 00			cmp		byte ptr [edi+eax],0x00
01E4  74 07				je		L$16
01E6  89 D0				mov		eax,edx
01E8  E8 00 00 00 00			call		free_
01ED				L$16:
01ED  8B 2D 00 00 00 00			mov		ebp,dword ptr _environ
01F3  89 CE				mov		esi,ecx
01F5  29 EE				sub		esi,ebp
01F7  8B 15 00 00 00 00			mov		edx,dword ptr ___env_mask
01FD  C1 FE 02				sar		esi,0x02
0200  89 C8				mov		eax,ecx
0202  89 F3				mov		ebx,esi
0204  E8 00 00 00 00			call		memmove_
0209  89 0D 00 00 00 00			mov		dword ptr ___env_mask,ecx
020F  8D 04 0F				lea		eax,[edi+ecx]
0212  EB 07				jmp		L$18
0214				L$17:
0214  8A 50 01				mov		dl,byte ptr 0x1[eax]
0217  47				inc		edi
0218  88 10				mov		byte ptr [eax],dl
021A  40				inc		eax
021B				L$18:
021B  39 F7				cmp		edi,esi
021D  7C F5				jl		L$17
021F				L$19:
021F  31 C0				xor		eax,eax
0221  EB 27				jmp		L$25
0223				L$20:
0223  8D 47 01				lea		eax,0x1[edi]
0226  EB 22				jmp		L$25
0228				L$21:
0228  42				inc		edx
0229  43				inc		ebx
022A				L$22:
022A  80 3B 00				cmp		byte ptr [ebx],0x00
022D  0F 85 54 FF FF FF			jne		L$13
0233				L$23:
0233  83 C6 04				add		esi,0x00000004
0236				L$24:
0236  8B 16				mov		edx,dword ptr [esi]
0238  85 D2				test		edx,edx
023A  0F 85 40 FF FF FF			jne		L$12
0240  A1 00 00 00 00			mov		eax,dword ptr _environ
0245  29 F0				sub		eax,esi
0247  C1 F8 02				sar		eax,0x02
024A				L$25:
024A  5D				pop		ebp
024B  5F				pop		edi
024C  5E				pop		esi
024D  59				pop		ecx
024E  5B				pop		ebx
024F  C3				ret		

Routine Size: 592 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

