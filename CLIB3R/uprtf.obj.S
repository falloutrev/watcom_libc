Module: uprtf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000A94 bytes
0000				__uprtf_:
0000  56				push		esi
0001  57				push		edi
0002  06				push		es
0003  C8 28 02 00			enter		0x0228,0x00
0007  89 DE				mov		esi,ebx
0009  89 4D F8				mov		dword ptr -0x8[ebp],ecx
000C  C7 45 FC 00 00 00 00		mov		dword ptr -0x4[ebp],0x00000000
0013  C6 45 EC 00			mov		byte ptr -0x14[ebp],0x00
0017  C7 45 E8 00 00 00 00		mov		dword ptr -0x18[ebp],0x00000000
001E  89 45 D8				mov		dword ptr -0x28[ebp],eax
0021  89 D7				mov		edi,edx
0023  EB 6E				jmp		L$6
0025				L$1:
0025  8D 5D D8				lea		ebx,-0x28[ebp]
0028  89 F2				mov		edx,esi
002A  89 F8				mov		eax,edi
002C  E8 00 00 00 00			call		getprintspecs_
0031  89 C7				mov		edi,eax
0033  66 8B 00				mov		ax,word ptr [eax]
0036  47				inc		edi
0037  47				inc		edi
0038  66 89 45 ED			mov		word ptr -0x13[ebp],ax
003C  66 85 C0				test		ax,ax
003F  0F 84 03 02 00 00			je		L$27
0045  0F B7 C0				movzx		eax,ax
0048  83 F8 6E				cmp		eax,0x0000006e
004B  0F 85 C9 00 00 00			jne		L$13
0051  8A 45 EC				mov		al,byte ptr -0x14[ebp]
0054  24 20				and		al,0x20
0056  0F B6 D0				movzx		edx,al
0059  8A 65 EC				mov		ah,byte ptr -0x14[ebp]
005C  80 E4 40				and		ah,0x40
005F  8A 45 EC				mov		al,byte ptr -0x14[ebp]
0062  24 80				and		al,0x80
0064  85 D2				test		edx,edx
0066  74 57				je		L$8
0068  0F B6 D0				movzx		edx,al
006B  85 D2				test		edx,edx
006D  74 10				je		L$3
006F				L$2:
006F  83 06 08				add		dword ptr [esi],0x00000008
0072  8B 06				mov		eax,dword ptr [esi]
0074  C4 58 F8				les		ebx,fword ptr -0x8[eax]
0077  8B 45 E8				mov		eax,dword ptr -0x18[ebp]
007A  26 89 03				mov		dword ptr es:[ebx],eax
007D  EB 14				jmp		L$6
007F				L$3:
007F  0F B6 C4				movzx		eax,ah
0082  85 C0				test		eax,eax
0084  74 2F				je		L$7
0086				L$4:
0086  83 06 04				add		dword ptr [esi],0x00000004
0089  8B 06				mov		eax,dword ptr [esi]
008B  8B 58 FC				mov		ebx,dword ptr -0x4[eax]
008E				L$5:
008E  8B 45 E8				mov		eax,dword ptr -0x18[ebp]
0091  89 03				mov		dword ptr [ebx],eax
0093				L$6:
0093  66 83 3F 00			cmp		word ptr [edi],0x0000
0097  0F 84 AB 01 00 00			je		L$27
009D  0F B7 1F				movzx		ebx,word ptr [edi]
00A0  47				inc		edi
00A1  47				inc		edi
00A2  83 FB 25				cmp		ebx,0x00000025
00A5  0F 84 7A FF FF FF			je		L$1
00AB  8D 45 D8				lea		eax,-0x28[ebp]
00AE  89 DA				mov		edx,ebx
00B0  FF 55 F8				call		dword ptr -0x8[ebp]
00B3  EB DE				jmp		L$6
00B5				L$7:
00B5  83 06 04				add		dword ptr [esi],0x00000004
00B8  8B 1E				mov		ebx,dword ptr [esi]
00BA  8B 5B FC				mov		ebx,dword ptr -0x4[ebx]
00BD  EB CF				jmp		L$5
00BF				L$8:
00BF  8A 55 EC				mov		dl,byte ptr -0x14[ebp]
00C2  80 E2 10				and		dl,0x10
00C5  0F B6 D2				movzx		edx,dl
00C8  85 D2				test		edx,edx
00CA  74 39				je		L$12
00CC  0F B6 D0				movzx		edx,al
00CF  85 D2				test		edx,edx
00D1  74 11				je		L$9
00D3  83 06 08				add		dword ptr [esi],0x00000008
00D6  8B 06				mov		eax,dword ptr [esi]
00D8  C4 58 F8				les		ebx,fword ptr -0x8[eax]
00DB  8B 45 E8				mov		eax,dword ptr -0x18[ebp]
00DE  66 26 89 03			mov		word ptr es:[ebx],ax
00E2  EB AF				jmp		L$6
00E4				L$9:
00E4  0F B6 C4				movzx		eax,ah
00E7  85 C0				test		eax,eax
00E9  74 10				je		L$11
00EB  83 06 04				add		dword ptr [esi],0x00000004
00EE  8B 1E				mov		ebx,dword ptr [esi]
00F0  8B 5B FC				mov		ebx,dword ptr -0x4[ebx]
00F3				L$10:
00F3  8B 45 E8				mov		eax,dword ptr -0x18[ebp]
00F6  66 89 03				mov		word ptr [ebx],ax
00F9  EB 98				jmp		L$6
00FB				L$11:
00FB  83 06 04				add		dword ptr [esi],0x00000004
00FE  8B 06				mov		eax,dword ptr [esi]
0100  8B 58 FC				mov		ebx,dword ptr -0x4[eax]
0103  EB EE				jmp		L$10
0105				L$12:
0105  0F B6 D0				movzx		edx,al
0108  85 D2				test		edx,edx
010A  0F 85 5F FF FF FF			jne		L$2
0110  0F B6 C4				movzx		eax,ah
0113  85 C0				test		eax,eax
0115  E9 6C FF FF FF			jmp		L$4
011A				L$13:
011A  8D 4D FC				lea		ecx,-0x4[ebp]
011D  8D 5D D8				lea		ebx,-0x28[ebp]
0120  8D 85 D8 FD FF FF			lea		eax,-0x228[ebp]
0126  89 F2				mov		edx,esi
0128  E8 00 00 00 00			call		formstring_
012D  89 C3				mov		ebx,eax
012F  8A 45 EC				mov		al,byte ptr -0x14[ebp]
0132  24 08				and		al,0x08
0134  0F B6 C0				movzx		eax,al
0137  8E C2				mov		es,edx
0139  85 C0				test		eax,eax
013B  75 1E				jne		L$15
013D  0F B7 45 EF			movzx		eax,word ptr -0x11[ebp]
0141  83 F8 20				cmp		eax,0x00000020
0144  75 15				jne		L$15
0146				L$14:
0146  FF 4D DC				dec		dword ptr -0x24[ebp]
0149  83 7D DC 00			cmp		dword ptr -0x24[ebp],0x00000000
014D  7C 0C				jl		L$15
014F  0F B7 55 EF			movzx		edx,word ptr -0x11[ebp]
0153  8D 45 D8				lea		eax,-0x28[ebp]
0156  FF 55 F8				call		dword ptr -0x8[ebp]
0159  EB EB				jmp		L$14
015B				L$15:
015B  8D 4D F1				lea		ecx,-0xf[ebp]
015E				L$16:
015E  66 83 39 00			cmp		word ptr [ecx],0x0000
0162  74 0D				je		L$17
0164  8D 45 D8				lea		eax,-0x28[ebp]
0167  0F B7 11				movzx		edx,word ptr [ecx]
016A  FF 55 F8				call		dword ptr -0x8[ebp]
016D  41				inc		ecx
016E  41				inc		ecx
016F  EB ED				jmp		L$16
0171				L$17:
0171  8B 45 E4				mov		eax,dword ptr -0x1c[ebp]
0174  FF 4D E4				dec		dword ptr -0x1c[ebp]
0177  85 C0				test		eax,eax
0179  74 0D				je		L$18
017B  BA 30 00 00 00			mov		edx,0x00000030
0180  8D 45 D8				lea		eax,-0x28[ebp]
0183  FF 55 F8				call		dword ptr -0x8[ebp]
0186  EB E9				jmp		L$17
0188				L$18:
0188  8A 45 EC				mov		al,byte ptr -0x14[ebp]
018B  24 08				and		al,0x08
018D  0F B6 C0				movzx		eax,al
0190  85 C0				test		eax,eax
0192  75 1E				jne		L$20
0194  0F B7 45 EF			movzx		eax,word ptr -0x11[ebp]
0198  83 F8 20				cmp		eax,0x00000020
019B  74 15				je		L$20
019D				L$19:
019D  FF 4D DC				dec		dword ptr -0x24[ebp]
01A0  83 7D DC 00			cmp		dword ptr -0x24[ebp],0x00000000
01A4  7C 0C				jl		L$20
01A6  0F B7 55 EF			movzx		edx,word ptr -0x11[ebp]
01AA  8D 45 D8				lea		eax,-0x28[ebp]
01AD  FF 55 F8				call		dword ptr -0x8[ebp]
01B0  EB EB				jmp		L$19
01B2				L$20:
01B2  0F B7 45 ED			movzx		eax,word ptr -0x13[ebp]
01B6  83 F8 73				cmp		eax,0x00000073
01B9  74 05				je		L$21
01BB  83 F8 53				cmp		eax,0x00000053
01BE  75 3B				jne		L$24
01C0				L$21:
01C0  8A 45 EC				mov		al,byte ptr -0x14[ebp]
01C3  24 10				and		al,0x10
01C5  0F B6 C0				movzx		eax,al
01C8  85 C0				test		eax,eax
01CA  74 17				je		L$23
01CC				L$22:
01CC  8B 45 E0				mov		eax,dword ptr -0x20[ebp]
01CF  FF 4D E0				dec		dword ptr -0x20[ebp]
01D2  85 C0				test		eax,eax
01D4  74 3D				je		L$25
01D6  8D 45 D8				lea		eax,-0x28[ebp]
01D9  26 0F B6 13			movzx		edx,byte ptr es:[ebx]
01DD  FF 55 F8				call		dword ptr -0x8[ebp]
01E0  43				inc		ebx
01E1  EB E9				jmp		L$22
01E3				L$23:
01E3  8B 45 E0				mov		eax,dword ptr -0x20[ebp]
01E6  FF 4D E0				dec		dword ptr -0x20[ebp]
01E9  85 C0				test		eax,eax
01EB  74 26				je		L$25
01ED  8D 45 D8				lea		eax,-0x28[ebp]
01F0  26 0F B7 13			movzx		edx,word ptr es:[ebx]
01F4  FF 55 F8				call		dword ptr -0x8[ebp]
01F7  43				inc		ebx
01F8  43				inc		ebx
01F9  EB E8				jmp		L$23
01FB				L$24:
01FB  8B 45 E0				mov		eax,dword ptr -0x20[ebp]
01FE  FF 4D E0				dec		dword ptr -0x20[ebp]
0201  85 C0				test		eax,eax
0203  74 0E				je		L$25
0205  8D 45 D8				lea		eax,-0x28[ebp]
0208  26 0F B7 13			movzx		edx,word ptr es:[ebx]
020C  FF 55 F8				call		dword ptr -0x8[ebp]
020F  43				inc		ebx
0210  43				inc		ebx
0211  EB E8				jmp		L$24
0213				L$25:
0213  8A 45 EC				mov		al,byte ptr -0x14[ebp]
0216  24 08				and		al,0x08
0218  0F B6 C0				movzx		eax,al
021B  85 C0				test		eax,eax
021D  0F 84 70 FE FF FF			je		L$6
0223  83 7D DC 00			cmp		dword ptr -0x24[ebp],0x00000000
0227  0F 8E 66 FE FF FF			jle		L$6
022D				L$26:
022D  8B 45 DC				mov		eax,dword ptr -0x24[ebp]
0230  FF 4D DC				dec		dword ptr -0x24[ebp]
0233  85 C0				test		eax,eax
0235  0F 84 58 FE FF FF			je		L$6
023B  BA 20 00 00 00			mov		edx,0x00000020
0240  8D 45 D8				lea		eax,-0x28[ebp]
0243  FF 55 F8				call		dword ptr -0x8[ebp]
0246  EB E5				jmp		L$26
0248				L$27:
0248  8B 45 E8				mov		eax,dword ptr -0x18[ebp]
024B  C9				leave		
024C  07				pop		es
024D  5F				pop		edi
024E  5E				pop		esi
024F  C3				ret		
0250				getprintspecs_:
0250  51				push		ecx
0251  56				push		esi
0252  89 D1				mov		ecx,edx
0254  66 C7 43 19 00 00			mov		word ptr 0x19[ebx],0x0000
025A  89 DA				mov		edx,ebx
025C  66 C7 43 17 20 00			mov		word ptr 0x17[ebx],0x0020
0262  E8 00 00 00 00			call		evalflags_
0267  C7 43 04 00 00 00 00		mov		dword ptr 0x4[ebx],0x00000000
026E  0F B7 10				movzx		edx,word ptr [eax]
0271  83 FA 30				cmp		edx,0x00000030
0274  7C 25				jl		L$29
0276  83 FA 39				cmp		edx,0x00000039
0279  7F 20				jg		L$29
027B				L$28:
027B  6B 53 04 0A			imul		edx,dword ptr 0x4[ebx],0x0000000a
027F  0F B7 30				movzx		esi,word ptr [eax]
0282  83 EE 30				sub		esi,0x00000030
0285  01 F2				add		edx,esi
0287  40				inc		eax
0288  40				inc		eax
0289  89 53 04				mov		dword ptr 0x4[ebx],edx
028C  0F B7 10				movzx		edx,word ptr [eax]
028F  83 FA 30				cmp		edx,0x00000030
0292  7C 27				jl		L$31
0294  83 FA 39				cmp		edx,0x00000039
0297  7E E2				jle		L$28
0299  EB 20				jmp		L$31
029B				L$29:
029B  0F B7 10				movzx		edx,word ptr [eax]
029E  83 FA 2A				cmp		edx,0x0000002a
02A1  75 18				jne		L$31
02A3  83 01 04				add		dword ptr [ecx],0x00000004
02A6  8B 11				mov		edx,dword ptr [ecx]
02A8  8B 52 FC				mov		edx,dword ptr -0x4[edx]
02AB  89 53 04				mov		dword ptr 0x4[ebx],edx
02AE  85 D2				test		edx,edx
02B0  7D 07				jge		L$30
02B2  F7 5B 04				neg		dword ptr 0x4[ebx]
02B5  80 4B 14 08			or		byte ptr 0x14[ebx],0x08
02B9				L$30:
02B9  40				inc		eax
02BA  40				inc		eax
02BB				L$31:
02BB  C7 43 08 FF FF FF FF		mov		dword ptr 0x8[ebx],0xffffffff
02C2  0F B7 10				movzx		edx,word ptr [eax]
02C5  83 FA 2E				cmp		edx,0x0000002e
02C8  75 48				jne		L$34
02CA  40				inc		eax
02CB  40				inc		eax
02CC  C7 43 08 00 00 00 00		mov		dword ptr 0x8[ebx],0x00000000
02D3  0F B7 10				movzx		edx,word ptr [eax]
02D6  83 FA 2A				cmp		edx,0x0000002a
02D9  75 1A				jne		L$33
02DB  83 01 04				add		dword ptr [ecx],0x00000004
02DE  8B 11				mov		edx,dword ptr [ecx]
02E0  8B 52 FC				mov		edx,dword ptr -0x4[edx]
02E3  89 53 08				mov		dword ptr 0x8[ebx],edx
02E6  85 D2				test		edx,edx
02E8  7D 07				jge		L$32
02EA  C7 43 08 FF FF FF FF		mov		dword ptr 0x8[ebx],0xffffffff
02F1				L$32:
02F1  40				inc		eax
02F2  40				inc		eax
02F3  EB 1D				jmp		L$34
02F5				L$33:
02F5  0F B7 10				movzx		edx,word ptr [eax]
02F8  83 FA 30				cmp		edx,0x00000030
02FB  7C 15				jl		L$34
02FD  83 FA 39				cmp		edx,0x00000039
0300  7F 10				jg		L$34
0302  6B 4B 08 0A			imul		ecx,dword ptr 0x8[ebx],0x0000000a
0306  83 EA 30				sub		edx,0x00000030
0309  01 D1				add		ecx,edx
030B  40				inc		eax
030C  40				inc		eax
030D  89 4B 08				mov		dword ptr 0x8[ebx],ecx
0310  EB E3				jmp		L$33
0312				L$34:
0312  66 8B 08				mov		cx,word ptr [eax]
0315  8D 50 02				lea		edx,0x2[eax]
0318  66 83 F9 4E			cmp		cx,0x004e
031C  72 1C				jb		L$36
031E  76 46				jbe		L$40
0320  66 83 F9 6C			cmp		cx,0x006c
0324  72 0B				jb		L$35
0326  76 23				jbe		L$37
0328  66 83 F9 77			cmp		cx,0x0077
032C  74 1D				je		L$37
032E  5E				pop		esi
032F  59				pop		ecx
0330  C3				ret		
0331				L$35:
0331  66 83 F9 68			cmp		cx,0x0068
0335  74 1D				je		L$38
0337  5E				pop		esi
0338  59				pop		ecx
0339  C3				ret		
033A				L$36:
033A  66 83 F9 46			cmp		cx,0x0046
033E  72 2C				jb		L$41
0340  76 1B				jbe		L$39
0342  66 83 F9 4C			cmp		cx,0x004c
0346  74 1E				je		L$40
0348  5E				pop		esi
0349  59				pop		ecx
034A  C3				ret		
034B				L$37:
034B  40				inc		eax
034C  40				inc		eax
034D  80 4B 14 20			or		byte ptr 0x14[ebx],0x20
0351  5E				pop		esi
0352  59				pop		ecx
0353  C3				ret		
0354				L$38:
0354  89 D0				mov		eax,edx
0356  80 4B 14 10			or		byte ptr 0x14[ebx],0x10
035A  5E				pop		esi
035B  59				pop		ecx
035C  C3				ret		
035D				L$39:
035D  89 D0				mov		eax,edx
035F  80 4B 14 80			or		byte ptr 0x14[ebx],0x80
0363  5E				pop		esi
0364  59				pop		ecx
0365  C3				ret		
0366				L$40:
0366  89 D0				mov		eax,edx
0368  80 4B 14 40			or		byte ptr 0x14[ebx],0x40
036C				L$41:
036C  5E				pop		esi
036D  59				pop		ecx
036E  C3				ret		
036F				evalflags_:
036F  53				push		ebx
0370  C6 42 14 00			mov		byte ptr 0x14[edx],0x00
0374				L$42:
0374  0F B7 18				movzx		ebx,word ptr [eax]
0377  83 FB 2D				cmp		ebx,0x0000002d
037A  75 06				jne		L$43
037C  80 4A 14 08			or		byte ptr 0x14[edx],0x08
0380  EB 3D				jmp		L$47
0382				L$43:
0382  83 FB 23				cmp		ebx,0x00000023
0385  75 06				jne		L$44
0387  80 4A 14 01			or		byte ptr 0x14[edx],0x01
038B  EB 32				jmp		L$47
038D				L$44:
038D  83 FB 2B				cmp		ebx,0x0000002b
0390  75 0A				jne		L$45
0392  80 4A 14 04			or		byte ptr 0x14[edx],0x04
0396  80 62 14 FD			and		byte ptr 0x14[edx],0xfd
039A  EB 23				jmp		L$47
039C				L$45:
039C  83 FB 20				cmp		ebx,0x00000020
039F  75 13				jne		L$46
03A1  8A 5A 14				mov		bl,byte ptr 0x14[edx]
03A4  80 E3 04				and		bl,0x04
03A7  0F B6 DB				movzx		ebx,bl
03AA  85 DB				test		ebx,ebx
03AC  75 11				jne		L$47
03AE  80 4A 14 02			or		byte ptr 0x14[edx],0x02
03B2  EB 0B				jmp		L$47
03B4				L$46:
03B4  83 FB 30				cmp		ebx,0x00000030
03B7  75 0A				jne		L$48
03B9  66 C7 42 17 30 00			mov		word ptr 0x17[edx],0x0030
03BF				L$47:
03BF  40				inc		eax
03C0  40				inc		eax
03C1  EB B1				jmp		L$42
03C3				L$48:
03C3  5B				pop		ebx
03C4  C3				ret		
03C5				far_strlen_:
03C5  51				push		ecx
03C6  56				push		esi
03C7  06				push		es
03C8  89 C1				mov		ecx,eax
03CA  89 DE				mov		esi,ebx
03CC  8E C2				mov		es,edx
03CE  31 C0				xor		eax,eax
03D0				L$49:
03D0  89 CB				mov		ebx,ecx
03D2  41				inc		ecx
03D3  41				inc		ecx
03D4  66 26 83 3B 00			cmp		word ptr es:[ebx],0x0000
03D9  74 07				je		L$50
03DB  39 F0				cmp		eax,esi
03DD  74 03				je		L$50
03DF  40				inc		eax
03E0  EB EE				jmp		L$49
03E2				L$50:
03E2  07				pop		es
03E3  5E				pop		esi
03E4  59				pop		ecx
03E5  C3				ret		
03E6				far_other_strlen_:
03E6  51				push		ecx
03E7  56				push		esi
03E8  57				push		edi
03E9  06				push		es
03EA  89 C1				mov		ecx,eax
03EC  89 DF				mov		edi,ebx
03EE  89 D6				mov		esi,edx
03F0  89 CB				mov		ebx,ecx
03F2  31 C0				xor		eax,eax
03F4  8E C6				mov		es,esi
03F6				L$51:
03F6  89 DA				mov		edx,ebx
03F8  43				inc		ebx
03F9  26 80 3A 00			cmp		byte ptr es:[edx],0x00
03FD  74 07				je		L$52
03FF  39 F8				cmp		eax,edi
0401  74 03				je		L$52
0403  40				inc		eax
0404  EB F0				jmp		L$51
0406				L$52:
0406  07				pop		es
0407  5F				pop		edi
0408  5E				pop		esi
0409  59				pop		ecx
040A  C3				ret		
040B				fmt4hex_:
040B  51				push		ecx
040C  56				push		esi
040D  57				push		edi
040E  C8 04 00 00			enter		0x0004,0x00
0412  89 D1				mov		ecx,edx
0414  89 DE				mov		esi,ebx
0416  BB 10 00 00 00			mov		ebx,0x00000010
041B  E8 00 00 00 00			call		_uitoa_
0420  89 C8				mov		eax,ecx
0422  89 4D FC				mov		dword ptr -0x4[ebp],ecx
0425  E8 00 00 00 00			call		_ustrlen_
042A  89 C2				mov		edx,eax
042C  8D 46 FF				lea		eax,-0x1[esi]
042F  01 D2				add		edx,edx
0431  8D 1C 00				lea		ebx,[eax+eax]
0434  01 CA				add		edx,ecx
0436  01 CB				add		ebx,ecx
0438  EB 0B				jmp		L$54
043A				L$53:
043A  4A				dec		edx
043B  4A				dec		edx
043C  66 8B 3A				mov		di,word ptr [edx]
043F  48				dec		eax
0440  66 89 3B				mov		word ptr [ebx],di
0443  4B				dec		ebx
0444  4B				dec		ebx
0445				L$54:
0445  3B 55 FC				cmp		edx,dword ptr -0x4[ebp]
0448  75 F0				jne		L$53
044A  8D 14 00				lea		edx,[eax+eax]
044D  01 CA				add		edx,ecx
044F				L$55:
044F  85 C0				test		eax,eax
0451  7C 0A				jl		L$56
0453  48				dec		eax
0454  66 C7 02 30 00			mov		word ptr [edx],0x0030
0459  4A				dec		edx
045A  4A				dec		edx
045B  EB F2				jmp		L$55
045D				L$56:
045D  66 C7 04 71 00 00			mov		word ptr [ecx+esi*2],0x0000
0463  C9				leave		
0464  5F				pop		edi
0465  5E				pop		esi
0466  59				pop		ecx
0467  C3				ret		
0468				FixedPoint_Format_:
0468  51				push		ecx
0469  56				push		esi
046A  C8 04 00 00			enter		0x0004,0x00
046E  89 C1				mov		ecx,eax
0470  89 DE				mov		esi,ebx
0472  89 55 FC				mov		dword ptr -0x4[ebp],edx
0475  85 D2				test		edx,edx
0477  7D 0B				jge		L$57
0479  F7 5D FC				neg		dword ptr -0x4[ebp]
047C  8D 48 02				lea		ecx,0x2[eax]
047F  66 C7 00 2D 00			mov		word ptr [eax],0x002d
0484				L$57:
0484  83 7E 08 FF			cmp		dword ptr 0x8[esi],0xffffffff
0488  75 07				jne		L$58
048A  C7 46 08 04 00 00 00		mov		dword ptr 0x8[esi],0x00000004
0491				L$58:
0491  0F B7 45 FE			movzx		eax,word ptr -0x2[ebp]
0495  BB 0A 00 00 00			mov		ebx,0x0000000a
049A  89 CA				mov		edx,ecx
049C  E8 00 00 00 00			call		_uitoa_
04A1  89 CB				mov		ebx,ecx
04A3				L$59:
04A3  8D 41 02				lea		eax,0x2[ecx]
04A6  66 83 39 00			cmp		word ptr [ecx],0x0000
04AA  74 04				je		L$60
04AC  89 C1				mov		ecx,eax
04AE  EB F3				jmp		L$59
04B0				L$60:
04B0  83 7E 08 00			cmp		dword ptr 0x8[esi],0x00000000
04B4  74 32				je		L$63
04B6  66 C7 01 2E 00			mov		word ptr [ecx],0x002e
04BB  31 D2				xor		edx,edx
04BD  89 C1				mov		ecx,eax
04BF  EB 1D				jmp		L$62
04C1				L$61:
04C1  66 C7 45 FE 00 00			mov		word ptr -0x2[ebp],0x0000
04C7  6B 45 FC 0A			imul		eax,dword ptr -0x4[ebp],0x0000000a
04CB  89 45 FC				mov		dword ptr -0x4[ebp],eax
04CE  66 0F B6 45 FE			movzx		ax,byte ptr -0x2[ebp]
04D3  05 30 00 00 00			add		eax,0x00000030
04D8  42				inc		edx
04D9  66 89 01				mov		word ptr [ecx],ax
04DC  41				inc		ecx
04DD  41				inc		ecx
04DE				L$62:
04DE  3B 56 08				cmp		edx,dword ptr 0x8[esi]
04E1  7C DE				jl		L$61
04E3  66 C7 01 00 00			mov		word ptr [ecx],0x0000
04E8				L$63:
04E8  8B 45 FC				mov		eax,dword ptr -0x4[ebp]
04EB  30 C0				xor		al,al
04ED  80 E4 80				and		ah,0x80
04F0  0F B7 C0				movzx		eax,ax
04F3  85 C0				test		eax,eax
04F5  0F 84 6B 00 00 00			je		L$72
04FB				L$64:
04FB  39 D9				cmp		ecx,ebx
04FD  75 45				jne		L$69
04FF  8D 4B 02				lea		ecx,0x2[ebx]
0502  66 C7 03 31 00			mov		word ptr [ebx],0x0031
0507				L$65:
0507  0F B7 11				movzx		edx,word ptr [ecx]
050A  8D 71 02				lea		esi,0x2[ecx]
050D  83 FA 30				cmp		edx,0x00000030
0510  75 04				jne		L$66
0512  89 F1				mov		ecx,esi
0514  EB F1				jmp		L$65
0516				L$66:
0516  83 FA 2E				cmp		edx,0x0000002e
0519  75 19				jne		L$68
051B  66 C7 01 30 00			mov		word ptr [ecx],0x0030
0520  8D 4E 02				lea		ecx,0x2[esi]
0523  66 C7 06 2E 00			mov		word ptr [esi],0x002e
0528				L$67:
0528  0F B7 01				movzx		eax,word ptr [ecx]
052B  83 F8 30				cmp		eax,0x00000030
052E  75 04				jne		L$68
0530  41				inc		ecx
0531  41				inc		ecx
0532  EB F4				jmp		L$67
0534				L$68:
0534  66 C7 01 30 00			mov		word ptr [ecx],0x0030
0539  41				inc		ecx
053A  41				inc		ecx
053B  66 C7 01 00 00			mov		word ptr [ecx],0x0000
0540  C9				leave		
0541  5E				pop		esi
0542  59				pop		ecx
0543  C3				ret		
0544				L$69:
0544  49				dec		ecx
0545  49				dec		ecx
0546  0F B7 01				movzx		eax,word ptr [ecx]
0549  83 F8 2E				cmp		eax,0x0000002e
054C  75 02				jne		L$70
054E  49				dec		ecx
054F  49				dec		ecx
0550				L$70:
0550  0F B7 01				movzx		eax,word ptr [ecx]
0553  83 F8 39				cmp		eax,0x00000039
0556  74 07				je		L$71
0558  66 FF 01				inc		word ptr [ecx]
055B  C9				leave		
055C  5E				pop		esi
055D  59				pop		ecx
055E  C3				ret		
055F				L$71:
055F  66 C7 01 30 00			mov		word ptr [ecx],0x0030
0564  EB 95				jmp		L$64
0566				L$72:
0566  C9				leave		
0567  5E				pop		esi
0568  59				pop		ecx
0569  C3				ret		
056A				float_format_:
056A  51				push		ecx
056B  56				push		esi
056C  57				push		edi
056D  06				push		es
056E  89 C1				mov		ecx,eax
0570  FF 15 00 00 00 00			call		dword ptr ___EFG_printf
0576  89 D6				mov		esi,edx
0578  89 C3				mov		ebx,eax
057A  8C DF				mov		edi,ds
057C  8D 81 00 01 00 00			lea		eax,0x100[ecx]
0582  8E C7				mov		es,edi
0584  81 C1 00 02 00 00			add		ecx,0x00000200
058A				L$73:
058A  48				dec		eax
058B  49				dec		ecx
058C  49				dec		ecx
058D  66 26 0F B6 10			movzx		dx,byte ptr es:[eax]
0592  66 89 11				mov		word ptr [ecx],dx
0595  39 D8				cmp		eax,ebx
0597  75 F1				jne		L$73
0599  66 39 F7				cmp		di,si
059C  75 EC				jne		L$73
059E  8C DA				mov		edx,ds
05A0  89 C8				mov		eax,ecx
05A2  07				pop		es
05A3  5F				pop		edi
05A4  5E				pop		esi
05A5  59				pop		ecx
05A6  C3				ret		
05A7				formstring_:
05A7  56				push		esi
05A8  57				push		edi
05A9  06				push		es
05AA  C8 10 00 00			enter		0x0010,0x00
05AE  89 C7				mov		edi,eax
05B0  89 DE				mov		esi,ebx
05B2  89 4D F8				mov		dword ptr -0x8[ebp],ecx
05B5  89 D0				mov		eax,edx
05B7  C7 45 FC 01 00 00 00		mov		dword ptr -0x4[ebp],0x00000001
05BE  1E				push		ds
05BF  07				pop		es
05C0  89 F9				mov		ecx,edi
05C2  66 8B 53 15			mov		dx,word ptr 0x15[ebx]
05C6  C7 43 0C 00 00 00 00		mov		dword ptr 0xc[ebx],0x00000000
05CD  66 83 FA 69			cmp		dx,0x0069
05D1  72 1F				jb		L$76
05D3  0F 86 67 00 00 00			jbe		L$81
05D9  66 83 FA 75			cmp		dx,0x0075
05DD  72 0D				jb		L$75
05DF  76 21				jbe		L$77
05E1  66 83 FA 78			cmp		dx,0x0078
05E5				L$74:
05E5  74 1B				je		L$77
05E7  E9 60 00 00 00			jmp		L$82
05EC				L$75:
05EC  66 83 FA 6F			cmp		dx,0x006f
05F0  EB F3				jmp		L$74
05F2				L$76:
05F2  66 83 FA 58			cmp		dx,0x0058
05F6  72 54				jb		L$82
05F8  76 08				jbe		L$77
05FA  66 83 FA 64			cmp		dx,0x0064
05FE  74 40				je		L$81
0600  EB 4A				jmp		L$82
0602				L$77:
0602  8A 56 14				mov		dl,byte ptr 0x14[esi]
0605  80 E2 20				and		dl,0x20
0608  0F B6 D2				movzx		edx,dl
060B  85 D2				test		edx,edx
060D  74 0A				je		L$78
060F  83 00 04				add		dword ptr [eax],0x00000004
0612  8B 18				mov		ebx,dword ptr [eax]
0614  8B 53 FC				mov		edx,dword ptr -0x4[ebx]
0617  EB 20				jmp		L$80
0619				L$78:
0619  8A 56 14				mov		dl,byte ptr 0x14[esi]
061C  80 E2 10				and		dl,0x10
061F  0F B6 D2				movzx		edx,dl
0622  85 D2				test		edx,edx
0624  74 0B				je		L$79
0626  83 00 04				add		dword ptr [eax],0x00000004
0629  8B 18				mov		ebx,dword ptr [eax]
062B  0F B7 53 FC			movzx		edx,word ptr -0x4[ebx]
062F  EB 08				jmp		L$80
0631				L$79:
0631  83 00 04				add		dword ptr [eax],0x00000004
0634  8B 18				mov		ebx,dword ptr [eax]
0636  8B 53 FC				mov		edx,dword ptr -0x4[ebx]
0639				L$80:
0639  89 55 F0				mov		dword ptr -0x10[ebp],edx
063C  80 66 14 F9			and		byte ptr 0x14[esi],0xf9
0640				L$81:
0640  83 7E 08 FF			cmp		dword ptr 0x8[esi],0xffffffff
0644  74 06				je		L$82
0646  66 C7 46 17 20 00			mov		word ptr 0x17[esi],0x0020
064C				L$82:
064C  66 8B 56 15			mov		dx,word ptr 0x15[esi]
0650  BB 0A 00 00 00			mov		ebx,0x0000000a
0655  66 83 FA 65			cmp		dx,0x0065
0659  72 6B				jb		L$85
065B  0F 86 E7 00 00 00			jbe		L$91
0661  66 83 FA 6F			cmp		dx,0x006f
0665  72 40				jb		L$84
0667  0F 86 F1 00 00 00			jbe		L$92
066D  66 83 FA 73			cmp		dx,0x0073
0671  72 25				jb		L$83
0673  0F 86 77 01 00 00			jbe		L$101
0679  66 83 FA 75			cmp		dx,0x0075
067D  0F 82 27 03 00 00			jb		L$121
0683  0F 86 47 02 00 00			jbe		L$113
0689  66 83 FA 78			cmp		dx,0x0078
068D  0F 84 12 02 00 00			je		L$111
0693  E9 12 03 00 00			jmp		L$121
0698				L$83:
0698  66 83 FA 70			cmp		dx,0x0070
069C  0F 84 51 02 00 00			je		L$114
06A2  E9 03 03 00 00			jmp		L$121
06A7				L$84:
06A7  66 83 FA 67			cmp		dx,0x0067
06AB  0F 82 6A 00 00 00			jb		L$90
06B1  0F 86 91 00 00 00			jbe		L$91
06B7  66 83 FA 69			cmp		dx,0x0069
06BB  0F 84 E6 00 00 00			je		L$97
06C1  E9 E4 02 00 00			jmp		L$121
06C6				L$85:
06C6  66 83 FA 50			cmp		dx,0x0050
06CA  72 36				jb		L$87
06CC  0F 86 21 02 00 00			jbe		L$114
06D2  66 83 FA 58			cmp		dx,0x0058
06D6  72 1B				jb		L$86
06D8  0F 86 C7 01 00 00			jbe		L$111
06DE  66 83 FA 63			cmp		dx,0x0063
06E2  0F 82 C2 02 00 00			jb		L$121
06E8  0F 86 98 02 00 00			jbe		L$119
06EE  E9 B4 00 00 00			jmp		L$97
06F3				L$86:
06F3  66 83 FA 53			cmp		dx,0x0053
06F7  0F 84 F3 00 00 00			je		L$101
06FD  E9 A8 02 00 00			jmp		L$121
0702				L$87:
0702  66 83 FA 46			cmp		dx,0x0046
0706  72 0D				jb		L$89
0708  76 11				jbe		L$90
070A  66 83 FA 47			cmp		dx,0x0047
070E				L$88:
070E  74 38				je		L$91
0710  E9 95 02 00 00			jmp		L$121
0715				L$89:
0715  66 83 FA 45			cmp		dx,0x0045
0719  EB F3				jmp		L$88
071B				L$90:
071B  8A 56 14				mov		dl,byte ptr 0x14[esi]
071E  80 E2 10				and		dl,0x10
0721  0F B6 D2				movzx		edx,dl
0724  85 D2				test		edx,edx
0726  74 20				je		L$91
0728  83 00 04				add		dword ptr [eax],0x00000004
072B  8B 00				mov		eax,dword ptr [eax]
072D  89 F3				mov		ebx,esi
072F  8B 50 FC				mov		edx,dword ptr -0x4[eax]
0732  89 F8				mov		eax,edi
0734  89 F9				mov		ecx,edi
0736  E8 00 00 00 00			call		FixedPoint_Format_
073B  BB FF FF FF FF			mov		ebx,0xffffffff
0740  8C DA				mov		edx,ds
0742  89 F8				mov		eax,edi
0744  1E				push		ds
0745  07				pop		es
0746  EB 55				jmp		L$96
0748				L$91:
0748  89 F3				mov		ebx,esi
074A  89 C2				mov		edx,eax
074C  89 F8				mov		eax,edi
074E  E8 00 00 00 00			call		float_format_
0753  BB FF FF FF FF			mov		ebx,0xffffffff
0758  8E C2				mov		es,edx
075A  89 C1				mov		ecx,eax
075C  EB 3F				jmp		L$96
075E				L$92:
075E  8A 46 14				mov		al,byte ptr 0x14[esi]
0761  24 01				and		al,0x01
0763  0F B6 C0				movzx		eax,al
0766  BB 08 00 00 00			mov		ebx,0x00000008
076B  85 C0				test		eax,eax
076D  74 07				je		L$93
076F  66 C7 07 30 00			mov		word ptr [edi],0x0030
0774  47				inc		edi
0775  47				inc		edi
0776				L$93:
0776  8B 45 F0				mov		eax,dword ptr -0x10[ebp]
0779  89 FA				mov		edx,edi
077B  E8 00 00 00 00			call		_ultoa_
0780				L$94:
0780  83 7E 08 00			cmp		dword ptr 0x8[esi],0x00000000
0784  75 0E				jne		L$95
0786  0F B7 07				movzx		eax,word ptr [edi]
0789  83 F8 30				cmp		eax,0x00000030
078C  75 06				jne		L$95
078E  66 26 C7 01 00 00			mov		word ptr es:[ecx],0x0000
0794				L$95:
0794  BB FF FF FF FF			mov		ebx,0xffffffff
0799  8C C2				mov		edx,es
079B  89 C8				mov		eax,ecx
079D				L$96:
079D  E8 00 00 00 00			call		far_strlen_
07A2  E9 2E 02 00 00			jmp		L$123
07A7				L$97:
07A7  8A 56 14				mov		dl,byte ptr 0x14[esi]
07AA  80 E2 20				and		dl,0x20
07AD  0F B6 D2				movzx		edx,dl
07B0  85 D2				test		edx,edx
07B2  74 11				je		L$99
07B4  83 00 04				add		dword ptr [eax],0x00000004
07B7  8B 00				mov		eax,dword ptr [eax]
07B9  89 FA				mov		edx,edi
07BB  8B 40 FC				mov		eax,dword ptr -0x4[eax]
07BE				L$98:
07BE  E8 00 00 00 00			call		_ultoa_
07C3  EB BB				jmp		L$94
07C5				L$99:
07C5  8A 56 14				mov		dl,byte ptr 0x14[esi]
07C8  80 E2 10				and		dl,0x10
07CB  0F B6 D2				movzx		edx,dl
07CE  85 D2				test		edx,edx
07D0  74 0D				je		L$100
07D2  83 00 04				add		dword ptr [eax],0x00000004
07D5  8B 00				mov		eax,dword ptr [eax]
07D7  89 FA				mov		edx,edi
07D9  0F BF 40 FC			movsx		eax,word ptr -0x4[eax]
07DD  EB DF				jmp		L$98
07DF				L$100:
07DF  83 00 04				add		dword ptr [eax],0x00000004
07E2  8B 00				mov		eax,dword ptr [eax]
07E4  89 FA				mov		edx,edi
07E6  8B 40 FC				mov		eax,dword ptr -0x4[eax]
07E9  E8 00 00 00 00			call		_uitoa_
07EE  EB 90				jmp		L$94
07F0				L$101:
07F0  8A 56 14				mov		dl,byte ptr 0x14[esi]
07F3  80 E2 80				and		dl,0x80
07F6  0F B6 D2				movzx		edx,dl
07F9  85 D2				test		edx,edx
07FB  74 1E				je		L$104
07FD  83 00 08				add		dword ptr [eax],0x00000008
0800  8B 00				mov		eax,dword ptr [eax]
0802  8B 48 F8				mov		ecx,dword ptr -0x8[eax]
0805  66 8B 50 FC			mov		dx,word ptr -0x4[eax]
0809  85 C9				test		ecx,ecx
080B  75 05				jne		L$102
080D  66 85 D2				test		dx,dx
0810  74 04				je		L$103
0812				L$102:
0812  8E C2				mov		es,edx
0814  EB 31				jmp		L$107
0816				L$103:
0816  8B 4D F8				mov		ecx,dword ptr -0x8[ebp]
0819  EB 2A				jmp		L$106
081B				L$104:
081B  8A 56 14				mov		dl,byte ptr 0x14[esi]
081E  80 E2 40				and		dl,0x40
0821  0F B6 D2				movzx		edx,dl
0824  85 D2				test		edx,edx
0826  74 0E				je		L$105
0828  83 00 04				add		dword ptr [eax],0x00000004
082B  8B 00				mov		eax,dword ptr [eax]
082D  8B 48 FC				mov		ecx,dword ptr -0x4[eax]
0830  85 C9				test		ecx,ecx
0832  75 11				jne		L$106
0834  EB E0				jmp		L$103
0836				L$105:
0836  83 00 04				add		dword ptr [eax],0x00000004
0839  8B 00				mov		eax,dword ptr [eax]
083B  8B 48 FC				mov		ecx,dword ptr -0x4[eax]
083E  85 C9				test		ecx,ecx
0840  75 03				jne		L$106
0842  8B 4D F8				mov		ecx,dword ptr -0x8[ebp]
0845				L$106:
0845  1E				push		ds
0846  07				pop		es
0847				L$107:
0847  C7 45 FC 00 00 00 00		mov		dword ptr -0x4[ebp],0x00000000
084E  0F B7 46 15			movzx		eax,word ptr 0x15[esi]
0852  80 66 14 F9			and		byte ptr 0x14[esi],0xf9
0856  83 F8 53				cmp		eax,0x00000053
0859  75 21				jne		L$109
085B  8A 46 14				mov		al,byte ptr 0x14[esi]
085E  24 10				and		al,0x10
0860  0F B6 C0				movzx		eax,al
0863  85 C0				test		eax,eax
0865  74 0A				je		L$108
0867  26 0F B6 01			movzx		eax,byte ptr es:[ecx]
086B  41				inc		ecx
086C  E9 64 01 00 00			jmp		L$123
0871				L$108:
0871  26 0F B7 01			movzx		eax,word ptr es:[ecx]
0875  41				inc		ecx
0876  41				inc		ecx
0877  E9 59 01 00 00			jmp		L$123
087C				L$109:
087C  8A 46 14				mov		al,byte ptr 0x14[esi]
087F  24 10				and		al,0x10
0881  0F B6 C0				movzx		eax,al
0884  85 C0				test		eax,eax
0886  74 11				je		L$110
0888  8C C2				mov		edx,es
088A  89 C8				mov		eax,ecx
088C  8B 5E 08				mov		ebx,dword ptr 0x8[esi]
088F  E8 00 00 00 00			call		far_other_strlen_
0894  E9 3C 01 00 00			jmp		L$123
0899				L$110:
0899  8C C2				mov		edx,es
089B  89 C8				mov		eax,ecx
089D  8B 5E 08				mov		ebx,dword ptr 0x8[esi]
08A0  E9 F8 FE FF FF			jmp		L$96
08A5				L$111:
08A5  8A 46 14				mov		al,byte ptr 0x14[esi]
08A8  24 01				and		al,0x01
08AA  0F B6 C0				movzx		eax,al
08AD  85 C0				test		eax,eax
08AF  74 1A				je		L$112
08B1  83 7D F0 00			cmp		dword ptr -0x10[ebp],0x00000000
08B5  74 14				je		L$112
08B7  66 C7 46 19 30 00			mov		word ptr 0x19[esi],0x0030
08BD  66 8B 46 15			mov		ax,word ptr 0x15[esi]
08C1  66 C7 46 1D 00 00			mov		word ptr 0x1d[esi],0x0000
08C7  66 89 46 1B			mov		word ptr 0x1b[esi],ax
08CB				L$112:
08CB  BB 10 00 00 00			mov		ebx,0x00000010
08D0				L$113:
08D0  8B 45 F0				mov		eax,dword ptr -0x10[ebp]
08D3  89 FA				mov		edx,edi
08D5  E8 00 00 00 00			call		_uultoa_
08DA  0F B7 46 15			movzx		eax,word ptr 0x15[esi]
08DE  83 F8 58				cmp		eax,0x00000058
08E1  0F 85 99 FE FF FF			jne		L$94
08E7  89 F8				mov		eax,edi
08E9  E8 00 00 00 00			call		zupstr_
08EE  E9 8D FE FF FF			jmp		L$94
08F3				L$114:
08F3  83 7E 04 00			cmp		dword ptr 0x4[esi],0x00000000
08F7  75 1D				jne		L$116
08F9  8A 56 14				mov		dl,byte ptr 0x14[esi]
08FC  80 E2 80				and		dl,0x80
08FF  0F B6 D2				movzx		edx,dl
0902  85 D2				test		edx,edx
0904  74 09				je		L$115
0906  C7 46 04 0D 00 00 00		mov		dword ptr 0x4[esi],0x0000000d
090D  EB 07				jmp		L$116
090F				L$115:
090F  C7 46 04 08 00 00 00		mov		dword ptr 0x4[esi],0x00000008
0916				L$116:
0916  80 66 14 F9			and		byte ptr 0x14[esi],0xf9
091A  83 00 04				add		dword ptr [eax],0x00000004
091D  8B 18				mov		ebx,dword ptr [eax]
091F  8B 53 FC				mov		edx,dword ptr -0x4[ebx]
0922  89 55 F4				mov		dword ptr -0xc[ebp],edx
0925  8A 56 14				mov		dl,byte ptr 0x14[esi]
0928  80 E2 80				and		dl,0x80
092B  0F B6 D2				movzx		edx,dl
092E  85 D2				test		edx,edx
0930  74 2C				je		L$117
0932  83 C3 04				add		ebx,0x00000004
0935  89 18				mov		dword ptr [eax],ebx
0937  89 FA				mov		edx,edi
0939  8B 43 FC				mov		eax,dword ptr -0x4[ebx]
093C  BB 04 00 00 00			mov		ebx,0x00000004
0941  25 FF FF 00 00			and		eax,0x0000ffff
0946  E8 00 00 00 00			call		fmt4hex_
094B  BB 08 00 00 00			mov		ebx,0x00000008
0950  8B 45 F4				mov		eax,dword ptr -0xc[ebp]
0953  8D 57 0A				lea		edx,0xa[edi]
0956  66 C7 47 08 3A 00			mov		word ptr 0x8[edi],0x003a
095C  EB 0A				jmp		L$118
095E				L$117:
095E  BB 08 00 00 00			mov		ebx,0x00000008
0963  8B 45 F4				mov		eax,dword ptr -0xc[ebp]
0966  89 FA				mov		edx,edi
0968				L$118:
0968  E8 00 00 00 00			call		fmt4hex_
096D  0F B7 46 15			movzx		eax,word ptr 0x15[esi]
0971  83 F8 50				cmp		eax,0x00000050
0974  0F 85 1A FE FF FF			jne		L$95
097A  89 F8				mov		eax,edi
097C  E8 00 00 00 00			call		zupstr_
0981  E9 0E FE FF FF			jmp		L$95
0986				L$119:
0986  83 00 04				add		dword ptr [eax],0x00000004
0989  8B 00				mov		eax,dword ptr [eax]
098B  66 8B 40 FC			mov		ax,word ptr -0x4[eax]
098F  66 89 07				mov		word ptr [edi],ax
0992  8A 46 14				mov		al,byte ptr 0x14[esi]
0995  24 10				and		al,0x10
0997  0F B6 C0				movzx		eax,al
099A  85 C0				test		eax,eax
099C  74 04				je		L$120
099E  C6 47 01 00			mov		byte ptr 0x1[edi],0x00
09A2				L$120:
09A2  66 C7 47 02 00 00			mov		word ptr 0x2[edi],0x0000
09A8  EB 14				jmp		L$122
09AA				L$121:
09AA  C7 46 04 00 00 00 00		mov		dword ptr 0x4[esi],0x00000000
09B1  66 8B 46 15			mov		ax,word ptr 0x15[esi]
09B5  66 C7 47 02 00 00			mov		word ptr 0x2[edi],0x0000
09BB  66 89 07				mov		word ptr [edi],ax
09BE				L$122:
09BE  C7 45 FC 00 00 00 00		mov		dword ptr -0x4[ebp],0x00000000
09C5  C7 46 08 01 00 00 00		mov		dword ptr 0x8[esi],0x00000001
09CC  B8 01 00 00 00			mov		eax,0x00000001
09D1  80 66 14 F9			and		byte ptr 0x14[esi],0xf9
09D5				L$123:
09D5  83 7D FC 00			cmp		dword ptr -0x4[ebp],0x00000000
09D9  74 54				je		L$129
09DB  26 0F B7 11			movzx		edx,word ptr es:[ecx]
09DF  83 FA 2D				cmp		edx,0x0000002d
09E2  75 0B				jne		L$124
09E4  41				inc		ecx
09E5  41				inc		ecx
09E6  66 C7 46 19 2D 00			mov		word ptr 0x19[esi],0x002d
09EC  48				dec		eax
09ED  EB 28				jmp		L$126
09EF				L$124:
09EF  8A 56 14				mov		dl,byte ptr 0x14[esi]
09F2  80 E2 02				and		dl,0x02
09F5  0F B6 D2				movzx		edx,dl
09F8  85 D2				test		edx,edx
09FA  74 08				je		L$125
09FC  66 C7 46 19 20 00			mov		word ptr 0x19[esi],0x0020
0A02  EB 13				jmp		L$126
0A04				L$125:
0A04  8A 56 14				mov		dl,byte ptr 0x14[esi]
0A07  80 E2 04				and		dl,0x04
0A0A  0F B6 D2				movzx		edx,dl
0A0D  85 D2				test		edx,edx
0A0F  74 0C				je		L$127
0A11  66 C7 46 19 2B 00			mov		word ptr 0x19[esi],0x002b
0A17				L$126:
0A17  66 C7 46 1B 00 00			mov		word ptr 0x1b[esi],0x0000
0A1D				L$127:
0A1D  3B 46 08				cmp		eax,dword ptr 0x8[esi]
0A20  7E 05				jle		L$128
0A22  89 46 08				mov		dword ptr 0x8[esi],eax
0A25  EB 08				jmp		L$129
0A27				L$128:
0A27  8B 5E 08				mov		ebx,dword ptr 0x8[esi]
0A2A  29 C3				sub		ebx,eax
0A2C  89 5E 0C				mov		dword ptr 0xc[esi],ebx
0A2F				L$129:
0A2F  0F B7 56 17			movzx		edx,word ptr 0x17[esi]
0A33  83 FA 2A				cmp		edx,0x0000002a
0A36  75 0A				jne		L$130
0A38  66 C7 46 19 00 00			mov		word ptr 0x19[esi],0x0000
0A3E  80 66 14 F9			and		byte ptr 0x14[esi],0xf9
0A42				L$130:
0A42  83 7E 08 FF			cmp		dword ptr 0x8[esi],0xffffffff
0A46  74 05				je		L$131
0A48  3B 46 08				cmp		eax,dword ptr 0x8[esi]
0A4B  7D 0C				jge		L$132
0A4D				L$131:
0A4D  0F B7 56 15			movzx		edx,word ptr 0x15[esi]
0A51  83 FA 63				cmp		edx,0x00000063
0A54  74 03				je		L$132
0A56  89 46 08				mov		dword ptr 0x8[esi],eax
0A59				L$132:
0A59  BB FF FF FF FF			mov		ebx,0xffffffff
0A5E  8D 46 19				lea		eax,0x19[esi]
0A61  8C DA				mov		edx,ds
0A63  E8 00 00 00 00			call		far_strlen_
0A68  03 46 08				add		eax,dword ptr 0x8[esi]
0A6B  03 46 0C				add		eax,dword ptr 0xc[esi]
0A6E  8C C2				mov		edx,es
0A70  29 46 04				sub		dword ptr 0x4[esi],eax
0A73  89 C8				mov		eax,ecx
0A75  C9				leave		
0A76  07				pop		es
0A77  5F				pop		edi
0A78  5E				pop		esi
0A79  C3				ret		
0A7A				zupstr_:
0A7A  52				push		edx
0A7B  89 C2				mov		edx,eax
0A7D				L$133:
0A7D  66 83 3A 00			cmp		word ptr [edx],0x0000
0A81  74 0F				je		L$134
0A83  0F B7 02				movzx		eax,word ptr [edx]
0A86  E8 00 00 00 00			call		_utoupper_
0A8B  66 89 02				mov		word ptr [edx],ax
0A8E  42				inc		edx
0A8F  42				inc		edx
0A90  EB EB				jmp		L$133
0A92				L$134:
0A92  5A				pop		edx
0A93  C3				ret		

Routine Size: 2708 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

