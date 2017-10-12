Module: qsort
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000004B7 bytes
0000				byteswap_:
0000  06				push		es
0001  1E				push		ds
0002  07				pop		es
0003  0F B6 D1				movzx		edx,cl
0006  C1 E9 02				shr		ecx,0x02
0009  74 0B				je		L$2
000B				L$1:
000B  8B 07				mov		eax,dword ptr [edi]
000D  87 06				xchg		dword ptr [esi],eax
000F  AB				stosd		
0010  83 C6 04				add		esi,0x00000004
0013  49				dec		ecx
0014  75 F5				jne		L$1
0016				L$2:
0016  80 E2 03				and		dl,0x03
0019  74 09				je		L$4
001B				L$3:
001B  8A 07				mov		al,byte ptr [edi]
001D  86 06				xchg		byte ptr [esi],al
001F  AA				stosb		
0020  46				inc		esi
0021  4A				dec		edx
0022  75 F7				jne		L$3
0024				L$4:
0024  07				pop		es
0025  C3				ret		
0026				med3_:
0026  56				push		esi
0027  57				push		edi
0028  06				push		es
0029  0F A0				push		fs
002B  0F A8				push		gs
002D  C8 04 00 00			enter		0x0004,0x00
0031  89 C7				mov		edi,eax
0033  89 D6				mov		esi,edx
0035  89 4D FC				mov		dword ptr -0x4[ebp],ecx
0038  FF 55 FC				call		dword ptr -0x4[ebp]
003B  85 C0				test		eax,eax
003D  7E 1E				jle		L$7
003F  89 DA				mov		edx,ebx
0041  89 F8				mov		eax,edi
0043  FF 55 FC				call		dword ptr -0x4[ebp]
0046  85 C0				test		eax,eax
0048  7E 0F				jle		L$6
004A  89 DA				mov		edx,ebx
004C  89 F0				mov		eax,esi
004E  FF 55 FC				call		dword ptr -0x4[ebp]
0051  85 C0				test		eax,eax
0053  7F 1E				jg		L$8
0055				L$5:
0055  89 D8				mov		eax,ebx
0057  EB 1C				jmp		L$9
0059				L$6:
0059  89 F8				mov		eax,edi
005B  EB 18				jmp		L$9
005D				L$7:
005D  89 DA				mov		edx,ebx
005F  89 F8				mov		eax,edi
0061  FF 55 FC				call		dword ptr -0x4[ebp]
0064  85 C0				test		eax,eax
0066  7D F1				jge		L$6
0068  89 DA				mov		edx,ebx
006A  89 F0				mov		eax,esi
006C  FF 55 FC				call		dword ptr -0x4[ebp]
006F  85 C0				test		eax,eax
0071  7F E2				jg		L$5
0073				L$8:
0073  89 F0				mov		eax,esi
0075				L$9:
0075  C9				leave		
0076  0F A9				pop		gs
0078  0F A1				pop		fs
007A  07				pop		es
007B  5F				pop		edi
007C  5E				pop		esi
007D  C3				ret		

Routine Size: 126 bytes,    Routine Base: _TEXT + 0000

007E				qsort_:
007E  56				push		esi
007F  57				push		edi
0080  06				push		es
0081  0F A0				push		fs
0083  0F A8				push		gs
0085  C8 44 01 00			enter		0x0144,0x00
0089  50				push		eax
008A  52				push		edx
008B  53				push		ebx
008C  09 D8				or		eax,ebx
008E  89 4D F0				mov		dword ptr -0x10[ebp],ecx
0091  A8 03				test		al,0x03
0093  74 07				je		L$10
0095  B8 02 00 00 00			mov		eax,0x00000002
009A  EB 09				jmp		L$11
009C				L$10:
009C  83 FB 04				cmp		ebx,0x00000004
009F  0F 97 C0				seta		al
00A2  0F B6 C0				movzx		eax,al
00A5				L$11:
00A5  89 45 E4				mov		dword ptr -0x1c[ebp],eax
00A8  6B 85 B0 FE FF FF 03		imul		eax,dword ptr -0x150[ebp],0x00000003
00AF  89 45 C4				mov		dword ptr -0x3c[ebp],eax
00B2  8B 85 B0 FE FF FF			mov		eax,dword ptr -0x150[ebp]
00B8  01 C0				add		eax,eax
00BA  C7 45 EC 00 00 00 00		mov		dword ptr -0x14[ebp],0x00000000
00C1  89 45 C8				mov		dword ptr -0x38[ebp],eax
00C4				L$12:
00C4  83 BD B4 FE FF FF 01		cmp		dword ptr -0x14c[ebp],0x00000001
00CB  0F 86 91 00 00 00			jbe		L$22
00D1  83 BD B4 FE FF FF 10		cmp		dword ptr -0x14c[ebp],0x00000010
00D8  0F 83 B3 00 00 00			jae		L$23
00DE  8B 45 C4				mov		eax,dword ptr -0x3c[ebp]
00E1  89 45 E8				mov		dword ptr -0x18[ebp],eax
00E4  8B 85 B4 FE FF FF			mov		eax,dword ptr -0x14c[ebp]
00EA  0F AF 85 B0 FE FF FF		imul		eax,dword ptr -0x150[ebp]
00F1  8B 95 B8 FE FF FF			mov		edx,dword ptr -0x148[ebp]
00F7  01 C2				add		edx,eax
00F9  89 55 CC				mov		dword ptr -0x34[ebp],edx
00FC  EB 5E				jmp		L$21
00FE				L$13:
00FE  8B 85 B8 FE FF FF			mov		eax,dword ptr -0x148[ebp]
0104  03 45 E8				add		eax,dword ptr -0x18[ebp]
0107  89 45 DC				mov		dword ptr -0x24[ebp],eax
010A  EB 42				jmp		L$20
010C				L$14:
010C  89 C3				mov		ebx,eax
010E  EB 20				jmp		L$18
0110				L$15:
0110  83 7D E4 00			cmp		dword ptr -0x1c[ebp],0x00000000
0114  74 0F				je		L$16
0116  8B 8D B0 FE FF FF			mov		ecx,dword ptr -0x150[ebp]
011C  89 DE				mov		esi,ebx
011E  E8 00 00 00 00			call		byteswap_
0123  EB 08				jmp		L$17
0125				L$16:
0125  8B 17				mov		edx,dword ptr [edi]
0127  8B 03				mov		eax,dword ptr [ebx]
0129  89 13				mov		dword ptr [ebx],edx
012B  89 07				mov		dword ptr [edi],eax
012D				L$17:
012D  2B 5D E8				sub		ebx,dword ptr -0x18[ebp]
0130				L$18:
0130  3B 9D B8 FE FF FF			cmp		ebx,dword ptr -0x148[ebp]
0136  76 10				jbe		L$19
0138  89 DF				mov		edi,ebx
013A  2B 7D E8				sub		edi,dword ptr -0x18[ebp]
013D  89 DA				mov		edx,ebx
013F  89 F8				mov		eax,edi
0141  FF 55 F0				call		dword ptr -0x10[ebp]
0144  85 C0				test		eax,eax
0146  7F C8				jg		L$15
0148				L$19:
0148  8B 45 E8				mov		eax,dword ptr -0x18[ebp]
014B  01 45 DC				add		dword ptr -0x24[ebp],eax
014E				L$20:
014E  8B 45 DC				mov		eax,dword ptr -0x24[ebp]
0151  3B 45 CC				cmp		eax,dword ptr -0x34[ebp]
0154  72 B6				jb		L$14
0156  8B 45 C8				mov		eax,dword ptr -0x38[ebp]
0159  29 45 E8				sub		dword ptr -0x18[ebp],eax
015C				L$21:
015C  83 7D E8 00			cmp		dword ptr -0x18[ebp],0x00000000
0160  7F 9C				jg		L$13
0162				L$22:
0162  83 7D EC 00			cmp		dword ptr -0x14[ebp],0x00000000
0166  0F 84 09 FF FF FF			je		L$9
016C  FF 4D EC				dec		dword ptr -0x14[ebp]
016F  8B 45 EC				mov		eax,dword ptr -0x14[ebp]
0172  8B 94 85 BC FE FF FF		mov		edx,dword ptr -0x144[ebp+eax*4]
0179  8B 84 85 3C FF FF FF		mov		eax,dword ptr -0xc4[ebp+eax*4]
0180  89 95 B8 FE FF FF			mov		dword ptr -0x148[ebp],edx
0186  89 85 B4 FE FF FF			mov		dword ptr -0x14c[ebp],eax
018C  E9 33 FF FF FF			jmp		L$12
0191				L$23:
0191  8B 85 B4 FE FF FF			mov		eax,dword ptr -0x14c[ebp]
0197  D1 E8				shr		eax,0x01
0199  0F AF 85 B0 FE FF FF		imul		eax,dword ptr -0x150[ebp]
01A0  8B BD B8 FE FF FF			mov		edi,dword ptr -0x148[ebp]
01A6  01 C7				add		edi,eax
01A8  83 BD B4 FE FF FF 1D		cmp		dword ptr -0x14c[ebp],0x0000001d
01AF  0F 86 9C 00 00 00			jbe		L$25
01B5  8B B5 B4 FE FF FF			mov		esi,dword ptr -0x14c[ebp]
01BB  4E				dec		esi
01BC  0F AF B5 B0 FE FF FF		imul		esi,dword ptr -0x150[ebp]
01C3  8B 85 B8 FE FF FF			mov		eax,dword ptr -0x148[ebp]
01C9  89 45 D0				mov		dword ptr -0x30[ebp],eax
01CC  01 C6				add		esi,eax
01CE  83 BD B4 FE FF FF 2A		cmp		dword ptr -0x14c[ebp],0x0000002a
01D5  76 69				jbe		L$24
01D7  8B 85 B4 FE FF FF			mov		eax,dword ptr -0x14c[ebp]
01DD  8B 95 B0 FE FF FF			mov		edx,dword ptr -0x150[ebp]
01E3  C1 E8 03				shr		eax,0x03
01E6  0F AF D0				imul		edx,eax
01E9  8B 9D B8 FE FF FF			mov		ebx,dword ptr -0x148[ebp]
01EF  89 55 E0				mov		dword ptr -0x20[ebp],edx
01F2  8D 04 12				lea		eax,[edx+edx]
01F5  8B 4D F0				mov		ecx,dword ptr -0x10[ebp]
01F8  8B 95 B8 FE FF FF			mov		edx,dword ptr -0x148[ebp]
01FE  89 45 C0				mov		dword ptr -0x40[ebp],eax
0201  01 C3				add		ebx,eax
0203  8B 85 B8 FE FF FF			mov		eax,dword ptr -0x148[ebp]
0209  03 55 E0				add		edx,dword ptr -0x20[ebp]
020C  E8 00 00 00 00			call		med3_
0211  8B 5D E0				mov		ebx,dword ptr -0x20[ebp]
0214  8B 4D F0				mov		ecx,dword ptr -0x10[ebp]
0217  89 45 D0				mov		dword ptr -0x30[ebp],eax
021A  89 FA				mov		edx,edi
021C  89 F8				mov		eax,edi
021E  01 FB				add		ebx,edi
0220  2B 45 E0				sub		eax,dword ptr -0x20[ebp]
0223  E8 00 00 00 00			call		med3_
0228  8B 4D F0				mov		ecx,dword ptr -0x10[ebp]
022B  89 C7				mov		edi,eax
022D  89 F2				mov		edx,esi
022F  89 F3				mov		ebx,esi
0231  89 F0				mov		eax,esi
0233  2B 55 E0				sub		edx,dword ptr -0x20[ebp]
0236  2B 45 C0				sub		eax,dword ptr -0x40[ebp]
0239  E8 00 00 00 00			call		med3_
023E  89 C6				mov		esi,eax
0240				L$24:
0240  8B 4D F0				mov		ecx,dword ptr -0x10[ebp]
0243  8B 45 D0				mov		eax,dword ptr -0x30[ebp]
0246  89 F3				mov		ebx,esi
0248  89 FA				mov		edx,edi
024A  E8 00 00 00 00			call		med3_
024F  89 C7				mov		edi,eax
0251				L$25:
0251  83 7D E4 00			cmp		dword ptr -0x1c[ebp],0x00000000
0255  74 2A				je		L$27
0257  8B 85 B8 FE FF FF			mov		eax,dword ptr -0x148[ebp]
025D  89 45 D8				mov		dword ptr -0x28[ebp],eax
0260  74 0F				je		L$26
0262  8B 8D B0 FE FF FF			mov		ecx,dword ptr -0x150[ebp]
0268  89 C6				mov		esi,eax
026A  E8 00 00 00 00			call		byteswap_
026F  EB 1B				jmp		L$28
0271				L$26:
0271  8B 9D B8 FE FF FF			mov		ebx,dword ptr -0x148[ebp]
0277  8B 10				mov		edx,dword ptr [eax]
0279  8B 07				mov		eax,dword ptr [edi]
027B  89 03				mov		dword ptr [ebx],eax
027D  89 17				mov		dword ptr [edi],edx
027F  EB 0B				jmp		L$28
0281				L$27:
0281  8D 45 BC				lea		eax,-0x44[ebp]
0284  89 45 D8				mov		dword ptr -0x28[ebp],eax
0287  8B 07				mov		eax,dword ptr [edi]
0289  89 45 BC				mov		dword ptr -0x44[ebp],eax
028C				L$28:
028C  8B 85 B4 FE FF FF			mov		eax,dword ptr -0x14c[ebp]
0292  48				dec		eax
0293  0F AF 85 B0 FE FF FF		imul		eax,dword ptr -0x150[ebp]
029A  8B 9D B8 FE FF FF			mov		ebx,dword ptr -0x148[ebp]
02A0  89 5D F4				mov		dword ptr -0xc[ebp],ebx
02A3  8D 14 03				lea		edx,[ebx+eax]
02A6  89 55 F8				mov		dword ptr -0x8[ebp],edx
02A9  89 55 FC				mov		dword ptr -0x4[ebp],edx
02AC				L$29:
02AC  3B 5D FC				cmp		ebx,dword ptr -0x4[ebp]
02AF  77 45				ja		L$33
02B1  8B 55 D8				mov		edx,dword ptr -0x28[ebp]
02B4  89 D8				mov		eax,ebx
02B6  FF 55 F0				call		dword ptr -0x10[ebp]
02B9  85 C0				test		eax,eax
02BB  7F 39				jg		L$33
02BD  75 2F				jne		L$32
02BF  83 7D E4 00			cmp		dword ptr -0x1c[ebp],0x00000000
02C3  74 12				je		L$30
02C5  8B 8D B0 FE FF FF			mov		ecx,dword ptr -0x150[ebp]
02CB  8B 75 F4				mov		esi,dword ptr -0xc[ebp]
02CE  89 DF				mov		edi,ebx
02D0  E8 00 00 00 00			call		byteswap_
02D5  EB 0E				jmp		L$31
02D7				L$30:
02D7  8B 55 F4				mov		edx,dword ptr -0xc[ebp]
02DA  8B 4D F4				mov		ecx,dword ptr -0xc[ebp]
02DD  8B 03				mov		eax,dword ptr [ebx]
02DF  8B 12				mov		edx,dword ptr [edx]
02E1  89 01				mov		dword ptr [ecx],eax
02E3  89 13				mov		dword ptr [ebx],edx
02E5				L$31:
02E5  8B 85 B0 FE FF FF			mov		eax,dword ptr -0x150[ebp]
02EB  01 45 F4				add		dword ptr -0xc[ebp],eax
02EE				L$32:
02EE  03 9D B0 FE FF FF			add		ebx,dword ptr -0x150[ebp]
02F4  EB B6				jmp		L$29
02F6				L$33:
02F6  3B 5D FC				cmp		ebx,dword ptr -0x4[ebp]
02F9  77 50				ja		L$37
02FB  8B 55 D8				mov		edx,dword ptr -0x28[ebp]
02FE  8B 45 FC				mov		eax,dword ptr -0x4[ebp]
0301  FF 55 F0				call		dword ptr -0x10[ebp]
0304  85 C0				test		eax,eax
0306  7C 43				jl		L$37
0308  75 36				jne		L$36
030A  83 7D E4 00			cmp		dword ptr -0x1c[ebp],0x00000000
030E  74 13				je		L$34
0310  8B 8D B0 FE FF FF			mov		ecx,dword ptr -0x150[ebp]
0316  8B 7D F8				mov		edi,dword ptr -0x8[ebp]
0319  8B 75 FC				mov		esi,dword ptr -0x4[ebp]
031C  E8 00 00 00 00			call		byteswap_
0321  EB 14				jmp		L$35
0323				L$34:
0323  8B 45 F8				mov		eax,dword ptr -0x8[ebp]
0326  8B 55 FC				mov		edx,dword ptr -0x4[ebp]
0329  8B 4D FC				mov		ecx,dword ptr -0x4[ebp]
032C  8B 00				mov		eax,dword ptr [eax]
032E  8B 12				mov		edx,dword ptr [edx]
0330  89 01				mov		dword ptr [ecx],eax
0332  8B 45 F8				mov		eax,dword ptr -0x8[ebp]
0335  89 10				mov		dword ptr [eax],edx
0337				L$35:
0337  8B 85 B0 FE FF FF			mov		eax,dword ptr -0x150[ebp]
033D  29 45 F8				sub		dword ptr -0x8[ebp],eax
0340				L$36:
0340  8B 85 B0 FE FF FF			mov		eax,dword ptr -0x150[ebp]
0346  29 45 FC				sub		dword ptr -0x4[ebp],eax
0349  EB AB				jmp		L$33
034B				L$37:
034B  3B 5D FC				cmp		ebx,dword ptr -0x4[ebp]
034E  77 3A				ja		L$40
0350  83 7D E4 00			cmp		dword ptr -0x1c[ebp],0x00000000
0354  74 12				je		L$38
0356  8B 8D B0 FE FF FF			mov		ecx,dword ptr -0x150[ebp]
035C  8B 7D FC				mov		edi,dword ptr -0x4[ebp]
035F  89 DE				mov		esi,ebx
0361  E8 00 00 00 00			call		byteswap_
0366  EB 0E				jmp		L$39
0368				L$38:
0368  8B 55 FC				mov		edx,dword ptr -0x4[ebp]
036B  8B 12				mov		edx,dword ptr [edx]
036D  8B 03				mov		eax,dword ptr [ebx]
036F  89 13				mov		dword ptr [ebx],edx
0371  8B 55 FC				mov		edx,dword ptr -0x4[ebp]
0374  89 02				mov		dword ptr [edx],eax
0376				L$39:
0376  8B 85 B0 FE FF FF			mov		eax,dword ptr -0x150[ebp]
037C  03 9D B0 FE FF FF			add		ebx,dword ptr -0x150[ebp]
0382  29 45 FC				sub		dword ptr -0x4[ebp],eax
0385  E9 22 FF FF FF			jmp		L$29
038A				L$40:
038A  8B 85 B4 FE FF FF			mov		eax,dword ptr -0x14c[ebp]
0390  0F AF 85 B0 FE FF FF		imul		eax,dword ptr -0x150[ebp]
0397  8B 95 B8 FE FF FF			mov		edx,dword ptr -0x148[ebp]
039D  89 D9				mov		ecx,ebx
039F  01 C2				add		edx,eax
03A1  8B 45 F4				mov		eax,dword ptr -0xc[ebp]
03A4  2B 4D F4				sub		ecx,dword ptr -0xc[ebp]
03A7  2B 85 B8 FE FF FF			sub		eax,dword ptr -0x148[ebp]
03AD  89 55 D4				mov		dword ptr -0x2c[ebp],edx
03B0  39 C8				cmp		eax,ecx
03B2  7D 02				jge		L$41
03B4  89 C1				mov		ecx,eax
03B6				L$41:
03B6  85 C9				test		ecx,ecx
03B8  76 2F				jbe		L$46
03BA  89 DF				mov		edi,ebx
03BC  8B B5 B8 FE FF FF			mov		esi,dword ptr -0x148[ebp]
03C2  29 CF				sub		edi,ecx
03C4  06				push		es
03C5  1E				push		ds
03C6  07				pop		es
03C7  0F B6 D1				movzx		edx,cl
03CA  C1 E9 02				shr		ecx,0x02
03CD  74 0B				je		L$43
03CF				L$42:
03CF  8B 07				mov		eax,dword ptr [edi]
03D1  87 06				xchg		dword ptr [esi],eax
03D3  AB				stosd		
03D4  83 C6 04				add		esi,0x00000004
03D7  49				dec		ecx
03D8  75 F5				jne		L$42
03DA				L$43:
03DA  80 E2 03				and		dl,0x03
03DD  74 09				je		L$45
03DF				L$44:
03DF  8A 07				mov		al,byte ptr [edi]
03E1  86 06				xchg		byte ptr [esi],al
03E3  AA				stosb		
03E4  46				inc		esi
03E5  4A				dec		edx
03E6  75 F7				jne		L$44
03E8				L$45:
03E8  07				pop		es
03E9				L$46:
03E9  8B 45 D4				mov		eax,dword ptr -0x2c[ebp]
03EC  8B 4D F8				mov		ecx,dword ptr -0x8[ebp]
03EF  2B 45 F8				sub		eax,dword ptr -0x8[ebp]
03F2  2B 4D FC				sub		ecx,dword ptr -0x4[ebp]
03F5  2B 85 B0 FE FF FF			sub		eax,dword ptr -0x150[ebp]
03FB  39 C1				cmp		ecx,eax
03FD  72 02				jb		L$47
03FF  89 C1				mov		ecx,eax
0401				L$47:
0401  85 C9				test		ecx,ecx
0403  76 2C				jbe		L$52
0405  8B 7D D4				mov		edi,dword ptr -0x2c[ebp]
0408  89 DE				mov		esi,ebx
040A  29 CF				sub		edi,ecx
040C  06				push		es
040D  1E				push		ds
040E  07				pop		es
040F  0F B6 D1				movzx		edx,cl
0412  C1 E9 02				shr		ecx,0x02
0415  74 0B				je		L$49
0417				L$48:
0417  8B 07				mov		eax,dword ptr [edi]
0419  87 06				xchg		dword ptr [esi],eax
041B  AB				stosd		
041C  83 C6 04				add		esi,0x00000004
041F  49				dec		ecx
0420  75 F5				jne		L$48
0422				L$49:
0422  80 E2 03				and		dl,0x03
0425  74 09				je		L$51
0427				L$50:
0427  8A 07				mov		al,byte ptr [edi]
0429  86 06				xchg		byte ptr [esi],al
042B  AA				stosb		
042C  46				inc		esi
042D  4A				dec		edx
042E  75 F7				jne		L$50
0430				L$51:
0430  07				pop		es
0431				L$52:
0431  8B 75 F8				mov		esi,dword ptr -0x8[ebp]
0434  8B 4D D4				mov		ecx,dword ptr -0x2c[ebp]
0437  89 DF				mov		edi,ebx
0439  8B 5D EC				mov		ebx,dword ptr -0x14[ebp]
043C  2B 7D F4				sub		edi,dword ptr -0xc[ebp]
043F  2B 75 FC				sub		esi,dword ptr -0x4[ebp]
0442  C1 E3 02				shl		ebx,0x02
0445  29 F1				sub		ecx,esi
0447  39 FE				cmp		esi,edi
0449  72 24				jb		L$53
044B  89 F0				mov		eax,esi
044D  31 D2				xor		edx,edx
044F  F7 B5 B0 FE FF FF			div		dword ptr -0x150[ebp]
0455  31 D2				xor		edx,edx
0457  89 84 2B 3C FF FF FF		mov		dword ptr -0xc4[ebx+ebp],eax
045E  89 F8				mov		eax,edi
0460  F7 B5 B0 FE FF FF			div		dword ptr -0x150[ebp]
0466  89 8C 2B BC FE FF FF		mov		dword ptr -0x144[ebx+ebp],ecx
046D  EB 3A				jmp		L$54
046F				L$53:
046F  3B BD B0 FE FF FF			cmp		edi,dword ptr -0x150[ebp]
0475  0F 86 E7 FC FF FF			jbe		L$22
047B  8B 85 B8 FE FF FF			mov		eax,dword ptr -0x148[ebp]
0481  31 D2				xor		edx,edx
0483  89 84 2B BC FE FF FF		mov		dword ptr -0x144[ebx+ebp],eax
048A  89 F8				mov		eax,edi
048C  F7 B5 B0 FE FF FF			div		dword ptr -0x150[ebp]
0492  31 D2				xor		edx,edx
0494  89 84 2B 3C FF FF FF		mov		dword ptr -0xc4[ebx+ebp],eax
049B  89 F0				mov		eax,esi
049D  F7 B5 B0 FE FF FF			div		dword ptr -0x150[ebp]
04A3  89 8D B8 FE FF FF			mov		dword ptr -0x148[ebp],ecx
04A9				L$54:
04A9  89 85 B4 FE FF FF			mov		dword ptr -0x14c[ebp],eax
04AF  FF 45 EC				inc		dword ptr -0x14[ebp]
04B2  E9 0D FC FF FF			jmp		L$12

Routine Size: 1081 bytes,    Routine Base: _TEXT + 007E

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

