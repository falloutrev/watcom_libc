Module: scnf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000C31 bytes
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

000F				__scnf_:
000F  51				push		ecx
0010  56				push		esi
0011  57				push		edi
0012  55				push		ebp
0013  83 EC 08				sub		esp,0x00000008
0016  89 C6				mov		esi,eax
0018  89 14 24				mov		dword ptr [esp],edx
001B  89 DF				mov		edi,ebx
001D  8A 60 10				mov		ah,byte ptr 0x10[eax]
0020  31 D2				xor		edx,edx
0022  31 ED				xor		ebp,ebp
0024  80 E4 FD				and		ah,0xfd
0027  89 54 24 04			mov		dword ptr 0x4[esp],edx
002B  88 66 10				mov		byte ptr 0x10[esi],ah
002E				L$1:
002E  8B 1C 24				mov		ebx,dword ptr [esp]
0031  8D 4B 01				lea		ecx,0x1[ebx]
0034  89 0C 24				mov		dword ptr [esp],ecx
0037  8A 1B				mov		bl,byte ptr [ebx]
0039  81 E3 FF 00 00 00			and		ebx,0x000000ff
003F  0F 84 F1 01 00 00			je		L$29
0045  88 D8				mov		al,bl
0047  FE C0				inc		al
0049  25 FF 00 00 00			and		eax,0x000000ff
004E  8A 80 00 00 00 00			mov		al,byte ptr __IsTable[eax]
0054  24 02				and		al,0x02
0056  25 FF 00 00 00			and		eax,0x000000ff
005B  74 0E				je		L$2
005D  89 F0				mov		eax,esi
005F  E8 00 00 00 00			call		scan_white_
0064  01 C5				add		ebp,eax
0066  E9 8B 01 00 00			jmp		L$28
006B				L$2:
006B  83 FB 25				cmp		ebx,0x00000025
006E  74 25				je		L$4
0070  89 F0				mov		eax,esi
0072  E8 00 00 00 00			call		cget_
0077  39 D8				cmp		eax,ebx
0079  0F 84 76 01 00 00			je		L$27
007F				L$3:
007F  F6 46 10 02			test		byte ptr 0x10[esi],0x02
0083  0F 85 AD 01 00 00			jne		L$29
0089  89 F2				mov		edx,esi
008B  E8 00 00 00 00			call		uncget_
0090  E9 A1 01 00 00			jmp		L$29
0095				L$4:
0095  89 F2				mov		edx,esi
0097  89 C8				mov		eax,ecx
0099  E8 00 00 00 00			call		get_opt_
009E  31 DB				xor		ebx,ebx
00A0  89 04 24				mov		dword ptr [esp],eax
00A3  8A 18				mov		bl,byte ptr [eax]
00A5  85 DB				test		ebx,ebx
00A7  74 04				je		L$5
00A9  40				inc		eax
00AA  89 04 24				mov		dword ptr [esp],eax
00AD				L$5:
00AD  83 FB 65				cmp		ebx,0x00000065
00B0  72 55				jb		L$9
00B2  83 FB 67				cmp		ebx,0x00000067
00B5  0F 86 D8 00 00 00			jbe		L$20
00BB  83 FB 70				cmp		ebx,0x00000070
00BE  72 2D				jb		L$7
00C0  0F 86 C1 00 00 00			jbe		L$19
00C6  83 FB 75				cmp		ebx,0x00000075
00C9  72 14				jb		L$6
00CB  0F 86 A9 00 00 00			jbe		L$18
00D1  83 FB 78				cmp		ebx,0x00000078
00D4  0F 84 AD 00 00 00			je		L$19
00DA  E9 17 01 00 00			jmp		L$28
00DF				L$6:
00DF  83 FB 73				cmp		ebx,0x00000073
00E2  0F 84 B6 00 00 00			je		L$21
00E8  E9 09 01 00 00			jmp		L$28
00ED				L$7:
00ED  83 FB 6E				cmp		ebx,0x0000006e
00F0  72 0B				jb		L$8
00F2  0F 86 E1 00 00 00			jbe		L$25
00F8  E9 71 00 00 00			jmp		L$17
00FD				L$8:
00FD  83 FB 69				cmp		ebx,0x00000069
0100  74 5F				je		L$16
0102  E9 EF 00 00 00			jmp		L$28
0107				L$9:
0107  83 FB 58				cmp		ebx,0x00000058
010A  72 21				jb		L$11
010C  0F 86 75 00 00 00			jbe		L$19
0112  83 FB 63				cmp		ebx,0x00000063
0115  72 08				jb		L$10
0117  0F 86 99 00 00 00			jbe		L$23
011D  EB 2D				jmp		L$13
011F				L$10:
011F  83 FB 5B				cmp		ebx,0x0000005b
0122  0F 84 81 00 00 00			je		L$22
0128  E9 C9 00 00 00			jmp		L$28
012D				L$11:
012D  83 FB 45				cmp		ebx,0x00000045
0130  72 0C				jb		L$12
0132  76 5F				jbe		L$20
0134  83 FB 47				cmp		ebx,0x00000047
0137  74 5A				je		L$20
0139  E9 B8 00 00 00			jmp		L$28
013E				L$12:
013E  83 FB 25				cmp		ebx,0x00000025
0141  0F 84 9F 00 00 00			je		L$26
0147  E9 AA 00 00 00			jmp		L$28
014C				L$13:
014C  B9 01 00 00 00			mov		ecx,0x00000001
0151  BB 0A 00 00 00			mov		ebx,0x0000000a
0156				L$14:
0156  89 FA				mov		edx,edi
0158  89 F0				mov		eax,esi
015A				L$15:
015A  E8 00 00 00 00			call		scan_int_
015F  EB 5E				jmp		L$24
0161				L$16:
0161  B9 01 00 00 00			mov		ecx,0x00000001
0166  89 FA				mov		edx,edi
0168  89 F0				mov		eax,esi
016A  31 DB				xor		ebx,ebx
016C  EB EC				jmp		L$15
016E				L$17:
016E  B9 01 00 00 00			mov		ecx,0x00000001
0173  BB 08 00 00 00			mov		ebx,0x00000008
0178  EB DC				jmp		L$14
017A				L$18:
017A  BB 0A 00 00 00			mov		ebx,0x0000000a
017F  89 FA				mov		edx,edi
0181  89 F0				mov		eax,esi
0183  31 C9				xor		ecx,ecx
0185  EB D3				jmp		L$15
0187				L$19:
0187  B9 01 00 00 00			mov		ecx,0x00000001
018C  BB 10 00 00 00			mov		ebx,0x00000010
0191  EB C3				jmp		L$14
0193				L$20:
0193  89 FA				mov		edx,edi
0195  89 F0				mov		eax,esi
0197  E8 00 00 00 00			call		scan_float_
019C  EB 21				jmp		L$24
019E				L$21:
019E  89 FA				mov		edx,edi
01A0  89 F0				mov		eax,esi
01A2  E8 00 00 00 00			call		scan_string_
01A7  EB 16				jmp		L$24
01A9				L$22:
01A9  89 E3				mov		ebx,esp
01AB  89 FA				mov		edx,edi
01AD  89 F0				mov		eax,esi
01AF  E8 00 00 00 00			call		scan_arb_
01B4  EB 09				jmp		L$24
01B6				L$23:
01B6  89 FA				mov		edx,edi
01B8  89 F0				mov		eax,esi
01BA  E8 00 00 00 00			call		scan_char_
01BF				L$24:
01BF  89 C3				mov		ebx,eax
01C1  85 DB				test		ebx,ebx
01C3  0F 8E 6D 00 00 00			jle		L$29
01C9  8A 56 10				mov		dl,byte ptr 0x10[esi]
01CC  01 DD				add		ebp,ebx
01CE  F6 C2 01				test		dl,0x01
01D1  74 23				je		L$28
01D3  FF 44 24 04			inc		dword ptr 0x4[esp]
01D7  EB 1D				jmp		L$28
01D9				L$25:
01D9  89 EB				mov		ebx,ebp
01DB  89 FA				mov		edx,edi
01DD  89 F0				mov		eax,esi
01DF  E8 00 00 00 00			call		report_scan_
01E4  EB 10				jmp		L$28
01E6				L$26:
01E6  89 F0				mov		eax,esi
01E8  E8 00 00 00 00			call		cget_
01ED  39 D8				cmp		eax,ebx
01EF  0F 85 8A FE FF FF			jne		L$3
01F5				L$27:
01F5  45				inc		ebp
01F6				L$28:
01F6  F6 46 10 02			test		byte ptr 0x10[esi],0x02
01FA  0F 84 2E FE FF FF			je		L$1
0200  8B 04 24				mov		eax,dword ptr [esp]
0203  8A 00				mov		al,byte ptr [eax]
0205  25 FF 00 00 00			and		eax,0x000000ff
020A  83 F8 25				cmp		eax,0x00000025
020D  75 27				jne		L$29
020F  FF 04 24				inc		dword ptr [esp]
0212  8B 04 24				mov		eax,dword ptr [esp]
0215  89 F2				mov		edx,esi
0217  E8 00 00 00 00			call		get_opt_
021C  89 04 24				mov		dword ptr [esp],eax
021F  8A 00				mov		al,byte ptr [eax]
0221  25 FF 00 00 00			and		eax,0x000000ff
0226  83 F8 6E				cmp		eax,0x0000006e
0229  75 0B				jne		L$29
022B  89 EB				mov		ebx,ebp
022D  89 FA				mov		edx,edi
022F  89 F0				mov		eax,esi
0231  E8 00 00 00 00			call		report_scan_
0236				L$29:
0236  83 7C 24 04 00			cmp		dword ptr 0x4[esp],0x00000000
023B  75 0D				jne		L$30
023D  F6 46 10 02			test		byte ptr 0x10[esi],0x02
0241  74 07				je		L$30
0243  B8 FF FF FF FF			mov		eax,0xffffffff
0248  EB 04				jmp		L$31
024A				L$30:
024A  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
024E				L$31:
024E  83 C4 08				add		esp,0x00000008
0251  5D				pop		ebp
0252  5F				pop		edi
0253  5E				pop		esi
0254  59				pop		ecx
0255  C3				ret		
0256				get_opt_:
0256  53				push		ebx
0257  51				push		ecx
0258  56				push		esi
0259  83 EC 04				sub		esp,0x00000004
025C  89 D3				mov		ebx,edx
025E  8A 52 10				mov		dl,byte ptr 0x10[edx]
0261  80 CA 01				or		dl,0x01
0264  88 53 10				mov		byte ptr 0x10[ebx],dl
0267  88 D6				mov		dh,dl
0269  C7 43 0C FF FF FF FF		mov		dword ptr 0xc[ebx],0xffffffff
0270  80 E6 03				and		dh,0x03
0273  88 73 10				mov		byte ptr 0x10[ebx],dh
0276  31 D2				xor		edx,edx
0278  8A 10				mov		dl,byte ptr [eax]
027A  83 FA 2A				cmp		edx,0x0000002a
027D  75 0A				jne		L$32
027F  8A 4B 10				mov		cl,byte ptr 0x10[ebx]
0282  80 E1 FE				and		cl,0xfe
0285  40				inc		eax
0286  88 4B 10				mov		byte ptr 0x10[ebx],cl
0289				L$32:
0289  31 D2				xor		edx,edx
028B  8A 10				mov		dl,byte ptr [eax]
028D  89 14 24				mov		dword ptr [esp],edx
0290  8A 14 24				mov		dl,byte ptr [esp]
0293  FE C2				inc		dl
0295  81 E2 FF 00 00 00			and		edx,0x000000ff
029B  8A 92 00 00 00 00			mov		dl,byte ptr __IsTable[edx]
02A1  80 E2 20				and		dl,0x20
02A4  81 E2 FF 00 00 00			and		edx,0x000000ff
02AA  74 2F				je		L$34
02AC  31 D2				xor		edx,edx
02AE				L$33:
02AE  6B D2 0A				imul		edx,0x0000000a
02B1  8B 34 24				mov		esi,dword ptr [esp]
02B4  83 EE 30				sub		esi,0x00000030
02B7  40				inc		eax
02B8  01 F2				add		edx,esi
02BA  0F B6 30				movzx		esi,byte ptr [eax]
02BD  89 34 24				mov		dword ptr [esp],esi
02C0  8A 0C 24				mov		cl,byte ptr [esp]
02C3  FE C1				inc		cl
02C5  0F B6 F1				movzx		esi,cl
02C8  8A 8E 00 00 00 00			mov		cl,byte ptr __IsTable[esi]
02CE  80 E1 20				and		cl,0x20
02D1  0F B6 F1				movzx		esi,cl
02D4  85 F6				test		esi,esi
02D6  75 D6				jne		L$33
02D8  89 53 0C				mov		dword ptr 0xc[ebx],edx
02DB				L$34:
02DB  31 D2				xor		edx,edx
02DD  8A 10				mov		dl,byte ptr [eax]
02DF  8D 70 01				lea		esi,0x1[eax]
02E2  83 FA 4E				cmp		edx,0x0000004e
02E5  75 08				jne		L$35
02E7  80 4B 10 08			or		byte ptr 0x10[ebx],0x08
02EB  89 F0				mov		eax,esi
02ED  EB 10				jmp		L$36
02EF				L$35:
02EF  83 FA 46				cmp		edx,0x00000046
02F2  75 0B				jne		L$36
02F4  8A 6B 10				mov		ch,byte ptr 0x10[ebx]
02F7  80 CD 04				or		ch,0x04
02FA  89 F0				mov		eax,esi
02FC  88 6B 10				mov		byte ptr 0x10[ebx],ch
02FF				L$36:
02FF  8A 10				mov		dl,byte ptr [eax]
0301  8D 70 01				lea		esi,0x1[eax]
0304  80 FA 68				cmp		dl,0x68
0307  72 10				jb		L$37
0309  76 15				jbe		L$38
030B  80 FA 6C				cmp		dl,0x6c
030E  72 34				jb		L$41
0310  76 1B				jbe		L$39
0312  80 FA 77				cmp		dl,0x77
0315  74 16				je		L$39
0317  EB 2B				jmp		L$41
0319				L$37:
0319  80 FA 4C				cmp		dl,0x4c
031C  74 1B				je		L$40
031E  EB 24				jmp		L$41
0320				L$38:
0320  8A 73 10				mov		dh,byte ptr 0x10[ebx]
0323  80 CE 10				or		dh,0x10
0326  89 F0				mov		eax,esi
0328  88 73 10				mov		byte ptr 0x10[ebx],dh
032B  EB 17				jmp		L$41
032D				L$39:
032D  8A 53 10				mov		dl,byte ptr 0x10[ebx]
0330  80 CA 20				or		dl,0x20
0333  40				inc		eax
0334  88 53 10				mov		byte ptr 0x10[ebx],dl
0337  EB 0B				jmp		L$41
0339				L$40:
0339  8A 4B 10				mov		cl,byte ptr 0x10[ebx]
033C  80 C9 40				or		cl,0x40
033F  89 F0				mov		eax,esi
0341  88 4B 10				mov		byte ptr 0x10[ebx],cl
0344				L$41:
0344  83 C4 04				add		esp,0x00000004
0347  5E				pop		esi
0348  59				pop		ecx
0349  5B				pop		ebx
034A  C3				ret		
034B				scan_white_:
034B  53				push		ebx
034C  52				push		edx
034D  56				push		esi
034E  89 C3				mov		ebx,eax
0350  31 F6				xor		esi,esi
0352				L$42:
0352  89 D8				mov		eax,ebx
0354  E8 00 00 00 00			call		cget_
0359  89 C2				mov		edx,eax
035B  FE C2				inc		dl
035D  81 E2 FF 00 00 00			and		edx,0x000000ff
0363  8A 92 00 00 00 00			mov		dl,byte ptr __IsTable[edx]
0369  80 E2 02				and		dl,0x02
036C  81 E2 FF 00 00 00			and		edx,0x000000ff
0372  74 03				je		L$43
0374  46				inc		esi
0375  EB DB				jmp		L$42
0377				L$43:
0377  F6 43 10 02			test		byte ptr 0x10[ebx],0x02
037B  75 07				jne		L$44
037D  89 DA				mov		edx,ebx
037F  E8 00 00 00 00			call		uncget_
0384				L$44:
0384  89 F0				mov		eax,esi
0386  5E				pop		esi
0387  5A				pop		edx
0388  5B				pop		ebx
0389  C3				ret		
038A				scan_char_:
038A  53				push		ebx
038B  51				push		ecx
038C  56				push		esi
038D  57				push		edi
038E  06				push		es
038F  83 EC 04				sub		esp,0x00000004
0392  89 C3				mov		ebx,eax
0394  F6 40 10 01			test		byte ptr 0x10[eax],0x01
0398  74 37				je		L$47
039A  8A 4B 10				mov		cl,byte ptr 0x10[ebx]
039D  F6 C1 04				test		cl,0x04
03A0  74 0C				je		L$45
03A2  8B 3A				mov		edi,dword ptr [edx]
03A4  83 C7 08				add		edi,0x00000008
03A7  89 3A				mov		dword ptr [edx],edi
03A9  C4 4F F8				les		ecx,fword ptr -0x8[edi]
03AC  EB 23				jmp		L$47
03AE				L$45:
03AE  F6 C1 08				test		cl,0x08
03B1  74 10				je		L$46
03B3  8B 32				mov		esi,dword ptr [edx]
03B5  83 C6 04				add		esi,0x00000004
03B8  8C D8				mov		eax,ds
03BA  89 32				mov		dword ptr [edx],esi
03BC  8E C0				mov		es,eax
03BE  8B 4E FC				mov		ecx,dword ptr -0x4[esi]
03C1  EB 0E				jmp		L$47
03C3				L$46:
03C3  8B 0A				mov		ecx,dword ptr [edx]
03C5  83 C1 04				add		ecx,0x00000004
03C8  8C D8				mov		eax,ds
03CA  89 0A				mov		dword ptr [edx],ecx
03CC  8E C0				mov		es,eax
03CE  8B 49 FC				mov		ecx,dword ptr -0x4[ecx]
03D1				L$47:
03D1  8B 53 0C				mov		edx,dword ptr 0xc[ebx]
03D4  31 F6				xor		esi,esi
03D6  83 FA FF				cmp		edx,0xffffffff
03D9  75 05				jne		L$48
03DB  BA 01 00 00 00			mov		edx,0x00000001
03E0				L$48:
03E0  85 D2				test		edx,edx
03E2  7E 30				jle		L$50
03E4  89 D8				mov		eax,ebx
03E6  E8 00 00 00 00			call		cget_
03EB  89 04 24				mov		dword ptr [esp],eax
03EE  8A 43 10				mov		al,byte ptr 0x10[ebx]
03F1  A8 02				test		al,0x02
03F3  75 1F				jne		L$50
03F5  46				inc		esi
03F6  4A				dec		edx
03F7  A8 01				test		al,0x01
03F9  74 E5				je		L$48
03FB  A8 20				test		al,0x20
03FD  74 0C				je		L$49
03FF  8B 04 24				mov		eax,dword ptr [esp]
0402  66 26 89 01			mov		word ptr es:[ecx],ax
0406  83 C1 02				add		ecx,0x00000002
0409  EB D5				jmp		L$48
040B				L$49:
040B  8A 04 24				mov		al,byte ptr [esp]
040E  26 88 01				mov		byte ptr es:[ecx],al
0411  41				inc		ecx
0412  EB CC				jmp		L$48
0414				L$50:
0414  89 F0				mov		eax,esi
0416  83 C4 04				add		esp,0x00000004
0419				L$51:
0419  07				pop		es
041A  5F				pop		edi
041B  5E				pop		esi
041C  59				pop		ecx
041D  5B				pop		ebx
041E  C3				ret		
041F				scan_string_:
041F  53				push		ebx
0420  51				push		ecx
0421  56				push		esi
0422  57				push		edi
0423  06				push		es
0424  83 EC 08				sub		esp,0x00000008
0427  89 C3				mov		ebx,eax
0429  F6 40 10 20			test		byte ptr 0x10[eax],0x20
042D  74 07				je		L$52
042F  C6 44 24 04 02			mov		byte ptr 0x4[esp],0x02
0434  EB 09				jmp		L$53
0436				L$52:
0436  F6 43 10 10			test		byte ptr 0x10[ebx],0x10
043A  C6 44 24 04 01			mov		byte ptr 0x4[esp],0x01
043F				L$53:
043F  8A 43 10				mov		al,byte ptr 0x10[ebx]
0442  A8 01				test		al,0x01
0444  74 32				je		L$56
0446  A8 04				test		al,0x04
0448  74 0C				je		L$54
044A  8B 3A				mov		edi,dword ptr [edx]
044C  83 C7 08				add		edi,0x00000008
044F  89 3A				mov		dword ptr [edx],edi
0451  C4 4F F8				les		ecx,fword ptr -0x8[edi]
0454  EB 22				jmp		L$56
0456				L$54:
0456  A8 08				test		al,0x08
0458  74 10				je		L$55
045A  8B 32				mov		esi,dword ptr [edx]
045C  83 C6 04				add		esi,0x00000004
045F  8C D8				mov		eax,ds
0461  89 32				mov		dword ptr [edx],esi
0463  8E C0				mov		es,eax
0465  8B 4E FC				mov		ecx,dword ptr -0x4[esi]
0468  EB 0E				jmp		L$56
046A				L$55:
046A  8B 0A				mov		ecx,dword ptr [edx]
046C  83 C1 04				add		ecx,0x00000004
046F  8C D8				mov		eax,ds
0471  89 0A				mov		dword ptr [edx],ecx
0473  8E C0				mov		es,eax
0475  8B 49 FC				mov		ecx,dword ptr -0x4[ecx]
0478				L$56:
0478  31 F6				xor		esi,esi
047A				L$57:
047A  89 D8				mov		eax,ebx
047C  E8 00 00 00 00			call		cget_
0481  89 04 24				mov		dword ptr [esp],eax
0484  8A 04 24				mov		al,byte ptr [esp]
0487  FE C0				inc		al
0489  25 FF 00 00 00			and		eax,0x000000ff
048E  8A 80 00 00 00 00			mov		al,byte ptr __IsTable[eax]
0494  24 02				and		al,0x02
0496  25 FF 00 00 00			and		eax,0x000000ff
049B  74 03				je		L$58
049D  46				inc		esi
049E  EB DA				jmp		L$57
04A0				L$58:
04A0  F6 43 10 02			test		byte ptr 0x10[ebx],0x02
04A4  74 07				je		L$59
04A6  31 F6				xor		esi,esi
04A8  E9 6A 00 00 00			jmp		L$65
04AD				L$59:
04AD  8B 43 0C				mov		eax,dword ptr 0xc[ebx]
04B0  8D 50 FF				lea		edx,-0x1[eax]
04B3  89 53 0C				mov		dword ptr 0xc[ebx],edx
04B6  85 C0				test		eax,eax
04B8  74 53				je		L$64
04BA				L$60:
04BA  8A 63 10				mov		ah,byte ptr 0x10[ebx]
04BD  46				inc		esi
04BE  F6 C4 01				test		ah,0x01
04C1  74 22				je		L$63
04C3  31 C0				xor		eax,eax
04C5  8A 44 24 04			mov		al,byte ptr 0x4[esp]
04C9  83 F8 01				cmp		eax,0x00000001
04CC  75 08				jne		L$61
04CE  8A 04 24				mov		al,byte ptr [esp]
04D1  26 88 01				mov		byte ptr es:[ecx],al
04D4  EB 07				jmp		L$62
04D6				L$61:
04D6  8B 04 24				mov		eax,dword ptr [esp]
04D9  66 26 89 01			mov		word ptr es:[ecx],ax
04DD				L$62:
04DD  31 C0				xor		eax,eax
04DF  8A 44 24 04			mov		al,byte ptr 0x4[esp]
04E3  01 C1				add		ecx,eax
04E5				L$63:
04E5  89 D8				mov		eax,ebx
04E7  E8 00 00 00 00			call		cgetw_
04EC  89 04 24				mov		dword ptr [esp],eax
04EF  83 F8 FF				cmp		eax,0xffffffff
04F2  74 23				je		L$65
04F4  8A 04 24				mov		al,byte ptr [esp]
04F7  FE C0				inc		al
04F9  25 FF 00 00 00			and		eax,0x000000ff
04FE  8A 80 00 00 00 00			mov		al,byte ptr __IsTable[eax]
0504  24 02				and		al,0x02
0506  25 FF 00 00 00			and		eax,0x000000ff
050B  74 AD				je		L$60
050D				L$64:
050D  8B 04 24				mov		eax,dword ptr [esp]
0510  89 DA				mov		edx,ebx
0512  E8 00 00 00 00			call		uncget_
0517				L$65:
0517  F6 43 10 01			test		byte ptr 0x10[ebx],0x01
051B  74 1B				je		L$67
051D  85 F6				test		esi,esi
051F  7E 17				jle		L$67
0521  31 C0				xor		eax,eax
0523  8A 44 24 04			mov		al,byte ptr 0x4[esp]
0527  83 F8 01				cmp		eax,0x00000001
052A  75 06				jne		L$66
052C  26 C6 01 00			mov		byte ptr es:[ecx],0x00
0530  EB 06				jmp		L$67
0532				L$66:
0532  66 26 C7 01 00 00			mov		word ptr es:[ecx],0x0000
0538				L$67:
0538  89 F0				mov		eax,esi
053A  83 C4 08				add		esp,0x00000008
053D  E9 D7 FE FF FF			jmp		L$51
0542				report_scan_:
0542  51				push		ecx
0543  56				push		esi
0544  57				push		edi
0545  06				push		es
0546  8A 48 10				mov		cl,byte ptr 0x10[eax]
0549  F6 C1 01				test		cl,0x01
054C  74 4D				je		L$72
054E  F6 C1 04				test		cl,0x04
0551  74 0C				je		L$68
0553  8B 3A				mov		edi,dword ptr [edx]
0555  83 C7 08				add		edi,0x00000008
0558  89 3A				mov		dword ptr [edx],edi
055A  C4 57 F8				les		edx,fword ptr -0x8[edi]
055D  EB 25				jmp		L$70
055F				L$68:
055F  F6 C1 08				test		cl,0x08
0562  74 10				je		L$69
0564  8B 32				mov		esi,dword ptr [edx]
0566  83 C6 04				add		esi,0x00000004
0569  8C D9				mov		ecx,ds
056B  89 32				mov		dword ptr [edx],esi
056D  8E C1				mov		es,ecx
056F  8B 56 FC				mov		edx,dword ptr -0x4[esi]
0572  EB 10				jmp		L$70
0574				L$69:
0574  8B 0A				mov		ecx,dword ptr [edx]
0576  83 C1 04				add		ecx,0x00000004
0579  89 0A				mov		dword ptr [edx],ecx
057B  89 CA				mov		edx,ecx
057D  8C D9				mov		ecx,ds
057F  8E C1				mov		es,ecx
0581  8B 52 FC				mov		edx,dword ptr -0x4[edx]
0584				L$70:
0584  8A 68 10				mov		ch,byte ptr 0x10[eax]
0587  F6 C5 10				test		ch,0x10
058A  74 09				je		L$71
058C  66 26 89 1A			mov		word ptr es:[edx],bx
0590  07				pop		es
0591  5F				pop		edi
0592  5E				pop		esi
0593  59				pop		ecx
0594  C3				ret		
0595				L$71:
0595  F6 C5 20				test		ch,0x20
0598  26 89 1A				mov		dword ptr es:[edx],ebx
059B				L$72:
059B  07				pop		es
059C  5F				pop		edi
059D  5E				pop		esi
059E  59				pop		ecx
059F  C3				ret		
05A0				makelist_:
05A0  53				push		ebx
05A1  51				push		ecx
05A2  56				push		esi
05A3  89 C1				mov		ecx,eax
05A5  89 D6				mov		esi,edx
05A7  BB 20 00 00 00			mov		ebx,0x00000020
05AC  89 F0				mov		eax,esi
05AE  31 D2				xor		edx,edx
05B0  E8 00 00 00 00			call		memset_
05B5  31 C0				xor		eax,eax
05B7  8A 01				mov		al,byte ptr [ecx]
05B9  41				inc		ecx
05BA  85 C0				test		eax,eax
05BC  74 1F				je		L$74
05BE				L$73:
05BE  89 C2				mov		edx,eax
05C0  83 E0 07				and		eax,0x00000007
05C3  C1 FA 03				sar		edx,0x03
05C6  8A 80 00 00 00 00			mov		al,byte ptr _lst_mask[eax]
05CC  08 04 32				or		byte ptr [edx+esi],al
05CF  31 C0				xor		eax,eax
05D1  8A 01				mov		al,byte ptr [ecx]
05D3  85 C0				test		eax,eax
05D5  74 06				je		L$74
05D7  41				inc		ecx
05D8  83 F8 5D				cmp		eax,0x0000005d
05DB  75 E1				jne		L$73
05DD				L$74:
05DD  89 C8				mov		eax,ecx
05DF  5E				pop		esi
05E0  59				pop		ecx
05E1  5B				pop		ebx
05E2  C3				ret		
05E3				scan_arb_:
05E3  51				push		ecx
05E4  56				push		esi
05E5  57				push		edi
05E6  06				push		es
05E7  55				push		ebp
05E8  83 EC 2C				sub		esp,0x0000002c
05EB  89 C1				mov		ecx,eax
05ED  89 D7				mov		edi,edx
05EF  8B 03				mov		eax,dword ptr [ebx]
05F1  31 D2				xor		edx,edx
05F3  8A 10				mov		dl,byte ptr [eax]
05F5  83 FA 5E				cmp		edx,0x0000005e
05F8  0F 94 C2				sete		dl
05FB  81 E2 FF 00 00 00			and		edx,0x000000ff
0601  89 54 24 24			mov		dword ptr 0x24[esp],edx
0605  74 03				je		L$75
0607  40				inc		eax
0608  89 03				mov		dword ptr [ebx],eax
060A				L$75:
060A  89 E2				mov		edx,esp
060C  8B 03				mov		eax,dword ptr [ebx]
060E  E8 00 00 00 00			call		makelist_
0613  89 03				mov		dword ptr [ebx],eax
0615  8A 61 10				mov		ah,byte ptr 0x10[ecx]
0618  F6 C4 01				test		ah,0x01
061B  74 34				je		L$78
061D  F6 C4 04				test		ah,0x04
0620  74 0C				je		L$76
0622  8B 37				mov		esi,dword ptr [edi]
0624  83 C6 08				add		esi,0x00000008
0627  89 37				mov		dword ptr [edi],esi
0629  C4 76 F8				les		esi,fword ptr -0x8[esi]
062C  EB 23				jmp		L$78
062E				L$76:
062E  F6 C4 08				test		ah,0x08
0631  74 10				je		L$77
0633  8B 1F				mov		ebx,dword ptr [edi]
0635  83 C3 04				add		ebx,0x00000004
0638  8C D8				mov		eax,ds
063A  89 1F				mov		dword ptr [edi],ebx
063C  8E C0				mov		es,eax
063E  8B 73 FC				mov		esi,dword ptr -0x4[ebx]
0641  EB 0E				jmp		L$78
0643				L$77:
0643  8B 17				mov		edx,dword ptr [edi]
0645  83 C2 04				add		edx,0x00000004
0648  8C D8				mov		eax,ds
064A  89 17				mov		dword ptr [edi],edx
064C  8E C0				mov		es,eax
064E  8B 72 FC				mov		esi,dword ptr -0x4[edx]
0651				L$78:
0651  8B 51 0C				mov		edx,dword ptr 0xc[ecx]
0654  31 FF				xor		edi,edi
0656				L$79:
0656  85 D2				test		edx,edx
0658  76 6A				jbe		L$81
065A  89 C8				mov		eax,ecx
065C  E8 00 00 00 00			call		cget_
0661  8A 59 10				mov		bl,byte ptr 0x10[ecx]
0664  89 44 24 28			mov		dword ptr 0x28[esp],eax
0668  F6 C3 02				test		bl,0x02
066B  75 57				jne		L$81
066D  89 C3				mov		ebx,eax
066F  C1 FB 03				sar		ebx,0x03
0672  8A 1C 1C				mov		bl,byte ptr [esp+ebx]
0675  81 E3 FF 00 00 00			and		ebx,0x000000ff
067B  89 5C 24 20			mov		dword ptr 0x20[esp],ebx
067F  89 C3				mov		ebx,eax
0681  83 E3 07				and		ebx,0x00000007
0684  8A 9B 00 00 00 00			mov		bl,byte ptr _lst_mask[ebx]
068A  8B 6C 24 20			mov		ebp,dword ptr 0x20[esp]
068E  81 E3 FF 00 00 00			and		ebx,0x000000ff
0694  85 EB				test		ebx,ebp
0696  0F 94 C3				sete		bl
0699  8B 6C 24 24			mov		ebp,dword ptr 0x24[esp]
069D  81 E3 FF 00 00 00			and		ebx,0x000000ff
06A3  39 EB				cmp		ebx,ebp
06A5  74 09				je		L$80
06A7  89 CA				mov		edx,ecx
06A9  E8 00 00 00 00			call		uncget_
06AE  EB 14				jmp		L$81
06B0				L$80:
06B0  47				inc		edi
06B1  8A 79 10				mov		bh,byte ptr 0x10[ecx]
06B4  4A				dec		edx
06B5  F6 C7 01				test		bh,0x01
06B8  74 9C				je		L$79
06BA  8A 44 24 28			mov		al,byte ptr 0x28[esp]
06BE  26 88 06				mov		byte ptr es:[esi],al
06C1  46				inc		esi
06C2  EB 92				jmp		L$79
06C4				L$81:
06C4  F6 41 10 01			test		byte ptr 0x10[ecx],0x01
06C8  74 08				je		L$82
06CA  85 FF				test		edi,edi
06CC  7E 04				jle		L$82
06CE  26 C6 06 00			mov		byte ptr es:[esi],0x00
06D2				L$82:
06D2  89 F8				mov		eax,edi
06D4  83 C4 2C				add		esp,0x0000002c
06D7  5D				pop		ebp
06D8  07				pop		es
06D9  5F				pop		edi
06DA  5E				pop		esi
06DB  59				pop		ecx
06DC  C3				ret		
06DD				scan_float_:
06DD  53				push		ebx
06DE  51				push		ecx
06DF  56				push		esi
06E0  57				push		edi
06E1  06				push		es
06E2  55				push		ebp
06E3  83 EC 6C				sub		esp,0x0000006c
06E6  89 C6				mov		esi,eax
06E8  89 54 24 5C			mov		dword ptr 0x5c[esp],edx
06EC  31 FF				xor		edi,edi
06EE  89 E3				mov		ebx,esp
06F0  89 7C 24 60			mov		dword ptr 0x60[esp],edi
06F4				L$83:
06F4  89 F0				mov		eax,esi
06F6  E8 00 00 00 00			call		cget_
06FB  88 C2				mov		dl,al
06FD  FE C2				inc		dl
06FF  0F B6 EA				movzx		ebp,dl
0702  8A 95 00 00 00 00			mov		dl,byte ptr __IsTable[ebp]
0708  89 C1				mov		ecx,eax
070A  80 E2 02				and		dl,0x02
070D  81 E2 FF 00 00 00			and		edx,0x000000ff
0713  74 06				je		L$84
0715  FF 44 24 60			inc		dword ptr 0x60[esp]
0719  EB D9				jmp		L$83
071B				L$84:
071B  F6 46 10 02			test		byte ptr 0x10[esi],0x02
071F  0F 85 09 02 00 00			jne		L$103
0725  8B 56 0C				mov		edx,dword ptr 0xc[esi]
0728  8D 6A FF				lea		ebp,-0x1[edx]
072B  89 6E 0C				mov		dword ptr 0xc[esi],ebp
072E  85 D2				test		edx,edx
0730  0F 84 EF 01 00 00			je		L$102
0736  83 F8 2B				cmp		eax,0x0000002b
0739  74 05				je		L$85
073B  83 F8 2D				cmp		eax,0x0000002d
073E  75 1E				jne		L$86
0740				L$85:
0740  8B 6C 24 60			mov		ebp,dword ptr 0x60[esp]
0744  89 F0				mov		eax,esi
0746  88 0B				mov		byte ptr [ebx],cl
0748  E8 00 00 00 00			call		cgetw_
074D  43				inc		ebx
074E  45				inc		ebp
074F  89 C1				mov		ecx,eax
0751  89 6C 24 60			mov		dword ptr 0x60[esp],ebp
0755  83 F8 FF				cmp		eax,0xffffffff
0758  0F 84 D0 01 00 00			je		L$103
075E				L$86:
075E  88 C8				mov		al,cl
0760  FE C0				inc		al
0762  25 FF 00 00 00			and		eax,0x000000ff
0767  8A 80 00 00 00 00			mov		al,byte ptr __IsTable[eax]
076D  24 20				and		al,0x20
076F  25 FF 00 00 00			and		eax,0x000000ff
0774  75 09				jne		L$87
0776  83 F9 2E				cmp		ecx,0x0000002e
0779  0F 85 A6 01 00 00			jne		L$102
077F				L$87:
077F  31 C0				xor		eax,eax
0781  89 44 24 68			mov		dword ptr 0x68[esp],eax
0785  88 C8				mov		al,cl
0787  31 ED				xor		ebp,ebp
0789  FE C0				inc		al
078B  25 FF 00 00 00			and		eax,0x000000ff
0790  8A 80 00 00 00 00			mov		al,byte ptr __IsTable[eax]
0796  24 20				and		al,0x20
0798  25 FF 00 00 00			and		eax,0x000000ff
079D  74 48				je		L$90
079F  BD 01 00 00 00			mov		ebp,0x00000001
07A4				L$88:
07A4  88 0B				mov		byte ptr [ebx],cl
07A6  8A 76 10				mov		dh,byte ptr 0x10[esi]
07A9  43				inc		ebx
07AA  F6 C6 10				test		dh,0x10
07AD  74 0F				je		L$89
07AF  6B 44 24 6A 0A			imul		eax,dword ptr 0x6a[esp],0x0000000a
07B4  01 C1				add		ecx,eax
07B6  83 E9 30				sub		ecx,0x00000030
07B9  66 89 4C 24 6A			mov		word ptr 0x6a[esp],cx
07BE				L$89:
07BE  89 F0				mov		eax,esi
07C0  47				inc		edi
07C1  E8 00 00 00 00			call		cgetw_
07C6  89 C1				mov		ecx,eax
07C8  83 F8 FF				cmp		eax,0xffffffff
07CB  0F 84 5D 01 00 00			je		L$103
07D1  FE C0				inc		al
07D3  25 FF 00 00 00			and		eax,0x000000ff
07D8  8A 80 00 00 00 00			mov		al,byte ptr __IsTable[eax]
07DE  24 20				and		al,0x20
07E0  25 FF 00 00 00			and		eax,0x000000ff
07E5  75 BD				jne		L$88
07E7				L$90:
07E7  83 F9 2E				cmp		ecx,0x0000002e
07EA  0F 85 A7 00 00 00			jne		L$97
07F0  89 F0				mov		eax,esi
07F2  88 0B				mov		byte ptr [ebx],cl
07F4  E8 00 00 00 00			call		cgetw_
07F9  43				inc		ebx
07FA  89 C1				mov		ecx,eax
07FC  83 F8 FF				cmp		eax,0xffffffff
07FF  0F 84 29 01 00 00			je		L$103
0805  85 ED				test		ebp,ebp
0807  75 1A				jne		L$91
0809  FE C0				inc		al
080B  25 FF 00 00 00			and		eax,0x000000ff
0810  8A 80 00 00 00 00			mov		al,byte ptr __IsTable[eax]
0816  24 20				and		al,0x20
0818  25 FF 00 00 00			and		eax,0x000000ff
081D  0F 84 02 01 00 00			je		L$102
0823				L$91:
0823  47				inc		edi
0824				L$92:
0824  88 C8				mov		al,cl
0826  FE C0				inc		al
0828  25 FF 00 00 00			and		eax,0x000000ff
082D  8A 80 00 00 00 00			mov		al,byte ptr __IsTable[eax]
0833  24 20				and		al,0x20
0835  25 FF 00 00 00			and		eax,0x000000ff
083A  74 12				je		L$93
083C  47				inc		edi
083D  89 F0				mov		eax,esi
083F  88 0B				mov		byte ptr [ebx],cl
0841  E8 00 00 00 00			call		cgetw_
0846  43				inc		ebx
0847  89 C1				mov		ecx,eax
0849  83 F8 FF				cmp		eax,0xffffffff
084C  75 D6				jne		L$92
084E				L$93:
084E  F6 46 10 10			test		byte ptr 0x10[esi],0x10
0852  74 3A				je		L$96
0854  31 D2				xor		edx,edx
0856  89 DD				mov		ebp,ebx
0858  89 54 24 58			mov		dword ptr 0x58[esp],edx
085C				L$94:
085C  4D				dec		ebp
085D  31 C0				xor		eax,eax
085F  8A 45 00				mov		al,byte ptr [ebp]
0862  83 F8 2E				cmp		eax,0x0000002e
0865  74 1E				je		L$95
0867  2C 30				sub		al,0x30
0869  C7 44 24 64 0A 00 00 00		mov		dword ptr 0x64[esp],0x0000000a
0871  88 44 24 5A			mov		byte ptr 0x5a[esp],al
0875  31 D2				xor		edx,edx
0877  8B 44 24 58			mov		eax,dword ptr 0x58[esp]
087B  F7 74 24 64			div		dword ptr 0x64[esp]
087F  89 44 24 58			mov		dword ptr 0x58[esp],eax
0883  EB D7				jmp		L$94
0885				L$95:
0885  8B 44 24 58			mov		eax,dword ptr 0x58[esp]
0889  66 89 44 24 68			mov		word ptr 0x68[esp],ax
088E				L$96:
088E  83 F9 FF				cmp		ecx,0xffffffff
0891  0F 84 97 00 00 00			je		L$103
0897				L$97:
0897  F6 46 10 10			test		byte ptr 0x10[esi],0x10
089B  0F 85 84 00 00 00			jne		L$102
08A1  83 F9 65				cmp		ecx,0x00000065
08A4  74 09				je		L$98
08A6  83 F9 45				cmp		ecx,0x00000045
08A9  0F 85 76 00 00 00			jne		L$102
08AF				L$98:
08AF  47				inc		edi
08B0  89 F0				mov		eax,esi
08B2  88 0B				mov		byte ptr [ebx],cl
08B4  E8 00 00 00 00			call		cgetw_
08B9  43				inc		ebx
08BA  89 C1				mov		ecx,eax
08BC  83 F8 FF				cmp		eax,0xffffffff
08BF  0F 84 69 00 00 00			je		L$103
08C5  83 F8 2B				cmp		eax,0x0000002b
08C8  74 05				je		L$99
08CA  83 F8 2D				cmp		eax,0x0000002d
08CD  75 12				jne		L$100
08CF				L$99:
08CF  47				inc		edi
08D0  89 F0				mov		eax,esi
08D2  88 0B				mov		byte ptr [ebx],cl
08D4  E8 00 00 00 00			call		cgetw_
08D9  43				inc		ebx
08DA  89 C1				mov		ecx,eax
08DC  83 F8 FF				cmp		eax,0xffffffff
08DF  74 4D				je		L$103
08E1				L$100:
08E1  88 C8				mov		al,cl
08E3  FE C0				inc		al
08E5  25 FF 00 00 00			and		eax,0x000000ff
08EA  8A 80 00 00 00 00			mov		al,byte ptr __IsTable[eax]
08F0  24 20				and		al,0x20
08F2  25 FF 00 00 00			and		eax,0x000000ff
08F7  75 04				jne		L$101
08F9  31 FF				xor		edi,edi
08FB  EB 28				jmp		L$102
08FD				L$101:
08FD  47				inc		edi
08FE  89 F0				mov		eax,esi
0900  88 0B				mov		byte ptr [ebx],cl
0902  E8 00 00 00 00			call		cgetw_
0907  43				inc		ebx
0908  89 C1				mov		ecx,eax
090A  83 F8 FF				cmp		eax,0xffffffff
090D  74 1F				je		L$103
090F  FE C0				inc		al
0911  25 FF 00 00 00			and		eax,0x000000ff
0916  8A 80 00 00 00 00			mov		al,byte ptr __IsTable[eax]
091C  24 20				and		al,0x20
091E  25 FF 00 00 00			and		eax,0x000000ff
0923  75 D8				jne		L$101
0925				L$102:
0925  89 F2				mov		edx,esi
0927  89 C8				mov		eax,ecx
0929  E8 00 00 00 00			call		uncget_
092E				L$103:
092E  85 FF				test		edi,edi
0930  0F 8E B3 00 00 00			jle		L$113
0936  8B 4C 24 60			mov		ecx,dword ptr 0x60[esp]
093A  8A 56 10				mov		dl,byte ptr 0x10[esi]
093D  01 CF				add		edi,ecx
093F  F6 C2 01				test		dl,0x01
0942  0F 84 A1 00 00 00			je		L$113
0948  C6 03 00				mov		byte ptr [ebx],0x00
094B  F6 46 10 10			test		byte ptr 0x10[esi],0x10
094F  74 10				je		L$104
0951  31 C0				xor		eax,eax
0953  8A 04 24				mov		al,byte ptr [esp]
0956  83 F8 2D				cmp		eax,0x0000002d
0959  75 12				jne		L$105
095B  F7 5C 24 68			neg		dword ptr 0x68[esp]
095F  EB 0C				jmp		L$105
0961				L$104:
0961  8D 54 24 50			lea		edx,0x50[esp]
0965  89 E0				mov		eax,esp
0967  FF 15 00 00 00 00			call		dword ptr ___EFG_scanf
096D				L$105:
096D  8A 5E 10				mov		bl,byte ptr 0x10[esi]
0970  F6 C3 04				test		bl,0x04
0973  74 10				je		L$106
0975  8B 44 24 5C			mov		eax,dword ptr 0x5c[esp]
0979  8B 08				mov		ecx,dword ptr [eax]
097B  83 C1 08				add		ecx,0x00000008
097E  89 08				mov		dword ptr [eax],ecx
0980  C4 59 F8				les		ebx,fword ptr -0x8[ecx]
0983  EB 2B				jmp		L$108
0985				L$106:
0985  F6 C3 08				test		bl,0x08
0988  74 14				je		L$107
098A  8B 44 24 5C			mov		eax,dword ptr 0x5c[esp]
098E  8B 18				mov		ebx,dword ptr [eax]
0990  83 C3 04				add		ebx,0x00000004
0993  89 18				mov		dword ptr [eax],ebx
0995  8C D8				mov		eax,ds
0997  8E C0				mov		es,eax
0999  8B 5B FC				mov		ebx,dword ptr -0x4[ebx]
099C  EB 12				jmp		L$108
099E				L$107:
099E  8B 44 24 5C			mov		eax,dword ptr 0x5c[esp]
09A2  8B 10				mov		edx,dword ptr [eax]
09A4  83 C2 04				add		edx,0x00000004
09A7  89 10				mov		dword ptr [eax],edx
09A9  8C D8				mov		eax,ds
09AB  8E C0				mov		es,eax
09AD  8B 5A FC				mov		ebx,dword ptr -0x4[edx]
09B0				L$108:
09B0  8A 4E 10				mov		cl,byte ptr 0x10[esi]
09B3  F6 C1 10				test		cl,0x10
09B6  74 06				je		L$109
09B8  8B 44 24 68			mov		eax,dword ptr 0x68[esp]
09BC  EB 28				jmp		L$112
09BE				L$109:
09BE  F6 C1 20				test		cl,0x20
09C1  75 05				jne		L$110
09C3  F6 C1 40				test		cl,0x40
09C6  74 11				je		L$111
09C8				L$110:
09C8  8B 44 24 50			mov		eax,dword ptr 0x50[esp]
09CC  26 89 03				mov		dword ptr es:[ebx],eax
09CF  8B 44 24 54			mov		eax,dword ptr 0x54[esp]
09D3  26 89 43 04			mov		dword ptr es:0x4[ebx],eax
09D7  EB 10				jmp		L$113
09D9				L$111:
09D9  8B 44 24 50			mov		eax,dword ptr 0x50[esp]
09DD  8B 54 24 54			mov		edx,dword ptr 0x54[esp]
09E1  E8 00 00 00 00			call		__FDFS
09E6				L$112:
09E6  26 89 03				mov		dword ptr es:[ebx],eax
09E9				L$113:
09E9  89 F8				mov		eax,edi
09EB  83 C4 6C				add		esp,0x0000006c
09EE  5D				pop		ebp
09EF  E9 25 FA FF FF			jmp		L$51
09F4				scan_int_:
09F4  56				push		esi
09F5  57				push		edi
09F6  06				push		es
09F7  55				push		ebp
09F8  83 EC 10				sub		esp,0x00000010
09FB  89 C6				mov		esi,eax
09FD  89 54 24 0C			mov		dword ptr 0xc[esp],edx
0A01  89 4C 24 04			mov		dword ptr 0x4[esp],ecx
0A05  89 DA				mov		edx,ebx
0A07  31 FF				xor		edi,edi
0A09  31 C9				xor		ecx,ecx
0A0B  89 3C 24				mov		dword ptr [esp],edi
0A0E				L$114:
0A0E  89 F0				mov		eax,esi
0A10  E8 00 00 00 00			call		cget_
0A15  89 C3				mov		ebx,eax
0A17  FE C0				inc		al
0A19  0F B6 E8				movzx		ebp,al
0A1C  8A 85 00 00 00 00			mov		al,byte ptr __IsTable[ebp]
0A22  24 02				and		al,0x02
0A24  25 FF 00 00 00			and		eax,0x000000ff
0A29  74 05				je		L$115
0A2B  FF 04 24				inc		dword ptr [esp]
0A2E  EB DE				jmp		L$114
0A30				L$115:
0A30  F6 46 10 02			test		byte ptr 0x10[esi],0x02
0A34  0F 85 32 01 00 00			jne		L$128
0A3A  8B 46 0C				mov		eax,dword ptr 0xc[esi]
0A3D  8D 68 FF				lea		ebp,-0x1[eax]
0A40  89 6E 0C				mov		dword ptr 0xc[esi],ebp
0A43  85 C0				test		eax,eax
0A45  0F 84 18 01 00 00			je		L$127
0A4B  B8 2B 00 00 00			mov		eax,0x0000002b
0A50  8B 6C 24 04			mov		ebp,dword ptr 0x4[esp]
0A54  89 44 24 08			mov		dword ptr 0x8[esp],eax
0A58  85 ED				test		ebp,ebp
0A5A  74 23				je		L$117
0A5C  83 FB 2B				cmp		ebx,0x0000002b
0A5F  74 05				je		L$116
0A61  83 FB 2D				cmp		ebx,0x0000002d
0A64  75 19				jne		L$117
0A66				L$116:
0A66  FF 04 24				inc		dword ptr [esp]
0A69  89 F0				mov		eax,esi
0A6B  89 5C 24 08			mov		dword ptr 0x8[esp],ebx
0A6F  E8 00 00 00 00			call		cgetw_
0A74  89 C3				mov		ebx,eax
0A76  83 F8 FF				cmp		eax,0xffffffff
0A79  0F 84 ED 00 00 00			je		L$128
0A7F				L$117:
0A7F  85 D2				test		edx,edx
0A81  75 58				jne		L$121
0A83  83 FB 30				cmp		ebx,0x00000030
0A86  75 4C				jne		L$120
0A88  89 F0				mov		eax,esi
0A8A  B9 01 00 00 00			mov		ecx,0x00000001
0A8F  E8 00 00 00 00			call		cgetw_
0A94  89 C3				mov		ebx,eax
0A96  83 F8 FF				cmp		eax,0xffffffff
0A99  0F 84 CD 00 00 00			je		L$128
0A9F  83 F8 78				cmp		eax,0x00000078
0AA2  74 05				je		L$118
0AA4  83 F8 58				cmp		eax,0x00000058
0AA7  75 24				jne		L$119
0AA9				L$118:
0AA9  89 F0				mov		eax,esi
0AAB  8B 2C 24				mov		ebp,dword ptr [esp]
0AAE  E8 00 00 00 00			call		cgetw_
0AB3  31 C9				xor		ecx,ecx
0AB5  83 C5 02				add		ebp,0x00000002
0AB8  89 C3				mov		ebx,eax
0ABA  89 2C 24				mov		dword ptr [esp],ebp
0ABD  83 F8 FF				cmp		eax,0xffffffff
0AC0  0F 84 A6 00 00 00			je		L$128
0AC6  BA 10 00 00 00			mov		edx,0x00000010
0ACB  EB 52				jmp		L$124
0ACD				L$119:
0ACD  BA 08 00 00 00			mov		edx,0x00000008
0AD2  EB 4B				jmp		L$124
0AD4				L$120:
0AD4  BA 0A 00 00 00			mov		edx,0x0000000a
0AD9  EB 44				jmp		L$124
0ADB				L$121:
0ADB  83 FA 10				cmp		edx,0x00000010
0ADE  75 3F				jne		L$124
0AE0  83 FB 30				cmp		ebx,0x00000030
0AE3  75 3A				jne		L$124
0AE5  89 F0				mov		eax,esi
0AE7  B9 01 00 00 00			mov		ecx,0x00000001
0AEC  E8 00 00 00 00			call		cgetw_
0AF1  89 C3				mov		ebx,eax
0AF3  83 F8 FF				cmp		eax,0xffffffff
0AF6  0F 84 70 00 00 00			je		L$128
0AFC  83 F8 78				cmp		eax,0x00000078
0AFF  74 05				je		L$122
0B01  83 F8 58				cmp		eax,0x00000058
0B04  75 19				jne		L$124
0B06				L$122:
0B06  89 F0				mov		eax,esi
0B08  8B 1C 24				mov		ebx,dword ptr [esp]
0B0B  E8 00 00 00 00			call		cgetw_
0B10  83 C3 02				add		ebx,0x00000002
0B13  31 C9				xor		ecx,ecx
0B15  89 1C 24				mov		dword ptr [esp],ebx
0B18				L$123:
0B18  89 C3				mov		ebx,eax
0B1A  83 F8 FF				cmp		eax,0xffffffff
0B1D  74 4D				je		L$128
0B1F				L$124:
0B1F  89 D8				mov		eax,ebx
0B21  E8 BE 00 00 00			call		radix_value_
0B26  39 D0				cmp		eax,edx
0B28  7D 0F				jge		L$125
0B2A  0F AF FA				imul		edi,edx
0B2D  01 C7				add		edi,eax
0B2F  89 F0				mov		eax,esi
0B31  41				inc		ecx
0B32  E8 00 00 00 00			call		cgetw_
0B37  EB DF				jmp		L$123
0B39				L$125:
0B39  83 FB 3A				cmp		ebx,0x0000003a
0B3C  75 25				jne		L$127
0B3E  F6 46 10 80			test		byte ptr 0x10[esi],0x80
0B42  74 1F				je		L$127
0B44				L$126:
0B44  89 F0				mov		eax,esi
0B46  41				inc		ecx
0B47  E8 00 00 00 00			call		cgetw_
0B4C  89 C3				mov		ebx,eax
0B4E  83 F8 FF				cmp		eax,0xffffffff
0B51  74 19				je		L$128
0B53  E8 8C 00 00 00			call		radix_value_
0B58  39 D0				cmp		eax,edx
0B5A  7D 07				jge		L$127
0B5C  0F AF FA				imul		edi,edx
0B5F  01 C7				add		edi,eax
0B61  EB E1				jmp		L$126
0B63				L$127:
0B63  89 F2				mov		edx,esi
0B65  89 D8				mov		eax,ebx
0B67  E8 00 00 00 00			call		uncget_
0B6C				L$128:
0B6C  83 7C 24 08 2D			cmp		dword ptr 0x8[esp],0x0000002d
0B71  75 02				jne		L$129
0B73  F7 DF				neg		edi
0B75				L$129:
0B75  85 C9				test		ecx,ecx
0B77  7E 61				jle		L$134
0B79  8B 14 24				mov		edx,dword ptr [esp]
0B7C  8A 66 10				mov		ah,byte ptr 0x10[esi]
0B7F  01 D1				add		ecx,edx
0B81  F6 C4 01				test		ah,0x01
0B84  74 54				je		L$134
0B86  F6 C4 04				test		ah,0x04
0B89  74 10				je		L$130
0B8B  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
0B8F  8B 10				mov		edx,dword ptr [eax]
0B91  83 C2 08				add		edx,0x00000008
0B94  89 10				mov		dword ptr [eax],edx
0B96  C4 42 F8				les		eax,fword ptr -0x8[edx]
0B99  EB 2B				jmp		L$132
0B9B				L$130:
0B9B  F6 C4 08				test		ah,0x08
0B9E  74 14				je		L$131
0BA0  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
0BA4  8B 28				mov		ebp,dword ptr [eax]
0BA6  83 C5 04				add		ebp,0x00000004
0BA9  8C DA				mov		edx,ds
0BAB  89 28				mov		dword ptr [eax],ebp
0BAD  8E C2				mov		es,edx
0BAF  8B 45 FC				mov		eax,dword ptr -0x4[ebp]
0BB2  EB 12				jmp		L$132
0BB4				L$131:
0BB4  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
0BB8  8B 18				mov		ebx,dword ptr [eax]
0BBA  83 C3 04				add		ebx,0x00000004
0BBD  8C DA				mov		edx,ds
0BBF  89 18				mov		dword ptr [eax],ebx
0BC1  8E C2				mov		es,edx
0BC3  8B 43 FC				mov		eax,dword ptr -0x4[ebx]
0BC6				L$132:
0BC6  8A 5E 10				mov		bl,byte ptr 0x10[esi]
0BC9  F6 C3 10				test		bl,0x10
0BCC  74 06				je		L$133
0BCE  66 26 89 38			mov		word ptr es:[eax],di
0BD2  EB 06				jmp		L$134
0BD4				L$133:
0BD4  F6 C3 20				test		bl,0x20
0BD7  26 89 38				mov		dword ptr es:[eax],edi
0BDA				L$134:
0BDA  89 C8				mov		eax,ecx
0BDC  83 C4 10				add		esp,0x00000010
0BDF  5D				pop		ebp
0BE0  07				pop		es
0BE1  5F				pop		edi
0BE2  5E				pop		esi
0BE3  C3				ret		
0BE4				radix_value_:
0BE4  83 F8 30				cmp		eax,0x00000030
0BE7  7C 09				jl		L$135
0BE9  83 F8 39				cmp		eax,0x00000039
0BEC  7F 04				jg		L$135
0BEE  83 E8 30				sub		eax,0x00000030
0BF1  C3				ret		
0BF2				L$135:
0BF2  E8 00 00 00 00			call		tolower_
0BF7  83 F8 61				cmp		eax,0x00000061
0BFA  7C 09				jl		L$136
0BFC  83 F8 66				cmp		eax,0x00000066
0BFF  7F 04				jg		L$136
0C01  83 E8 57				sub		eax,0x00000057
0C04  C3				ret		
0C05				L$136:
0C05  B8 10 00 00 00			mov		eax,0x00000010
0C0A  C3				ret		
0C0B				cgetw_:
0C0B  53				push		ebx
0C0C  52				push		edx
0C0D  89 C2				mov		edx,eax
0C0F  8B 40 0C				mov		eax,dword ptr 0xc[eax]
0C12  8D 58 FF				lea		ebx,-0x1[eax]
0C15  89 5A 0C				mov		dword ptr 0xc[edx],ebx
0C18  85 C0				test		eax,eax
0C1A  74 0D				je		L$137
0C1C  89 D0				mov		eax,edx
0C1E  E8 00 00 00 00			call		cget_
0C23  F6 42 10 02			test		byte ptr 0x10[edx],0x02
0C27  74 05				je		L$138
0C29				L$137:
0C29  B8 FF FF FF FF			mov		eax,0xffffffff
0C2E				L$138:
0C2E  5A				pop		edx
0C2F  5B				pop		ebx
0C30  C3				ret		

Routine Size: 3106 bytes,    Routine Base: _TEXT + 000F

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000008 bytes
0000				_lst_mask:
0000  01 02 04 08 10 20 40 80                         ..... @.

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

