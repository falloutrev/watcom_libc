Module: initargv
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001D0 bytes
0000				__Init_Argv_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  57				push		edi
0005  55				push		ebp
0006  83 EC 0C				sub		esp,0x0000000c
0009  89 E3				mov		ebx,esp
000B  A1 00 00 00 00			mov		eax,dword ptr __LpCmdLine
0010  31 D2				xor		edx,edx
0012  E8 00 00 00 00			call		_SplitParms_
0017  8B 0C 24				mov		ecx,dword ptr [esp]
001A  40				inc		eax
001B  8B 15 00 00 00 00			mov		edx,dword ptr __LpCmdLine
0021  89 44 24 08			mov		dword ptr 0x8[esp],eax
0025  29 D1				sub		ecx,edx
0027  C1 E0 02				shl		eax,0x02
002A  41				inc		ecx
002B  89 44 24 04			mov		dword ptr 0x4[esp],eax
002F  83 C0 04				add		eax,0x00000004
0032  01 C8				add		eax,ecx
0034  E8 00 00 00 00			call		malloc_
0039  89 C5				mov		ebp,eax
003B  85 C0				test		eax,eax
003D  74 5B				je		L$1
003F  89 E3				mov		ebx,esp
0041  8B 35 00 00 00 00			mov		esi,dword ptr __LpCmdLine
0047  01 C8				add		eax,ecx
0049  89 EF				mov		edi,ebp
004B  A3 00 00 00 00			mov		dword ptr __argv,eax
0050  06				push		es
0051  8C D8				mov		eax,ds
0053  8E C0				mov		es,eax
0055  57				push		edi
0056  89 C8				mov		eax,ecx
0058  C1 E9 02				shr		ecx,0x02
005B  F2 A5				repne movsd	
005D  8A C8				mov		cl,al
005F  80 E1 03				and		cl,0x03
0062  F2 A4				repne movsb	
0064  5F				pop		edi
0065  07				pop		es
0066  8B 0D 00 00 00 00			mov		ecx,dword ptr __argv
006C  A1 00 00 00 00			mov		eax,dword ptr __LpPgmName
0071  8D 51 04				lea		edx,0x4[ecx]
0074  89 01				mov		dword ptr [ecx],eax
0076  89 E8				mov		eax,ebp
0078  8B 74 24 04			mov		esi,dword ptr 0x4[esp]
007C  E8 00 00 00 00			call		_SplitParms_
0081  8B 0D 00 00 00 00			mov		ecx,dword ptr __argv
0087  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
008B  01 F1				add		ecx,esi
008D  A3 00 00 00 00			mov		dword ptr __argc,eax
0092  C7 01 00 00 00 00			mov		dword ptr [ecx],0x00000000
0098  EB 0A				jmp		L$2
009A				L$1:
009A  A3 00 00 00 00			mov		dword ptr __argv,eax
009F  A3 00 00 00 00			mov		dword ptr __argc,eax
00A4				L$2:
00A4  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
00A8  A3 00 00 00 00			mov		dword ptr ____Argc,eax
00AD  A1 00 00 00 00			mov		eax,dword ptr __argv
00B2  A3 00 00 00 00			mov		dword ptr ____Argv,eax
00B7  83 C4 0C				add		esp,0x0000000c
00BA  5D				pop		ebp
00BB  5F				pop		edi
00BC  5E				pop		esi
00BD  5A				pop		edx
00BE  59				pop		ecx
00BF  5B				pop		ebx
00C0  C3				ret		
00C1				_SplitParms_:
00C1  51				push		ecx
00C2  56				push		esi
00C3  57				push		edi
00C4  55				push		ebp
00C5  83 EC 08				sub		esp,0x00000008
00C8  8B 35 00 00 00 00			mov		esi,dword ptr ___historical_splitparms
00CE  89 D7				mov		edi,edx
00D0  89 DD				mov		ebp,ebx
00D2  31 D2				xor		edx,edx
00D4  89 54 24 04			mov		dword ptr 0x4[esp],edx
00D8				L$3:
00D8  31 DB				xor		ebx,ebx
00DA  8A 18				mov		bl,byte ptr [eax]
00DC  83 FB 20				cmp		ebx,0x00000020
00DF  74 05				je		L$4
00E1  83 FB 09				cmp		ebx,0x00000009
00E4  75 03				jne		L$5
00E6				L$4:
00E6  40				inc		eax
00E7  EB EF				jmp		L$3
00E9				L$5:
00E9  84 DB				test		bl,bl
00EB  0F 84 CA 00 00 00			je		L$21
00F1  30 D2				xor		dl,dl
00F3  83 FB 22				cmp		ebx,0x00000022
00F6  75 03				jne		L$6
00F8  B2 01				mov		dl,0x01
00FA  40				inc		eax
00FB				L$6:
00FB  89 04 24				mov		dword ptr [esp],eax
00FE  89 C3				mov		ebx,eax
0100				L$7:
0100  31 C9				xor		ecx,ecx
0102  8A 08				mov		cl,byte ptr [eax]
0104  83 F9 22				cmp		ecx,0x00000022
0107  75 20				jne		L$10
0109  80 FA 01				cmp		dl,0x01
010C  0F 84 76 00 00 00			je		L$18
0112  85 F6				test		esi,esi
0114  75 13				jne		L$10
0116  84 D2				test		dl,dl
0118  75 05				jne		L$9
011A  B2 02				mov		dl,0x02
011C				L$8:
011C  40				inc		eax
011D  EB E1				jmp		L$7
011F				L$9:
011F  80 FA 02				cmp		dl,0x02
0122  75 05				jne		L$10
0124  40				inc		eax
0125  30 D2				xor		dl,dl
0127  EB D7				jmp		L$7
0129				L$10:
0129  31 C9				xor		ecx,ecx
012B  8A 08				mov		cl,byte ptr [eax]
012D  83 F9 20				cmp		ecx,0x00000020
0130  74 05				je		L$11
0132  83 F9 09				cmp		ecx,0x00000009
0135  75 04				jne		L$12
0137				L$11:
0137  84 D2				test		dl,dl
0139  74 4D				je		L$18
013B				L$12:
013B  8A 30				mov		dh,byte ptr [eax]
013D  84 F6				test		dh,dh
013F  74 47				je		L$18
0141  31 C9				xor		ecx,ecx
0143  88 F1				mov		cl,dh
0145  83 F9 5C				cmp		ecx,0x0000005c
0148  75 2F				jne		L$17
014A  85 F6				test		esi,esi
014C  75 0C				jne		L$14
014E  31 C9				xor		ecx,ecx
0150  8A 48 01				mov		cl,byte ptr 0x1[eax]
0153  83 F9 22				cmp		ecx,0x00000022
0156				L$13:
0156  75 21				jne		L$17
0158  EB 1E				jmp		L$16
015A				L$14:
015A  80 FA 01				cmp		dl,0x01
015D  75 0F				jne		L$15
015F  31 C9				xor		ecx,ecx
0161  8A 48 01				mov		cl,byte ptr 0x1[eax]
0164  83 F9 22				cmp		ecx,0x00000022
0167  74 0F				je		L$16
0169  83 F9 5C				cmp		ecx,0x0000005c
016C  EB E8				jmp		L$13
016E				L$15:
016E  31 C9				xor		ecx,ecx
0170  8A 48 01				mov		cl,byte ptr 0x1[eax]
0173  83 F9 22				cmp		ecx,0x00000022
0176  75 01				jne		L$17
0178				L$16:
0178  40				inc		eax
0179				L$17:
0179  85 FF				test		edi,edi
017B  74 9F				je		L$8
017D  8A 08				mov		cl,byte ptr [eax]
017F  40				inc		eax
0180  88 0B				mov		byte ptr [ebx],cl
0182  43				inc		ebx
0183  E9 78 FF FF FF			jmp		L$7
0188				L$18:
0188  85 FF				test		edi,edi
018A  74 22				je		L$20
018C  8B 4C 24 04			mov		ecx,dword ptr 0x4[esp]
0190  8B 14 24				mov		edx,dword ptr [esp]
0193  89 14 8F				mov		dword ptr [edi+ecx*4],edx
0196  41				inc		ecx
0197  89 4C 24 04			mov		dword ptr 0x4[esp],ecx
019B  8A 08				mov		cl,byte ptr [eax]
019D  84 C9				test		cl,cl
019F  75 04				jne		L$19
01A1  88 0B				mov		byte ptr [ebx],cl
01A3  EB 16				jmp		L$21
01A5				L$19:
01A5  40				inc		eax
01A6  C6 03 00				mov		byte ptr [ebx],0x00
01A9  E9 2A FF FF FF			jmp		L$3
01AE				L$20:
01AE  FF 44 24 04			inc		dword ptr 0x4[esp]
01B2  80 38 00				cmp		byte ptr [eax],0x00
01B5  0F 85 2B FF FF FF			jne		L$4
01BB				L$21:
01BB  89 45 00				mov		dword ptr [ebp],eax
01BE  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
01C2  89 35 00 00 00 00			mov		dword ptr ___historical_splitparms,esi
01C8  83 C4 08				add		esp,0x00000008
01CB  5D				pop		ebp
01CC  5F				pop		edi
01CD  5E				pop		esi
01CE  59				pop		ecx
01CF  C3				ret		

Routine Size: 464 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

