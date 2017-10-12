Module: timeutil
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000447 bytes
0000				__leapyear_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  89 C3				mov		ebx,eax
0005  F6 C3 03				test		bl,0x03
0008  75 2B				jne		L$3
000A  89 C2				mov		edx,eax
000C  B9 64 00 00 00			mov		ecx,0x00000064
0011  C1 FA 1F				sar		edx,0x1f
0014  F7 F9				idiv		ecx
0016  85 D2				test		edx,edx
0018  74 09				je		L$2
001A				L$1:
001A  B8 01 00 00 00			mov		eax,0x00000001
001F  5A				pop		edx
0020  59				pop		ecx
0021  5B				pop		ebx
0022  C3				ret		
0023				L$2:
0023  B9 90 01 00 00			mov		ecx,0x00000190
0028  89 DA				mov		edx,ebx
002A  89 D8				mov		eax,ebx
002C  C1 FA 1F				sar		edx,0x1f
002F  F7 F9				idiv		ecx
0031  85 D2				test		edx,edx
0033  74 E5				je		L$1
0035				L$3:
0035  31 C0				xor		eax,eax
0037  5A				pop		edx
0038  59				pop		ecx
0039  5B				pop		ebx
003A  C3				ret		
003B				calc_yday_:
003B  53				push		ebx
003C  51				push		ecx
003D  56				push		esi
003E  57				push		edi
003F  55				push		ebp
0040  83 EC 24				sub		esp,0x00000024
0043  89 C3				mov		ebx,eax
0045  8B 48 20				mov		ecx,dword ptr 0x20[eax]
0048  85 C9				test		ecx,ecx
004A  0F 85 B8 00 00 00			jne		L$9
0050  8D 82 6C 07 00 00			lea		eax,0x76c[edx]
0056  E8 00 00 00 00			call		__leapyear_
005B  85 C0				test		eax,eax
005D  74 13				je		L$4
005F  8B 43 10				mov		eax,dword ptr 0x10[ebx]
0062  8B 34 45 00 00 00 00		mov		esi,dword ptr ___dilyr[eax*2]
0069  8B 04 45 FE FF FF FF		mov		eax,dword ptr ___dilyr-0x2[eax*2]
0070  EB 11				jmp		L$5
0072				L$4:
0072  8B 43 10				mov		eax,dword ptr 0x10[ebx]
0075  8B 34 45 00 00 00 00		mov		esi,dword ptr ___diyr[eax*2]
007C  8B 04 45 FE FF FF FF		mov		eax,dword ptr ___diyr-0x2[eax*2]
0083				L$5:
0083  C1 FE 10				sar		esi,0x10
0086  C1 F8 10				sar		eax,0x10
0089  29 C6				sub		esi,eax
008B  31 FF				xor		edi,edi
008D  B9 01 00 00 00			mov		ecx,0x00000001
0092  89 3C 24				mov		dword ptr [esp],edi
0095  89 7C 24 04			mov		dword ptr 0x4[esp],edi
0099  89 7C 24 08			mov		dword ptr 0x8[esp],edi
009D  89 4C 24 0C			mov		dword ptr 0xc[esp],ecx
00A1  8B 43 10				mov		eax,dword ptr 0x10[ebx]
00A4  89 44 24 10			mov		dword ptr 0x10[esp],eax
00A8  89 54 24 14			mov		dword ptr 0x14[esp],edx
00AC  89 E0				mov		eax,esp
00AE  89 7C 24 20			mov		dword ptr 0x20[esp],edi
00B2  E8 00 00 00 00			call		mktime_
00B7  8B 6C 24 18			mov		ebp,dword ptr 0x18[esp]
00BB  8B 53 18				mov		edx,dword ptr 0x18[ebx]
00BE  29 EA				sub		edx,ebp
00C0  83 C2 07				add		edx,0x00000007
00C3  B9 07 00 00 00			mov		ecx,0x00000007
00C8  89 D0				mov		eax,edx
00CA  C1 FA 1F				sar		edx,0x1f
00CD  F7 F9				idiv		ecx
00CF  8B 43 0C				mov		eax,dword ptr 0xc[ebx]
00D2  83 F8 05				cmp		eax,0x00000005
00D5  75 1F				jne		L$7
00D7  8D 48 FF				lea		ecx,-0x1[eax]
00DA  89 CF				mov		edi,ecx
00DC  C1 E7 03				shl		edi,0x03
00DF  8D 42 01				lea		eax,0x1[edx]
00E2  29 CF				sub		edi,ecx
00E4  01 F8				add		eax,edi
00E6  39 F0				cmp		eax,esi
00E8  7E 08				jle		L$6
00EA  8B 43 0C				mov		eax,dword ptr 0xc[ebx]
00ED  83 E8 02				sub		eax,0x00000002
00F0  EB 05				jmp		L$8
00F2				L$6:
00F2  89 C8				mov		eax,ecx
00F4  EB 01				jmp		L$8
00F6				L$7:
00F6  48				dec		eax
00F7				L$8:
00F7  8B 5C 24 1C			mov		ebx,dword ptr 0x1c[esp]
00FB  01 D3				add		ebx,edx
00FD  89 C2				mov		edx,eax
00FF  C1 E0 03				shl		eax,0x03
0102  29 D0				sub		eax,edx
0104  01 D8				add		eax,ebx
0106  EB 0F				jmp		L$11
0108				L$9:
0108  83 F9 01				cmp		ecx,0x00000001
010B  75 07				jne		L$10
010D  8B 40 1C				mov		eax,dword ptr 0x1c[eax]
0110  29 C8				sub		eax,ecx
0112  EB 03				jmp		L$11
0114				L$10:
0114  8B 40 1C				mov		eax,dword ptr 0x1c[eax]
0117				L$11:
0117  83 C4 24				add		esp,0x00000024
011A  5D				pop		ebp
011B  5F				pop		edi
011C  5E				pop		esi
011D  59				pop		ecx
011E  5B				pop		ebx
011F  C3				ret		
0120				check_order_:
0120  51				push		ecx
0121  56				push		esi
0122  89 D1				mov		ecx,edx
0124  8B 70 10				mov		esi,dword ptr 0x10[eax]
0127  3B 72 10				cmp		esi,dword ptr 0x10[edx]
012A  7E 08				jle		L$13
012C				L$12:
012C  B8 01 00 00 00			mov		eax,0x00000001
0131  5E				pop		esi
0132  59				pop		ecx
0133  C3				ret		
0134				L$13:
0134  3B 71 10				cmp		esi,dword ptr 0x10[ecx]
0137  7C 16				jl		L$14
0139  89 DA				mov		edx,ebx
013B  E8 00 00 00 00			call		calc_yday_
0140  89 C6				mov		esi,eax
0142  89 DA				mov		edx,ebx
0144  89 C8				mov		eax,ecx
0146  E8 00 00 00 00			call		calc_yday_
014B  39 C6				cmp		esi,eax
014D  7F DD				jg		L$12
014F				L$14:
014F  31 C0				xor		eax,eax
0151  5E				pop		esi
0152  59				pop		ecx
0153  C3				ret		

Routine Size: 340 bytes,    Routine Base: _TEXT + 0000

0154				__isindst_:
0154  53				push		ebx
0155  51				push		ecx
0156  52				push		edx
0157  56				push		esi
0158  57				push		edi
0159  55				push		ebp
015A  83 EC 1C				sub		esp,0x0000001c
015D  89 C1				mov		ecx,eax
015F  A1 04 00 00 00			mov		eax,dword ptr _tzname+0x4
0164  8A 10				mov		dl,byte ptr [eax]
0166  31 FF				xor		edi,edi
0168  84 D2				test		dl,dl
016A  0F 84 98 02 00 00			je		L$38
0170  BA 00 00 00 00			mov		edx,offset ___end_dst
0175  B8 00 00 00 00			mov		eax,offset ___start_dst
017A  8B 59 14				mov		ebx,dword ptr 0x14[ecx]
017D  E8 00 00 00 00			call		check_order_
0182  89 44 24 14			mov		dword ptr 0x14[esp],eax
0186  85 C0				test		eax,eax
0188  74 0C				je		L$15
018A  BE 00 00 00 00			mov		esi,offset ___end_dst
018F  BB 00 00 00 00			mov		ebx,offset ___start_dst
0194  EB 0A				jmp		L$16
0196				L$15:
0196  BE 00 00 00 00			mov		esi,offset ___start_dst
019B  BB 00 00 00 00			mov		ebx,offset ___end_dst
01A0				L$16:
01A0  8B 41 14				mov		eax,dword ptr 0x14[ecx]
01A3  05 6C 07 00 00			add		eax,0x0000076c
01A8  8B 69 10				mov		ebp,dword ptr 0x10[ecx]
01AB  E8 00 00 00 00			call		__leapyear_
01B0  89 C2				mov		edx,eax
01B2  8D 44 2D 00			lea		eax,[ebp+ebp]
01B6  85 D2				test		edx,edx
01B8  74 0E				je		L$17
01BA  8B 90 00 00 00 00			mov		edx,dword ptr ___dilyr[eax]
01C0  8B 80 FE FF FF FF			mov		eax,dword ptr ___dilyr-0x2[eax]
01C6  EB 0C				jmp		L$18
01C8				L$17:
01C8  8B 90 00 00 00 00			mov		edx,dword ptr ___diyr[eax]
01CE  8B 80 FE FF FF FF			mov		eax,dword ptr ___diyr-0x2[eax]
01D4				L$18:
01D4  C1 FA 10				sar		edx,0x10
01D7  C1 F8 10				sar		eax,0x10
01DA  29 C2				sub		edx,eax
01DC  89 54 24 0C			mov		dword ptr 0xc[esp],edx
01E0  31 D2				xor		edx,edx
01E2  8B 46 20				mov		eax,dword ptr 0x20[esi]
01E5  89 54 24 10			mov		dword ptr 0x10[esp],edx
01E9  85 C0				test		eax,eax
01EB  0F 85 B3 00 00 00			jne		L$21
01F1  8B 46 10				mov		eax,dword ptr 0x10[esi]
01F4  39 C5				cmp		ebp,eax
01F6  7E 0A				jle		L$19
01F8  BF 01 00 00 00			mov		edi,0x00000001
01FD  E9 DB 00 00 00			jmp		L$25
0202				L$19:
0202  0F 85 D5 00 00 00			jne		L$25
0208  8B 51 18				mov		edx,dword ptr 0x18[ecx]
020B  8B 46 18				mov		eax,dword ptr 0x18[esi]
020E  83 C2 07				add		edx,0x00000007
0211  29 C2				sub		edx,eax
0213  C7 44 24 18 07 00 00 00		mov		dword ptr 0x18[esp],0x00000007
021B  89 D0				mov		eax,edx
021D  C1 FA 1F				sar		edx,0x1f
0220  F7 7C 24 18			idiv		dword ptr 0x18[esp]
0224  8B 41 0C				mov		eax,dword ptr 0xc[ecx]
0227  29 D0				sub		eax,edx
0229  8B 51 18				mov		edx,dword ptr 0x18[ecx]
022C  89 04 24				mov		dword ptr [esp],eax
022F  83 C2 06				add		edx,0x00000006
0232  2B 56 18				sub		edx,dword ptr 0x18[esi]
0235  C7 44 24 18 07 00 00 00		mov		dword ptr 0x18[esp],0x00000007
023D  89 D0				mov		eax,edx
023F  C1 FA 1F				sar		edx,0x1f
0242  F7 7C 24 18			idiv		dword ptr 0x18[esp]
0246  8B 41 0C				mov		eax,dword ptr 0xc[ecx]
0249  48				dec		eax
024A  29 D0				sub		eax,edx
024C  8B 56 0C				mov		edx,dword ptr 0xc[esi]
024F  89 44 24 08			mov		dword ptr 0x8[esp],eax
0253  83 FA 05				cmp		edx,0x00000005
0256  75 25				jne		L$20
0258  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
025C  8B 14 24				mov		edx,dword ptr [esp]
025F  83 E8 07				sub		eax,0x00000007
0262  39 D0				cmp		eax,edx
0264  0F 8D 73 00 00 00			jge		L$25
026A  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
026E  BF 01 00 00 00			mov		edi,0x00000001
0273  39 D0				cmp		eax,edx
0275  0F 8C 62 00 00 00			jl		L$25
027B  EB 5C				jmp		L$24
027D				L$20:
027D  8D 42 FF				lea		eax,-0x1[edx]
0280  89 44 24 18			mov		dword ptr 0x18[esp],eax
0284  8B 54 24 18			mov		edx,dword ptr 0x18[esp]
0288  C1 E0 03				shl		eax,0x03
028B  29 D0				sub		eax,edx
028D  8B 14 24				mov		edx,dword ptr [esp]
0290  40				inc		eax
0291  39 D0				cmp		eax,edx
0293  7F 48				jg		L$25
0295  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
0299  BF 01 00 00 00			mov		edi,0x00000001
029E  39 D0				cmp		eax,edx
02A0  7E 3B				jle		L$25
02A2  EB 35				jmp		L$24
02A4				L$21:
02A4  8B 56 1C				mov		edx,dword ptr 0x1c[esi]
02A7  83 F8 01				cmp		eax,0x00000001
02AA  75 1F				jne		L$23
02AC  8B 41 14				mov		eax,dword ptr 0x14[ecx]
02AF  05 6C 07 00 00			add		eax,0x0000076c
02B4  E8 00 00 00 00			call		__leapyear_
02B9  85 C0				test		eax,eax
02BB  74 0D				je		L$22
02BD  A1 02 00 00 00			mov		eax,dword ptr ___diyr+0x2
02C2  C1 F8 10				sar		eax,0x10
02C5  39 C2				cmp		edx,eax
02C7  7E 01				jle		L$22
02C9  42				inc		edx
02CA				L$22:
02CA  4A				dec		edx
02CB				L$23:
02CB  8B 41 1C				mov		eax,dword ptr 0x1c[ecx]
02CE  39 C2				cmp		edx,eax
02D0  7F 0B				jg		L$25
02D2  BF 01 00 00 00			mov		edi,0x00000001
02D7  75 04				jne		L$25
02D9				L$24:
02D9  89 7C 24 10			mov		dword ptr 0x10[esp],edi
02DD				L$25:
02DD  83 7C 24 10 00			cmp		dword ptr 0x10[esp],0x00000000
02E2  74 16				je		L$26
02E4  89 F2				mov		edx,esi
02E6  89 C8				mov		eax,ecx
02E8  E8 00 00 00 00			call		time_less_
02ED  85 C0				test		eax,eax
02EF  0F 94 C0				sete		al
02F2  89 C7				mov		edi,eax
02F4  81 E7 FF 00 00 00			and		edi,0x000000ff
02FA				L$26:
02FA  85 FF				test		edi,edi
02FC  75 13				jne		L$27
02FE  8B 54 24 14			mov		edx,dword ptr 0x14[esp]
0302  85 D2				test		edx,edx
0304  0F 84 FE 00 00 00			je		L$38
030A  89 D7				mov		edi,edx
030C  E9 F7 00 00 00			jmp		L$38
0311				L$27:
0311  8B 43 20				mov		eax,dword ptr 0x20[ebx]
0314  31 F6				xor		esi,esi
0316  85 C0				test		eax,eax
0318  0F 85 96 00 00 00			jne		L$32
031E  8B 43 10				mov		eax,dword ptr 0x10[ebx]
0321  39 C5				cmp		ebp,eax
0323  7E 07				jle		L$28
0325  31 FF				xor		edi,edi
0327  E9 C1 00 00 00			jmp		L$36
032C				L$28:
032C  0F 85 BB 00 00 00			jne		L$36
0332  8B 51 18				mov		edx,dword ptr 0x18[ecx]
0335  8B 6B 18				mov		ebp,dword ptr 0x18[ebx]
0338  83 C2 07				add		edx,0x00000007
033B  29 EA				sub		edx,ebp
033D  BD 07 00 00 00			mov		ebp,0x00000007
0342  89 D0				mov		eax,edx
0344  C1 FA 1F				sar		edx,0x1f
0347  F7 FD				idiv		ebp
0349  8B 41 0C				mov		eax,dword ptr 0xc[ecx]
034C  29 D0				sub		eax,edx
034E  8B 51 18				mov		edx,dword ptr 0x18[ecx]
0351  89 44 24 04			mov		dword ptr 0x4[esp],eax
0355  83 C2 06				add		edx,0x00000006
0358  8B 43 18				mov		eax,dword ptr 0x18[ebx]
035B  29 C2				sub		edx,eax
035D  89 D0				mov		eax,edx
035F  C1 FA 1F				sar		edx,0x1f
0362  F7 FD				idiv		ebp
0364  8B 41 0C				mov		eax,dword ptr 0xc[ecx]
0367  48				dec		eax
0368  31 FF				xor		edi,edi
036A  29 D0				sub		eax,edx
036C  8B 6B 0C				mov		ebp,dword ptr 0xc[ebx]
036F  89 C2				mov		edx,eax
0371  83 FD 05				cmp		ebp,0x00000005
0374  75 1F				jne		L$31
0376  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
037A  8B 6C 24 04			mov		ebp,dword ptr 0x4[esp]
037E  83 E8 07				sub		eax,0x00000007
0381  39 E8				cmp		eax,ebp
0383  7C 0A				jl		L$30
0385				L$29:
0385  BF 01 00 00 00			mov		edi,0x00000001
038A  E9 5E 00 00 00			jmp		L$36
038F				L$30:
038F  39 C2				cmp		edx,eax
0391  7F 5A				jg		L$36
0393  EB 53				jmp		L$35
0395				L$31:
0395  8D 45 FF				lea		eax,-0x1[ebp]
0398  89 44 24 18			mov		dword ptr 0x18[esp],eax
039C  8B 6C 24 18			mov		ebp,dword ptr 0x18[esp]
03A0  C1 E0 03				shl		eax,0x03
03A3  29 E8				sub		eax,ebp
03A5  8B 6C 24 04			mov		ebp,dword ptr 0x4[esp]
03A9  40				inc		eax
03AA  39 E8				cmp		eax,ebp
03AC  7F D7				jg		L$29
03AE  39 C2				cmp		edx,eax
03B0  7D 3B				jge		L$36
03B2  EB 34				jmp		L$35
03B4				L$32:
03B4  8B 53 1C				mov		edx,dword ptr 0x1c[ebx]
03B7  83 F8 01				cmp		eax,0x00000001
03BA  75 1F				jne		L$34
03BC  8B 41 14				mov		eax,dword ptr 0x14[ecx]
03BF  05 6C 07 00 00			add		eax,0x0000076c
03C4  E8 00 00 00 00			call		__leapyear_
03C9  85 C0				test		eax,eax
03CB  74 0D				je		L$33
03CD  A1 02 00 00 00			mov		eax,dword ptr ___diyr+0x2
03D2  C1 F8 10				sar		eax,0x10
03D5  39 C2				cmp		edx,eax
03D7  7E 01				jle		L$33
03D9  42				inc		edx
03DA				L$33:
03DA  4A				dec		edx
03DB				L$34:
03DB  8B 41 1C				mov		eax,dword ptr 0x1c[ecx]
03DE  39 C2				cmp		edx,eax
03E0  7F 0B				jg		L$36
03E2  31 FF				xor		edi,edi
03E4  39 C2				cmp		edx,eax
03E6  75 05				jne		L$36
03E8				L$35:
03E8  BE 01 00 00 00			mov		esi,0x00000001
03ED				L$36:
03ED  85 F6				test		esi,esi
03EF  74 0B				je		L$37
03F1  89 DA				mov		edx,ebx
03F3  89 C8				mov		eax,ecx
03F5  E8 00 00 00 00			call		time_less_
03FA  89 C7				mov		edi,eax
03FC				L$37:
03FC  8B 44 24 14			mov		eax,dword ptr 0x14[esp]
0400  85 C0				test		eax,eax
0402  74 04				je		L$38
0404  29 F8				sub		eax,edi
0406  89 C7				mov		edi,eax
0408				L$38:
0408  89 F8				mov		eax,edi
040A  89 79 20				mov		dword ptr 0x20[ecx],edi
040D  83 C4 1C				add		esp,0x0000001c
0410  5D				pop		ebp
0411  5F				pop		edi
0412  5E				pop		esi
0413  5A				pop		edx
0414  59				pop		ecx
0415  5B				pop		ebx
0416  C3				ret		
0417				time_less_:
0417  53				push		ebx
0418  51				push		ecx
0419  56				push		esi
041A  55				push		ebp
041B  8B 48 08				mov		ecx,dword ptr 0x8[eax]
041E  8B 72 08				mov		esi,dword ptr 0x8[edx]
0421  31 DB				xor		ebx,ebx
0423  39 F1				cmp		ecx,esi
0425  7C 14				jl		L$39
0427  75 17				jne		L$40
0429  8B 48 04				mov		ecx,dword ptr 0x4[eax]
042C  8B 6A 04				mov		ebp,dword ptr 0x4[edx]
042F  39 E9				cmp		ecx,ebp
0431  7C 08				jl		L$39
0433  75 0B				jne		L$40
0435  8B 00				mov		eax,dword ptr [eax]
0437  3B 02				cmp		eax,dword ptr [edx]
0439  7D 05				jge		L$40
043B				L$39:
043B  BB 01 00 00 00			mov		ebx,0x00000001
0440				L$40:
0440  89 D8				mov		eax,ebx
0442  5D				pop		ebp
0443  5E				pop		esi
0444  59				pop		ecx
0445  5B				pop		ebx
0446  C3				ret		

Routine Size: 755 bytes,    Routine Base: _TEXT + 0154

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000034 bytes
0000				___diyr:
0000  00 00 1F 00 3B 00 5A 00 78 00 97 00 B5 00 D4 00 ....;.Z.x.......
0010  F3 00 11 01 30 01 4E 01 6D 01                   ....0.N.m.
001A				___dilyr:
001A  00 00 1F 00 3C 00 5B 00 79 00 98 00 B6 00 D5 00 ....<.[.y.......
002A  F4 00 12 01 31 01 4F 01 6E 01                   ....1.O.n.

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

