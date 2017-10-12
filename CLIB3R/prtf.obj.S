Module: prtf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000BDE bytes
0000				__prtf_:
0000  56				push		esi
0001  57				push		edi
0002  06				push		es
0003  55				push		ebp
0004  81 EC 24 01 00 00			sub		esp,0x00000124
000A  89 DE				mov		esi,ebx
000C  89 8C 24 1C 01 00 00		mov		dword ptr 0x11c[esp],ecx
0013  30 DB				xor		bl,bl
0015  89 84 24 00 01 00 00		mov		dword ptr 0x100[esp],eax
001C  88 9C 24 20 01 00 00		mov		byte ptr 0x120[esp],bl
0023  88 9C 24 14 01 00 00		mov		byte ptr 0x114[esp],bl
002A  31 DB				xor		ebx,ebx
002C  89 D7				mov		edi,edx
002E  89 9C 24 10 01 00 00		mov		dword ptr 0x110[esp],ebx
0035  BD 04 00 00 00			mov		ebp,0x00000004
003A  E9 93 00 00 00			jmp		L$5
003F				L$1:
003F  8D 9C 24 00 01 00 00		lea		ebx,0x100[esp]
0046  89 F2				mov		edx,esi
0048  E8 00 00 00 00			call		getprintspecs_
004D  89 C7				mov		edi,eax
004F  8A 00				mov		al,byte ptr [eax]
0051  47				inc		edi
0052  88 84 24 15 01 00 00		mov		byte ptr 0x115[esp],al
0059  84 C0				test		al,al
005B  0F 84 2C 03 00 00			je		L$28
0061  31 C0				xor		eax,eax
0063  8A 84 24 15 01 00 00		mov		al,byte ptr 0x115[esp]
006A  83 F8 6E				cmp		eax,0x0000006e
006D  0F 85 29 01 00 00			jne		L$14
0073  8A 84 24 14 01 00 00		mov		al,byte ptr 0x114[esp]
007A  31 D2				xor		edx,edx
007C  24 20				and		al,0x20
007E  88 C2				mov		dl,al
0080  8A 84 24 14 01 00 00		mov		al,byte ptr 0x114[esp]
0087  24 40				and		al,0x40
0089  8A A4 24 14 01 00 00		mov		ah,byte ptr 0x114[esp]
0090  80 E4 80				and		ah,0x80
0093  85 D2				test		edx,edx
0095  0F 84 6E 00 00 00			je		L$7
009B  31 D2				xor		edx,edx
009D  88 E2				mov		dl,ah
009F  85 D2				test		edx,edx
00A1  74 16				je		L$3
00A3  8B 0E				mov		ecx,dword ptr [esi]
00A5  83 C1 08				add		ecx,0x00000008
00A8  89 0E				mov		dword ptr [esi],ecx
00AA  C4 51 F8				les		edx,fword ptr -0x8[ecx]
00AD				L$2:
00AD  8B 84 24 10 01 00 00		mov		eax,dword ptr 0x110[esp]
00B4  26 89 02				mov		dword ptr es:[edx],eax
00B7  EB 19				jmp		L$5
00B9				L$3:
00B9  25 FF 00 00 00			and		eax,0x000000ff
00BE  74 3E				je		L$6
00C0  8B 1E				mov		ebx,dword ptr [esi]
00C2  01 EB				add		ebx,ebp
00C4  89 1E				mov		dword ptr [esi],ebx
00C6  8B 53 FC				mov		edx,dword ptr -0x4[ebx]
00C9				L$4:
00C9  8B 84 24 10 01 00 00		mov		eax,dword ptr 0x110[esp]
00D0  89 02				mov		dword ptr [edx],eax
00D2				L$5:
00D2  8A 0F				mov		cl,byte ptr [edi]
00D4  84 C9				test		cl,cl
00D6  0F 84 B1 02 00 00			je		L$28
00DC  31 D2				xor		edx,edx
00DE  88 CA				mov		dl,cl
00E0  8D 47 01				lea		eax,0x1[edi]
00E3  83 FA 25				cmp		edx,0x00000025
00E6  0F 84 53 FF FF FF			je		L$1
00EC  89 C7				mov		edi,eax
00EE  8D 84 24 00 01 00 00		lea		eax,0x100[esp]
00F5  FF 94 24 1C 01 00 00		call		dword ptr 0x11c[esp]
00FC  EB D4				jmp		L$5
00FE				L$6:
00FE  8B 16				mov		edx,dword ptr [esi]
0100  01 EA				add		edx,ebp
0102  89 16				mov		dword ptr [esi],edx
0104  8B 52 FC				mov		edx,dword ptr -0x4[edx]
0107  EB C0				jmp		L$4
0109				L$7:
0109  8A 94 24 14 01 00 00		mov		dl,byte ptr 0x114[esp]
0110  80 E2 10				and		dl,0x10
0113  81 E2 FF 00 00 00			and		edx,0x000000ff
0119  74 49				je		L$11
011B  31 D2				xor		edx,edx
011D  88 E2				mov		dl,ah
011F  85 D2				test		edx,edx
0121  74 17				je		L$8
0123  8B 06				mov		eax,dword ptr [esi]
0125  83 C0 08				add		eax,0x00000008
0128  89 06				mov		dword ptr [esi],eax
012A  C4 50 F8				les		edx,fword ptr -0x8[eax]
012D  8B 84 24 10 01 00 00		mov		eax,dword ptr 0x110[esp]
0134  66 26 89 02			mov		word ptr es:[edx],ax
0138  EB 98				jmp		L$5
013A				L$8:
013A  25 FF 00 00 00			and		eax,0x000000ff
013F  74 18				je		L$10
0141  8B 0E				mov		ecx,dword ptr [esi]
0143  01 E9				add		ecx,ebp
0145  89 0E				mov		dword ptr [esi],ecx
0147  8B 51 FC				mov		edx,dword ptr -0x4[ecx]
014A				L$9:
014A  8B 84 24 10 01 00 00		mov		eax,dword ptr 0x110[esp]
0151  66 89 02				mov		word ptr [edx],ax
0154  E9 79 FF FF FF			jmp		L$5
0159				L$10:
0159  8B 1E				mov		ebx,dword ptr [esi]
015B  01 EB				add		ebx,ebp
015D  89 1E				mov		dword ptr [esi],ebx
015F  8B 53 FC				mov		edx,dword ptr -0x4[ebx]
0162  EB E6				jmp		L$9
0164				L$11:
0164  88 E2				mov		dl,ah
0166  85 D2				test		edx,edx
0168  74 0F				je		L$12
016A  8B 16				mov		edx,dword ptr [esi]
016C  83 C2 08				add		edx,0x00000008
016F  89 16				mov		dword ptr [esi],edx
0171  C4 52 F8				les		edx,fword ptr -0x8[edx]
0174  E9 34 FF FF FF			jmp		L$2
0179				L$12:
0179  25 FF 00 00 00			and		eax,0x000000ff
017E  74 0E				je		L$13
0180  8B 06				mov		eax,dword ptr [esi]
0182  01 E8				add		eax,ebp
0184  89 06				mov		dword ptr [esi],eax
0186  8B 50 FC				mov		edx,dword ptr -0x4[eax]
0189  E9 3B FF FF FF			jmp		L$4
018E				L$13:
018E  8B 0E				mov		ecx,dword ptr [esi]
0190  01 E9				add		ecx,ebp
0192  89 0E				mov		dword ptr [esi],ecx
0194  8B 51 FC				mov		edx,dword ptr -0x4[ecx]
0197  E9 2D FF FF FF			jmp		L$4
019C				L$14:
019C  8D 8C 24 20 01 00 00		lea		ecx,0x120[esp]
01A3  8D 9C 24 00 01 00 00		lea		ebx,0x100[esp]
01AA  89 E0				mov		eax,esp
01AC  89 F2				mov		edx,esi
01AE  E8 00 00 00 00			call		formstring_
01B3  89 C3				mov		ebx,eax
01B5  8A 84 24 14 01 00 00		mov		al,byte ptr 0x114[esp]
01BC  8E C2				mov		es,edx
01BE  24 08				and		al,0x08
01C0  25 FF 00 00 00			and		eax,0x000000ff
01C5  75 38				jne		L$16
01C7  8A 84 24 16 01 00 00		mov		al,byte ptr 0x116[esp]
01CE  83 F8 20				cmp		eax,0x00000020
01D1  75 2C				jne		L$16
01D3				L$15:
01D3  8B 84 24 04 01 00 00		mov		eax,dword ptr 0x104[esp]
01DA  48				dec		eax
01DB  89 84 24 04 01 00 00		mov		dword ptr 0x104[esp],eax
01E2  85 C0				test		eax,eax
01E4  7C 19				jl		L$16
01E6  31 D2				xor		edx,edx
01E8  8D 84 24 00 01 00 00		lea		eax,0x100[esp]
01EF  8A 94 24 16 01 00 00		mov		dl,byte ptr 0x116[esp]
01F6  FF 94 24 1C 01 00 00		call		dword ptr 0x11c[esp]
01FD  EB D4				jmp		L$15
01FF				L$16:
01FF  8D 8C 24 17 01 00 00		lea		ecx,0x117[esp]
0206				L$17:
0206  8A 01				mov		al,byte ptr [ecx]
0208  84 C0				test		al,al
020A  74 15				je		L$18
020C  31 D2				xor		edx,edx
020E  88 C2				mov		dl,al
0210  8D 84 24 00 01 00 00		lea		eax,0x100[esp]
0217  41				inc		ecx
0218  FF 94 24 1C 01 00 00		call		dword ptr 0x11c[esp]
021F  EB E5				jmp		L$17
0221				L$18:
0221  8B 84 24 0C 01 00 00		mov		eax,dword ptr 0x10c[esp]
0228  8D 48 FF				lea		ecx,-0x1[eax]
022B  89 8C 24 0C 01 00 00		mov		dword ptr 0x10c[esp],ecx
0232  85 C0				test		eax,eax
0234  74 15				je		L$19
0236  BA 30 00 00 00			mov		edx,0x00000030
023B  8D 84 24 00 01 00 00		lea		eax,0x100[esp]
0242  FF 94 24 1C 01 00 00		call		dword ptr 0x11c[esp]
0249  EB D6				jmp		L$18
024B				L$19:
024B  8A 84 24 14 01 00 00		mov		al,byte ptr 0x114[esp]
0252  24 08				and		al,0x08
0254  25 FF 00 00 00			and		eax,0x000000ff
0259  75 38				jne		L$21
025B  8A 84 24 16 01 00 00		mov		al,byte ptr 0x116[esp]
0262  83 F8 20				cmp		eax,0x00000020
0265  74 2C				je		L$21
0267				L$20:
0267  8B 84 24 04 01 00 00		mov		eax,dword ptr 0x104[esp]
026E  48				dec		eax
026F  89 84 24 04 01 00 00		mov		dword ptr 0x104[esp],eax
0276  85 C0				test		eax,eax
0278  7C 19				jl		L$21
027A  31 D2				xor		edx,edx
027C  8D 84 24 00 01 00 00		lea		eax,0x100[esp]
0283  8A 94 24 16 01 00 00		mov		dl,byte ptr 0x116[esp]
028A  FF 94 24 1C 01 00 00		call		dword ptr 0x11c[esp]
0291  EB D4				jmp		L$20
0293				L$21:
0293  31 C0				xor		eax,eax
0295  8A 84 24 15 01 00 00		mov		al,byte ptr 0x115[esp]
029C  83 F8 73				cmp		eax,0x00000073
029F  74 05				je		L$22
02A1  83 F8 53				cmp		eax,0x00000053
02A4  75 6C				jne		L$25
02A6				L$22:
02A6  8A 84 24 14 01 00 00		mov		al,byte ptr 0x114[esp]
02AD  24 20				and		al,0x20
02AF  25 FF 00 00 00			and		eax,0x000000ff
02B4  74 31				je		L$24
02B6				L$23:
02B6  8B 84 24 08 01 00 00		mov		eax,dword ptr 0x108[esp]
02BD  8D 48 FF				lea		ecx,-0x1[eax]
02C0  89 8C 24 08 01 00 00		mov		dword ptr 0x108[esp],ecx
02C7  85 C0				test		eax,eax
02C9  0F 84 6E 00 00 00			je		L$26
02CF  31 D2				xor		edx,edx
02D1  8D 84 24 00 01 00 00		lea		eax,0x100[esp]
02D8  26 8A 13				mov		dl,byte ptr es:[ebx]
02DB  FF 94 24 1C 01 00 00		call		dword ptr 0x11c[esp]
02E2  83 C3 02				add		ebx,0x00000002
02E5  EB CF				jmp		L$23
02E7				L$24:
02E7  8B 84 24 08 01 00 00		mov		eax,dword ptr 0x108[esp]
02EE  8D 50 FF				lea		edx,-0x1[eax]
02F1  89 94 24 08 01 00 00		mov		dword ptr 0x108[esp],edx
02F8  85 C0				test		eax,eax
02FA  74 41				je		L$26
02FC  31 D2				xor		edx,edx
02FE  8D 84 24 00 01 00 00		lea		eax,0x100[esp]
0305  26 8A 13				mov		dl,byte ptr es:[ebx]
0308  FF 94 24 1C 01 00 00		call		dword ptr 0x11c[esp]
030F  43				inc		ebx
0310  EB D5				jmp		L$24
0312				L$25:
0312  8B 84 24 08 01 00 00		mov		eax,dword ptr 0x108[esp]
0319  8D 48 FF				lea		ecx,-0x1[eax]
031C  89 8C 24 08 01 00 00		mov		dword ptr 0x108[esp],ecx
0323  85 C0				test		eax,eax
0325  74 16				je		L$26
0327  31 D2				xor		edx,edx
0329  8D 84 24 00 01 00 00		lea		eax,0x100[esp]
0330  26 8A 13				mov		dl,byte ptr es:[ebx]
0333  FF 94 24 1C 01 00 00		call		dword ptr 0x11c[esp]
033A  43				inc		ebx
033B  EB D5				jmp		L$25
033D				L$26:
033D  8A 84 24 14 01 00 00		mov		al,byte ptr 0x114[esp]
0344  24 08				and		al,0x08
0346  25 FF 00 00 00			and		eax,0x000000ff
034B  0F 84 81 FD FF FF			je		L$5
0351  83 BC 24 04 01 00 00 00		cmp		dword ptr 0x104[esp],0x00000000
0359  0F 8E 73 FD FF FF			jle		L$5
035F				L$27:
035F  8B 84 24 04 01 00 00		mov		eax,dword ptr 0x104[esp]
0366  8D 50 FF				lea		edx,-0x1[eax]
0369  89 94 24 04 01 00 00		mov		dword ptr 0x104[esp],edx
0370  85 C0				test		eax,eax
0372  0F 84 5A FD FF FF			je		L$5
0378  BA 20 00 00 00			mov		edx,0x00000020
037D  8D 84 24 00 01 00 00		lea		eax,0x100[esp]
0384  FF 94 24 1C 01 00 00		call		dword ptr 0x11c[esp]
038B  EB D2				jmp		L$27
038D				L$28:
038D  8B 84 24 10 01 00 00		mov		eax,dword ptr 0x110[esp]
0394  81 C4 24 01 00 00			add		esp,0x00000124
039A  5D				pop		ebp
039B  07				pop		es
039C  5F				pop		edi
039D  5E				pop		esi
039E  C3				ret		
039F				getprintspecs_:
039F  51				push		ecx
03A0  56				push		esi
03A1  57				push		edi
03A2  89 D6				mov		esi,edx
03A4  C6 43 17 00			mov		byte ptr 0x17[ebx],0x00
03A8  89 DA				mov		edx,ebx
03AA  C6 43 16 20			mov		byte ptr 0x16[ebx],0x20
03AE  E8 00 00 00 00			call		evalflags_
03B3  C7 43 04 00 00 00 00		mov		dword ptr 0x4[ebx],0x00000000
03BA  8A 10				mov		dl,byte ptr [eax]
03BC  81 E2 FF 00 00 00			and		edx,0x000000ff
03C2  83 FA 30				cmp		edx,0x00000030
03C5  7C 26				jl		L$30
03C7  83 FA 39				cmp		edx,0x00000039
03CA  7F 21				jg		L$30
03CC				L$29:
03CC  6B 4B 04 0A			imul		ecx,dword ptr 0x4[ebx],0x0000000a
03D0  31 D2				xor		edx,edx
03D2  8A 10				mov		dl,byte ptr [eax]
03D4  83 EA 30				sub		edx,0x00000030
03D7  40				inc		eax
03D8  01 D1				add		ecx,edx
03DA  31 D2				xor		edx,edx
03DC  89 4B 04				mov		dword ptr 0x4[ebx],ecx
03DF  8A 10				mov		dl,byte ptr [eax]
03E1  83 FA 30				cmp		edx,0x00000030
03E4  7C 32				jl		L$32
03E6  83 FA 39				cmp		edx,0x00000039
03E9  7E E1				jle		L$29
03EB  EB 2B				jmp		L$32
03ED				L$30:
03ED  31 D2				xor		edx,edx
03EF  8A 10				mov		dl,byte ptr [eax]
03F1  83 FA 2A				cmp		edx,0x0000002a
03F4  75 22				jne		L$32
03F6  8B 16				mov		edx,dword ptr [esi]
03F8  83 C2 04				add		edx,0x00000004
03FB  89 16				mov		dword ptr [esi],edx
03FD  8B 52 FC				mov		edx,dword ptr -0x4[edx]
0400  89 53 04				mov		dword ptr 0x4[ebx],edx
0403  85 D2				test		edx,edx
0405  7D 10				jge		L$31
0407  89 D7				mov		edi,edx
0409  8A 53 14				mov		dl,byte ptr 0x14[ebx]
040C  F7 DF				neg		edi
040E  80 CA 08				or		dl,0x08
0411  89 7B 04				mov		dword ptr 0x4[ebx],edi
0414  88 53 14				mov		byte ptr 0x14[ebx],dl
0417				L$31:
0417  40				inc		eax
0418				L$32:
0418  C7 43 08 FF FF FF FF		mov		dword ptr 0x8[ebx],0xffffffff
041F  31 D2				xor		edx,edx
0421  8A 10				mov		dl,byte ptr [eax]
0423  83 FA 2E				cmp		edx,0x0000002e
0426  75 49				jne		L$35
0428  40				inc		eax
0429  C7 43 08 00 00 00 00		mov		dword ptr 0x8[ebx],0x00000000
0430  31 D2				xor		edx,edx
0432  8A 10				mov		dl,byte ptr [eax]
0434  83 FA 2A				cmp		edx,0x0000002a
0437  75 1B				jne		L$34
0439  8B 16				mov		edx,dword ptr [esi]
043B  83 C2 04				add		edx,0x00000004
043E  89 16				mov		dword ptr [esi],edx
0440  8B 52 FC				mov		edx,dword ptr -0x4[edx]
0443  89 53 08				mov		dword ptr 0x8[ebx],edx
0446  85 D2				test		edx,edx
0448  7D 07				jge		L$33
044A  C7 43 08 FF FF FF FF		mov		dword ptr 0x8[ebx],0xffffffff
0451				L$33:
0451  40				inc		eax
0452  EB 1D				jmp		L$35
0454				L$34:
0454  31 D2				xor		edx,edx
0456  8A 10				mov		dl,byte ptr [eax]
0458  83 FA 30				cmp		edx,0x00000030
045B  7C 14				jl		L$35
045D  83 FA 39				cmp		edx,0x00000039
0460  7F 0F				jg		L$35
0462  6B 4B 08 0A			imul		ecx,dword ptr 0x8[ebx],0x0000000a
0466  83 EA 30				sub		edx,0x00000030
0469  01 D1				add		ecx,edx
046B  40				inc		eax
046C  89 4B 08				mov		dword ptr 0x8[ebx],ecx
046F  EB E3				jmp		L$34
0471				L$35:
0471  8A 10				mov		dl,byte ptr [eax]
0473  8D 48 01				lea		ecx,0x1[eax]
0476  80 FA 4E				cmp		dl,0x4e
0479  72 1B				jb		L$37
047B  76 56				jbe		L$43
047D  80 FA 6C				cmp		dl,0x6c
0480  72 0B				jb		L$36
0482  76 22				jbe		L$38
0484  80 FA 77				cmp		dl,0x77
0487  74 1D				je		L$38
0489  5F				pop		edi
048A  5E				pop		esi
048B  59				pop		ecx
048C  C3				ret		
048D				L$36:
048D  80 FA 68				cmp		dl,0x68
0490  74 22				je		L$40
0492  5F				pop		edi
0493  5E				pop		esi
0494  59				pop		ecx
0495  C3				ret		
0496				L$37:
0496  80 FA 46				cmp		dl,0x46
0499  72 3E				jb		L$45
049B  76 2C				jbe		L$42
049D  80 FA 4C				cmp		dl,0x4c
04A0  74 18				je		L$41
04A2  5F				pop		edi
04A3  5E				pop		esi
04A4  59				pop		ecx
04A5  C3				ret		
04A6				L$38:
04A6  8A 73 14				mov		dh,byte ptr 0x14[ebx]
04A9  80 CE 20				or		dh,0x20
04AC  40				inc		eax
04AD				L$39:
04AD  88 73 14				mov		byte ptr 0x14[ebx],dh
04B0  5F				pop		edi
04B1  5E				pop		esi
04B2  59				pop		ecx
04B3  C3				ret		
04B4				L$40:
04B4  80 4B 14 10			or		byte ptr 0x14[ebx],0x10
04B8  EB 1D				jmp		L$44
04BA				L$41:
04BA  8A 53 14				mov		dl,byte ptr 0x14[ebx]
04BD  80 CA 40				or		dl,0x40
04C0  89 C8				mov		eax,ecx
04C2  88 53 14				mov		byte ptr 0x14[ebx],dl
04C5  5F				pop		edi
04C6  5E				pop		esi
04C7  59				pop		ecx
04C8  C3				ret		
04C9				L$42:
04C9  8A 73 14				mov		dh,byte ptr 0x14[ebx]
04CC  80 CE 80				or		dh,0x80
04CF  89 C8				mov		eax,ecx
04D1  EB DA				jmp		L$39
04D3				L$43:
04D3  80 4B 14 40			or		byte ptr 0x14[ebx],0x40
04D7				L$44:
04D7  89 C8				mov		eax,ecx
04D9				L$45:
04D9  5F				pop		edi
04DA  5E				pop		esi
04DB  59				pop		ecx
04DC  C3				ret		
04DD				evalflags_:
04DD  53				push		ebx
04DE  51				push		ecx
04DF  89 C3				mov		ebx,eax
04E1  C6 42 14 00			mov		byte ptr 0x14[edx],0x00
04E5				L$46:
04E5  31 C0				xor		eax,eax
04E7  8A 03				mov		al,byte ptr [ebx]
04E9  83 F8 2D				cmp		eax,0x0000002d
04EC  75 06				jne		L$47
04EE  80 4A 14 08			or		byte ptr 0x14[edx],0x08
04F2  EB 40				jmp		L$51
04F4				L$47:
04F4  83 F8 23				cmp		eax,0x00000023
04F7  75 06				jne		L$48
04F9  80 4A 14 01			or		byte ptr 0x14[edx],0x01
04FD  EB 35				jmp		L$51
04FF				L$48:
04FF  83 F8 2B				cmp		eax,0x0000002b
0502  75 10				jne		L$49
0504  8A 4A 14				mov		cl,byte ptr 0x14[edx]
0507  80 C9 04				or		cl,0x04
050A  88 CD				mov		ch,cl
050C  80 E5 FD				and		ch,0xfd
050F  88 6A 14				mov		byte ptr 0x14[edx],ch
0512  EB 20				jmp		L$51
0514				L$49:
0514  83 F8 20				cmp		eax,0x00000020
0517  75 12				jne		L$50
0519  8A 42 14				mov		al,byte ptr 0x14[edx]
051C  24 04				and		al,0x04
051E  25 FF 00 00 00			and		eax,0x000000ff
0523  75 0F				jne		L$51
0525  80 4A 14 02			or		byte ptr 0x14[edx],0x02
0529  EB 09				jmp		L$51
052B				L$50:
052B  83 F8 30				cmp		eax,0x00000030
052E  75 07				jne		L$52
0530  C6 42 16 30			mov		byte ptr 0x16[edx],0x30
0534				L$51:
0534  43				inc		ebx
0535  EB AE				jmp		L$46
0537				L$52:
0537  89 D8				mov		eax,ebx
0539  59				pop		ecx
053A  5B				pop		ebx
053B  C3				ret		
053C				far_strlen_:
053C  51				push		ecx
053D  56				push		esi
053E  57				push		edi
053F  06				push		es
0540  89 D1				mov		ecx,edx
0542  89 DF				mov		edi,ebx
0544  89 C2				mov		edx,eax
0546  8E C1				mov		es,ecx
0548  31 C0				xor		eax,eax
054A				L$53:
054A  89 D6				mov		esi,edx
054C  26 8A 1E				mov		bl,byte ptr es:[esi]
054F  42				inc		edx
0550  84 DB				test		bl,bl
0552  74 07				je		L$54
0554  39 F8				cmp		eax,edi
0556  74 03				je		L$54
0558  40				inc		eax
0559  EB EF				jmp		L$53
055B				L$54:
055B  07				pop		es
055C  5F				pop		edi
055D  5E				pop		esi
055E  59				pop		ecx
055F  C3				ret		
0560				far_other_strlen_:
0560  51				push		ecx
0561  56				push		esi
0562  57				push		edi
0563  06				push		es
0564  89 C1				mov		ecx,eax
0566  89 DE				mov		esi,ebx
0568  89 CB				mov		ebx,ecx
056A  8E C2				mov		es,edx
056C  31 C0				xor		eax,eax
056E				L$55:
056E  89 D9				mov		ecx,ebx
0570  66 26 8B 39			mov		di,word ptr es:[ecx]
0574  83 C3 02				add		ebx,0x00000002
0577  66 85 FF				test		di,di
057A  74 DF				je		L$54
057C  39 F0				cmp		eax,esi
057E  74 DB				je		L$54
0580  40				inc		eax
0581  EB EB				jmp		L$55
0583				fmt4hex_:
0583  51				push		ecx
0584  56				push		esi
0585  57				push		edi
0586  55				push		ebp
0587  83 EC 04				sub		esp,0x00000004
058A  89 D5				mov		ebp,edx
058C  89 1C 24				mov		dword ptr [esp],ebx
058F  BB 10 00 00 00			mov		ebx,0x00000010
0594  89 EF				mov		edi,ebp
0596  E8 00 00 00 00			call		itoa_
059B  06				push		es
059C  8C D8				mov		eax,ds
059E  8E C0				mov		es,eax
05A0  29 C9				sub		ecx,ecx
05A2  49				dec		ecx
05A3  31 C0				xor		eax,eax
05A5  F2 AE				repne scasb	
05A7  F7 D1				not		ecx
05A9  49				dec		ecx
05AA  07				pop		es
05AB  8B 04 24				mov		eax,dword ptr [esp]
05AE  89 EE				mov		esi,ebp
05B0  48				dec		eax
05B1  8D 14 29				lea		edx,[ecx+ebp]
05B4  8D 1C 28				lea		ebx,[eax+ebp]
05B7  EB 07				jmp		L$57
05B9				L$56:
05B9  4A				dec		edx
05BA  8A 0A				mov		cl,byte ptr [edx]
05BC  48				dec		eax
05BD  88 0B				mov		byte ptr [ebx],cl
05BF  4B				dec		ebx
05C0				L$57:
05C0  39 F2				cmp		edx,esi
05C2  75 F5				jne		L$56
05C4  8D 14 28				lea		edx,[eax+ebp]
05C7				L$58:
05C7  85 C0				test		eax,eax
05C9  7C 07				jl		L$59
05CB  48				dec		eax
05CC  C6 02 30				mov		byte ptr [edx],0x30
05CF  4A				dec		edx
05D0  EB F5				jmp		L$58
05D2				L$59:
05D2  03 2C 24				add		ebp,dword ptr [esp]
05D5  C6 45 00 00			mov		byte ptr [ebp],0x00
05D9  83 C4 04				add		esp,0x00000004
05DC  5D				pop		ebp
05DD  5F				pop		edi
05DE  5E				pop		esi
05DF  59				pop		ecx
05E0  C3				ret		
05E1				FixedPoint_Format_:
05E1  51				push		ecx
05E2  56				push		esi
05E3  57				push		edi
05E4  83 EC 04				sub		esp,0x00000004
05E7  89 C1				mov		ecx,eax
05E9  89 DE				mov		esi,ebx
05EB  89 14 24				mov		dword ptr [esp],edx
05EE  85 D2				test		edx,edx
05F0  7D 0B				jge		L$60
05F2  F7 DA				neg		edx
05F4  8D 48 01				lea		ecx,0x1[eax]
05F7  C6 00 2D				mov		byte ptr [eax],0x2d
05FA  89 14 24				mov		dword ptr [esp],edx
05FD				L$60:
05FD  83 7E 08 FF			cmp		dword ptr 0x8[esi],0xffffffff
0601  75 07				jne		L$61
0603  C7 46 08 04 00 00 00		mov		dword ptr 0x8[esi],0x00000004
060A				L$61:
060A  BB 0A 00 00 00			mov		ebx,0x0000000a
060F  31 C0				xor		eax,eax
0611  89 CA				mov		edx,ecx
0613  66 8B 44 24 02			mov		ax,word ptr 0x2[esp]
0618  E8 00 00 00 00			call		itoa_
061D  89 CB				mov		ebx,ecx
061F				L$62:
061F  8A 21				mov		ah,byte ptr [ecx]
0621  8D 51 01				lea		edx,0x1[ecx]
0624  84 E4				test		ah,ah
0626  74 04				je		L$63
0628  89 D1				mov		ecx,edx
062A  EB F3				jmp		L$62
062C				L$63:
062C  83 7E 08 00			cmp		dword ptr 0x8[esi],0x00000000
0630  74 2C				je		L$66
0632  C6 01 2E				mov		byte ptr [ecx],0x2e
0635  31 C0				xor		eax,eax
0637  89 D1				mov		ecx,edx
0639  EB 1B				jmp		L$65
063B				L$64:
063B  31 D2				xor		edx,edx
063D  66 89 54 24 02			mov		word ptr 0x2[esp],dx
0642  8B 3C 24				mov		edi,dword ptr [esp]
0645  6B D7 0A				imul		edx,edi,0x0000000a
0648  89 14 24				mov		dword ptr [esp],edx
064B  8A 54 24 02			mov		dl,byte ptr 0x2[esp]
064F  80 C2 30				add		dl,0x30
0652  40				inc		eax
0653  88 11				mov		byte ptr [ecx],dl
0655  41				inc		ecx
0656				L$65:
0656  3B 46 08				cmp		eax,dword ptr 0x8[esi]
0659  7C E0				jl		L$64
065B  C6 01 00				mov		byte ptr [ecx],0x00
065E				L$66:
065E  8B 04 24				mov		eax,dword ptr [esp]
0661  30 C0				xor		al,al
0663  80 E4 80				and		ah,0x80
0666  25 FF FF 00 00			and		eax,0x0000ffff
066B  0F 84 5E 00 00 00			je		L$75
0671				L$67:
0671  39 D9				cmp		ecx,ebx
0673  75 39				jne		L$72
0675  8D 4B 01				lea		ecx,0x1[ebx]
0678  C6 03 31				mov		byte ptr [ebx],0x31
067B				L$68:
067B  31 D2				xor		edx,edx
067D  8A 11				mov		dl,byte ptr [ecx]
067F  8D 41 01				lea		eax,0x1[ecx]
0682  83 FA 30				cmp		edx,0x00000030
0685  75 04				jne		L$69
0687  89 C1				mov		ecx,eax
0689  EB F0				jmp		L$68
068B				L$69:
068B  83 FA 2E				cmp		edx,0x0000002e
068E  75 15				jne		L$71
0690  C6 01 30				mov		byte ptr [ecx],0x30
0693  8D 48 01				lea		ecx,0x1[eax]
0696  C6 00 2E				mov		byte ptr [eax],0x2e
0699				L$70:
0699  31 C0				xor		eax,eax
069B  8A 01				mov		al,byte ptr [ecx]
069D  83 F8 30				cmp		eax,0x00000030
06A0  75 03				jne		L$71
06A2  41				inc		ecx
06A3  EB F4				jmp		L$70
06A5				L$71:
06A5  C6 01 30				mov		byte ptr [ecx],0x30
06A8  41				inc		ecx
06A9  C6 01 00				mov		byte ptr [ecx],0x00
06AC  EB 21				jmp		L$75
06AE				L$72:
06AE  49				dec		ecx
06AF  31 C0				xor		eax,eax
06B1  8A 01				mov		al,byte ptr [ecx]
06B3  83 F8 2E				cmp		eax,0x0000002e
06B6  75 01				jne		L$73
06B8  49				dec		ecx
06B9				L$73:
06B9  31 C0				xor		eax,eax
06BB  8A 01				mov		al,byte ptr [ecx]
06BD  83 F8 39				cmp		eax,0x00000039
06C0  74 08				je		L$74
06C2  88 C2				mov		dl,al
06C4  FE C2				inc		dl
06C6  88 11				mov		byte ptr [ecx],dl
06C8  EB 05				jmp		L$75
06CA				L$74:
06CA  C6 01 30				mov		byte ptr [ecx],0x30
06CD  EB A2				jmp		L$67
06CF				L$75:
06CF  83 C4 04				add		esp,0x00000004
06D2  5F				pop		edi
06D3  5E				pop		esi
06D4  59				pop		ecx
06D5  C3				ret		
06D6				float_format_:
06D6  FF 15 00 00 00 00			call		dword ptr ___EFG_printf
06DC  C3				ret		
06DD				formstring_:
06DD  56				push		esi
06DE  57				push		edi
06DF  06				push		es
06E0  55				push		ebp
06E1  83 EC 0C				sub		esp,0x0000000c
06E4  89 C7				mov		edi,eax
06E6  89 DE				mov		esi,ebx
06E8  89 4C 24 04			mov		dword ptr 0x4[esp],ecx
06EC  89 D0				mov		eax,edx
06EE  C7 04 24 01 00 00 00		mov		dword ptr [esp],0x00000001
06F5  8C DA				mov		edx,ds
06F7  89 F9				mov		ecx,edi
06F9  8E C2				mov		es,edx
06FB  8A 53 15				mov		dl,byte ptr 0x15[ebx]
06FE  C7 43 0C 00 00 00 00		mov		dword ptr 0xc[ebx],0x00000000
0705  80 FA 69				cmp		dl,0x69
0708  72 1C				jb		L$78
070A  0F 86 67 00 00 00			jbe		L$83
0710  80 FA 75				cmp		dl,0x75
0713  72 0C				jb		L$77
0715  76 1D				jbe		L$79
0717  80 FA 78				cmp		dl,0x78
071A				L$76:
071A  74 18				je		L$79
071C  E9 60 00 00 00			jmp		L$84
0721				L$77:
0721  80 FA 6F				cmp		dl,0x6f
0724  EB F4				jmp		L$76
0726				L$78:
0726  80 FA 58				cmp		dl,0x58
0729  72 56				jb		L$84
072B  76 07				jbe		L$79
072D  80 FA 64				cmp		dl,0x64
0730  74 45				je		L$83
0732  EB 4D				jmp		L$84
0734				L$79:
0734  8A 56 14				mov		dl,byte ptr 0x14[esi]
0737  80 E2 20				and		dl,0x20
073A  81 E2 FF 00 00 00			and		edx,0x000000ff
0740  74 0C				je		L$80
0742  8B 10				mov		edx,dword ptr [eax]
0744  83 C2 04				add		edx,0x00000004
0747  89 10				mov		dword ptr [eax],edx
0749  8B 6A FC				mov		ebp,dword ptr -0x4[edx]
074C  EB 25				jmp		L$82
074E				L$80:
074E  8A 56 14				mov		dl,byte ptr 0x14[esi]
0751  80 E2 10				and		dl,0x10
0754  81 E2 FF 00 00 00			and		edx,0x000000ff
075A  74 0D				je		L$81
075C  8B 28				mov		ebp,dword ptr [eax]
075E  83 C5 04				add		ebp,0x00000004
0761  89 28				mov		dword ptr [eax],ebp
0763  0F B7 6D FC			movzx		ebp,word ptr -0x4[ebp]
0767  EB 0A				jmp		L$82
0769				L$81:
0769  8B 18				mov		ebx,dword ptr [eax]
076B  83 C3 04				add		ebx,0x00000004
076E  89 18				mov		dword ptr [eax],ebx
0770  8B 6B FC				mov		ebp,dword ptr -0x4[ebx]
0773				L$82:
0773  80 66 14 F9			and		byte ptr 0x14[esi],0xf9
0777				L$83:
0777  83 7E 08 FF			cmp		dword ptr 0x8[esi],0xffffffff
077B  74 04				je		L$84
077D  C6 46 16 20			mov		byte ptr 0x16[esi],0x20
0781				L$84:
0781  8A 56 15				mov		dl,byte ptr 0x15[esi]
0784  BB 0A 00 00 00			mov		ebx,0x0000000a
0789  80 FA 65				cmp		dl,0x65
078C  72 60				jb		L$87
078E  0F 86 DA 00 00 00			jbe		L$93
0794  80 FA 6F				cmp		dl,0x6f
0797  72 3C				jb		L$86
0799  0F 86 E5 00 00 00			jbe		L$94
079F  80 FA 73				cmp		dl,0x73
07A2  72 23				jb		L$85
07A4  0F 86 6F 01 00 00			jbe		L$103
07AA  80 FA 75				cmp		dl,0x75
07AD  0F 82 38 03 00 00			jb		L$123
07B3  0F 86 4C 02 00 00			jbe		L$116
07B9  80 FA 78				cmp		dl,0x78
07BC  0F 84 20 02 00 00			je		L$114
07C2  E9 24 03 00 00			jmp		L$123
07C7				L$85:
07C7  80 FA 70				cmp		dl,0x70
07CA  0F 84 58 02 00 00			je		L$117
07D0  E9 16 03 00 00			jmp		L$123
07D5				L$86:
07D5  80 FA 67				cmp		dl,0x67
07D8  72 62				jb		L$92
07DA  0F 86 8E 00 00 00			jbe		L$93
07E0  80 FA 69				cmp		dl,0x69
07E3  0F 84 DF 00 00 00			je		L$99
07E9  E9 FD 02 00 00			jmp		L$123
07EE				L$87:
07EE  80 FA 50				cmp		dl,0x50
07F1  72 33				jb		L$89
07F3  0F 86 2F 02 00 00			jbe		L$117
07F9  80 FA 58				cmp		dl,0x58
07FC  72 1A				jb		L$88
07FE  0F 86 DE 01 00 00			jbe		L$114
0804  80 FA 63				cmp		dl,0x63
0807  0F 82 DE 02 00 00			jb		L$123
080D  0F 86 AC 02 00 00			jbe		L$122
0813  E9 B0 00 00 00			jmp		L$99
0818				L$88:
0818  80 FA 53				cmp		dl,0x53
081B  0F 84 F8 00 00 00			je		L$103
0821  E9 C5 02 00 00			jmp		L$123
0826				L$89:
0826  80 FA 46				cmp		dl,0x46
0829  72 0C				jb		L$91
082B  76 0F				jbe		L$92
082D  80 FA 47				cmp		dl,0x47
0830				L$90:
0830  74 3C				je		L$93
0832  E9 B4 02 00 00			jmp		L$123
0837				L$91:
0837  80 FA 45				cmp		dl,0x45
083A  EB F4				jmp		L$90
083C				L$92:
083C  8A 56 14				mov		dl,byte ptr 0x14[esi]
083F  80 E2 10				and		dl,0x10
0842  81 E2 FF 00 00 00			and		edx,0x000000ff
0848  74 24				je		L$93
084A  8B 18				mov		ebx,dword ptr [eax]
084C  83 C3 04				add		ebx,0x00000004
084F  89 18				mov		dword ptr [eax],ebx
0851  89 F8				mov		eax,edi
0853  8B 53 FC				mov		edx,dword ptr -0x4[ebx]
0856  89 F3				mov		ebx,esi
0858  E8 00 00 00 00			call		FixedPoint_Format_
085D  BB FF FF FF FF			mov		ebx,0xffffffff
0862  8C D8				mov		eax,ds
0864  8C DA				mov		edx,ds
0866  8E C0				mov		es,eax
0868  89 F8				mov		eax,edi
086A  89 F9				mov		ecx,edi
086C  EB 50				jmp		L$98
086E				L$93:
086E  89 F3				mov		ebx,esi
0870  89 C2				mov		edx,eax
0872  89 F8				mov		eax,edi
0874  E8 00 00 00 00			call		float_format_
0879  BB FF FF FF FF			mov		ebx,0xffffffff
087E  8E C2				mov		es,edx
0880  89 C1				mov		ecx,eax
0882  EB 3A				jmp		L$98
0884				L$94:
0884  8A 46 14				mov		al,byte ptr 0x14[esi]
0887  BB 08 00 00 00			mov		ebx,0x00000008
088C  24 01				and		al,0x01
088E  25 FF 00 00 00			and		eax,0x000000ff
0893  74 04				je		L$95
0895  C6 07 30				mov		byte ptr [edi],0x30
0898  47				inc		edi
0899				L$95:
0899  89 FA				mov		edx,edi
089B  89 E8				mov		eax,ebp
089D  E8 00 00 00 00			call		ltoa_
08A2				L$96:
08A2  83 7E 08 00			cmp		dword ptr 0x8[esi],0x00000000
08A6  75 0D				jne		L$97
08A8  31 C0				xor		eax,eax
08AA  8A 07				mov		al,byte ptr [edi]
08AC  83 F8 30				cmp		eax,0x00000030
08AF  75 04				jne		L$97
08B1  26 C6 01 00			mov		byte ptr es:[ecx],0x00
08B5				L$97:
08B5  BB FF FF FF FF			mov		ebx,0xffffffff
08BA  8C C2				mov		edx,es
08BC  89 C8				mov		eax,ecx
08BE				L$98:
08BE  E8 00 00 00 00			call		far_strlen_
08C3  E9 4C 02 00 00			jmp		L$124
08C8				L$99:
08C8  8A 56 14				mov		dl,byte ptr 0x14[esi]
08CB  80 E2 20				and		dl,0x20
08CE  81 E2 FF 00 00 00			and		edx,0x000000ff
08D4  74 13				je		L$101
08D6  8B 10				mov		edx,dword ptr [eax]
08D8  83 C2 04				add		edx,0x00000004
08DB  89 10				mov		dword ptr [eax],edx
08DD  8B 42 FC				mov		eax,dword ptr -0x4[edx]
08E0  89 FA				mov		edx,edi
08E2				L$100:
08E2  E8 00 00 00 00			call		ltoa_
08E7  EB B9				jmp		L$96
08E9				L$101:
08E9  8A 56 14				mov		dl,byte ptr 0x14[esi]
08EC  80 E2 10				and		dl,0x10
08EF  81 E2 FF 00 00 00			and		edx,0x000000ff
08F5  74 0F				je		L$102
08F7  8B 28				mov		ebp,dword ptr [eax]
08F9  83 C5 04				add		ebp,0x00000004
08FC  89 28				mov		dword ptr [eax],ebp
08FE  89 FA				mov		edx,edi
0900  0F BF 45 FC			movsx		eax,word ptr -0x4[ebp]
0904  EB DC				jmp		L$100
0906				L$102:
0906  8B 10				mov		edx,dword ptr [eax]
0908  83 C2 04				add		edx,0x00000004
090B  89 10				mov		dword ptr [eax],edx
090D  8B 42 FC				mov		eax,dword ptr -0x4[edx]
0910  89 FA				mov		edx,edi
0912  E8 00 00 00 00			call		itoa_
0917  EB 89				jmp		L$96
0919				L$103:
0919  8A 56 14				mov		dl,byte ptr 0x14[esi]
091C  80 E2 80				and		dl,0x80
091F  81 E2 FF 00 00 00			and		edx,0x000000ff
0925  74 23				je		L$106
0927  8B 38				mov		edi,dword ptr [eax]
0929  83 C7 08				add		edi,0x00000008
092C  89 38				mov		dword ptr [eax],edi
092E  8B 4F F8				mov		ecx,dword ptr -0x8[edi]
0931  66 8B 57 FC			mov		dx,word ptr -0x4[edi]
0935  85 C9				test		ecx,ecx
0937  75 05				jne		L$104
0939  66 85 D2				test		dx,dx
093C  74 04				je		L$105
093E				L$104:
093E  8E C2				mov		es,edx
0940  EB 3E				jmp		L$110
0942				L$105:
0942  8C D8				mov		eax,ds
0944  8B 4C 24 04			mov		ecx,dword ptr 0x4[esp]
0948  EB 34				jmp		L$109
094A				L$106:
094A  8A 56 14				mov		dl,byte ptr 0x14[esi]
094D  80 E2 40				and		dl,0x40
0950  81 E2 FF 00 00 00			and		edx,0x000000ff
0956  74 12				je		L$108
0958  8B 08				mov		ecx,dword ptr [eax]
095A  83 C1 04				add		ecx,0x00000004
095D  89 08				mov		dword ptr [eax],ecx
095F  8B 49 FC				mov		ecx,dword ptr -0x4[ecx]
0962  85 C9				test		ecx,ecx
0964  74 DC				je		L$105
0966				L$107:
0966  8C D8				mov		eax,ds
0968  EB 14				jmp		L$109
096A				L$108:
096A  8B 18				mov		ebx,dword ptr [eax]
096C  83 C3 04				add		ebx,0x00000004
096F  89 18				mov		dword ptr [eax],ebx
0971  8B 4B FC				mov		ecx,dword ptr -0x4[ebx]
0974  85 C9				test		ecx,ecx
0976  75 EE				jne		L$107
0978  8C D8				mov		eax,ds
097A  8B 4C 24 04			mov		ecx,dword ptr 0x4[esp]
097E				L$109:
097E  8E C0				mov		es,eax
0980				L$110:
0980  8A 5E 14				mov		bl,byte ptr 0x14[esi]
0983  31 ED				xor		ebp,ebp
0985  31 C0				xor		eax,eax
0987  80 E3 F9				and		bl,0xf9
098A  89 2C 24				mov		dword ptr [esp],ebp
098D  8A 46 15				mov		al,byte ptr 0x15[esi]
0990  88 5E 14				mov		byte ptr 0x14[esi],bl
0993  83 F8 53				cmp		eax,0x00000053
0996  75 22				jne		L$112
0998  88 D8				mov		al,bl
099A  24 20				and		al,0x20
099C  25 FF 00 00 00			and		eax,0x000000ff
09A1  74 0E				je		L$111
09A3  31 C0				xor		eax,eax
09A5  66 26 8B 01			mov		ax,word ptr es:[ecx]
09A9  83 C1 02				add		ecx,0x00000002
09AC  E9 63 01 00 00			jmp		L$124
09B1				L$111:
09B1  26 8A 01				mov		al,byte ptr es:[ecx]
09B4  41				inc		ecx
09B5  E9 5A 01 00 00			jmp		L$124
09BA				L$112:
09BA  88 D8				mov		al,bl
09BC  24 20				and		al,0x20
09BE  25 FF 00 00 00			and		eax,0x000000ff
09C3  74 11				je		L$113
09C5  8C C2				mov		edx,es
09C7  89 C8				mov		eax,ecx
09C9  8B 5E 08				mov		ebx,dword ptr 0x8[esi]
09CC  E8 00 00 00 00			call		far_other_strlen_
09D1  E9 3E 01 00 00			jmp		L$124
09D6				L$113:
09D6  8C C2				mov		edx,es
09D8  89 C8				mov		eax,ecx
09DA  8B 5E 08				mov		ebx,dword ptr 0x8[esi]
09DD  E9 DC FE FF FF			jmp		L$98
09E2				L$114:
09E2  8A 46 14				mov		al,byte ptr 0x14[esi]
09E5  24 01				and		al,0x01
09E7  25 FF 00 00 00			and		eax,0x000000ff
09EC  74 12				je		L$115
09EE  85 ED				test		ebp,ebp
09F0  74 0E				je		L$115
09F2  C6 46 17 30			mov		byte ptr 0x17[esi],0x30
09F6  8A 46 15				mov		al,byte ptr 0x15[esi]
09F9  C6 46 19 00			mov		byte ptr 0x19[esi],0x00
09FD  88 46 18				mov		byte ptr 0x18[esi],al
0A00				L$115:
0A00  BB 10 00 00 00			mov		ebx,0x00000010
0A05				L$116:
0A05  89 FA				mov		edx,edi
0A07  89 E8				mov		eax,ebp
0A09  E8 00 00 00 00			call		ultoa_
0A0E  31 C0				xor		eax,eax
0A10  8A 46 15				mov		al,byte ptr 0x15[esi]
0A13  83 F8 58				cmp		eax,0x00000058
0A16  0F 85 86 FE FF FF			jne		L$96
0A1C  89 F8				mov		eax,edi
0A1E  E8 00 00 00 00			call		zupstr_
0A23  E9 7A FE FF FF			jmp		L$96
0A28				L$117:
0A28  83 7E 04 00			cmp		dword ptr 0x4[esi],0x00000000
0A2C  75 1E				jne		L$119
0A2E  8A 56 14				mov		dl,byte ptr 0x14[esi]
0A31  80 E2 80				and		dl,0x80
0A34  81 E2 FF 00 00 00			and		edx,0x000000ff
0A3A  74 09				je		L$118
0A3C  C7 46 04 0D 00 00 00		mov		dword ptr 0x4[esi],0x0000000d
0A43  EB 07				jmp		L$119
0A45				L$118:
0A45  C7 46 04 08 00 00 00		mov		dword ptr 0x4[esi],0x00000008
0A4C				L$119:
0A4C  80 66 14 F9			and		byte ptr 0x14[esi],0xf9
0A50  8B 18				mov		ebx,dword ptr [eax]
0A52  83 C3 04				add		ebx,0x00000004
0A55  89 18				mov		dword ptr [eax],ebx
0A57  8A 56 14				mov		dl,byte ptr 0x14[esi]
0A5A  80 E2 80				and		dl,0x80
0A5D  88 54 24 08			mov		byte ptr 0x8[esp],dl
0A61  31 D2				xor		edx,edx
0A63  8A 54 24 08			mov		dl,byte ptr 0x8[esp]
0A67  8B 6B FC				mov		ebp,dword ptr -0x4[ebx]
0A6A  85 D2				test		edx,edx
0A6C  74 29				je		L$120
0A6E  83 C3 04				add		ebx,0x00000004
0A71  89 18				mov		dword ptr [eax],ebx
0A73  89 FA				mov		edx,edi
0A75  8B 43 FC				mov		eax,dword ptr -0x4[ebx]
0A78  BB 04 00 00 00			mov		ebx,0x00000004
0A7D  25 FF FF 00 00			and		eax,0x0000ffff
0A82  E8 00 00 00 00			call		fmt4hex_
0A87  BB 08 00 00 00			mov		ebx,0x00000008
0A8C  8D 57 05				lea		edx,0x5[edi]
0A8F  89 E8				mov		eax,ebp
0A91  C6 47 04 3A			mov		byte ptr 0x4[edi],0x3a
0A95  EB 09				jmp		L$121
0A97				L$120:
0A97  BB 08 00 00 00			mov		ebx,0x00000008
0A9C  89 FA				mov		edx,edi
0A9E  89 E8				mov		eax,ebp
0AA0				L$121:
0AA0  E8 00 00 00 00			call		fmt4hex_
0AA5  31 C0				xor		eax,eax
0AA7  8A 46 15				mov		al,byte ptr 0x15[esi]
0AAA  83 F8 50				cmp		eax,0x00000050
0AAD  0F 85 02 FE FF FF			jne		L$97
0AB3  89 F8				mov		eax,edi
0AB5  E8 00 00 00 00			call		zupstr_
0ABA  E9 F6 FD FF FF			jmp		L$97
0ABF				L$122:
0ABF  8B 28				mov		ebp,dword ptr [eax]
0AC1  83 C5 04				add		ebp,0x00000004
0AC4  89 28				mov		dword ptr [eax],ebp
0AC6  8A 45 FC				mov		al,byte ptr -0x4[ebp]
0AC9  C6 47 01 00			mov		byte ptr 0x1[edi],0x00
0ACD  88 07				mov		byte ptr [edi],al
0ACF  C7 46 08 01 00 00 00		mov		dword ptr 0x8[esi],0x00000001
0AD6  8A 76 14				mov		dh,byte ptr 0x14[esi]
0AD9  31 C0				xor		eax,eax
0ADB  80 E6 F9				and		dh,0xf9
0ADE  89 04 24				mov		dword ptr [esp],eax
0AE1  B8 01 00 00 00			mov		eax,0x00000001
0AE6  88 76 14				mov		byte ptr 0x14[esi],dh
0AE9  EB 29				jmp		L$124
0AEB				L$123:
0AEB  C7 46 04 00 00 00 00		mov		dword ptr 0x4[esi],0x00000000
0AF2  8A 46 15				mov		al,byte ptr 0x15[esi]
0AF5  C6 47 01 00			mov		byte ptr 0x1[edi],0x00
0AF9  88 07				mov		byte ptr [edi],al
0AFB  C7 46 08 01 00 00 00		mov		dword ptr 0x8[esi],0x00000001
0B02  8A 46 14				mov		al,byte ptr 0x14[esi]
0B05  31 FF				xor		edi,edi
0B07  24 F9				and		al,0xf9
0B09  89 3C 24				mov		dword ptr [esp],edi
0B0C  88 46 14				mov		byte ptr 0x14[esi],al
0B0F  B8 01 00 00 00			mov		eax,0x00000001
0B14				L$124:
0B14  83 3C 24 00			cmp		dword ptr [esp],0x00000000
0B18  74 4F				je		L$130
0B1A  31 D2				xor		edx,edx
0B1C  26 8A 11				mov		dl,byte ptr es:[ecx]
0B1F  83 FA 2D				cmp		edx,0x0000002d
0B22  75 08				jne		L$125
0B24  41				inc		ecx
0B25  C6 46 17 2D			mov		byte ptr 0x17[esi],0x2d
0B29  48				dec		eax
0B2A  EB 26				jmp		L$127
0B2C				L$125:
0B2C  8A 56 14				mov		dl,byte ptr 0x14[esi]
0B2F  80 E2 02				and		dl,0x02
0B32  81 E2 FF 00 00 00			and		edx,0x000000ff
0B38  74 06				je		L$126
0B3A  C6 46 17 20			mov		byte ptr 0x17[esi],0x20
0B3E  EB 12				jmp		L$127
0B40				L$126:
0B40  8A 56 14				mov		dl,byte ptr 0x14[esi]
0B43  80 E2 04				and		dl,0x04
0B46  81 E2 FF 00 00 00			and		edx,0x000000ff
0B4C  74 08				je		L$128
0B4E  C6 46 17 2B			mov		byte ptr 0x17[esi],0x2b
0B52				L$127:
0B52  C6 46 18 00			mov		byte ptr 0x18[esi],0x00
0B56				L$128:
0B56  8B 56 08				mov		edx,dword ptr 0x8[esi]
0B59  39 D0				cmp		eax,edx
0B5B  7E 05				jle		L$129
0B5D  89 46 08				mov		dword ptr 0x8[esi],eax
0B60  EB 07				jmp		L$130
0B62				L$129:
0B62  89 D3				mov		ebx,edx
0B64  29 C3				sub		ebx,eax
0B66  89 5E 0C				mov		dword ptr 0xc[esi],ebx
0B69				L$130:
0B69  31 D2				xor		edx,edx
0B6B  8A 56 16				mov		dl,byte ptr 0x16[esi]
0B6E  83 FA 2A				cmp		edx,0x0000002a
0B71  75 0D				jne		L$131
0B73  8A 56 14				mov		dl,byte ptr 0x14[esi]
0B76  C6 46 17 00			mov		byte ptr 0x17[esi],0x00
0B7A  80 E2 F9				and		dl,0xf9
0B7D  88 56 14				mov		byte ptr 0x14[esi],dl
0B80				L$131:
0B80  8B 5E 08				mov		ebx,dword ptr 0x8[esi]
0B83  83 FB FF				cmp		ebx,0xffffffff
0B86  74 04				je		L$132
0B88  39 D8				cmp		eax,ebx
0B8A  7D 0D				jge		L$133
0B8C				L$132:
0B8C  31 D2				xor		edx,edx
0B8E  8A 56 15				mov		dl,byte ptr 0x15[esi]
0B91  83 FA 63				cmp		edx,0x00000063
0B94  74 03				je		L$133
0B96  89 46 08				mov		dword ptr 0x8[esi],eax
0B99				L$133:
0B99  BB FF FF FF FF			mov		ebx,0xffffffff
0B9E  8D 46 17				lea		eax,0x17[esi]
0BA1  8C DA				mov		edx,ds
0BA3  E8 00 00 00 00			call		far_strlen_
0BA8  8B 6E 08				mov		ebp,dword ptr 0x8[esi]
0BAB  8B 56 0C				mov		edx,dword ptr 0xc[esi]
0BAE  01 E8				add		eax,ebp
0BB0  8B 5E 04				mov		ebx,dword ptr 0x4[esi]
0BB3  01 D0				add		eax,edx
0BB5  8C C2				mov		edx,es
0BB7  29 C3				sub		ebx,eax
0BB9  89 C8				mov		eax,ecx
0BBB  89 5E 04				mov		dword ptr 0x4[esi],ebx
0BBE  83 C4 0C				add		esp,0x0000000c
0BC1  5D				pop		ebp
0BC2  07				pop		es
0BC3  5F				pop		edi
0BC4  5E				pop		esi
0BC5  C3				ret		
0BC6				zupstr_:
0BC6  52				push		edx
0BC7  89 C2				mov		edx,eax
0BC9				L$134:
0BC9  80 3A 00				cmp		byte ptr [edx],0x00
0BCC  74 0E				je		L$135
0BCE  31 C0				xor		eax,eax
0BD0  8A 02				mov		al,byte ptr [edx]
0BD2  E8 00 00 00 00			call		toupper_
0BD7  88 02				mov		byte ptr [edx],al
0BD9  42				inc		edx
0BDA  EB ED				jmp		L$134
0BDC				L$135:
0BDC  5A				pop		edx
0BDD  C3				ret		

Routine Size: 3038 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

