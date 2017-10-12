Module: strftime
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000003B3 bytes
0000				TwoDigits_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  89 C1				mov		ecx,eax
0005  89 D3				mov		ebx,edx
0007  BE 0A 00 00 00			mov		esi,0x0000000a
000C  89 D0				mov		eax,edx
000E  C1 FA 1F				sar		edx,0x1f
0011  F7 FE				idiv		esi
0013  89 DA				mov		edx,ebx
0015  83 C0 30				add		eax,0x00000030
0018  C1 FA 1F				sar		edx,0x1f
001B  88 01				mov		byte ptr [ecx],al
001D  89 D8				mov		eax,ebx
001F  F7 FE				idiv		esi
0021  C6 41 02 00			mov		byte ptr 0x2[ecx],0x00
0025  83 C2 30				add		edx,0x00000030
0028  88 51 01				mov		byte ptr 0x1[ecx],dl
002B  5E				pop		esi
002C  59				pop		ecx
002D  5B				pop		ebx
002E  C3				ret		
002F  90				nop		
0030				L$1:
0030  79 78 77 74 72 70 6E 6D 6A 68 64 63 62 61 5A 59 yxwtrpnmjhdcbaZY
0040  58 57 55 54 53 4D 49 48 44 42 41 25             XWUTSMIHDBA%
004C				L$2:
004C  20 03 00 00                                     DD	offset L$37
0050  20 03 00 00                                     DD	offset L$37
0054  2E 01 00 00                                     DD	offset L$6
0058  4E 01 00 00                                     DD	offset L$8
005C  A3 01 00 00                                     DD	offset L$13
0060  AD 01 00 00                                     DD	offset L$14
0064  B9 01 00 00                                     DD	offset L$15
0068  FD 01 00 00                                     DD	offset L$19
006C  3E 02 00 00                                     DD	offset L$24
0070  D0 02 00 00                                     DD	offset L$33
0074  51 02 00 00                                     DD	offset L$26
0078  8C 02 00 00                                     DD	offset L$31
007C  D0 02 00 00                                     DD	offset L$33
0080  F7 02 00 00                                     DD	offset L$35
0084  0F 03 00 00                                     DD	offset L$36
0088  1D 01 00 00                                     DD	offset L$5
008C  3D 01 00 00                                     DD	offset L$7
0090  5D 01 00 00                                     DD	offset L$9
0094  97 01 00 00                                     DD	offset L$12
0098  3D 01 00 00                                     DD	offset L$7
009C  D6 01 00 00                                     DD	offset L$17
00A0  F3 01 00 00                                     DD	offset L$18
00A4  06 02 00 00                                     DD	offset L$20
00A8  24 02 00 00                                     DD	offset L$22
00AC  10 02 00 00                                     DD	offset L$21
00B0  47 02 00 00                                     DD	offset L$25
00B4  78 02 00 00                                     DD	offset L$30
00B8  BC 02 00 00                                     DD	offset L$32
00BC  E3 02 00 00                                     DD	offset L$34

Routine Size: 192 bytes,    Routine Base: _TEXT + 0000

00C0				strftime_:
00C0  56				push		esi
00C1  57				push		edi
00C2  55				push		ebp
00C3  83 EC 14				sub		esp,0x00000014
00C6  50				push		eax
00C7  52				push		edx
00C8  53				push		ebx
00C9  89 CD				mov		ebp,ecx
00CB  31 D2				xor		edx,edx
00CD  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
00D1  89 54 24 14			mov		dword ptr 0x14[esp],edx
00D5  89 44 24 18			mov		dword ptr 0x18[esp],eax
00D9  89 54 24 1C			mov		dword ptr 0x1c[esp],edx
00DD  E9 8A 00 00 00			jmp		L$11
00E2				L$3:
00E2  8B 14 24				mov		edx,dword ptr [esp]
00E5  31 C0				xor		eax,eax
00E7  8A 02				mov		al,byte ptr [edx]
00E9  83 F8 25				cmp		eax,0x00000025
00EC  74 0F				je		L$4
00EE  30 C9				xor		cl,cl
00F0  88 44 24 0C			mov		byte ptr 0xc[esp],al
00F4  88 4C 24 0D			mov		byte ptr 0xd[esp],cl
00F8  E9 32 02 00 00			jmp		L$38
00FD				L$4:
00FD  8D 4A 01				lea		ecx,0x1[edx]
0100  BF 30 00 00 00			mov		edi,offset L$1
0105  89 0C 24				mov		dword ptr [esp],ecx
0108  8A 01				mov		al,byte ptr [ecx]
010A  B9 1D 00 00 00			mov		ecx,0x0000001d
010F  06				push		es
0110  0E				push		cs
0111  07				pop		es
0112  F2 AE				repne scasb	
0114  07				pop		es
0115  2E FF 24 8D 4C 00 00 00		jmp		dword ptr cs:L$2[ecx*4]
011D				L$5:
011D  8B 75 18				mov		esi,dword ptr 0x18[ebp]
0120  C1 E6 02				shl		esi,0x02
0123  81 C6 00 00 00 00			add		esi,offset _awday_name
0129  E9 01 02 00 00			jmp		L$38
012E				L$6:
012E  8B 75 18				mov		esi,dword ptr 0x18[ebp]
0131  8B 34 B5 00 00 00 00		mov		esi,dword ptr _wday_name[esi*4]
0138  E9 F2 01 00 00			jmp		L$38
013D				L$7:
013D  8B 75 10				mov		esi,dword ptr 0x10[ebp]
0140  C1 E6 02				shl		esi,0x02
0143  81 C6 00 00 00 00			add		esi,offset _amon_name
0149  E9 E1 01 00 00			jmp		L$38
014E				L$8:
014E  8B 75 10				mov		esi,dword ptr 0x10[ebp]
0151  8B 34 B5 00 00 00 00		mov		esi,dword ptr _mon_name[esi*4]
0158  E9 D2 01 00 00			jmp		L$38
015D				L$9:
015D  8B 04 24				mov		eax,dword ptr [esp]
0160  BA 8F 00 00 00			mov		edx,offset DGROUP:L$62
0165				L$10:
0165  89 44 24 1C			mov		dword ptr 0x1c[esp],eax
0169  89 14 24				mov		dword ptr [esp],edx
016C				L$11:
016C  8B 04 24				mov		eax,dword ptr [esp]
016F  8A 10				mov		dl,byte ptr [eax]
0171  8D 74 24 0C			lea		esi,0xc[esp]
0175  84 D2				test		dl,dl
0177  0F 85 65 FF FF FF			jne		L$3
017D  8B 74 24 1C			mov		esi,dword ptr 0x1c[esp]
0181  85 F6				test		esi,esi
0183  0F 84 06 02 00 00			je		L$40
0189  8D 46 01				lea		eax,0x1[esi]
018C  31 FF				xor		edi,edi
018E  89 04 24				mov		dword ptr [esp],eax
0191  89 7C 24 1C			mov		dword ptr 0x1c[esp],edi
0195  EB D5				jmp		L$11
0197				L$12:
0197  8D 44 24 0C			lea		eax,0xc[esp]
019B  8B 55 0C				mov		edx,dword ptr 0xc[ebp]
019E  E9 CB 00 00 00			jmp		L$29
01A3				L$13:
01A3  8B 04 24				mov		eax,dword ptr [esp]
01A6  BA A4 00 00 00			mov		edx,offset DGROUP:L$63
01AB  EB B8				jmp		L$10
01AD				L$14:
01AD  8D 44 24 0C			lea		eax,0xc[esp]
01B1  8B 55 08				mov		edx,dword ptr 0x8[ebp]
01B4  E9 B5 00 00 00			jmp		L$29
01B9				L$15:
01B9  8B 55 08				mov		edx,dword ptr 0x8[ebp]
01BC  83 FA 0C				cmp		edx,0x0000000c
01BF  7E 03				jle		L$16
01C1  83 EA 0C				sub		edx,0x0000000c
01C4				L$16:
01C4  85 D2				test		edx,edx
01C6  0F 85 9E 00 00 00			jne		L$28
01CC  BA 0C 00 00 00			mov		edx,0x0000000c
01D1  E9 94 00 00 00			jmp		L$28
01D6				L$17:
01D6  BB 0A 00 00 00			mov		ebx,0x0000000a
01DB  8B 45 1C				mov		eax,dword ptr 0x1c[ebp]
01DE  8D 54 24 0C			lea		edx,0xc[esp]
01E2  83 C0 65				add		eax,0x00000065
01E5  E8 00 00 00 00			call		itoa_
01EA  FE 4C 24 0C			dec		byte ptr 0xc[esp]
01EE  E9 3C 01 00 00			jmp		L$38
01F3				L$18:
01F3  8B 55 10				mov		edx,dword ptr 0x10[ebp]
01F6  8D 44 24 0C			lea		eax,0xc[esp]
01FA  42				inc		edx
01FB  EB 71				jmp		L$29
01FD				L$19:
01FD  8D 44 24 0C			lea		eax,0xc[esp]
0201  8B 55 04				mov		edx,dword ptr 0x4[ebp]
0204  EB 68				jmp		L$29
0206				L$20:
0206  BE AD 00 00 00			mov		esi,offset DGROUP:L$64
020B  E9 1F 01 00 00			jmp		L$38
0210				L$21:
0210  8B 04 24				mov		eax,dword ptr [esp]
0213  BF AF 00 00 00			mov		edi,offset DGROUP:L$65
0218  89 44 24 1C			mov		dword ptr 0x1c[esp],eax
021C  89 3C 24				mov		dword ptr [esp],edi
021F  E9 48 FF FF FF			jmp		L$11
0224				L$22:
0224  83 7D 08 0C			cmp		dword ptr 0x8[ebp],0x0000000c
0228  7D 0A				jge		L$23
022A  BE BB 00 00 00			mov		esi,offset DGROUP:L$66
022F  E9 FB 00 00 00			jmp		L$38
0234				L$23:
0234  BE BE 00 00 00			mov		esi,offset DGROUP:L$67
0239  E9 F1 00 00 00			jmp		L$38
023E				L$24:
023E  8D 44 24 0C			lea		eax,0xc[esp]
0242  8B 55 00				mov		edx,dword ptr [ebp]
0245  EB 27				jmp		L$29
0247				L$25:
0247  BE C1 00 00 00			mov		esi,offset DGROUP:L$68
024C  E9 DE 00 00 00			jmp		L$38
0251				L$26:
0251  8B 55 1C				mov		edx,dword ptr 0x1c[ebp]
0254  8B 7D 18				mov		edi,dword ptr 0x18[ebp]
0257  83 C2 07				add		edx,0x00000007
025A  29 FA				sub		edx,edi
025C  B9 07 00 00 00			mov		ecx,0x00000007
0261  89 D0				mov		eax,edx
0263				L$27:
0263  C1 FA 1F				sar		edx,0x1f
0266  F7 F9				idiv		ecx
0268  89 C2				mov		edx,eax
026A				L$28:
026A  8D 44 24 0C			lea		eax,0xc[esp]
026E				L$29:
026E  E8 00 00 00 00			call		TwoDigits_
0273  E9 B7 00 00 00			jmp		L$38
0278				L$30:
0278  8A 45 18				mov		al,byte ptr 0x18[ebp]
027B  30 F6				xor		dh,dh
027D  04 30				add		al,0x30
027F  88 74 24 0D			mov		byte ptr 0xd[esp],dh
0283  88 44 24 0C			mov		byte ptr 0xc[esp],al
0287  E9 A3 00 00 00			jmp		L$38
028C				L$31:
028C  8B 45 1C				mov		eax,dword ptr 0x1c[ebp]
028F  89 C2				mov		edx,eax
0291  B9 07 00 00 00			mov		ecx,0x00000007
0296  C1 FA 1F				sar		edx,0x1f
0299  F7 F9				idiv		ecx
029B  2B 55 18				sub		edx,dword ptr 0x18[ebp]
029E  01 CA				add		edx,ecx
02A0  89 D0				mov		eax,edx
02A2  C1 FA 1F				sar		edx,0x1f
02A5  F7 F9				idiv		ecx
02A7  B8 06 00 00 00			mov		eax,0x00000006
02AC  8B 4D 1C				mov		ecx,dword ptr 0x1c[ebp]
02AF  29 D0				sub		eax,edx
02B1  01 C8				add		eax,ecx
02B3  89 C2				mov		edx,eax
02B5  B9 07 00 00 00			mov		ecx,0x00000007
02BA  EB A7				jmp		L$27
02BC				L$32:
02BC  8B 04 24				mov		eax,dword ptr [esp]
02BF  BE C3 00 00 00			mov		esi,offset DGROUP:L$69
02C4  89 44 24 1C			mov		dword ptr 0x1c[esp],eax
02C8  89 34 24				mov		dword ptr [esp],esi
02CB  E9 9C FE FF FF			jmp		L$11
02D0				L$33:
02D0  8B 04 24				mov		eax,dword ptr [esp]
02D3  89 44 24 1C			mov		dword ptr 0x1c[esp],eax
02D7  C7 04 24 D0 00 00 00		mov		dword ptr [esp],offset DGROUP:L$70
02DE  E9 89 FE FF FF			jmp		L$11
02E3				L$34:
02E3  8B 45 14				mov		eax,dword ptr 0x14[ebp]
02E6  89 C2				mov		edx,eax
02E8  B9 64 00 00 00			mov		ecx,0x00000064
02ED  C1 FA 1F				sar		edx,0x1f
02F0  F7 F9				idiv		ecx
02F2  E9 73 FF FF FF			jmp		L$28
02F7				L$35:
02F7  BB 0A 00 00 00			mov		ebx,0x0000000a
02FC  8B 45 14				mov		eax,dword ptr 0x14[ebp]
02FF  8D 54 24 0C			lea		edx,0xc[esp]
0303  05 6C 07 00 00			add		eax,0x0000076c
0308  E8 00 00 00 00			call		itoa_
030D  EB 20				jmp		L$38
030F				L$36:
030F  E8 00 00 00 00			call		tzset_
0314  8B 75 20				mov		esi,dword ptr 0x20[ebp]
0317  8B 34 B5 00 00 00 00		mov		esi,dword ptr _tzname[esi*4]
031E  EB 0F				jmp		L$38
0320				L$37:
0320  8B 04 24				mov		eax,dword ptr [esp]
0323  8A 00				mov		al,byte ptr [eax]
0325  30 FF				xor		bh,bh
0327  88 44 24 0C			mov		byte ptr 0xc[esp],al
032B  88 7C 24 0D			mov		byte ptr 0xd[esp],bh
032F				L$38:
032F  89 F7				mov		edi,esi
0331  8B 1C 24				mov		ebx,dword ptr [esp]
0334  06				push		es
0335  8C D8				mov		eax,ds
0337  8E C0				mov		es,eax
0339  29 C9				sub		ecx,ecx
033B  49				dec		ecx
033C  31 C0				xor		eax,eax
033E  F2 AE				repne scasb	
0340  F7 D1				not		ecx
0342  49				dec		ecx
0343  07				pop		es
0344  8B 7C 24 18			mov		edi,dword ptr 0x18[esp]
0348  43				inc		ebx
0349  89 CA				mov		edx,ecx
034B  89 1C 24				mov		dword ptr [esp],ebx
034E  39 F9				cmp		ecx,edi
0350  76 02				jbe		L$39
0352  89 FA				mov		edx,edi
0354				L$39:
0354  8B 7C 24 08			mov		edi,dword ptr 0x8[esp]
0358  8B 44 24 14			mov		eax,dword ptr 0x14[esp]
035C  89 D1				mov		ecx,edx
035E  01 C7				add		edi,eax
0360  8B 5C 24 18			mov		ebx,dword ptr 0x18[esp]
0364  06				push		es
0365  8C D8				mov		eax,ds
0367  8E C0				mov		es,eax
0369  57				push		edi
036A  89 C8				mov		eax,ecx
036C  C1 E9 02				shr		ecx,0x02
036F  F2 A5				repne movsd	
0371  8A C8				mov		cl,al
0373  80 E1 03				and		cl,0x03
0376  F2 A4				repne movsb	
0378  5F				pop		edi
0379  07				pop		es
037A  8B 4C 24 14			mov		ecx,dword ptr 0x14[esp]
037E  29 D3				sub		ebx,edx
0380  01 D1				add		ecx,edx
0382  89 5C 24 18			mov		dword ptr 0x18[esp],ebx
0386  89 4C 24 14			mov		dword ptr 0x14[esp],ecx
038A  E9 DD FD FF FF			jmp		L$11
038F				L$40:
038F  8B 44 24 14			mov		eax,dword ptr 0x14[esp]
0393  3B 44 24 04			cmp		eax,dword ptr 0x4[esp]
0397  73 11				jae		L$41
0399  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
039D  8B 54 24 14			mov		edx,dword ptr 0x14[esp]
03A1  01 D0				add		eax,edx
03A3  C6 00 00				mov		byte ptr [eax],0x00
03A6  89 D0				mov		eax,edx
03A8  EB 02				jmp		L$42
03AA				L$41:
03AA  31 C0				xor		eax,eax
03AC				L$42:
03AC  83 C4 20				add		esp,0x00000020
03AF  5D				pop		ebp
03B0  5F				pop		edi
03B1  5E				pop		esi
03B2  C3				ret		

Routine Size: 755 bytes,    Routine Base: _TEXT + 00C0

No disassembly errors

Segment: CONST DWORD USE32 000000D9 bytes
0000				L$43:
0000  53 75 6E 64 61 79 00                            Sunday.
0007				L$44:
0007  4D 6F 6E 64 61 79 00                            Monday.
000E				L$45:
000E  54 75 65 73 64 61 79 00                         Tuesday.
0016				L$46:
0016  57 65 64 6E 65 73 64 61 79 00                   Wednesday.
0020				L$47:
0020  54 68 75 72 73 64 61 79 00                      Thursday.
0029				L$48:
0029  46 72 69 64 61 79 00                            Friday.
0030				L$49:
0030  53 61 74 75 72 64 61 79 00                      Saturday.
0039				L$50:
0039  4A 61 6E 75 61 72 79 00                         January.
0041				L$51:
0041  46 65 62 72 75 61 72 79 00                      February.
004A				L$52:
004A  4D 61 72 63 68 00                               March.
0050				L$53:
0050  41 70 72 69 6C 00                               April.
0056				L$54:
0056  4D 61 79 00                                     May.
005A				L$55:
005A  4A 75 6E 65 00                                  June.
005F				L$56:
005F  4A 75 6C 79 00                                  July.
0064				L$57:
0064  41 75 67 75 73 74 00                            August.
006B				L$58:
006B  53 65 70 74 65 6D 62 65 72 00                   September.
0075				L$59:
0075  4F 63 74 6F 62 65 72 00                         October.
007D				L$60:
007D  4E 6F 76 65 6D 62 65 72 00                      November.
0086				L$61:
0086  44 65 63 65 6D 62 65 72 00                      December.
008F				L$62:
008F  25 61 20 25 62 20 25 64 20 25 48 3A 25 4D 3A 25 %a %b %d %H:%M:%
009F  53 20 25 59 00                                  S %Y.
00A4				L$63:
00A4  25 6D 2F 25 64 2F 25 79 00                      %m/%d/%y.
00AD				L$64:
00AD  0A 00                                           ..
00AF				L$65:
00AF  25 49 3A 25 4D 3A 25 53 20 25 70 00             %I:%M:%S %p.
00BB				L$66:
00BB  41 4D 00                                        AM.
00BE				L$67:
00BE  50 4D 00                                        PM.
00C1				L$68:
00C1  09 00                                           ..
00C3				L$69:
00C3  25 61 20 25 62 20 25 64 2C 20 25 59 00          %a %b %d, %Y.
00D0				L$70:
00D0  25 48 3A 25 4D 3A 25 53 00                      %H:%M:%S.

Segment: CONST2 DWORD USE32 00000098 bytes
0000				_awday_name:
0000  53 75 6E 00 4D 6F 6E 00 54 75 65 00 57 65 64 00 Sun.Mon.Tue.Wed.
0010  54 68 75 00 46 72 69 00 53 61 74 00             Thu.Fri.Sat.
001C				_wday_name:
001C  00 00 00 00                                     DD	offset DGROUP:L$43
0020  07 00 00 00                                     DD	offset DGROUP:L$44
0024  0E 00 00 00                                     DD	offset DGROUP:L$45
0028  16 00 00 00                                     DD	offset DGROUP:L$46
002C  20 00 00 00                                     DD	offset DGROUP:L$47
0030  29 00 00 00                                     DD	offset DGROUP:L$48
0034  30 00 00 00                                     DD	offset DGROUP:L$49
0038				_amon_name:
0038  4A 61 6E 00 46 65 62 00 4D 61 72 00 41 70 72 00 Jan.Feb.Mar.Apr.
0048  4D 61 79 00 4A 75 6E 00 4A 75 6C 00 41 75 67 00 May.Jun.Jul.Aug.
0058  53 65 70 00 4F 63 74 00 4E 6F 76 00 44 65 63 00 Sep.Oct.Nov.Dec.
0068				_mon_name:
0068  39 00 00 00                                     DD	offset DGROUP:L$50
006C  41 00 00 00                                     DD	offset DGROUP:L$51
0070  4A 00 00 00                                     DD	offset DGROUP:L$52
0074  50 00 00 00                                     DD	offset DGROUP:L$53
0078  56 00 00 00                                     DD	offset DGROUP:L$54
007C  5A 00 00 00                                     DD	offset DGROUP:L$55
0080  5F 00 00 00                                     DD	offset DGROUP:L$56
0084  64 00 00 00                                     DD	offset DGROUP:L$57
0088  6B 00 00 00                                     DD	offset DGROUP:L$58
008C  75 00 00 00                                     DD	offset DGROUP:L$59
0090  7D 00 00 00                                     DD	offset DGROUP:L$60
0094  86 00 00 00                                     DD	offset DGROUP:L$61

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

