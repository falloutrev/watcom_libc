Module: tzset
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000004B2 bytes
0000				__CacheOSTZ_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  89 C2				mov		edx,eax
0005  A1 00 00 00 00			mov		eax,dword ptr _tzFlag
000A  8A 0D 00 00 00 00			mov		cl,byte ptr _tzFlag
0010  83 E0 01				and		eax,0x00000001
0013  80 E1 FE				and		cl,0xfe
0016  89 C3				mov		ebx,eax
0018  88 0D 00 00 00 00			mov		byte ptr _tzFlag,cl
001E  F7 D3				not		ebx
0020  8B 0D 00 00 00 00			mov		ecx,dword ptr _tzFlag
0026  83 E3 01				and		ebx,0x00000001
0029  09 D9				or		ecx,ebx
002B  89 0D 00 00 00 00			mov		dword ptr _tzFlag,ecx
0031  85 D2				test		edx,edx
0033  0F 95 C2				setne		dl
0036  8A 2D 00 00 00 00			mov		ch,byte ptr _tzFlag
003C  83 E2 01				and		edx,0x00000001
003F  80 E5 FD				and		ch,0xfd
0042  88 2D 00 00 00 00			mov		byte ptr _tzFlag,ch
0048  01 D2				add		edx,edx
004A  09 15 00 00 00 00			or		dword ptr _tzFlag,edx
0050  5A				pop		edx
0051  59				pop		ecx
0052  5B				pop		ebx
0053  C3				ret		
0054				tryOSTimeZone_:
0054  53				push		ebx
0055  51				push		ecx
0056  52				push		edx
0057  56				push		esi
0058  81 EC AC 00 00 00			sub		esp,0x000000ac
005E  8A 25 00 00 00 00			mov		ah,byte ptr _tzFlag
0064  F6 C4 01				test		ah,0x01
0067  74 09				je		L$1
0069  F6 C4 02				test		ah,0x02
006C  0F 85 CD 00 00 00			jne		L$10
0072				L$1:
0072  8A 35 00 00 00 00			mov		dh,byte ptr _tzFlag
0078  89 E0				mov		eax,esp
007A  80 CE 02				or		dh,0x02
007D  50				push		eax
007E  88 35 00 00 00 00			mov		byte ptr _tzFlag,dh
0084  E8 00 00 00 00			call		_GetTimeZoneInformation
0089  83 F8 01				cmp		eax,0x00000001
008C  0F 82 AD 00 00 00			jb		L$10
0092  76 35				jbe		L$2
0094  83 F8 02				cmp		eax,0x00000002
0097  0F 85 A2 00 00 00			jne		L$10
009D  C7 05 00 00 00 00 01 00 00 00
					mov		dword ptr _daylight,0x00000001
00A7  8B 94 24 A8 00 00 00		mov		edx,dword ptr 0xa8[esp]
00AE  89 D0				mov		eax,edx
00B0  C1 E0 04				shl		eax,0x04
00B3  29 D0				sub		eax,edx
00B5  C1 E0 02				shl		eax,0x02
00B8  89 C3				mov		ebx,eax
00BA  A3 00 00 00 00			mov		dword ptr ___dst_adjust,eax
00BF  F7 DB				neg		ebx
00C1  89 1D 00 00 00 00			mov		dword ptr ___dst_adjust,ebx
00C7  EB 08				jmp		L$3
00C9				L$2:
00C9  31 C9				xor		ecx,ecx
00CB  89 0D 00 00 00 00			mov		dword ptr _daylight,ecx
00D1				L$3:
00D1  8B 54 24 54			mov		edx,dword ptr 0x54[esp]
00D5  8B 34 24				mov		esi,dword ptr [esp]
00D8  01 F2				add		edx,esi
00DA  89 D0				mov		eax,edx
00DC  C1 E0 04				shl		eax,0x04
00DF  29 D0				sub		eax,edx
00E1  B3 20				mov		bl,0x20
00E3  C1 E0 02				shl		eax,0x02
00E6  8D 54 24 04			lea		edx,0x4[esp]
00EA  A3 00 00 00 00			mov		dword ptr _timezone,eax
00EF  B8 00 00 00 00			mov		eax,offset _stzone
00F4  EB 15				jmp		L$6
00F6				L$4:
00F6  81 E3 FF 00 00 00			and		ebx,0x000000ff
00FC  83 FB 20				cmp		ebx,0x00000020
00FF  75 05				jne		L$5
0101  8A 1A				mov		bl,byte ptr [edx]
0103  88 18				mov		byte ptr [eax],bl
0105  40				inc		eax
0106				L$5:
0106  8A 1A				mov		bl,byte ptr [edx]
0108  83 C2 02				add		edx,0x00000002
010B				L$6:
010B  66 83 3A 00			cmp		word ptr [edx],0x0000
010F  75 E5				jne		L$4
0111  B3 20				mov		bl,0x20
0113  8D 54 24 58			lea		edx,0x58[esp]
0117  C6 00 00				mov		byte ptr [eax],0x00
011A  B8 00 00 00 00			mov		eax,offset _dtzone
011F  EB 15				jmp		L$9
0121				L$7:
0121  81 E3 FF 00 00 00			and		ebx,0x000000ff
0127  83 FB 20				cmp		ebx,0x00000020
012A  75 05				jne		L$8
012C  8A 1A				mov		bl,byte ptr [edx]
012E  88 18				mov		byte ptr [eax],bl
0130  40				inc		eax
0131				L$8:
0131  8A 1A				mov		bl,byte ptr [edx]
0133  83 C2 02				add		edx,0x00000002
0136				L$9:
0136  66 83 3A 00			cmp		word ptr [edx],0x0000
013A  75 E5				jne		L$7
013C  C6 00 00				mov		byte ptr [eax],0x00
013F				L$10:
013F  81 C4 AC 00 00 00			add		esp,0x000000ac
0145  5E				pop		esi
0146  5A				pop		edx
0147  59				pop		ecx
0148  5B				pop		ebx
0149  C3				ret		

Routine Size: 330 bytes,    Routine Base: _TEXT + 0000

014A				tzset_:
014A  B8 00 00 00 00			mov		eax,offset DGROUP:L$32
014F  E8 00 00 00 00			call		getenv_
0154  85 C0				test		eax,eax
0156  0F 84 00 00 00 00			je		tryOSTimeZone_

Routine Size: 18 bytes,    Routine Base: _TEXT + 014A

015C				__parse_tz_:
015C  53				push		ebx
015D  51				push		ecx
015E  52				push		edx
015F  56				push		esi
0160  57				push		edi
0161  55				push		ebp
0162  83 EC 04				sub		esp,0x00000004
0165  31 D2				xor		edx,edx
0167  BB 00 00 00 00			mov		ebx,offset _timezone
016C  89 15 00 00 00 00			mov		dword ptr _daylight,edx
0172  BA 00 00 00 00			mov		edx,offset _stzone
0177  E8 00 00 00 00			call		parse_offset_
017C  89 C1				mov		ecx,eax
017E  8A 20				mov		ah,byte ptr [eax]
0180  84 E4				test		ah,ah
0182  0F 85 5C 02 00 00			jne		L$29
0188  88 25 00 00 00 00			mov		byte ptr _dtzone,ah
018E  E9 15 03 00 00			jmp		L$31
0193				parse_time_:
0193  53				push		ebx
0194  51				push		ecx
0195  89 D1				mov		ecx,edx
0197  31 DB				xor		ebx,ebx
0199				L$11:
0199  31 D2				xor		edx,edx
019B  8A 10				mov		dl,byte ptr [eax]
019D  83 FA 30				cmp		edx,0x00000030
01A0  7C 10				jl		L$12
01A2  83 FA 39				cmp		edx,0x00000039
01A5  7F 0B				jg		L$12
01A7  6B DB 0A				imul		ebx,0x0000000a
01AA  01 DA				add		edx,ebx
01AC  40				inc		eax
01AD  8D 5A D0				lea		ebx,-0x30[edx]
01B0  EB E7				jmp		L$11
01B2				L$12:
01B2  89 19				mov		dword ptr [ecx],ebx
01B4  59				pop		ecx
01B5  5B				pop		ebx
01B6  C3				ret		
01B7				parse_offset_:
01B7  51				push		ecx
01B8  56				push		esi
01B9  57				push		edi
01BA  55				push		ebp
01BB  83 EC 14				sub		esp,0x00000014
01BE  89 C5				mov		ebp,eax
01C0  89 54 24 10			mov		dword ptr 0x10[esp],edx
01C4  31 C0				xor		eax,eax
01C6  8A 45 00				mov		al,byte ptr [ebp]
01C9  83 F8 3A				cmp		eax,0x0000003a
01CC  75 01				jne		L$13
01CE  45				inc		ebp
01CF				L$13:
01CF  89 EE				mov		esi,ebp
01D1				L$14:
01D1  8A 55 00				mov		dl,byte ptr [ebp]
01D4  84 D2				test		dl,dl
01D6  74 20				je		L$16
01D8  31 C0				xor		eax,eax
01DA  88 D0				mov		al,dl
01DC  83 F8 2C				cmp		eax,0x0000002c
01DF  74 17				je		L$16
01E1  83 F8 2D				cmp		eax,0x0000002d
01E4  74 12				je		L$16
01E6  83 F8 2B				cmp		eax,0x0000002b
01E9  74 0D				je		L$16
01EB  83 F8 30				cmp		eax,0x00000030
01EE  7C 05				jl		L$15
01F0  83 F8 39				cmp		eax,0x00000039
01F3  7E 03				jle		L$16
01F5				L$15:
01F5  45				inc		ebp
01F6  EB D9				jmp		L$14
01F8				L$16:
01F8  89 E8				mov		eax,ebp
01FA  29 F0				sub		eax,esi
01FC  89 44 24 0C			mov		dword ptr 0xc[esp],eax
0200  83 F8 1E				cmp		eax,0x0000001e
0203  7E 08				jle		L$17
0205  C7 44 24 0C 1E 00 00 00		mov		dword ptr 0xc[esp],0x0000001e
020D				L$17:
020D  8B 4C 24 0C			mov		ecx,dword ptr 0xc[esp]
0211  8B 7C 24 10			mov		edi,dword ptr 0x10[esp]
0215  06				push		es
0216  8C D8				mov		eax,ds
0218  8E C0				mov		es,eax
021A  57				push		edi
021B  89 C8				mov		eax,ecx
021D  C1 E9 02				shr		ecx,0x02
0220  F2 A5				repne movsd	
0222  8A C8				mov		cl,al
0224  80 E1 03				and		cl,0x03
0227  F2 A4				repne movsb	
0229  5F				pop		edi
022A  07				pop		es
022B  8B 4C 24 0C			mov		ecx,dword ptr 0xc[esp]
022F  8D 04 0F				lea		eax,[edi+ecx]
0232  C6 00 00				mov		byte ptr [eax],0x00
0235  31 C0				xor		eax,eax
0237  31 C9				xor		ecx,ecx
0239  88 D0				mov		al,dl
023B  8D 55 01				lea		edx,0x1[ebp]
023E  83 F8 2D				cmp		eax,0x0000002d
0241  75 07				jne		L$18
0243  B9 01 00 00 00			mov		ecx,0x00000001
0248  EB 05				jmp		L$19
024A				L$18:
024A  83 F8 2B				cmp		eax,0x0000002b
024D  75 02				jne		L$20
024F				L$19:
024F  89 D5				mov		ebp,edx
0251				L$20:
0251  8A 45 00				mov		al,byte ptr [ebp]
0254  25 FF 00 00 00			and		eax,0x000000ff
0259  83 F8 30				cmp		eax,0x00000030
025C  0F 8C 74 00 00 00			jl		L$22
0262  83 F8 39				cmp		eax,0x00000039
0265  7F 6F				jg		L$22
0267  8D 54 24 08			lea		edx,0x8[esp]
026B  31 F6				xor		esi,esi
026D  89 E8				mov		eax,ebp
026F  89 34 24				mov		dword ptr [esp],esi
0272  89 74 24 04			mov		dword ptr 0x4[esp],esi
0276  89 74 24 08			mov		dword ptr 0x8[esp],esi
027A  E8 00 00 00 00			call		parse_time_
027F  31 D2				xor		edx,edx
0281  8A 10				mov		dl,byte ptr [eax]
0283  89 C5				mov		ebp,eax
0285  83 FA 3A				cmp		edx,0x0000003a
0288  75 1F				jne		L$21
028A  8D 54 24 04			lea		edx,0x4[esp]
028E  40				inc		eax
028F  E8 00 00 00 00			call		parse_time_
0294  31 D2				xor		edx,edx
0296  8A 10				mov		dl,byte ptr [eax]
0298  89 C5				mov		ebp,eax
029A  83 FA 3A				cmp		edx,0x0000003a
029D  75 0A				jne		L$21
029F  89 E2				mov		edx,esp
02A1  40				inc		eax
02A2  E8 00 00 00 00			call		parse_time_
02A7  89 C5				mov		ebp,eax
02A9				L$21:
02A9  8B 74 24 08			mov		esi,dword ptr 0x8[esp]
02AD  89 F0				mov		eax,esi
02AF  C1 E0 04				shl		eax,0x04
02B2  29 F0				sub		eax,esi
02B4  8B 74 24 04			mov		esi,dword ptr 0x4[esp]
02B8  C1 E0 02				shl		eax,0x02
02BB  01 C6				add		esi,eax
02BD  89 F0				mov		eax,esi
02BF  C1 E0 04				shl		eax,0x04
02C2  29 F0				sub		eax,esi
02C4  8B 14 24				mov		edx,dword ptr [esp]
02C7  C1 E0 02				shl		eax,0x02
02CA  01 C2				add		edx,eax
02CC  89 13				mov		dword ptr [ebx],edx
02CE  85 C9				test		ecx,ecx
02D0  74 04				je		L$22
02D2  F7 DA				neg		edx
02D4  89 13				mov		dword ptr [ebx],edx
02D6				L$22:
02D6  89 E8				mov		eax,ebp
02D8  83 C4 14				add		esp,0x00000014
02DB  5D				pop		ebp
02DC  5F				pop		edi
02DD  5E				pop		esi
02DE  59				pop		ecx
02DF  C3				ret		
02E0				parse_rule_:
02E0  53				push		ebx
02E1  51				push		ecx
02E2  56				push		esi
02E3  83 EC 10				sub		esp,0x00000010
02E6  89 C3				mov		ebx,eax
02E8  89 D1				mov		ecx,edx
02EA  31 C0				xor		eax,eax
02EC  8A 03				mov		al,byte ptr [ebx]
02EE  BE FF FF FF FF			mov		esi,0xffffffff
02F3  83 F8 4A				cmp		eax,0x0000004a
02F6  75 07				jne		L$23
02F8  BE 01 00 00 00			mov		esi,0x00000001
02FD  01 F3				add		ebx,esi
02FF				L$23:
02FF  31 C0				xor		eax,eax
0301  8A 03				mov		al,byte ptr [ebx]
0303  83 F8 4D				cmp		eax,0x0000004d
0306  75 03				jne		L$24
0308  43				inc		ebx
0309  31 F6				xor		esi,esi
030B				L$24:
030B  8D 54 24 0C			lea		edx,0xc[esp]
030F  89 D8				mov		eax,ebx
0311  89 71 20				mov		dword ptr 0x20[ecx],esi
0314  E8 00 00 00 00			call		parse_time_
0319  89 C2				mov		edx,eax
031B  89 C3				mov		ebx,eax
031D  85 F6				test		esi,esi
031F  74 09				je		L$25
0321  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
0325  89 41 1C				mov		dword ptr 0x1c[ecx],eax
0328  EB 4D				jmp		L$27
032A				L$25:
032A  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
032E  48				dec		eax
032F  89 41 10				mov		dword ptr 0x10[ecx],eax
0332  31 C0				xor		eax,eax
0334  8A 02				mov		al,byte ptr [edx]
0336  83 F8 2E				cmp		eax,0x0000002e
0339  75 35				jne		L$26
033B  8D 42 01				lea		eax,0x1[edx]
033E  8D 54 24 0C			lea		edx,0xc[esp]
0342  E8 00 00 00 00			call		parse_time_
0347  89 C2				mov		edx,eax
0349  89 C3				mov		ebx,eax
034B  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
034F  89 41 0C				mov		dword ptr 0xc[ecx],eax
0352  31 C0				xor		eax,eax
0354  8A 02				mov		al,byte ptr [edx]
0356  83 F8 2E				cmp		eax,0x0000002e
0359  75 15				jne		L$26
035B  8D 42 01				lea		eax,0x1[edx]
035E  8D 54 24 0C			lea		edx,0xc[esp]
0362  E8 00 00 00 00			call		parse_time_
0367  89 C3				mov		ebx,eax
0369  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
036D  89 41 18				mov		dword ptr 0x18[ecx],eax
0370				L$26:
0370  C7 41 1C 00 00 00 00		mov		dword ptr 0x1c[ecx],0x00000000
0377				L$27:
0377  BA 02 00 00 00			mov		edx,0x00000002
037C  31 F6				xor		esi,esi
037E  31 C0				xor		eax,eax
0380  89 54 24 08			mov		dword ptr 0x8[esp],edx
0384  89 34 24				mov		dword ptr [esp],esi
0387  89 74 24 04			mov		dword ptr 0x4[esp],esi
038B  8A 03				mov		al,byte ptr [ebx]
038D  83 F8 2F				cmp		eax,0x0000002f
0390  75 36				jne		L$28
0392  8D 54 24 08			lea		edx,0x8[esp]
0396  8D 43 01				lea		eax,0x1[ebx]
0399  E8 00 00 00 00			call		parse_time_
039E  31 D2				xor		edx,edx
03A0  8A 10				mov		dl,byte ptr [eax]
03A2  89 C3				mov		ebx,eax
03A4  83 FA 3A				cmp		edx,0x0000003a
03A7  75 1F				jne		L$28
03A9  8D 54 24 04			lea		edx,0x4[esp]
03AD  40				inc		eax
03AE  E8 00 00 00 00			call		parse_time_
03B3  31 D2				xor		edx,edx
03B5  8A 10				mov		dl,byte ptr [eax]
03B7  89 C3				mov		ebx,eax
03B9  83 FA 3A				cmp		edx,0x0000003a
03BC  75 0A				jne		L$28
03BE  89 E2				mov		edx,esp
03C0  40				inc		eax
03C1  E8 00 00 00 00			call		parse_time_
03C6  89 C3				mov		ebx,eax
03C8				L$28:
03C8  8B 04 24				mov		eax,dword ptr [esp]
03CB  89 01				mov		dword ptr [ecx],eax
03CD  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
03D1  89 41 04				mov		dword ptr 0x4[ecx],eax
03D4  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
03D8  89 41 08				mov		dword ptr 0x8[ecx],eax
03DB  89 D8				mov		eax,ebx
03DD  83 C4 10				add		esp,0x00000010
03E0  5E				pop		esi
03E1  59				pop		ecx
03E2  5B				pop		ebx
03E3  C3				ret		
03E4				L$29:
03E4  BB 01 00 00 00			mov		ebx,0x00000001
03E9  BA 00 00 00 00			mov		edx,offset _dtzone
03EE  A1 00 00 00 00			mov		eax,dword ptr _timezone
03F3  89 1D 00 00 00 00			mov		dword ptr _daylight,ebx
03F9  2D 10 0E 00 00			sub		eax,0x00000e10
03FE  89 E3				mov		ebx,esp
0400  89 04 24				mov		dword ptr [esp],eax
0403  89 C8				mov		eax,ecx
0405  E8 00 00 00 00			call		parse_offset_
040A  8B 0C 24				mov		ecx,dword ptr [esp]
040D  8B 1D 00 00 00 00			mov		ebx,dword ptr _timezone
0413  29 CB				sub		ebx,ecx
0415  89 1D 00 00 00 00			mov		dword ptr ___dst_adjust,ebx
041B  31 DB				xor		ebx,ebx
041D  8A 18				mov		bl,byte ptr [eax]
041F  89 C2				mov		edx,eax
0421  83 FB 2C				cmp		ebx,0x0000002c
0424  75 0D				jne		L$30
0426  BA 00 00 00 00			mov		edx,offset ___start_dst
042B  40				inc		eax
042C  E8 00 00 00 00			call		parse_rule_
0431  89 C2				mov		edx,eax
0433				L$30:
0433  31 C0				xor		eax,eax
0435  8A 02				mov		al,byte ptr [edx]
0437  83 F8 2C				cmp		eax,0x0000002c
043A  75 6C				jne		L$31
043C  8D 42 01				lea		eax,0x1[edx]
043F  BA 00 00 00 00			mov		edx,offset ___end_dst
0444  E8 00 00 00 00			call		parse_rule_
0449  A1 00 00 00 00			mov		eax,dword ptr ___dst_adjust
044E  89 C2				mov		edx,eax
0450  BB 10 0E 00 00			mov		ebx,0x00000e10
0455  C1 FA 1F				sar		edx,0x1f
0458  F7 FB				idiv		ebx
045A  8B 35 08 00 00 00			mov		esi,dword ptr ___end_dst+0x8
0460  29 C6				sub		esi,eax
0462  A1 00 00 00 00			mov		eax,dword ptr ___dst_adjust
0467  89 C2				mov		edx,eax
0469  BB 3C 00 00 00			mov		ebx,0x0000003c
046E  C1 FA 1F				sar		edx,0x1f
0471  F7 FB				idiv		ebx
0473  89 C2				mov		edx,eax
0475  C1 FA 1F				sar		edx,0x1f
0478  F7 FB				idiv		ebx
047A  8B 3D 04 00 00 00			mov		edi,dword ptr ___end_dst+0x4
0480  A1 00 00 00 00			mov		eax,dword ptr ___dst_adjust
0485  29 D7				sub		edi,edx
0487  89 C2				mov		edx,eax
0489  C1 FA 1F				sar		edx,0x1f
048C  F7 FB				idiv		ebx
048E  8B 2D 00 00 00 00			mov		ebp,dword ptr ___end_dst
0494  89 35 08 00 00 00			mov		dword ptr ___end_dst+0x8,esi
049A  29 D5				sub		ebp,edx
049C  89 3D 04 00 00 00			mov		dword ptr ___end_dst+0x4,edi
04A2  89 2D 00 00 00 00			mov		dword ptr ___end_dst,ebp
04A8				L$31:
04A8  83 C4 04				add		esp,0x00000004
04AB  5D				pop		ebp
04AC  5F				pop		edi
04AD  5E				pop		esi
04AE  5A				pop		edx
04AF  59				pop		ecx
04B0  5B				pop		ebx
04B1  C3				ret		

Routine Size: 854 bytes,    Routine Base: _TEXT + 015C

No disassembly errors

Segment: CONST DWORD USE32 00000003 bytes
0000				L$32:
0000  54 5A 00                                        TZ.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 0000009E bytes
0000				___start_dst:
0000  00 00 00 00 00 00 00 00 02 00 00 00 01 00 00 00 ................
0010  03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
0020  00 00 00 00                                     ....
0024				___end_dst:
0024  00 00 00 00 00 00 00 00 01 00 00 00 05 00 00 00 ................
0034  09 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
0044  00 00 00 00                                     ....
0048				_timezone:
0048  50 46 00 00                                     PF..
004C				___dst_adjust:
004C  10 0E 00 00                                     ....
0050				_daylight:
0050  01 00 00 00                                     ....
0054				_stzone:
0054  45 53 54 00 00 00 00 00 00 00 00 00 00 00 00 00 EST.............
0064  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ...............
0073				_dtzone:
0073  45 44 54 00 00 00 00 00 00 00 00 00 00 00 00 00 EDT.............
0083  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ...............
0092				_tzname:
0092  00 00 00 00                                     DD	offset _stzone
0096  00 00 00 00                                     DD	offset _dtzone
009A				_tzFlag:
009A  01 00 00 00                                     ....

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

