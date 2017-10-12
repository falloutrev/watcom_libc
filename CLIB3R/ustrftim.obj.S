Module: ustrftim
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000003CE bytes
0000				TwoDigits_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  89 C3				mov		ebx,eax
0005  89 D1				mov		ecx,edx
0007  89 D0				mov		eax,edx
0009  BE 0A 00 00 00			mov		esi,0x0000000a
000E  99				cdq		
000F  F7 FE				idiv		esi
0011  83 C0 30				add		eax,0x00000030
0014  66 89 03				mov		word ptr [ebx],ax
0017  89 C8				mov		eax,ecx
0019  99				cdq		
001A  F7 FE				idiv		esi
001C  66 C7 43 04 00 00			mov		word ptr 0x4[ebx],0x0000
0022  83 C2 30				add		edx,0x00000030
0025  66 89 53 02			mov		word ptr 0x2[ebx],dx
0029  5E				pop		esi
002A  59				pop		ecx
002B  5B				pop		ebx
002C  C3				ret		
002D				L$1:
002D  54 53 52 4F 4D 4B 49 48 45 43 3F 3E 3D 3C 35 34 TSROMKIHEC?>=<54
003D  33 32 30 2F 2E 28 24 23 1F 1D 1C 00             320/.($#....
0049				L$2:
0049  F3 02 00 00                                     DD	offset L$40
004D  F3 02 00 00                                     DD	offset L$40
0051  35 01 00 00                                     DD	offset L$7
0055  51 01 00 00                                     DD	offset L$10
0059  A9 01 00 00                                     DD	offset L$16
005D  B3 01 00 00                                     DD	offset L$17
0061  BE 01 00 00                                     DD	offset L$18
0065  00 02 00 00                                     DD	offset L$22
0069  3F 02 00 00                                     DD	offset L$27
006D  AE 02 00 00                                     DD	offset L$36
0071  52 02 00 00                                     DD	offset L$29
0075  80 02 00 00                                     DD	offset L$34
0079  AE 02 00 00                                     DD	offset L$36
007D  C8 02 00 00                                     DD	offset L$38
0081  DF 02 00 00                                     DD	offset L$39
0085  20 01 00 00                                     DD	offset L$5
0089  47 01 00 00                                     DD	offset L$9
008D  5D 01 00 00                                     DD	offset L$11
0091  9E 01 00 00                                     DD	offset L$15
0095  47 01 00 00                                     DD	offset L$9
0099  DB 01 00 00                                     DD	offset L$20
009D  F7 01 00 00                                     DD	offset L$21
00A1  08 02 00 00                                     DD	offset L$23
00A5  21 02 00 00                                     DD	offset L$25
00A9  14 02 00 00                                     DD	offset L$24
00AD  46 02 00 00                                     DD	offset L$28
00B1  72 02 00 00                                     DD	offset L$33
00B5  A1 02 00 00                                     DD	offset L$35
00B9  BB 02 00 00                                     DD	offset L$37

Routine Size: 189 bytes,    Routine Base: _TEXT + 0000

00BD				_ustrftime_:
00BD  56				push		esi
00BE  57				push		edi
00BF  C8 5C 00 00			enter		0x005c,0x00
00C3  50				push		eax
00C4  52				push		edx
00C5  53				push		ebx
00C6  89 CE				mov		esi,ecx
00C8  C7 45 F0 00 00 00 00		mov		dword ptr -0x10[ebp],0x00000000
00CF  C7 45 F8 00 00 00 00		mov		dword ptr -0x8[ebp],0x00000000
00D6  89 55 F4				mov		dword ptr -0xc[ebp],edx
00D9  E9 95 00 00 00			jmp		L$14
00DE				L$3:
00DE  0F B7 00				movzx		eax,word ptr [eax]
00E1  83 F8 25				cmp		eax,0x00000025
00E4  74 0B				je		L$4
00E6  8B 45 98				mov		eax,dword ptr -0x68[ebp]
00E9  66 8B 00				mov		ax,word ptr [eax]
00EC  E9 08 02 00 00			jmp		L$41
00F1				L$4:
00F1  83 45 98 02			add		dword ptr -0x68[ebp],0x00000002
00F5  8B 45 98				mov		eax,dword ptr -0x68[ebp]
00F8  66 8B 00				mov		ax,word ptr [eax]
00FB  83 E8 25				sub		eax,0x00000025
00FE  66 3D 54 00			cmp		ax,0x0054
0102  0F 87 EB 01 00 00			ja		L$40
0108  B9 1D 00 00 00			mov		ecx,0x0000001d
010D  BF 2D 00 00 00			mov		edi,offset L$1
0112  06				push		es
0113  0E				push		cs
0114  07				pop		es
0115  F2 AE				repne scasb	
0117  07				pop		es
0118  2E FF 24 8D 49 00 00 00		jmp		dword ptr cs:L$2[ecx*4]
0120				L$5:
0120  8B 46 18				mov		eax,dword ptr 0x18[esi]
0123  BA 00 00 00 00			mov		edx,offset _awday_name
0128				L$6:
0128  C1 E0 02				shl		eax,0x02
012B  01 C2				add		edx,eax
012D  89 55 FC				mov		dword ptr -0x4[ebp],edx
0130  E9 CE 01 00 00			jmp		L$42
0135				L$7:
0135  8B 46 18				mov		eax,dword ptr 0x18[esi]
0138  8B 04 85 00 00 00 00		mov		eax,dword ptr _wday_name[eax*4]
013F				L$8:
013F  89 45 FC				mov		dword ptr -0x4[ebp],eax
0142  E9 BC 01 00 00			jmp		L$42
0147				L$9:
0147  8B 46 10				mov		eax,dword ptr 0x10[esi]
014A  BA 00 00 00 00			mov		edx,offset _amon_name
014F  EB D7				jmp		L$6
0151				L$10:
0151  8B 46 10				mov		eax,dword ptr 0x10[esi]
0154  8B 04 85 00 00 00 00		mov		eax,dword ptr _mon_name[eax*4]
015B  EB E2				jmp		L$8
015D				L$11:
015D  8B 45 98				mov		eax,dword ptr -0x68[ebp]
0160  BA 8F 00 00 00			mov		edx,offset DGROUP:L$70
0165				L$12:
0165  89 45 F8				mov		dword ptr -0x8[ebp],eax
0168  8D 45 A4				lea		eax,-0x5c[ebp]
016B  E8 00 00 00 00			call		_atouni_
0170				L$13:
0170  89 45 98				mov		dword ptr -0x68[ebp],eax
0173				L$14:
0173  8D 45 E0				lea		eax,-0x20[ebp]
0176  89 45 FC				mov		dword ptr -0x4[ebp],eax
0179  8B 45 98				mov		eax,dword ptr -0x68[ebp]
017C  66 83 38 00			cmp		word ptr [eax],0x0000
0180  0F 85 58 FF FF FF			jne		L$3
0186  83 7D F8 00			cmp		dword ptr -0x8[ebp],0x00000000
018A  0F 84 D0 01 00 00			je		L$47
0190  8B 45 F8				mov		eax,dword ptr -0x8[ebp]
0193  40				inc		eax
0194  40				inc		eax
0195  C7 45 F8 00 00 00 00		mov		dword ptr -0x8[ebp],0x00000000
019C  EB D2				jmp		L$13
019E				L$15:
019E  8D 45 E0				lea		eax,-0x20[ebp]
01A1  8B 56 0C				mov		edx,dword ptr 0xc[esi]
01A4  E9 BF 00 00 00			jmp		L$32
01A9				L$16:
01A9  8B 45 98				mov		eax,dword ptr -0x68[ebp]
01AC  BA A4 00 00 00			mov		edx,offset DGROUP:L$71
01B1  EB B2				jmp		L$12
01B3				L$17:
01B3  8D 45 E0				lea		eax,-0x20[ebp]
01B6  8B 56 08				mov		edx,dword ptr 0x8[esi]
01B9  E9 AA 00 00 00			jmp		L$32
01BE				L$18:
01BE  8B 56 08				mov		edx,dword ptr 0x8[esi]
01C1  83 FA 0C				cmp		edx,0x0000000c
01C4  7E 03				jle		L$19
01C6  83 EA 0C				sub		edx,0x0000000c
01C9				L$19:
01C9  85 D2				test		edx,edx
01CB  0F 85 94 00 00 00			jne		L$31
01D1  BA 0C 00 00 00			mov		edx,0x0000000c
01D6  E9 8A 00 00 00			jmp		L$31
01DB				L$20:
01DB  BB 0A 00 00 00			mov		ebx,0x0000000a
01E0  8B 46 1C				mov		eax,dword ptr 0x1c[esi]
01E3  8D 55 E0				lea		edx,-0x20[ebp]
01E6  83 C0 65				add		eax,0x00000065
01E9  E8 00 00 00 00			call		_uitoa_
01EE  66 FF 4D E0			dec		word ptr -0x20[ebp]
01F2  E9 0C 01 00 00			jmp		L$42
01F7				L$21:
01F7  8B 56 10				mov		edx,dword ptr 0x10[esi]
01FA  8D 45 E0				lea		eax,-0x20[ebp]
01FD  42				inc		edx
01FE  EB 68				jmp		L$32
0200				L$22:
0200  8D 45 E0				lea		eax,-0x20[ebp]
0203  8B 56 04				mov		edx,dword ptr 0x4[esi]
0206  EB 60				jmp		L$32
0208				L$23:
0208  C7 45 FC AD 00 00 00		mov		dword ptr -0x4[ebp],offset DGROUP:L$72
020F  E9 EF 00 00 00			jmp		L$42
0214				L$24:
0214  8B 45 98				mov		eax,dword ptr -0x68[ebp]
0217  BA AF 00 00 00			mov		edx,offset DGROUP:L$73
021C  E9 44 FF FF FF			jmp		L$12
0221				L$25:
0221  83 7E 08 0C			cmp		dword ptr 0x8[esi],0x0000000c
0225  7D 0C				jge		L$26
0227  C7 45 FC BB 00 00 00		mov		dword ptr -0x4[ebp],offset DGROUP:L$74
022E  E9 D0 00 00 00			jmp		L$42
0233				L$26:
0233  C7 45 FC BE 00 00 00		mov		dword ptr -0x4[ebp],offset DGROUP:L$75
023A  E9 C4 00 00 00			jmp		L$42
023F				L$27:
023F  8D 45 E0				lea		eax,-0x20[ebp]
0242  8B 16				mov		edx,dword ptr [esi]
0244  EB 22				jmp		L$32
0246				L$28:
0246  C7 45 FC C1 00 00 00		mov		dword ptr -0x4[ebp],offset DGROUP:L$76
024D  E9 B1 00 00 00			jmp		L$42
0252				L$29:
0252  8B 46 1C				mov		eax,dword ptr 0x1c[esi]
0255  83 C0 07				add		eax,0x00000007
0258  2B 46 18				sub		eax,dword ptr 0x18[esi]
025B  BB 07 00 00 00			mov		ebx,0x00000007
0260				L$30:
0260  99				cdq		
0261  F7 FB				idiv		ebx
0263  89 C2				mov		edx,eax
0265				L$31:
0265  8D 45 E0				lea		eax,-0x20[ebp]
0268				L$32:
0268  E8 00 00 00 00			call		TwoDigits_
026D  E9 91 00 00 00			jmp		L$42
0272				L$33:
0272  66 8B 46 18			mov		ax,word ptr 0x18[esi]
0276  05 30 00 00 00			add		eax,0x00000030
027B  E9 79 00 00 00			jmp		L$41
0280				L$34:
0280  8B 46 1C				mov		eax,dword ptr 0x1c[esi]
0283  BB 07 00 00 00			mov		ebx,0x00000007
0288  99				cdq		
0289  F7 FB				idiv		ebx
028B  89 D0				mov		eax,edx
028D  2B 46 18				sub		eax,dword ptr 0x18[esi]
0290  01 D8				add		eax,ebx
0292  99				cdq		
0293  F7 FB				idiv		ebx
0295  B8 06 00 00 00			mov		eax,0x00000006
029A  29 D0				sub		eax,edx
029C  03 46 1C				add		eax,dword ptr 0x1c[esi]
029F  EB BF				jmp		L$30
02A1				L$35:
02A1  8B 45 98				mov		eax,dword ptr -0x68[ebp]
02A4  BA C3 00 00 00			mov		edx,offset DGROUP:L$77
02A9  E9 B7 FE FF FF			jmp		L$12
02AE				L$36:
02AE  8B 45 98				mov		eax,dword ptr -0x68[ebp]
02B1  BA D0 00 00 00			mov		edx,offset DGROUP:L$78
02B6  E9 AA FE FF FF			jmp		L$12
02BB				L$37:
02BB  8B 46 14				mov		eax,dword ptr 0x14[esi]
02BE  BB 64 00 00 00			mov		ebx,0x00000064
02C3  99				cdq		
02C4  F7 FB				idiv		ebx
02C6  EB 9D				jmp		L$31
02C8				L$38:
02C8  BB 0A 00 00 00			mov		ebx,0x0000000a
02CD  8B 46 14				mov		eax,dword ptr 0x14[esi]
02D0  8D 55 E0				lea		edx,-0x20[ebp]
02D3  05 6C 07 00 00			add		eax,0x0000076c
02D8  E8 00 00 00 00			call		_uitoa_
02DD  EB 24				jmp		L$42
02DF				L$39:
02DF  E8 00 00 00 00			call		tzset_
02E4  8B 46 20				mov		eax,dword ptr 0x20[esi]
02E7  8B 04 85 00 00 00 00		mov		eax,dword ptr _tzname[eax*4]
02EE  E9 4C FE FF FF			jmp		L$8
02F3				L$40:
02F3  8B 45 98				mov		eax,dword ptr -0x68[ebp]
02F6  66 8B 00				mov		ax,word ptr [eax]
02F9				L$41:
02F9  66 C7 45 E2 00 00			mov		word ptr -0x1e[ebp],0x0000
02FF  66 89 45 E0			mov		word ptr -0x20[ebp],ax
0303				L$42:
0303  8D 45 E0				lea		eax,-0x20[ebp]
0306  3B 45 FC				cmp		eax,dword ptr -0x4[ebp]
0309  74 21				je		L$45
030B				L$43:
030B  8B 55 FC				mov		edx,dword ptr -0x4[ebp]
030E  80 3A 00				cmp		byte ptr [edx],0x00
0311  74 0E				je		L$44
0313  66 0F B6 12			movzx		dx,byte ptr [edx]
0317  FF 45 FC				inc		dword ptr -0x4[ebp]
031A  66 89 10				mov		word ptr [eax],dx
031D  40				inc		eax
031E  40				inc		eax
031F  EB EA				jmp		L$43
0321				L$44:
0321  66 C7 00 00 00			mov		word ptr [eax],0x0000
0326  8D 45 E0				lea		eax,-0x20[ebp]
0329  89 45 FC				mov		dword ptr -0x4[ebp],eax
032C				L$45:
032C  8B 45 FC				mov		eax,dword ptr -0x4[ebp]
032F  83 45 98 02			add		dword ptr -0x68[ebp],0x00000002
0333  E8 00 00 00 00			call		_ustrlen_
0338  89 C1				mov		ecx,eax
033A  3B 45 F4				cmp		eax,dword ptr -0xc[ebp]
033D  76 03				jbe		L$46
033F  8B 4D F4				mov		ecx,dword ptr -0xc[ebp]
0342				L$46:
0342  8B 45 F0				mov		eax,dword ptr -0x10[ebp]
0345  8B 55 FC				mov		edx,dword ptr -0x4[ebp]
0348  8D 1C 09				lea		ebx,[ecx+ecx]
034B  01 C0				add		eax,eax
034D  29 4D F4				sub		dword ptr -0xc[ebp],ecx
0350  03 45 A0				add		eax,dword ptr -0x60[ebp]
0353  01 4D F0				add		dword ptr -0x10[ebp],ecx
0356  E8 00 00 00 00			call		memcpy_
035B  E9 13 FE FF FF			jmp		L$14
0360				L$47:
0360  8B 45 F0				mov		eax,dword ptr -0x10[ebp]
0363  3B 45 9C				cmp		eax,dword ptr -0x64[ebp]
0366  73 11				jae		L$48
0368  01 C0				add		eax,eax
036A  03 45 A0				add		eax,dword ptr -0x60[ebp]
036D  66 C7 00 00 00			mov		word ptr [eax],0x0000
0372  8B 45 F0				mov		eax,dword ptr -0x10[ebp]
0375  C9				leave		
0376  5F				pop		edi
0377  5E				pop		esi
0378  C3				ret		
0379				L$48:
0379  31 C0				xor		eax,eax
037B  C9				leave		
037C  5F				pop		edi
037D  5E				pop		esi
037E  C3				ret		

Routine Size: 706 bytes,    Routine Base: _TEXT + 00BD

037F				_ustrftime_ms_:
037F  56				push		esi
0380  57				push		edi
0381  C8 04 00 00			enter		0x0004,0x00
0385  89 C7				mov		edi,eax
0387  89 D6				mov		esi,edx
0389  89 DA				mov		edx,ebx
038B  89 D8				mov		eax,ebx
038D  E8 00 00 00 00			call		strlen_
0392  01 C0				add		eax,eax
0394  8D 58 02				lea		ebx,0x2[eax]
0397  83 C0 05				add		eax,0x00000005
039A  24 FC				and		al,0xfc
039C  89 5D FC				mov		dword ptr -0x4[ebp],ebx
039F  89 C3				mov		ebx,eax
03A1  E8 00 00 00 00			call		stackavail_
03A6  39 C3				cmp		ebx,eax
03A8  73 0E				jae		L$49
03AA  8B 45 FC				mov		eax,dword ptr -0x4[ebp]
03AD  83 C0 03				add		eax,0x00000003
03B0  24 FC				and		al,0xfc
03B2  29 C4				sub		esp,eax
03B4  89 E0				mov		eax,esp
03B6  EB 02				jmp		L$50
03B8				L$49:
03B8  31 C0				xor		eax,eax
03BA				L$50:
03BA  E8 00 00 00 00			call		_atouni_
03BF  89 C3				mov		ebx,eax
03C1  89 F2				mov		edx,esi
03C3  89 F8				mov		eax,edi
03C5  E8 00 00 00 00			call		_ustrftime_
03CA  C9				leave		
03CB  5F				pop		edi
03CC  5E				pop		esi
03CD  C3				ret		

Routine Size: 79 bytes,    Routine Base: _TEXT + 037F

No disassembly errors

Segment: CONST DWORD USE32 000000D9 bytes
0000				L$51:
0000  53 75 6E 64 61 79 00                            Sunday.
0007				L$52:
0007  4D 6F 6E 64 61 79 00                            Monday.
000E				L$53:
000E  54 75 65 73 64 61 79 00                         Tuesday.
0016				L$54:
0016  57 65 64 6E 65 73 64 61 79 00                   Wednesday.
0020				L$55:
0020  54 68 75 72 73 64 61 79 00                      Thursday.
0029				L$56:
0029  46 72 69 64 61 79 00                            Friday.
0030				L$57:
0030  53 61 74 75 72 64 61 79 00                      Saturday.
0039				L$58:
0039  4A 61 6E 75 61 72 79 00                         January.
0041				L$59:
0041  46 65 62 72 75 61 72 79 00                      February.
004A				L$60:
004A  4D 61 72 63 68 00                               March.
0050				L$61:
0050  41 70 72 69 6C 00                               April.
0056				L$62:
0056  4D 61 79 00                                     May.
005A				L$63:
005A  4A 75 6E 65 00                                  June.
005F				L$64:
005F  4A 75 6C 79 00                                  July.
0064				L$65:
0064  41 75 67 75 73 74 00                            August.
006B				L$66:
006B  53 65 70 74 65 6D 62 65 72 00                   September.
0075				L$67:
0075  4F 63 74 6F 62 65 72 00                         October.
007D				L$68:
007D  4E 6F 76 65 6D 62 65 72 00                      November.
0086				L$69:
0086  44 65 63 65 6D 62 65 72 00                      December.
008F				L$70:
008F  25 61 20 25 62 20 25 64 20 25 48 3A 25 4D 3A 25 %a %b %d %H:%M:%
009F  53 20 25 59 00                                  S %Y.
00A4				L$71:
00A4  25 6D 2F 25 64 2F 25 79 00                      %m/%d/%y.
00AD				L$72:
00AD  0A 00                                           ..
00AF				L$73:
00AF  25 49 3A 25 4D 3A 25 53 20 25 70 00             %I:%M:%S %p.
00BB				L$74:
00BB  41 4D 00                                        AM.
00BE				L$75:
00BE  50 4D 00                                        PM.
00C1				L$76:
00C1  09 00                                           ..
00C3				L$77:
00C3  25 61 20 25 62 20 25 64 2C 20 25 59 00          %a %b %d, %Y.
00D0				L$78:
00D0  25 48 3A 25 4D 3A 25 53 00                      %H:%M:%S.

Segment: CONST2 DWORD USE32 00000098 bytes
0000				_awday_name:
0000  53 75 6E 00 4D 6F 6E 00 54 75 65 00 57 65 64 00 Sun.Mon.Tue.Wed.
0010  54 68 75 00 46 72 69 00 53 61 74 00             Thu.Fri.Sat.
001C				_wday_name:
001C  00 00 00 00                                     DD	offset DGROUP:L$51
0020  07 00 00 00                                     DD	offset DGROUP:L$52
0024  0E 00 00 00                                     DD	offset DGROUP:L$53
0028  16 00 00 00                                     DD	offset DGROUP:L$54
002C  20 00 00 00                                     DD	offset DGROUP:L$55
0030  29 00 00 00                                     DD	offset DGROUP:L$56
0034  30 00 00 00                                     DD	offset DGROUP:L$57
0038				_amon_name:
0038  4A 61 6E 00 46 65 62 00 4D 61 72 00 41 70 72 00 Jan.Feb.Mar.Apr.
0048  4D 61 79 00 4A 75 6E 00 4A 75 6C 00 41 75 67 00 May.Jun.Jul.Aug.
0058  53 65 70 00 4F 63 74 00 4E 6F 76 00 44 65 63 00 Sep.Oct.Nov.Dec.
0068				_mon_name:
0068  39 00 00 00                                     DD	offset DGROUP:L$58
006C  41 00 00 00                                     DD	offset DGROUP:L$59
0070  4A 00 00 00                                     DD	offset DGROUP:L$60
0074  50 00 00 00                                     DD	offset DGROUP:L$61
0078  56 00 00 00                                     DD	offset DGROUP:L$62
007C  5A 00 00 00                                     DD	offset DGROUP:L$63
0080  5F 00 00 00                                     DD	offset DGROUP:L$64
0084  64 00 00 00                                     DD	offset DGROUP:L$65
0088  6B 00 00 00                                     DD	offset DGROUP:L$66
008C  75 00 00 00                                     DD	offset DGROUP:L$67
0090  7D 00 00 00                                     DD	offset DGROUP:L$68
0094  86 00 00 00                                     DD	offset DGROUP:L$69

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

