Module: uscnf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000A47 bytes
0000				cget_:
0000  52				push		edx
0001  89 C2				mov		edx,eax
0003  FF 12				call		dword ptr [edx]
0005  5A				pop		edx
0006  C3				ret		
0007				uncget_:
0007  53				push		ebx
0008  89 D3				mov		ebx,edx
000A  FF 53 04				call		dword ptr 0x4[ebx]
000D  5B				pop		ebx
000E  C3				ret		

Routine Size: 15 bytes,    Routine Base: _TEXT + 0000

000F				__uscnf_:
000F  51				push		ecx
0010  56				push		esi
0011  57				push		edi
0012  C8 0C 00 00			enter		0x000c,0x00
0016  89 C6				mov		esi,eax
0018  89 55 F4				mov		dword ptr -0xc[ebp],edx
001B  89 DF				mov		edi,ebx
001D  C7 45 F8 00 00 00 00		mov		dword ptr -0x8[ebp],0x00000000
0024  C7 45 FC 00 00 00 00		mov		dword ptr -0x4[ebp],0x00000000
002B  80 60 10 FD			and		byte ptr 0x10[eax],0xfd
002F				L$1:
002F  8B 55 F4				mov		edx,dword ptr -0xc[ebp]
0032  83 45 F4 02			add		dword ptr -0xc[ebp],0x00000002
0036  0F B7 12				movzx		edx,word ptr [edx]
0039  85 D2				test		edx,edx
003B  0F 84 DF 01 00 00			je		L$29
0041  89 D0				mov		eax,edx
0043  E8 00 00 00 00			call		_uisspace_
0048  85 C0				test		eax,eax
004A  74 0F				je		L$2
004C  89 F0				mov		eax,esi
004E  E8 00 00 00 00			call		scan_white_
0053  01 45 FC				add		dword ptr -0x4[ebp],eax
0056  E9 8B 01 00 00			jmp		L$28
005B				L$2:
005B  83 FA 25				cmp		edx,0x00000025
005E  74 25				je		L$4
0060  89 F0				mov		eax,esi
0062  E8 00 00 00 00			call		cget_
0067  39 D0				cmp		eax,edx
0069  0F 84 74 01 00 00			je		L$27
006F				L$3:
006F  F6 46 10 02			test		byte ptr 0x10[esi],0x02
0073  0F 85 A7 01 00 00			jne		L$29
0079  89 F2				mov		edx,esi
007B  E8 00 00 00 00			call		uncget_
0080  E9 9B 01 00 00			jmp		L$29
0085				L$4:
0085  8B 45 F4				mov		eax,dword ptr -0xc[ebp]
0088  89 F2				mov		edx,esi
008A  E8 00 00 00 00			call		get_opt_
008F  89 45 F4				mov		dword ptr -0xc[ebp],eax
0092  89 C2				mov		edx,eax
0094  0F B7 00				movzx		eax,word ptr [eax]
0097  85 C0				test		eax,eax
0099  74 05				je		L$5
009B  42				inc		edx
009C  42				inc		edx
009D  89 55 F4				mov		dword ptr -0xc[ebp],edx
00A0				L$5:
00A0  83 F8 65				cmp		eax,0x00000065
00A3  72 55				jb		L$9
00A5  83 F8 67				cmp		eax,0x00000067
00A8  0F 86 D8 00 00 00			jbe		L$20
00AE  83 F8 70				cmp		eax,0x00000070
00B1  72 2D				jb		L$7
00B3  0F 86 C1 00 00 00			jbe		L$19
00B9  83 F8 75				cmp		eax,0x00000075
00BC  72 14				jb		L$6
00BE  0F 86 A9 00 00 00			jbe		L$18
00C4  83 F8 78				cmp		eax,0x00000078
00C7  0F 84 AD 00 00 00			je		L$19
00CD  E9 14 01 00 00			jmp		L$28
00D2				L$6:
00D2  83 F8 73				cmp		eax,0x00000073
00D5  0F 84 B6 00 00 00			je		L$21
00DB  E9 06 01 00 00			jmp		L$28
00E0				L$7:
00E0  83 F8 6E				cmp		eax,0x0000006e
00E3  72 0B				jb		L$8
00E5  0F 86 DA 00 00 00			jbe		L$25
00EB  E9 71 00 00 00			jmp		L$17
00F0				L$8:
00F0  83 F8 69				cmp		eax,0x00000069
00F3  74 5F				je		L$16
00F5  E9 EC 00 00 00			jmp		L$28
00FA				L$9:
00FA  83 F8 58				cmp		eax,0x00000058
00FD  72 21				jb		L$11
00FF  0F 86 75 00 00 00			jbe		L$19
0105  83 F8 63				cmp		eax,0x00000063
0108  72 08				jb		L$10
010A  0F 86 9A 00 00 00			jbe		L$23
0110  EB 2D				jmp		L$13
0112				L$10:
0112  83 F8 5B				cmp		eax,0x0000005b
0115  0F 84 81 00 00 00			je		L$22
011B  E9 C6 00 00 00			jmp		L$28
0120				L$11:
0120  83 F8 45				cmp		eax,0x00000045
0123  72 0C				jb		L$12
0125  76 5F				jbe		L$20
0127  83 F8 47				cmp		eax,0x00000047
012A  74 5A				je		L$20
012C  E9 B5 00 00 00			jmp		L$28
0131				L$12:
0131  83 F8 25				cmp		eax,0x00000025
0134  0F 84 99 00 00 00			je		L$26
013A  E9 A7 00 00 00			jmp		L$28
013F				L$13:
013F  B9 01 00 00 00			mov		ecx,0x00000001
0144  BB 0A 00 00 00			mov		ebx,0x0000000a
0149				L$14:
0149  89 FA				mov		edx,edi
014B  89 F0				mov		eax,esi
014D				L$15:
014D  E8 00 00 00 00			call		scan_int_
0152  EB 5F				jmp		L$24
0154				L$16:
0154  B9 01 00 00 00			mov		ecx,0x00000001
0159  89 FA				mov		edx,edi
015B  89 F0				mov		eax,esi
015D  31 DB				xor		ebx,ebx
015F  EB EC				jmp		L$15
0161				L$17:
0161  B9 01 00 00 00			mov		ecx,0x00000001
0166  BB 08 00 00 00			mov		ebx,0x00000008
016B  EB DC				jmp		L$14
016D				L$18:
016D  BB 0A 00 00 00			mov		ebx,0x0000000a
0172  89 FA				mov		edx,edi
0174  89 F0				mov		eax,esi
0176  31 C9				xor		ecx,ecx
0178  EB D3				jmp		L$15
017A				L$19:
017A  B9 01 00 00 00			mov		ecx,0x00000001
017F  BB 10 00 00 00			mov		ebx,0x00000010
0184  EB C3				jmp		L$14
0186				L$20:
0186  89 FA				mov		edx,edi
0188  89 F0				mov		eax,esi
018A  E8 00 00 00 00			call		scan_float_
018F  EB 22				jmp		L$24
0191				L$21:
0191  89 FA				mov		edx,edi
0193  89 F0				mov		eax,esi
0195  E8 00 00 00 00			call		scan_string_
019A  EB 17				jmp		L$24
019C				L$22:
019C  8D 5D F4				lea		ebx,-0xc[ebp]
019F  89 FA				mov		edx,edi
01A1  89 F0				mov		eax,esi
01A3  E8 00 00 00 00			call		scan_arb_
01A8  EB 09				jmp		L$24
01AA				L$23:
01AA  89 FA				mov		edx,edi
01AC  89 F0				mov		eax,esi
01AE  E8 00 00 00 00			call		scan_char_
01B3				L$24:
01B3  85 C0				test		eax,eax
01B5  7E 69				jle		L$29
01B7  01 45 FC				add		dword ptr -0x4[ebp],eax
01BA  F6 46 10 01			test		byte ptr 0x10[esi],0x01
01BE  74 26				je		L$28
01C0  FF 45 F8				inc		dword ptr -0x8[ebp]
01C3  EB 21				jmp		L$28
01C5				L$25:
01C5  8B 5D FC				mov		ebx,dword ptr -0x4[ebp]
01C8  89 FA				mov		edx,edi
01CA  89 F0				mov		eax,esi
01CC  E8 00 00 00 00			call		report_scan_
01D1  EB 13				jmp		L$28
01D3				L$26:
01D3  89 F0				mov		eax,esi
01D5  E8 00 00 00 00			call		cget_
01DA  83 F8 25				cmp		eax,0x00000025
01DD  0F 85 8C FE FF FF			jne		L$3
01E3				L$27:
01E3  FF 45 FC				inc		dword ptr -0x4[ebp]
01E6				L$28:
01E6  F6 46 10 02			test		byte ptr 0x10[esi],0x02
01EA  0F 84 3F FE FF FF			je		L$1
01F0  8B 45 F4				mov		eax,dword ptr -0xc[ebp]
01F3  0F B7 00				movzx		eax,word ptr [eax]
01F6  83 F8 25				cmp		eax,0x00000025
01F9  75 25				jne		L$29
01FB  83 45 F4 02			add		dword ptr -0xc[ebp],0x00000002
01FF  89 F2				mov		edx,esi
0201  8B 45 F4				mov		eax,dword ptr -0xc[ebp]
0204  E8 00 00 00 00			call		get_opt_
0209  89 45 F4				mov		dword ptr -0xc[ebp],eax
020C  0F B7 00				movzx		eax,word ptr [eax]
020F  83 F8 6E				cmp		eax,0x0000006e
0212  75 0C				jne		L$29
0214  8B 5D FC				mov		ebx,dword ptr -0x4[ebp]
0217  89 FA				mov		edx,edi
0219  89 F0				mov		eax,esi
021B  E8 00 00 00 00			call		report_scan_
0220				L$29:
0220  83 7D F8 00			cmp		dword ptr -0x8[ebp],0x00000000
0224  75 10				jne		L$30
0226  F6 46 10 02			test		byte ptr 0x10[esi],0x02
022A  74 0A				je		L$30
022C  B8 FF FF FF FF			mov		eax,0xffffffff
0231  C9				leave		
0232  5F				pop		edi
0233  5E				pop		esi
0234  59				pop		ecx
0235  C3				ret		
0236				L$30:
0236  8B 45 F8				mov		eax,dword ptr -0x8[ebp]
0239  C9				leave		
023A  5F				pop		edi
023B  5E				pop		esi
023C  59				pop		ecx
023D  C3				ret		
023E				get_opt_:
023E  53				push		ebx
023F  51				push		ecx
0240  56				push		esi
0241  89 C3				mov		ebx,eax
0243  C7 42 0C FF FF FF FF		mov		dword ptr 0xc[edx],0xffffffff
024A  80 4A 10 01			or		byte ptr 0x10[edx],0x01
024E  80 62 10 03			and		byte ptr 0x10[edx],0x03
0252  0F B7 00				movzx		eax,word ptr [eax]
0255  83 F8 2A				cmp		eax,0x0000002a
0258  75 06				jne		L$31
025A  43				inc		ebx
025B  43				inc		ebx
025C  80 62 10 FE			and		byte ptr 0x10[edx],0xfe
0260				L$31:
0260  0F B7 0B				movzx		ecx,word ptr [ebx]
0263  89 C8				mov		eax,ecx
0265  E8 00 00 00 00			call		_uisdigit_
026A  85 C0				test		eax,eax
026C  74 1D				je		L$33
026E  31 F6				xor		esi,esi
0270				L$32:
0270  6B F6 0A				imul		esi,0x0000000a
0273  83 E9 30				sub		ecx,0x00000030
0276  43				inc		ebx
0277  43				inc		ebx
0278  01 CE				add		esi,ecx
027A  0F B7 0B				movzx		ecx,word ptr [ebx]
027D  89 C8				mov		eax,ecx
027F  E8 00 00 00 00			call		_uisdigit_
0284  85 C0				test		eax,eax
0286  75 E8				jne		L$32
0288  89 72 0C				mov		dword ptr 0xc[edx],esi
028B				L$33:
028B  0F B7 03				movzx		eax,word ptr [ebx]
028E  8D 4B 02				lea		ecx,0x2[ebx]
0291  83 F8 4E				cmp		eax,0x0000004e
0294  75 08				jne		L$34
0296  89 CB				mov		ebx,ecx
0298  80 4A 10 08			or		byte ptr 0x10[edx],0x08
029C  EB 0B				jmp		L$35
029E				L$34:
029E  83 F8 46				cmp		eax,0x00000046
02A1  75 06				jne		L$35
02A3  89 CB				mov		ebx,ecx
02A5  80 4A 10 04			or		byte ptr 0x10[edx],0x04
02A9				L$35:
02A9  66 8B 03				mov		ax,word ptr [ebx]
02AC  8D 4B 02				lea		ecx,0x2[ebx]
02AF  66 3D 68 00			cmp		ax,0x0068
02B3  72 12				jb		L$36
02B5  76 18				jbe		L$37
02B7  66 3D 6C 00			cmp		ax,0x006c
02BB  72 28				jb		L$40
02BD  76 18				jbe		L$38
02BF  66 3D 77 00			cmp		ax,0x0077
02C3  74 12				je		L$38
02C5  EB 1E				jmp		L$40
02C7				L$36:
02C7  66 3D 4C 00			cmp		ax,0x004c
02CB  74 12				je		L$39
02CD  EB 16				jmp		L$40
02CF				L$37:
02CF  89 CB				mov		ebx,ecx
02D1  80 4A 10 10			or		byte ptr 0x10[edx],0x10
02D5  EB 0E				jmp		L$40
02D7				L$38:
02D7  43				inc		ebx
02D8  43				inc		ebx
02D9  80 4A 10 20			or		byte ptr 0x10[edx],0x20
02DD  EB 06				jmp		L$40
02DF				L$39:
02DF  89 CB				mov		ebx,ecx
02E1  80 4A 10 40			or		byte ptr 0x10[edx],0x40
02E5				L$40:
02E5  89 D8				mov		eax,ebx
02E7  5E				pop		esi
02E8  59				pop		ecx
02E9  5B				pop		ebx
02EA  C3				ret		
02EB				scan_white_:
02EB  53				push		ebx
02EC  51				push		ecx
02ED  52				push		edx
02EE  89 C2				mov		edx,eax
02F0  31 C9				xor		ecx,ecx
02F2				L$41:
02F2  89 D0				mov		eax,edx
02F4  E8 00 00 00 00			call		cget_
02F9  89 C3				mov		ebx,eax
02FB  E8 00 00 00 00			call		_uisspace_
0300  85 C0				test		eax,eax
0302  74 03				je		L$42
0304  41				inc		ecx
0305  EB EB				jmp		L$41
0307				L$42:
0307  F6 42 10 02			test		byte ptr 0x10[edx],0x02
030B  75 07				jne		L$43
030D  89 D8				mov		eax,ebx
030F  E8 00 00 00 00			call		uncget_
0314				L$43:
0314  89 C8				mov		eax,ecx
0316  5A				pop		edx
0317  59				pop		ecx
0318  5B				pop		ebx
0319  C3				ret		
031A				scan_char_:
031A  53				push		ebx
031B  51				push		ecx
031C  56				push		esi
031D  06				push		es
031E  C8 04 00 00			enter		0x0004,0x00
0322  89 C3				mov		ebx,eax
0324  F6 40 10 01			test		byte ptr 0x10[eax],0x01
0328  74 1E				je		L$45
032A  F6 40 10 04			test		byte ptr 0x10[eax],0x04
032E  74 0A				je		L$44
0330  83 02 08				add		dword ptr [edx],0x00000008
0333  8B 0A				mov		ecx,dword ptr [edx]
0335  C4 49 F8				les		ecx,fword ptr -0x8[ecx]
0338  EB 0E				jmp		L$45
033A				L$44:
033A  F6 40 10 08			test		byte ptr 0x10[eax],0x08
033E  83 02 04				add		dword ptr [edx],0x00000004
0341  8B 0A				mov		ecx,dword ptr [edx]
0343  1E				push		ds
0344  07				pop		es
0345  8B 49 FC				mov		ecx,dword ptr -0x4[ecx]
0348				L$45:
0348  8B 53 0C				mov		edx,dword ptr 0xc[ebx]
034B  31 F6				xor		esi,esi
034D  83 FA FF				cmp		edx,0xffffffff
0350  75 05				jne		L$46
0352  BA 01 00 00 00			mov		edx,0x00000001
0357				L$46:
0357  85 D2				test		edx,edx
0359  7E 32				jle		L$48
035B  89 D8				mov		eax,ebx
035D  E8 00 00 00 00			call		cget_
0362  89 45 FC				mov		dword ptr -0x4[ebp],eax
0365  F6 43 10 02			test		byte ptr 0x10[ebx],0x02
0369  75 22				jne		L$48
036B  46				inc		esi
036C  4A				dec		edx
036D  F6 43 10 01			test		byte ptr 0x10[ebx],0x01
0371  74 E4				je		L$46
0373  F6 43 10 10			test		byte ptr 0x10[ebx],0x10
0377  74 09				je		L$47
0379  8A 45 FC				mov		al,byte ptr -0x4[ebp]
037C  26 88 01				mov		byte ptr es:[ecx],al
037F  41				inc		ecx
0380  EB D5				jmp		L$46
0382				L$47:
0382  8B 45 FC				mov		eax,dword ptr -0x4[ebp]
0385  66 26 89 01			mov		word ptr es:[ecx],ax
0389  41				inc		ecx
038A  41				inc		ecx
038B  EB CA				jmp		L$46
038D				L$48:
038D  89 F0				mov		eax,esi
038F  C9				leave		
0390  07				pop		es
0391  5E				pop		esi
0392  59				pop		ecx
0393  5B				pop		ebx
0394  C3				ret		
0395				scan_string_:
0395  53				push		ebx
0396  51				push		ecx
0397  56				push		esi
0398  06				push		es
0399  C8 08 00 00			enter		0x0008,0x00
039D  89 C3				mov		ebx,eax
039F  F6 40 10 20			test		byte ptr 0x10[eax],0x20
03A3  75 0C				jne		L$49
03A5  F6 40 10 10			test		byte ptr 0x10[eax],0x10
03A9  74 06				je		L$49
03AB  C6 45 FC 01			mov		byte ptr -0x4[ebp],0x01
03AF  EB 04				jmp		L$50
03B1				L$49:
03B1  C6 45 FC 02			mov		byte ptr -0x4[ebp],0x02
03B5				L$50:
03B5  F6 43 10 01			test		byte ptr 0x10[ebx],0x01
03B9  74 1E				je		L$52
03BB  F6 43 10 04			test		byte ptr 0x10[ebx],0x04
03BF  74 0A				je		L$51
03C1  83 02 08				add		dword ptr [edx],0x00000008
03C4  8B 0A				mov		ecx,dword ptr [edx]
03C6  C4 49 F8				les		ecx,fword ptr -0x8[ecx]
03C9  EB 0E				jmp		L$52
03CB				L$51:
03CB  F6 43 10 08			test		byte ptr 0x10[ebx],0x08
03CF  83 02 04				add		dword ptr [edx],0x00000004
03D2  8B 0A				mov		ecx,dword ptr [edx]
03D4  1E				push		ds
03D5  07				pop		es
03D6  8B 49 FC				mov		ecx,dword ptr -0x4[ecx]
03D9				L$52:
03D9  31 F6				xor		esi,esi
03DB				L$53:
03DB  89 D8				mov		eax,ebx
03DD  E8 00 00 00 00			call		cget_
03E2  89 45 F8				mov		dword ptr -0x8[ebp],eax
03E5  E8 00 00 00 00			call		_uisspace_
03EA  85 C0				test		eax,eax
03EC  74 03				je		L$54
03EE  46				inc		esi
03EF  EB EA				jmp		L$53
03F1				L$54:
03F1  F6 43 10 02			test		byte ptr 0x10[ebx],0x02
03F5  74 04				je		L$55
03F7  31 F6				xor		esi,esi
03F9  EB 54				jmp		L$61
03FB				L$55:
03FB  8B 43 0C				mov		eax,dword ptr 0xc[ebx]
03FE  8D 50 FF				lea		edx,-0x1[eax]
0401  89 53 0C				mov		dword ptr 0xc[ebx],edx
0404  85 C0				test		eax,eax
0406  74 3D				je		L$60
0408				L$56:
0408  46				inc		esi
0409  F6 43 10 01			test		byte ptr 0x10[ebx],0x01
040D  74 1E				je		L$59
040F  0F B6 45 FC			movzx		eax,byte ptr -0x4[ebp]
0413  83 F8 01				cmp		eax,0x00000001
0416  75 08				jne		L$57
0418  8A 45 F8				mov		al,byte ptr -0x8[ebp]
041B  26 88 01				mov		byte ptr es:[ecx],al
041E  EB 07				jmp		L$58
0420				L$57:
0420  8B 45 F8				mov		eax,dword ptr -0x8[ebp]
0423  66 26 89 01			mov		word ptr es:[ecx],ax
0427				L$58:
0427  0F B6 45 FC			movzx		eax,byte ptr -0x4[ebp]
042B  01 C1				add		ecx,eax
042D				L$59:
042D  89 D8				mov		eax,ebx
042F  E8 00 00 00 00			call		cgetw_
0434  89 45 F8				mov		dword ptr -0x8[ebp],eax
0437  83 F8 FF				cmp		eax,0xffffffff
043A  74 13				je		L$61
043C  E8 00 00 00 00			call		_uisspace_
0441  85 C0				test		eax,eax
0443  74 C3				je		L$56
0445				L$60:
0445  8B 45 F8				mov		eax,dword ptr -0x8[ebp]
0448  89 DA				mov		edx,ebx
044A  E8 00 00 00 00			call		uncget_
044F				L$61:
044F  F6 43 10 01			test		byte ptr 0x10[ebx],0x01
0453  0F 84 34 FF FF FF			je		L$48
0459  85 F6				test		esi,esi
045B  0F 8E 2C FF FF FF			jle		L$48
0461  0F B6 45 FC			movzx		eax,byte ptr -0x4[ebp]
0465  83 F8 01				cmp		eax,0x00000001
0468  75 09				jne		L$62
046A  26 C6 01 00			mov		byte ptr es:[ecx],0x00
046E  E9 1A FF FF FF			jmp		L$48
0473				L$62:
0473  66 26 C7 01 00 00			mov		word ptr es:[ecx],0x0000
0479  E9 0F FF FF FF			jmp		L$48
047E				report_scan_:
047E  06				push		es
047F  F6 40 10 01			test		byte ptr 0x10[eax],0x01
0483  74 31				je		L$66
0485  F6 40 10 04			test		byte ptr 0x10[eax],0x04
0489  74 0A				je		L$63
048B  83 02 08				add		dword ptr [edx],0x00000008
048E  8B 12				mov		edx,dword ptr [edx]
0490  C4 52 F8				les		edx,fword ptr -0x8[edx]
0493  EB 0E				jmp		L$64
0495				L$63:
0495  F6 40 10 08			test		byte ptr 0x10[eax],0x08
0499  83 02 04				add		dword ptr [edx],0x00000004
049C  8B 12				mov		edx,dword ptr [edx]
049E  1E				push		ds
049F  07				pop		es
04A0  8B 52 FC				mov		edx,dword ptr -0x4[edx]
04A3				L$64:
04A3  F6 40 10 10			test		byte ptr 0x10[eax],0x10
04A7  74 06				je		L$65
04A9  66 26 89 1A			mov		word ptr es:[edx],bx
04AD  07				pop		es
04AE  C3				ret		
04AF				L$65:
04AF  F6 40 10 20			test		byte ptr 0x10[eax],0x20
04B3  26 89 1A				mov		dword ptr es:[edx],ebx
04B6				L$66:
04B6  07				pop		es
04B7  C3				ret		
04B8				scan_arb_:
04B8  51				push		ecx
04B9  56				push		esi
04BA  57				push		edi
04BB  06				push		es
04BC  C8 1C 00 00			enter		0x001c,0x00
04C0  89 C1				mov		ecx,eax
04C2  8B 3B				mov		edi,dword ptr [ebx]
04C4  0F B7 07				movzx		eax,word ptr [edi]
04C7  83 F8 5E				cmp		eax,0x0000005e
04CA  0F 94 45 F8			sete		byte ptr -0x8[ebp]
04CE  0F B6 45 F8			movzx		eax,byte ptr -0x8[ebp]
04D2  89 45 E8				mov		dword ptr -0x18[ebp],eax
04D5  85 C0				test		eax,eax
04D7  74 04				je		L$67
04D9  47				inc		edi
04DA  47				inc		edi
04DB  89 3B				mov		dword ptr [ebx],edi
04DD				L$67:
04DD  F6 41 10 01			test		byte ptr 0x10[ecx],0x01
04E1  74 1E				je		L$69
04E3  F6 41 10 04			test		byte ptr 0x10[ecx],0x04
04E7  74 0A				je		L$68
04E9  83 02 08				add		dword ptr [edx],0x00000008
04EC  8B 32				mov		esi,dword ptr [edx]
04EE  C4 76 F8				les		esi,fword ptr -0x8[esi]
04F1  EB 0E				jmp		L$69
04F3				L$68:
04F3  F6 41 10 08			test		byte ptr 0x10[ecx],0x08
04F7  83 02 04				add		dword ptr [edx],0x00000004
04FA  8B 32				mov		esi,dword ptr [edx]
04FC  1E				push		ds
04FD  07				pop		es
04FE  8B 76 FC				mov		esi,dword ptr -0x4[esi]
0501				L$69:
0501  8B 41 0C				mov		eax,dword ptr 0xc[ecx]
0504  31 FF				xor		edi,edi
0506  89 45 F0				mov		dword ptr -0x10[ebp],eax
0509				L$70:
0509  83 7D F0 00			cmp		dword ptr -0x10[ebp],0x00000000
050D  0F 86 69 00 00 00			jbe		L$74
0513  89 C8				mov		eax,ecx
0515  E8 00 00 00 00			call		cget_
051A  89 45 EC				mov		dword ptr -0x14[ebp],eax
051D  F6 41 10 02			test		byte ptr 0x10[ecx],0x02
0521  75 59				jne		L$74
0523  8B 13				mov		edx,dword ptr [ebx]
0525  66 8B 02				mov		ax,word ptr [edx]
0528  C6 45 FC 01			mov		byte ptr -0x4[ebp],0x01
052C  89 45 F4				mov		dword ptr -0xc[ebp],eax
052F				L$71:
052F  0F B7 45 F4			movzx		eax,word ptr -0xc[ebp]
0533  89 45 E4				mov		dword ptr -0x1c[ebp],eax
0536  8B 45 EC				mov		eax,dword ptr -0x14[ebp]
0539  3B 45 E4				cmp		eax,dword ptr -0x1c[ebp]
053C  74 14				je		L$72
053E  42				inc		edx
053F  42				inc		edx
0540  66 8B 02				mov		ax,word ptr [edx]
0543  89 45 F4				mov		dword ptr -0xc[ebp],eax
0546  0F B7 C0				movzx		eax,ax
0549  83 F8 5D				cmp		eax,0x0000005d
054C  75 E1				jne		L$71
054E  C6 45 FC 00			mov		byte ptr -0x4[ebp],0x00
0552				L$72:
0552  0F B6 45 FC			movzx		eax,byte ptr -0x4[ebp]
0556  3B 45 E8				cmp		eax,dword ptr -0x18[ebp]
0559  75 0C				jne		L$73
055B  8B 45 EC				mov		eax,dword ptr -0x14[ebp]
055E  89 CA				mov		edx,ecx
0560  E8 00 00 00 00			call		uncget_
0565  EB 15				jmp		L$74
0567				L$73:
0567  FF 4D F0				dec		dword ptr -0x10[ebp]
056A  47				inc		edi
056B  F6 41 10 01			test		byte ptr 0x10[ecx],0x01
056F  74 98				je		L$70
0571  8B 45 EC				mov		eax,dword ptr -0x14[ebp]
0574  66 26 89 06			mov		word ptr es:[esi],ax
0578  46				inc		esi
0579  46				inc		esi
057A  EB 8D				jmp		L$70
057C				L$74:
057C  F6 41 10 01			test		byte ptr 0x10[ecx],0x01
0580  74 0A				je		L$75
0582  85 FF				test		edi,edi
0584  7E 06				jle		L$75
0586  66 26 C7 06 00 00			mov		word ptr es:[esi],0x0000
058C				L$75:
058C  89 F8				mov		eax,edi
058E  C9				leave		
058F  07				pop		es
0590  5F				pop		edi
0591  5E				pop		esi
0592  59				pop		ecx
0593  C3				ret		
0594				scan_float_:
0594  53				push		ebx
0595  51				push		ecx
0596  56				push		esi
0597  57				push		edi
0598  06				push		es
0599  C8 74 00 00			enter		0x0074,0x00
059D  89 C3				mov		ebx,eax
059F  89 D6				mov		esi,edx
05A1  31 FF				xor		edi,edi
05A3  8D 4D 8C				lea		ecx,-0x74[ebp]
05A6  89 7D E4				mov		dword ptr -0x1c[ebp],edi
05A9				L$76:
05A9  89 D8				mov		eax,ebx
05AB  E8 00 00 00 00			call		cget_
05B0  89 C2				mov		edx,eax
05B2  89 45 F8				mov		dword ptr -0x8[ebp],eax
05B5  E8 00 00 00 00			call		_uisspace_
05BA  85 C0				test		eax,eax
05BC  74 05				je		L$77
05BE  FF 45 E4				inc		dword ptr -0x1c[ebp]
05C1  EB E6				jmp		L$76
05C3				L$77:
05C3  F6 43 10 02			test		byte ptr 0x10[ebx],0x02
05C7  0F 85 D7 01 00 00			jne		L$96
05CD  8B 43 0C				mov		eax,dword ptr 0xc[ebx]
05D0  89 45 FC				mov		dword ptr -0x4[ebp],eax
05D3  48				dec		eax
05D4  89 43 0C				mov		dword ptr 0xc[ebx],eax
05D7  83 7D FC 00			cmp		dword ptr -0x4[ebp],0x00000000
05DB  0F 84 B9 01 00 00			je		L$95
05E1  83 FA 2B				cmp		edx,0x0000002b
05E4  74 05				je		L$78
05E6  83 FA 2D				cmp		edx,0x0000002d
05E9  75 1C				jne		L$79
05EB				L$78:
05EB  8A 45 F8				mov		al,byte ptr -0x8[ebp]
05EE  FF 45 E4				inc		dword ptr -0x1c[ebp]
05F1  88 01				mov		byte ptr [ecx],al
05F3  89 D8				mov		eax,ebx
05F5  41				inc		ecx
05F6  E8 00 00 00 00			call		cgetw_
05FB  89 45 F8				mov		dword ptr -0x8[ebp],eax
05FE  83 F8 FF				cmp		eax,0xffffffff
0601  0F 84 9D 01 00 00			je		L$96
0607				L$79:
0607  8B 45 F8				mov		eax,dword ptr -0x8[ebp]
060A  E8 00 00 00 00			call		_uisdigit_
060F  85 C0				test		eax,eax
0611  75 0A				jne		L$80
0613  83 7D F8 2E			cmp		dword ptr -0x8[ebp],0x0000002e
0617  0F 85 7D 01 00 00			jne		L$95
061D				L$80:
061D  C7 45 EC 00 00 00 00		mov		dword ptr -0x14[ebp],0x00000000
0624  8B 45 F8				mov		eax,dword ptr -0x8[ebp]
0627  C7 45 F0 00 00 00 00		mov		dword ptr -0x10[ebp],0x00000000
062E  E8 00 00 00 00			call		_uisdigit_
0633  85 C0				test		eax,eax
0635  74 3E				je		L$83
0637  C7 45 F0 01 00 00 00		mov		dword ptr -0x10[ebp],0x00000001
063E				L$81:
063E  8A 45 F8				mov		al,byte ptr -0x8[ebp]
0641  88 01				mov		byte ptr [ecx],al
0643  41				inc		ecx
0644  F6 43 10 10			test		byte ptr 0x10[ebx],0x10
0648  74 0E				je		L$82
064A  6B 45 EE 0A			imul		eax,dword ptr -0x12[ebp],0x0000000a
064E  03 45 F8				add		eax,dword ptr -0x8[ebp]
0651  83 E8 30				sub		eax,0x00000030
0654  66 89 45 EE			mov		word ptr -0x12[ebp],ax
0658				L$82:
0658  89 D8				mov		eax,ebx
065A  47				inc		edi
065B  E8 00 00 00 00			call		cgetw_
0660  89 45 F8				mov		dword ptr -0x8[ebp],eax
0663  83 F8 FF				cmp		eax,0xffffffff
0666  0F 84 38 01 00 00			je		L$96
066C  E8 00 00 00 00			call		_uisdigit_
0671  85 C0				test		eax,eax
0673  75 C9				jne		L$81
0675				L$83:
0675  83 7D F8 2E			cmp		dword ptr -0x8[ebp],0x0000002e
0679  0F 85 9C 00 00 00			jne		L$90
067F  8A 45 F8				mov		al,byte ptr -0x8[ebp]
0682  88 01				mov		byte ptr [ecx],al
0684  89 D8				mov		eax,ebx
0686  41				inc		ecx
0687  E8 00 00 00 00			call		cgetw_
068C  89 45 F8				mov		dword ptr -0x8[ebp],eax
068F  83 F8 FF				cmp		eax,0xffffffff
0692  0F 84 0C 01 00 00			je		L$96
0698  83 7D F0 00			cmp		dword ptr -0x10[ebp],0x00000000
069C  75 0D				jne		L$84
069E  E8 00 00 00 00			call		_uisdigit_
06A3  85 C0				test		eax,eax
06A5  0F 84 EF 00 00 00			je		L$95
06AB				L$84:
06AB  47				inc		edi
06AC				L$85:
06AC  8B 45 F8				mov		eax,dword ptr -0x8[ebp]
06AF  E8 00 00 00 00			call		_uisdigit_
06B4  85 C0				test		eax,eax
06B6  74 16				je		L$86
06B8  8A 45 F8				mov		al,byte ptr -0x8[ebp]
06BB  47				inc		edi
06BC  88 01				mov		byte ptr [ecx],al
06BE  89 D8				mov		eax,ebx
06C0  41				inc		ecx
06C1  E8 00 00 00 00			call		cgetw_
06C6  89 45 F8				mov		dword ptr -0x8[ebp],eax
06C9  83 F8 FF				cmp		eax,0xffffffff
06CC  75 DE				jne		L$85
06CE				L$86:
06CE  F6 43 10 10			test		byte ptr 0x10[ebx],0x10
06D2  74 3D				je		L$89
06D4  C7 45 E8 00 00 00 00		mov		dword ptr -0x18[ebp],0x00000000
06DB  89 4D F4				mov		dword ptr -0xc[ebp],ecx
06DE				L$87:
06DE  FF 4D F4				dec		dword ptr -0xc[ebp]
06E1  8B 45 F4				mov		eax,dword ptr -0xc[ebp]
06E4  0F B6 00				movzx		eax,byte ptr [eax]
06E7  83 F8 2E				cmp		eax,0x0000002e
06EA  74 1E				je		L$88
06EC  8B 45 F4				mov		eax,dword ptr -0xc[ebp]
06EF  8A 00				mov		al,byte ptr [eax]
06F1  2C 30				sub		al,0x30
06F3  C7 45 FC 0A 00 00 00		mov		dword ptr -0x4[ebp],0x0000000a
06FA  88 45 EA				mov		byte ptr -0x16[ebp],al
06FD  31 D2				xor		edx,edx
06FF  8B 45 E8				mov		eax,dword ptr -0x18[ebp]
0702  F7 75 FC				div		dword ptr -0x4[ebp]
0705  89 45 E8				mov		dword ptr -0x18[ebp],eax
0708  EB D4				jmp		L$87
070A				L$88:
070A  8B 45 E8				mov		eax,dword ptr -0x18[ebp]
070D  66 89 45 EC			mov		word ptr -0x14[ebp],ax
0711				L$89:
0711  83 7D F8 FF			cmp		dword ptr -0x8[ebp],0xffffffff
0715  0F 84 89 00 00 00			je		L$96
071B				L$90:
071B  F6 43 10 10			test		byte ptr 0x10[ebx],0x10
071F  0F 85 75 00 00 00			jne		L$95
0725  83 7D F8 65			cmp		dword ptr -0x8[ebp],0x00000065
0729  74 0A				je		L$91
072B  83 7D F8 45			cmp		dword ptr -0x8[ebp],0x00000045
072F  0F 85 65 00 00 00			jne		L$95
0735				L$91:
0735  8A 45 F8				mov		al,byte ptr -0x8[ebp]
0738  47				inc		edi
0739  88 01				mov		byte ptr [ecx],al
073B  89 D8				mov		eax,ebx
073D  41				inc		ecx
073E  E8 00 00 00 00			call		cgetw_
0743  89 45 F8				mov		dword ptr -0x8[ebp],eax
0746  83 F8 FF				cmp		eax,0xffffffff
0749  74 59				je		L$96
074B  83 F8 2B				cmp		eax,0x0000002b
074E  74 05				je		L$92
0750  83 F8 2D				cmp		eax,0x0000002d
0753  75 16				jne		L$93
0755				L$92:
0755  8A 45 F8				mov		al,byte ptr -0x8[ebp]
0758  47				inc		edi
0759  88 01				mov		byte ptr [ecx],al
075B  89 D8				mov		eax,ebx
075D  41				inc		ecx
075E  E8 00 00 00 00			call		cgetw_
0763  89 45 F8				mov		dword ptr -0x8[ebp],eax
0766  83 F8 FF				cmp		eax,0xffffffff
0769  74 39				je		L$96
076B				L$93:
076B  8B 45 F8				mov		eax,dword ptr -0x8[ebp]
076E  E8 00 00 00 00			call		_uisdigit_
0773  85 C0				test		eax,eax
0775  75 04				jne		L$94
0777  31 FF				xor		edi,edi
0779  EB 1F				jmp		L$95
077B				L$94:
077B  8A 45 F8				mov		al,byte ptr -0x8[ebp]
077E  47				inc		edi
077F  88 01				mov		byte ptr [ecx],al
0781  89 D8				mov		eax,ebx
0783  41				inc		ecx
0784  E8 00 00 00 00			call		cgetw_
0789  89 45 F8				mov		dword ptr -0x8[ebp],eax
078C  83 F8 FF				cmp		eax,0xffffffff
078F  74 13				je		L$96
0791  E8 00 00 00 00			call		_uisdigit_
0796  85 C0				test		eax,eax
0798  75 E1				jne		L$94
079A				L$95:
079A  8B 45 F8				mov		eax,dword ptr -0x8[ebp]
079D  89 DA				mov		edx,ebx
079F  E8 00 00 00 00			call		uncget_
07A4				L$96:
07A4  85 FF				test		edi,edi
07A6  0F 8E 82 00 00 00			jle		L$105
07AC  03 7D E4				add		edi,dword ptr -0x1c[ebp]
07AF  F6 43 10 01			test		byte ptr 0x10[ebx],0x01
07B3  0F 84 75 00 00 00			je		L$105
07B9  C6 01 00				mov		byte ptr [ecx],0x00
07BC  F6 43 10 10			test		byte ptr 0x10[ebx],0x10
07C0  74 0E				je		L$97
07C2  0F B6 45 8C			movzx		eax,byte ptr -0x74[ebp]
07C6  83 F8 2D				cmp		eax,0x0000002d
07C9  75 11				jne		L$98
07CB  F7 5D EC				neg		dword ptr -0x14[ebp]
07CE  EB 0C				jmp		L$98
07D0				L$97:
07D0  8D 55 DC				lea		edx,-0x24[ebp]
07D3  8D 45 8C				lea		eax,-0x74[ebp]
07D6  FF 15 00 00 00 00			call		dword ptr ___EFG_scanf
07DC				L$98:
07DC  F6 43 10 04			test		byte ptr 0x10[ebx],0x04
07E0  74 0A				je		L$99
07E2  83 06 08				add		dword ptr [esi],0x00000008
07E5  8B 0E				mov		ecx,dword ptr [esi]
07E7  C4 49 F8				les		ecx,fword ptr -0x8[ecx]
07EA  EB 0E				jmp		L$100
07EC				L$99:
07EC  F6 43 10 08			test		byte ptr 0x10[ebx],0x08
07F0  83 06 04				add		dword ptr [esi],0x00000004
07F3  8B 0E				mov		ecx,dword ptr [esi]
07F5  1E				push		ds
07F6  07				pop		es
07F7  8B 49 FC				mov		ecx,dword ptr -0x4[ecx]
07FA				L$100:
07FA  F6 43 10 10			test		byte ptr 0x10[ebx],0x10
07FE  74 05				je		L$101
0800  8B 45 EC				mov		eax,dword ptr -0x14[ebp]
0803  EB 26				jmp		L$104
0805				L$101:
0805  F6 43 10 20			test		byte ptr 0x10[ebx],0x20
0809  75 06				jne		L$102
080B  F6 43 10 40			test		byte ptr 0x10[ebx],0x40
080F  74 0F				je		L$103
0811				L$102:
0811  8B 45 DC				mov		eax,dword ptr -0x24[ebp]
0814  26 89 01				mov		dword ptr es:[ecx],eax
0817  8B 45 E0				mov		eax,dword ptr -0x20[ebp]
081A  26 89 41 04			mov		dword ptr es:0x4[ecx],eax
081E  EB 0E				jmp		L$105
0820				L$103:
0820  8B 45 DC				mov		eax,dword ptr -0x24[ebp]
0823  8B 55 E0				mov		edx,dword ptr -0x20[ebp]
0826  E8 00 00 00 00			call		__FDFS
082B				L$104:
082B  26 89 01				mov		dword ptr es:[ecx],eax
082E				L$105:
082E  89 F8				mov		eax,edi
0830  C9				leave		
0831  07				pop		es
0832  5F				pop		edi
0833  5E				pop		esi
0834  59				pop		ecx
0835  5B				pop		ebx
0836  C3				ret		
0837				scan_int_:
0837  56				push		esi
0838  57				push		edi
0839  06				push		es
083A  C8 14 00 00			enter		0x0014,0x00
083E  89 C6				mov		esi,eax
0840  89 D7				mov		edi,edx
0842  89 4D F0				mov		dword ptr -0x10[ebp],ecx
0845  89 DA				mov		edx,ebx
0847  31 C9				xor		ecx,ecx
0849  C7 45 FC 00 00 00 00		mov		dword ptr -0x4[ebp],0x00000000
0850  89 4D F8				mov		dword ptr -0x8[ebp],ecx
0853				L$106:
0853  89 F0				mov		eax,esi
0855  E8 00 00 00 00			call		cget_
085A  89 C3				mov		ebx,eax
085C  E8 00 00 00 00			call		_uisspace_
0861  85 C0				test		eax,eax
0863  74 05				je		L$107
0865  FF 45 F8				inc		dword ptr -0x8[ebp]
0868  EB E9				jmp		L$106
086A				L$107:
086A  F6 46 10 02			test		byte ptr 0x10[esi],0x02
086E  0F 85 32 01 00 00			jne		L$120
0874  8B 46 0C				mov		eax,dword ptr 0xc[esi]
0877  89 45 EC				mov		dword ptr -0x14[ebp],eax
087A  48				dec		eax
087B  89 46 0C				mov		dword ptr 0xc[esi],eax
087E  83 7D EC 00			cmp		dword ptr -0x14[ebp],0x00000000
0882  0F 84 15 01 00 00			je		L$119
0888  C7 45 F4 2B 00 00 00		mov		dword ptr -0xc[ebp],0x0000002b
088F  83 7D F0 00			cmp		dword ptr -0x10[ebp],0x00000000
0893  74 22				je		L$109
0895  83 FB 2B				cmp		ebx,0x0000002b
0898  74 05				je		L$108
089A  83 FB 2D				cmp		ebx,0x0000002d
089D  75 18				jne		L$109
089F				L$108:
089F  FF 45 F8				inc		dword ptr -0x8[ebp]
08A2  89 F0				mov		eax,esi
08A4  89 5D F4				mov		dword ptr -0xc[ebp],ebx
08A7  E8 00 00 00 00			call		cgetw_
08AC  89 C3				mov		ebx,eax
08AE  83 F8 FF				cmp		eax,0xffffffff
08B1  0F 84 EF 00 00 00			je		L$120
08B7				L$109:
08B7  85 D2				test		edx,edx
08B9  75 53				jne		L$113
08BB  83 FB 30				cmp		ebx,0x00000030
08BE  75 47				jne		L$112
08C0  89 F0				mov		eax,esi
08C2  B9 01 00 00 00			mov		ecx,0x00000001
08C7  E8 00 00 00 00			call		cgetw_
08CC  89 C3				mov		ebx,eax
08CE  83 F8 FF				cmp		eax,0xffffffff
08D1  0F 84 CF 00 00 00			je		L$120
08D7  83 F8 78				cmp		eax,0x00000078
08DA  74 05				je		L$110
08DC  83 F8 58				cmp		eax,0x00000058
08DF  75 1F				jne		L$111
08E1				L$110:
08E1  89 F0				mov		eax,esi
08E3  83 45 F8 02			add		dword ptr -0x8[ebp],0x00000002
08E7  E8 00 00 00 00			call		cgetw_
08EC  31 C9				xor		ecx,ecx
08EE  89 C3				mov		ebx,eax
08F0  83 F8 FF				cmp		eax,0xffffffff
08F3  0F 84 AD 00 00 00			je		L$120
08F9  BA 10 00 00 00			mov		edx,0x00000010
08FE  EB 4D				jmp		L$116
0900				L$111:
0900  BA 08 00 00 00			mov		edx,0x00000008
0905  EB 46				jmp		L$116
0907				L$112:
0907  BA 0A 00 00 00			mov		edx,0x0000000a
090C  EB 3F				jmp		L$116
090E				L$113:
090E  83 FA 10				cmp		edx,0x00000010
0911  75 3A				jne		L$116
0913  83 FB 30				cmp		ebx,0x00000030
0916  75 35				jne		L$116
0918  89 F0				mov		eax,esi
091A  B9 01 00 00 00			mov		ecx,0x00000001
091F  E8 00 00 00 00			call		cgetw_
0924  89 C3				mov		ebx,eax
0926  83 F8 FF				cmp		eax,0xffffffff
0929  0F 84 77 00 00 00			je		L$120
092F  83 F8 78				cmp		eax,0x00000078
0932  74 05				je		L$114
0934  83 F8 58				cmp		eax,0x00000058
0937  75 14				jne		L$116
0939				L$114:
0939  89 F0				mov		eax,esi
093B  83 45 F8 02			add		dword ptr -0x8[ebp],0x00000002
093F  E8 00 00 00 00			call		cgetw_
0944  31 C9				xor		ecx,ecx
0946				L$115:
0946  89 C3				mov		ebx,eax
0948  83 F8 FF				cmp		eax,0xffffffff
094B  74 59				je		L$120
094D				L$116:
094D  89 D8				mov		eax,ebx
094F  E8 A6 00 00 00			call		radix_value_
0954  39 D0				cmp		eax,edx
0956  7D 15				jge		L$117
0958  8B 5D FC				mov		ebx,dword ptr -0x4[ebp]
095B  0F AF DA				imul		ebx,edx
095E  41				inc		ecx
095F  01 C3				add		ebx,eax
0961  89 F0				mov		eax,esi
0963  89 5D FC				mov		dword ptr -0x4[ebp],ebx
0966  E8 00 00 00 00			call		cgetw_
096B  EB D9				jmp		L$115
096D				L$117:
096D  83 FB 3A				cmp		ebx,0x0000003a
0970  75 2B				jne		L$119
0972  F6 46 10 80			test		byte ptr 0x10[esi],0x80
0976  74 25				je		L$119
0978				L$118:
0978  89 F0				mov		eax,esi
097A  41				inc		ecx
097B  E8 00 00 00 00			call		cgetw_
0980  89 C3				mov		ebx,eax
0982  83 F8 FF				cmp		eax,0xffffffff
0985  74 1F				je		L$120
0987  E8 6E 00 00 00			call		radix_value_
098C  39 D0				cmp		eax,edx
098E  7D 0D				jge		L$119
0990  8B 5D FC				mov		ebx,dword ptr -0x4[ebp]
0993  0F AF DA				imul		ebx,edx
0996  01 C3				add		ebx,eax
0998  89 5D FC				mov		dword ptr -0x4[ebp],ebx
099B  EB DB				jmp		L$118
099D				L$119:
099D  89 F2				mov		edx,esi
099F  89 D8				mov		eax,ebx
09A1  E8 00 00 00 00			call		uncget_
09A6				L$120:
09A6  83 7D F4 2D			cmp		dword ptr -0xc[ebp],0x0000002d
09AA  75 03				jne		L$121
09AC  F7 5D FC				neg		dword ptr -0x4[ebp]
09AF				L$121:
09AF  85 C9				test		ecx,ecx
09B1  7E 40				jle		L$125
09B3  03 4D F8				add		ecx,dword ptr -0x8[ebp]
09B6  F6 46 10 01			test		byte ptr 0x10[esi],0x01
09BA  74 37				je		L$125
09BC  F6 46 10 04			test		byte ptr 0x10[esi],0x04
09C0  74 0A				je		L$122
09C2  83 07 08				add		dword ptr [edi],0x00000008
09C5  8B 1F				mov		ebx,dword ptr [edi]
09C7  C4 5B F8				les		ebx,fword ptr -0x8[ebx]
09CA  EB 0E				jmp		L$123
09CC				L$122:
09CC  F6 46 10 08			test		byte ptr 0x10[esi],0x08
09D0  83 07 04				add		dword ptr [edi],0x00000004
09D3  8B 1F				mov		ebx,dword ptr [edi]
09D5  1E				push		ds
09D6  07				pop		es
09D7  8B 5B FC				mov		ebx,dword ptr -0x4[ebx]
09DA				L$123:
09DA  F6 46 10 10			test		byte ptr 0x10[esi],0x10
09DE  74 09				je		L$124
09E0  8B 45 FC				mov		eax,dword ptr -0x4[ebp]
09E3  66 26 89 03			mov		word ptr es:[ebx],ax
09E7  EB 0A				jmp		L$125
09E9				L$124:
09E9  F6 46 10 20			test		byte ptr 0x10[esi],0x20
09ED  8B 45 FC				mov		eax,dword ptr -0x4[ebp]
09F0  26 89 03				mov		dword ptr es:[ebx],eax
09F3				L$125:
09F3  89 C8				mov		eax,ecx
09F5  C9				leave		
09F6  07				pop		es
09F7  5F				pop		edi
09F8  5E				pop		esi
09F9  C3				ret		
09FA				radix_value_:
09FA  83 F8 30				cmp		eax,0x00000030
09FD  7C 09				jl		L$126
09FF  83 F8 39				cmp		eax,0x00000039
0A02  7F 04				jg		L$126
0A04  83 E8 30				sub		eax,0x00000030
0A07  C3				ret		
0A08				L$126:
0A08  E8 00 00 00 00			call		_utolower_
0A0D  83 F8 61				cmp		eax,0x00000061
0A10  7C 09				jl		L$127
0A12  83 F8 66				cmp		eax,0x00000066
0A15  7F 04				jg		L$127
0A17  83 E8 57				sub		eax,0x00000057
0A1A  C3				ret		
0A1B				L$127:
0A1B  B8 10 00 00 00			mov		eax,0x00000010
0A20  C3				ret		
0A21				cgetw_:
0A21  53				push		ebx
0A22  52				push		edx
0A23  89 C2				mov		edx,eax
0A25  8B 40 0C				mov		eax,dword ptr 0xc[eax]
0A28  8D 58 FF				lea		ebx,-0x1[eax]
0A2B  89 5A 0C				mov		dword ptr 0xc[edx],ebx
0A2E  85 C0				test		eax,eax
0A30  74 0D				je		L$128
0A32  89 D0				mov		eax,edx
0A34  E8 00 00 00 00			call		cget_
0A39  F6 42 10 02			test		byte ptr 0x10[edx],0x02
0A3D  74 05				je		L$129
0A3F				L$128:
0A3F  B8 FF FF FF FF			mov		eax,0xffffffff
0A44				L$129:
0A44  5A				pop		edx
0A45  5B				pop		ebx
0A46  C3				ret		

Routine Size: 2616 bytes,    Routine Base: _TEXT + 000F

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

