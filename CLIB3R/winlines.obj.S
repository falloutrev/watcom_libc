Module: winlines
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000921 bytes
0000				createNewEntry_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  57				push		edi
0005  89 C3				mov		ebx,eax
0007  8B 50 57				mov		edx,dword ptr 0x57[eax]
000A  8B 40 53				mov		eax,dword ptr 0x53[eax]
000D  83 C0 09				add		eax,0x00000009
0010  E8 00 00 00 00			call		__mbsninc_
0015  C6 00 00				mov		byte ptr [eax],0x00
0018  8B 43 53				mov		eax,dword ptr 0x53[ebx]
001B  8B 53 57				mov		edx,dword ptr 0x57[ebx]
001E  83 C0 09				add		eax,0x00000009
0021  E8 00 00 00 00			call		_mbsnbcnt_
0026  83 C0 0A				add		eax,0x0000000a
0029  E8 00 00 00 00			call		_MemAlloc_
002E  89 C2				mov		edx,eax
0030  8B 73 53				mov		esi,dword ptr 0x53[ebx]
0033  89 C1				mov		ecx,eax
0035  83 C6 09				add		esi,0x00000009
0038  8D 78 09				lea		edi,0x9[eax]
003B  C7 43 57 00 00 00 00		mov		dword ptr 0x57[ebx],0x00000000
0042  57				push		edi
0043				L$1:
0043  8A 06				mov		al,byte ptr [esi]
0045  88 07				mov		byte ptr [edi],al
0047  3C 00				cmp		al,0x00
0049  74 10				je		L$2
004B  8A 46 01				mov		al,byte ptr 0x1[esi]
004E  83 C6 02				add		esi,0x00000002
0051  88 47 01				mov		byte ptr 0x1[edi],al
0054  83 C7 02				add		edi,0x00000002
0057  3C 00				cmp		al,0x00
0059  75 E8				jne		L$1
005B				L$2:
005B  5F				pop		edi
005C  8B 73 42				mov		esi,dword ptr 0x42[ebx]
005F  85 F6				test		esi,esi
0061  75 08				jne		L$3
0063  89 53 42				mov		dword ptr 0x42[ebx],edx
0066  89 53 3E				mov		dword ptr 0x3e[ebx],edx
0069  EB 0B				jmp		L$4
006B				L$3:
006B  89 16				mov		dword ptr [esi],edx
006D  8B 43 42				mov		eax,dword ptr 0x42[ebx]
0070  89 42 04				mov		dword ptr 0x4[edx],eax
0073  89 53 42				mov		dword ptr 0x42[ebx],edx
0076				L$4:
0076  89 C8				mov		eax,ecx
0078  EB 58				jmp		L$8
007A				incrementLastLineNumber_:
007A  53				push		ebx
007B  51				push		ecx
007C  52				push		edx
007D  56				push		esi
007E  57				push		edi
007F  55				push		ebp
0080  89 C3				mov		ebx,eax
0082  8B 50 46				mov		edx,dword ptr 0x46[eax]
0085  42				inc		edx
0086  8B 0D 00 00 00 00			mov		ecx,dword ptr __AutoClearLines
008C  89 50 46				mov		dword ptr 0x46[eax],edx
008F  39 CA				cmp		edx,ecx
0091  76 07				jbe		L$5
0093  E8 00 00 00 00			call		_FreeAllLines_
0098  EB 37				jmp		L$7
009A				L$5:
009A  89 D0				mov		eax,edx
009C  8B 73 4E				mov		esi,dword ptr 0x4e[ebx]
009F  8B 7B 24				mov		edi,dword ptr 0x24[ebx]
00A2  29 F0				sub		eax,esi
00A4  39 F8				cmp		eax,edi
00A6  7D 22				jge		L$6
00A8  8B 6B 4A				mov		ebp,dword ptr 0x4a[ebx]
00AB  8B 53 24				mov		edx,dword ptr 0x24[ebx]
00AE  45				inc		ebp
00AF  4A				dec		edx
00B0  89 6B 4A				mov		dword ptr 0x4a[ebx],ebp
00B3  39 D0				cmp		eax,edx
00B5  75 13				jne		L$6
00B7  8B 43 4E				mov		eax,dword ptr 0x4e[ebx]
00BA  40				inc		eax
00BB  BA 01 00 00 00			mov		edx,0x00000001
00C0  89 43 4E				mov		dword ptr 0x4e[ebx],eax
00C3  89 D8				mov		eax,ebx
00C5  E8 00 00 00 00			call		_ShiftWindow_
00CA				L$6:
00CA  89 D8				mov		eax,ebx
00CC  E8 00 00 00 00			call		_PositionScrollThumb_
00D1				L$7:
00D1  5D				pop		ebp
00D2				L$8:
00D2  5F				pop		edi
00D3  5E				pop		esi
00D4  5A				pop		edx
00D5  59				pop		ecx
00D6  5B				pop		ebx
00D7  C3				ret		
00D8				replaceTail_:
00D8  53				push		ebx
00D9  51				push		ecx
00DA  52				push		edx
00DB  56				push		esi
00DC  57				push		edi
00DD  89 C1				mov		ecx,eax
00DF  8B 50 57				mov		edx,dword ptr 0x57[eax]
00E2  8B 40 53				mov		eax,dword ptr 0x53[eax]
00E5  83 C0 09				add		eax,0x00000009
00E8  E8 00 00 00 00			call		__mbsninc_
00ED  C6 00 00				mov		byte ptr [eax],0x00
00F0  8B 41 42				mov		eax,dword ptr 0x42[ecx]
00F3  8B 50 04				mov		edx,dword ptr 0x4[eax]
00F6  E8 00 00 00 00			call		_MemFree_
00FB  8B 41 57				mov		eax,dword ptr 0x57[ecx]
00FE  01 C0				add		eax,eax
0100  83 C0 0A				add		eax,0x0000000a
0103  E8 00 00 00 00			call		_MemAlloc_
0108  8B 71 53				mov		esi,dword ptr 0x53[ecx]
010B  89 41 42				mov		dword ptr 0x42[ecx],eax
010E  83 C6 09				add		esi,0x00000009
0111  8D 78 09				lea		edi,0x9[eax]
0114  57				push		edi
0115				L$9:
0115  8A 06				mov		al,byte ptr [esi]
0117  88 07				mov		byte ptr [edi],al
0119  3C 00				cmp		al,0x00
011B  74 10				je		L$10
011D  8A 46 01				mov		al,byte ptr 0x1[esi]
0120  83 C6 02				add		esi,0x00000002
0123  88 47 01				mov		byte ptr 0x1[edi],al
0126  83 C7 02				add		edi,0x00000002
0129  3C 00				cmp		al,0x00
012B  75 E8				jne		L$9
012D				L$10:
012D  5F				pop		edi
012E  8B 41 42				mov		eax,dword ptr 0x42[ecx]
0131  89 50 04				mov		dword ptr 0x4[eax],edx
0134  85 D2				test		edx,edx
0136  74 07				je		L$11
0138  8B 41 42				mov		eax,dword ptr 0x42[ecx]
013B  89 02				mov		dword ptr [edx],eax
013D  EB 06				jmp		L$12
013F				L$11:
013F  8B 41 42				mov		eax,dword ptr 0x42[ecx]
0142  89 41 3E				mov		dword ptr 0x3e[ecx],eax
0145				L$12:
0145  8B 41 46				mov		eax,dword ptr 0x46[ecx]
0148  2B 41 4E				sub		eax,dword ptr 0x4e[ecx]
014B  8B 59 42				mov		ebx,dword ptr 0x42[ecx]
014E  8D 50 01				lea		edx,0x1[eax]
0151  83 C3 09				add		ebx,0x00000009
0154  89 C8				mov		eax,ecx
0156  E8 00 00 00 00			call		_DisplayLineInWindow_
015B  E9 72 FF FF FF			jmp		L$8
0160				addBuff_:
0160  53				push		ebx
0161  51				push		ecx
0162  52				push		edx
0163  89 C1				mov		ecx,eax
0165  E8 00 00 00 00			call		createNewEntry_
016A  8D 58 09				lea		ebx,0x9[eax]
016D  C6 40 08 01			mov		byte ptr 0x8[eax],0x01
0171  8B 41 46				mov		eax,dword ptr 0x46[ecx]
0174  2B 41 4E				sub		eax,dword ptr 0x4e[ecx]
0177  8D 50 01				lea		edx,0x1[eax]
017A  89 C8				mov		eax,ecx
017C  E8 00 00 00 00			call		_DisplayLineInWindow_
0181  5A				pop		edx
0182  59				pop		ecx
0183  5B				pop		ebx
0184  C3				ret		
0185				updateBuff_:
0185  53				push		ebx
0186  52				push		edx
0187  89 C2				mov		edx,eax
0189  83 78 3E 00			cmp		dword ptr 0x3e[eax],0x00000000
018D  74 09				je		L$13
018F  8B 40 42				mov		eax,dword ptr 0x42[eax]
0192  80 78 08 00			cmp		byte ptr 0x8[eax],0x00
0196  74 0F				je		L$14
0198				L$13:
0198  89 D0				mov		eax,edx
019A  8B 5A 57				mov		ebx,dword ptr 0x57[edx]
019D  E8 00 00 00 00			call		addBuff_
01A2  89 5A 57				mov		dword ptr 0x57[edx],ebx
01A5  EB 07				jmp		L$15
01A7				L$14:
01A7  89 D0				mov		eax,edx
01A9  E8 00 00 00 00			call		replaceTail_
01AE				L$15:
01AE  8B 52 42				mov		edx,dword ptr 0x42[edx]
01B1  C6 42 08 00			mov		byte ptr 0x8[edx],0x00
01B5  5A				pop		edx
01B6  5B				pop		ebx
01B7  C3				ret		
01B8				newLine_:
01B8  53				push		ebx
01B9  52				push		edx
01BA  89 C2				mov		edx,eax
01BC  8B 58 42				mov		ebx,dword ptr 0x42[eax]
01BF  85 DB				test		ebx,ebx
01C1  74 1B				je		L$16
01C3  80 7B 08 00			cmp		byte ptr 0x8[ebx],0x00
01C7  75 15				jne		L$16
01C9  E8 00 00 00 00			call		replaceTail_
01CE  8B 42 42				mov		eax,dword ptr 0x42[edx]
01D1  C7 42 57 00 00 00 00		mov		dword ptr 0x57[edx],0x00000000
01D8  C6 40 08 01			mov		byte ptr 0x8[eax],0x01
01DC  EB 07				jmp		L$17
01DE				L$16:
01DE  89 D0				mov		eax,edx
01E0  E8 00 00 00 00			call		addBuff_
01E5				L$17:
01E5  89 D0				mov		eax,edx
01E7  C7 42 67 00 00 00 00		mov		dword ptr 0x67[edx],0x00000000
01EE  E8 00 00 00 00			call		incrementLastLineNumber_
01F3  5A				pop		edx
01F4  5B				pop		ebx
01F5  C3				ret		

Routine Size: 502 bytes,    Routine Base: _TEXT + 0000

01F6				_AddLine_:
01F6  51				push		ecx
01F7  56				push		esi
01F8  57				push		edi
01F9  55				push		ebp
01FA  83 EC 14				sub		esp,0x00000014
01FD  89 C1				mov		ecx,eax
01FF  89 D5				mov		ebp,edx
0201  89 5C 24 0C			mov		dword ptr 0xc[esp],ebx
0205  E8 00 00 00 00			call		_AccessWinLines_
020A  8B 79 42				mov		edi,dword ptr 0x42[ecx]
020D  31 D2				xor		edx,edx
020F  31 F6				xor		esi,esi
0211  89 54 24 04			mov		dword ptr 0x4[esp],edx
0215  89 54 24 08			mov		dword ptr 0x8[esp],edx
0219  85 FF				test		edi,edi
021B  74 43				je		L$20
021D  8A 57 08				mov		dl,byte ptr 0x8[edi]
0220  89 F8				mov		eax,edi
0222  84 D2				test		dl,dl
0224  75 3A				jne		L$20
0226  8D 77 09				lea		esi,0x9[edi]
0229  8B 79 53				mov		edi,dword ptr 0x53[ecx]
022C  83 C7 09				add		edi,0x00000009
022F  57				push		edi
0230				L$18:
0230  8A 06				mov		al,byte ptr [esi]
0232  88 07				mov		byte ptr [edi],al
0234  3C 00				cmp		al,0x00
0236  74 10				je		L$19
0238  8A 46 01				mov		al,byte ptr 0x1[esi]
023B  83 C6 02				add		esi,0x00000002
023E  88 47 01				mov		byte ptr 0x1[edi],al
0241  83 C7 02				add		edi,0x00000002
0244  3C 00				cmp		al,0x00
0246  75 E8				jne		L$18
0248				L$19:
0248  5F				pop		edi
0249  8B 41 53				mov		eax,dword ptr 0x53[ecx]
024C  83 C0 09				add		eax,0x00000009
024F  E8 00 00 00 00			call		__mbslen_
0254  8B 51 57				mov		edx,dword ptr 0x57[ecx]
0257  89 C6				mov		esi,eax
0259  39 D0				cmp		eax,edx
025B  7E 03				jle		L$20
025D  89 41 57				mov		dword ptr 0x57[ecx],eax
0260				L$20:
0260  F6 41 52 10			test		byte ptr 0x52[ecx],0x10
0264  74 02				je		L$21
0266  31 F6				xor		esi,esi
0268				L$21:
0268  31 FF				xor		edi,edi
026A  E9 6A 02 00 00			jmp		L$45
026F				L$22:
026F  80 61 52 EF			and		byte ptr 0x52[ecx],0xef
0273				L$23:
0273  31 C0				xor		eax,eax
0275  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0279  89 04 24				mov		dword ptr [esp],eax
027C  85 D2				test		edx,edx
027E  74 39				je		L$25
0280  BA 00 00 00 00			mov		edx,offset DGROUP:L$72
0285  8D 44 24 10			lea		eax,0x10[esp]
0289  E8 00 00 00 00			call		_mbccpy_
028E  A1 00 00 00 00			mov		eax,dword ptr ___IsDBCS
0293  85 C0				test		eax,eax
0295  74 13				je		L$24
0297  31 C0				xor		eax,eax
0299  8A 44 24 10			mov		al,byte ptr 0x10[esp]
029D  8A 80 01 00 00 00			mov		al,byte ptr ___MBCSIsTable+0x1[eax]
02A3  24 01				and		al,0x01
02A5  25 FF 00 00 00			and		eax,0x000000ff
02AA				L$24:
02AA  30 F6				xor		dh,dh
02AC  88 74 04 11			mov		byte ptr 0x11[esp+eax],dh
02B0  FF 4C 24 04			dec		dword ptr 0x4[esp]
02B4  E9 B6 00 00 00			jmp		L$33
02B9				L$25:
02B9  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
02BD  85 DB				test		ebx,ebx
02BF  74 42				je		L$28
02C1  BA 02 00 00 00			mov		edx,offset DGROUP:L$73
02C6  8D 44 24 10			lea		eax,0x10[esp]
02CA  E8 00 00 00 00			call		_mbccpy_
02CF  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
02D6  74 15				je		L$26
02D8  31 C0				xor		eax,eax
02DA  8A 44 24 10			mov		al,byte ptr 0x10[esp]
02DE  8A 80 01 00 00 00			mov		al,byte ptr ___MBCSIsTable+0x1[eax]
02E4  24 01				and		al,0x01
02E6  25 FF 00 00 00			and		eax,0x000000ff
02EB  EB 02				jmp		L$27
02ED				L$26:
02ED  31 C0				xor		eax,eax
02EF				L$27:
02EF  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
02F3  30 D2				xor		dl,dl
02F5  4B				dec		ebx
02F6  88 54 04 11			mov		byte ptr 0x11[esp+eax],dl
02FA  89 5C 24 08			mov		dword ptr 0x8[esp],ebx
02FE  E9 6C 00 00 00			jmp		L$33
0303				L$28:
0303  A1 00 00 00 00			mov		eax,dword ptr DGROUP:L$86
0308  85 C0				test		eax,eax
030A  75 46				jne		L$31
030C  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
0313  74 10				je		L$29
0315  8A 45 00				mov		al,byte ptr [ebp]
0318  8A 80 01 00 00 00			mov		al,byte ptr ___MBCSIsTable+0x1[eax]
031E  24 01				and		al,0x01
0320  25 FF 00 00 00			and		eax,0x000000ff
0325				L$29:
0325  85 C0				test		eax,eax
0327  74 1A				je		L$30
0329  C7 05 00 00 00 00 01 00 00 00
					mov		dword ptr DGROUP:L$86,0x00000001
0333  8A 45 00				mov		al,byte ptr [ebp]
0336  A2 04 00 00 00			mov		byte ptr DGROUP:L$87,al
033B  30 E4				xor		ah,ah
033D  88 64 24 10			mov		byte ptr 0x10[esp],ah
0341  EB 2B				jmp		L$32
0343				L$30:
0343  8A 45 00				mov		al,byte ptr [ebp]
0346  88 44 24 10			mov		byte ptr 0x10[esp],al
034A  30 C0				xor		al,al
034C  88 44 24 11			mov		byte ptr 0x11[esp],al
0350  EB 1C				jmp		L$32
0352				L$31:
0352  A0 04 00 00 00			mov		al,byte ptr DGROUP:L$87
0357  88 44 24 10			mov		byte ptr 0x10[esp],al
035B  89 15 00 00 00 00			mov		dword ptr DGROUP:L$86,edx
0361  8A 45 00				mov		al,byte ptr [ebp]
0364  30 F7				xor		bh,dh
0366  88 44 24 11			mov		byte ptr 0x11[esp],al
036A  88 7C 24 12			mov		byte ptr 0x12[esp],bh
036E				L$32:
036E  45				inc		ebp
036F				L$33:
036F  BB 01 00 00 00			mov		ebx,0x00000001
0374  BA 04 00 00 00			mov		edx,offset DGROUP:L$74
0379  8D 44 24 10			lea		eax,0x10[esp]
037D  E8 00 00 00 00			call		_mbsncmp_
0382  85 C0				test		eax,eax
0384  75 20				jne		L$34
0386  89 F2				mov		edx,esi
0388  89 F0				mov		eax,esi
038A  C1 FA 1F				sar		edx,0x1f
038D  C1 E2 03				shl		edx,0x03
0390  1B C2				sbb		eax,edx
0392  C1 F8 03				sar		eax,0x03
0395  C1 E0 03				shl		eax,0x03
0398  83 C0 08				add		eax,0x00000008
039B  29 F0				sub		eax,esi
039D  89 44 24 04			mov		dword ptr 0x4[esp],eax
03A1  E9 1C 01 00 00			jmp		L$44
03A6				L$34:
03A6  BB 01 00 00 00			mov		ebx,0x00000001
03AB  BA 06 00 00 00			mov		edx,offset DGROUP:L$75
03B0  8D 44 24 10			lea		eax,0x10[esp]
03B4  E8 00 00 00 00			call		_mbsncmp_
03B9  85 C0				test		eax,eax
03BB  75 0C				jne		L$35
03BD  8B 41 24				mov		eax,dword ptr 0x24[ecx]
03C0  89 44 24 08			mov		dword ptr 0x8[esp],eax
03C4  E9 F9 00 00 00			jmp		L$44
03C9				L$35:
03C9  BB 01 00 00 00			mov		ebx,0x00000001
03CE  BA 08 00 00 00			mov		edx,offset DGROUP:L$76
03D3  8D 44 24 10			lea		eax,0x10[esp]
03D7  E8 00 00 00 00			call		_mbsncmp_
03DC  85 C0				test		eax,eax
03DE  75 17				jne		L$36
03E0  8A 79 52				mov		bh,byte ptr 0x52[ecx]
03E3  80 CF 10				or		bh,0x10
03E6  8B 41 53				mov		eax,dword ptr 0x53[ecx]
03E9  88 79 52				mov		byte ptr 0x52[ecx],bh
03EC  31 F6				xor		esi,esi
03EE  C6 40 08 01			mov		byte ptr 0x8[eax],0x01
03F2  E9 CB 00 00 00			jmp		L$44
03F7				L$36:
03F7  BB 01 00 00 00			mov		ebx,0x00000001
03FC  BA 02 00 00 00			mov		edx,offset DGROUP:L$73
0401  8D 44 24 10			lea		eax,0x10[esp]
0405  E8 00 00 00 00			call		_mbsncmp_
040A  85 C0				test		eax,eax
040C  75 14				jne		L$37
040E  89 C8				mov		eax,ecx
0410  BE 01 00 00 00			mov		esi,0x00000001
0415  E8 00 00 00 00			call		newLine_
041A  89 34 24				mov		dword ptr [esp],esi
041D  E9 9D 00 00 00			jmp		L$43
0422				L$37:
0422  BB 01 00 00 00			mov		ebx,0x00000001
0427  BA 0A 00 00 00			mov		edx,offset DGROUP:L$77
042C  8D 44 24 10			lea		eax,0x10[esp]
0430  E8 00 00 00 00			call		_mbsncmp_
0435  85 C0				test		eax,eax
0437  75 44				jne		L$41
0439  85 F6				test		esi,esi
043B  0F 8E 81 00 00 00			jle		L$44
0441  8B 41 53				mov		eax,dword ptr 0x53[ecx]
0444  8D 56 FF				lea		edx,-0x1[esi]
0447  83 C0 09				add		eax,0x00000009
044A  E8 00 00 00 00			call		__mbsninc_
044F  8B 1D 00 00 00 00			mov		ebx,dword ptr ___IsDBCS
0455  89 C2				mov		edx,eax
0457  85 DB				test		ebx,ebx
0459  74 16				je		L$38
045B  8A 00				mov		al,byte ptr [eax]
045D  25 FF 00 00 00			and		eax,0x000000ff
0462  8A 80 01 00 00 00			mov		al,byte ptr ___MBCSIsTable+0x1[eax]
0468  24 01				and		al,0x01
046A  25 FF 00 00 00			and		eax,0x000000ff
046F  EB 02				jmp		L$39
0471				L$38:
0471  31 C0				xor		eax,eax
0473				L$39:
0473  74 05				je		L$40
0475  C6 02 20				mov		byte ptr [edx],0x20
0478  EB 48				jmp		L$44
047A				L$40:
047A  4E				dec		esi
047B  EB 45				jmp		L$44
047D				L$41:
047D  80 7C 24 10 00			cmp		byte ptr 0x10[esp],0x00
0482  74 3E				je		L$44
0484  8B 41 53				mov		eax,dword ptr 0x53[ecx]
0487  89 F2				mov		edx,esi
0489  83 C0 09				add		eax,0x00000009
048C  E8 00 00 00 00			call		__mbsninc_
0491  8D 54 24 10			lea		edx,0x10[esp]
0495  46				inc		esi
0496  E8 00 00 00 00			call		_mbccpy_
049B  3B 71 57				cmp		esi,dword ptr 0x57[ecx]
049E  7E 03				jle		L$42
04A0  89 71 57				mov		dword ptr 0x57[ecx],esi
04A3				L$42:
04A3  8B 41 63				mov		eax,dword ptr 0x63[ecx]
04A6  8B 51 57				mov		edx,dword ptr 0x57[ecx]
04A9  83 E8 02				sub		eax,0x00000002
04AC  39 D0				cmp		eax,edx
04AE  7F 12				jg		L$44
04B0  89 C8				mov		eax,ecx
04B2  BB 01 00 00 00			mov		ebx,0x00000001
04B7  E8 00 00 00 00			call		newLine_
04BC  89 1C 24				mov		dword ptr [esp],ebx
04BF				L$43:
04BF  8B 71 57				mov		esi,dword ptr 0x57[ecx]
04C2				L$44:
04C2  83 7C 24 04 00			cmp		dword ptr 0x4[esp],0x00000000
04C7  0F 85 A6 FD FF FF			jne		L$23
04CD  83 7C 24 08 00			cmp		dword ptr 0x8[esp],0x00000000
04D2  0F 85 9B FD FF FF			jne		L$23
04D8  47				inc		edi
04D9				L$45:
04D9  3B 7C 24 0C			cmp		edi,dword ptr 0xc[esp]
04DD  0F 82 8C FD FF FF			jb		L$22
04E3  83 3C 24 00			cmp		dword ptr [esp],0x00000000
04E7  75 07				jne		L$46
04E9  89 C8				mov		eax,ecx
04EB  E8 00 00 00 00			call		updateBuff_
04F0				L$46:
04F0  E8 00 00 00 00			call		_ReleaseWinLines_
04F5  83 C4 14				add		esp,0x00000014
04F8  5D				pop		ebp
04F9  5F				pop		edi
04FA  5E				pop		esi
04FB  59				pop		ecx
04FC  C3				ret		

Routine Size: 775 bytes,    Routine Base: _TEXT + 01F6

04FD				_UpdateInputLine_:
04FD  56				push		esi
04FE  57				push		edi
04FF  55				push		ebp
0500  83 EC 10				sub		esp,0x00000010
0503  89 C6				mov		esi,eax
0505  89 D5				mov		ebp,edx
0507  89 5C 24 04			mov		dword ptr 0x4[esp],ebx
050B  89 0C 24				mov		dword ptr [esp],ecx
050E  E8 00 00 00 00			call		_AccessWinLines_
0513  C7 46 67 01 00 00 00		mov		dword ptr 0x67[esi],0x00000001
051A  8B 4E 57				mov		ecx,dword ptr 0x57[esi]
051D  31 D2				xor		edx,edx
051F  31 DB				xor		ebx,ebx
0521  89 54 24 0C			mov		dword ptr 0xc[esp],edx
0525  89 54 24 08			mov		dword ptr 0x8[esp],edx
0529  EB 61				jmp		L$49
052B				L$47:
052B  8B 46 63				mov		eax,dword ptr 0x63[esi]
052E  31 FF				xor		edi,edi
0530  83 E8 02				sub		eax,0x00000002
0533  89 7C 24 0C			mov		dword ptr 0xc[esp],edi
0537  39 C1				cmp		ecx,eax
0539  7C 30				jl		L$48
053B  8B 46 53				mov		eax,dword ptr 0x53[esi]
053E  89 CA				mov		edx,ecx
0540  83 C0 09				add		eax,0x00000009
0543  E8 00 00 00 00			call		__mbsninc_
0548  BA 0C 00 00 00			mov		edx,offset DGROUP:L$78
054D  E8 00 00 00 00			call		_mbccpy_
0552  89 F0				mov		eax,esi
0554  89 4E 57				mov		dword ptr 0x57[esi],ecx
0557  E8 00 00 00 00			call		newLine_
055C  B8 01 00 00 00			mov		eax,0x00000001
0561  31 C9				xor		ecx,ecx
0563  89 44 24 0C			mov		dword ptr 0xc[esp],eax
0567  89 44 24 08			mov		dword ptr 0x8[esp],eax
056B				L$48:
056B  89 DA				mov		edx,ebx
056D  89 E8				mov		eax,ebp
056F  E8 00 00 00 00			call		__mbsninc_
0574  89 C7				mov		edi,eax
0576  8B 46 53				mov		eax,dword ptr 0x53[esi]
0579  89 CA				mov		edx,ecx
057B  83 C0 09				add		eax,0x00000009
057E  43				inc		ebx
057F  E8 00 00 00 00			call		__mbsninc_
0584  89 FA				mov		edx,edi
0586  41				inc		ecx
0587  E8 00 00 00 00			call		_mbccpy_
058C				L$49:
058C  3B 5C 24 04			cmp		ebx,dword ptr 0x4[esp]
0590  72 99				jb		L$47
0592  8B 46 53				mov		eax,dword ptr 0x53[esi]
0595  89 CA				mov		edx,ecx
0597  83 C0 09				add		eax,0x00000009
059A  E8 00 00 00 00			call		__mbsninc_
059F  BA 0C 00 00 00			mov		edx,offset DGROUP:L$78
05A4  8B 2C 24				mov		ebp,dword ptr [esp]
05A7  E8 00 00 00 00			call		_mbccpy_
05AC  85 ED				test		ebp,ebp
05AE  74 13				je		L$50
05B0  83 7C 24 0C 00			cmp		dword ptr 0xc[esp],0x00000000
05B5  75 0C				jne		L$50
05B7  89 F0				mov		eax,esi
05B9  89 4E 57				mov		dword ptr 0x57[esi],ecx
05BC  E8 00 00 00 00			call		newLine_
05C1  EB 22				jmp		L$51
05C3				L$50:
05C3  8B 46 46				mov		eax,dword ptr 0x46[esi]
05C6  2B 46 4E				sub		eax,dword ptr 0x4e[esi]
05C9  8B 5E 53				mov		ebx,dword ptr 0x53[esi]
05CC  8D 50 01				lea		edx,0x1[eax]
05CF  83 C3 09				add		ebx,0x00000009
05D2  89 F0				mov		eax,esi
05D4  E8 00 00 00 00			call		_DisplayLineInWindow_
05D9  83 7C 24 08 00			cmp		dword ptr 0x8[esp],0x00000000
05DE  75 05				jne		L$51
05E0  B9 FF FF FF FF			mov		ecx,0xffffffff
05E5				L$51:
05E5  E8 00 00 00 00			call		_ReleaseWinLines_
05EA  89 C8				mov		eax,ecx
05EC  83 C4 10				add		esp,0x00000010
05EF  5D				pop		ebp
05F0  5F				pop		edi
05F1  5E				pop		esi
05F2  C3				ret		

Routine Size: 246 bytes,    Routine Base: _TEXT + 04FD

05F3				_PositionScrollThumb_:
05F3  53				push		ebx
05F4  51				push		ecx
05F5  52				push		edx
05F6  56				push		esi
05F7  57				push		edi
05F8  89 C3				mov		ebx,eax
05FA  8B 70 4E				mov		esi,dword ptr 0x4e[eax]
05FD  E8 00 00 00 00			call		_GetLastLineNumber_
0602  89 C1				mov		ecx,eax
0604  89 C7				mov		edi,eax
0606  3D 00 80 00 00			cmp		eax,0x00008000
060B  76 10				jbe		L$52
060D  89 F0				mov		eax,esi
060F  31 D2				xor		edx,edx
0611  C1 E0 0F				shl		eax,0x0f
0614  F7 F1				div		ecx
0616  BF 00 80 00 00			mov		edi,0x00008000
061B  89 C6				mov		esi,eax
061D				L$52:
061D  31 C0				xor		eax,eax
061F  6A 00				push		0x00000000
0621  66 89 F8				mov		ax,di
0624  50				push		eax
0625  6A 01				push		0x00000001
0627  6A 01				push		0x00000001
0629  8B 53 3A				mov		edx,dword ptr 0x3a[ebx]
062C  52				push		edx
062D  E8 00 00 00 00			call		_SetScrollRange
0632  31 C0				xor		eax,eax
0634  6A 01				push		0x00000001
0636  66 89 F0				mov		ax,si
0639  50				push		eax
063A  6A 01				push		0x00000001
063C  8B 4B 3A				mov		ecx,dword ptr 0x3a[ebx]
063F  51				push		ecx
0640  E8 00 00 00 00			call		_SetScrollPos
0645  E9 88 FA FF FF			jmp		L$8

Routine Size: 87 bytes,    Routine Base: _TEXT + 05F3

064A				_GetLineFromThumbPosition_:
064A  E8 00 00 00 00			call		_GetLastLineNumber_
064F  3D 00 80 00 00			cmp		eax,0x00008000
0654  76 0D				jbe		L$53
0656  81 E2 FF FF 00 00			and		edx,0x0000ffff
065C  0F AF C2				imul		eax,edx
065F  C1 E8 0F				shr		eax,0x0f
0662  C3				ret		
0663				L$53:
0663  31 C0				xor		eax,eax
0665  66 89 D0				mov		ax,dx
0668  C3				ret		

Routine Size: 31 bytes,    Routine Base: _TEXT + 064A

0669				_GetLineDataPointer_:
0669  53				push		ebx
066A  51				push		ecx
066B  89 C1				mov		ecx,eax
066D  89 D3				mov		ebx,edx
066F  E8 00 00 00 00			call		_AccessWinLines_
0674  3B 59 46				cmp		ebx,dword ptr 0x46[ecx]
0677  75 11				jne		L$54
0679  83 79 67 00			cmp		dword ptr 0x67[ecx],0x00000000
067D  74 0B				je		L$54
067F  E8 00 00 00 00			call		_ReleaseWinLines_
0684  8B 41 53				mov		eax,dword ptr 0x53[ecx]
0687  59				pop		ecx
0688  5B				pop		ebx
0689  C3				ret		
068A				L$54:
068A  B8 01 00 00 00			mov		eax,0x00000001
068F  8B 51 3E				mov		edx,dword ptr 0x3e[ecx]
0692				L$55:
0692  39 D8				cmp		eax,ebx
0694  74 09				je		L$56
0696  85 D2				test		edx,edx
0698  74 05				je		L$56
069A  40				inc		eax
069B  8B 12				mov		edx,dword ptr [edx]
069D  EB F3				jmp		L$55
069F				L$56:
069F  E8 00 00 00 00			call		_ReleaseWinLines_
06A4  89 D0				mov		eax,edx
06A6  59				pop		ecx
06A7  5B				pop		ebx
06A8  C3				ret		

Routine Size: 64 bytes,    Routine Base: _TEXT + 0669

06A9				_FreeAllLines_:
06A9  53				push		ebx
06AA  52				push		edx
06AB  89 C2				mov		edx,eax
06AD  E8 00 00 00 00			call		_AccessWinLines_
06B2  8B 42 3E				mov		eax,dword ptr 0x3e[edx]
06B5				L$57:
06B5  85 C0				test		eax,eax
06B7  74 0B				je		L$58
06B9  8B 18				mov		ebx,dword ptr [eax]
06BB  E8 00 00 00 00			call		_MemFree_
06C0  89 D8				mov		eax,ebx
06C2  EB F1				jmp		L$57
06C4				L$58:
06C4  C7 42 4E 01 00 00 00		mov		dword ptr 0x4e[edx],0x00000001
06CB  89 42 42				mov		dword ptr 0x42[edx],eax
06CE  89 42 3E				mov		dword ptr 0x3e[edx],eax
06D1  89 42 57				mov		dword ptr 0x57[edx],eax
06D4  8B 42 4E				mov		eax,dword ptr 0x4e[edx]
06D7  89 42 46				mov		dword ptr 0x46[edx],eax
06DA  89 42 4A				mov		dword ptr 0x4a[edx],eax
06DD  89 D0				mov		eax,edx
06DF  E8 00 00 00 00			call		_PositionScrollThumb_
06E4  E8 00 00 00 00			call		_ReleaseWinLines_
06E9  5A				pop		edx
06EA  5B				pop		ebx
06EB  C3				ret		

Routine Size: 67 bytes,    Routine Base: _TEXT + 06A9

06EC				_SaveAllLines_:
06EC  53				push		ebx
06ED  51				push		ecx
06EE  52				push		edx
06EF  56				push		esi
06F0  57				push		edi
06F1  55				push		ebp
06F2  81 EC 50 01 00 00			sub		esp,0x00000150
06F8  89 C6				mov		esi,eax
06FA  BB 4C 00 00 00			mov		ebx,0x0000004c
06FF  B9 01 00 00 00			mov		ecx,0x00000001
0704  BF 04 01 00 00			mov		edi,0x00000104
0709  30 E4				xor		ah,ah
070B  31 D2				xor		edx,edx
070D  88 24 24				mov		byte ptr [esp],ah
0710  8D 84 24 04 01 00 00		lea		eax,0x104[esp]
0717  BD 0D 00 00 00			mov		ebp,offset DGROUP:L$79
071C  E8 00 00 00 00			call		memset_
0721  BA 4C 00 00 00			mov		edx,0x0000004c
0726  A1 00 00 00 00			mov		eax,dword ptr __MainWindow
072B  BB 00 00 00 00			mov		ebx,offset _filterFiles
0730  89 84 24 08 01 00 00		mov		dword ptr 0x108[esp],eax
0737  89 E0				mov		eax,esp
0739  89 8C 24 1C 01 00 00		mov		dword ptr 0x11c[esp],ecx
0740  89 84 24 20 01 00 00		mov		dword ptr 0x120[esp],eax
0747  B8 04 00 00 00			mov		eax,0x00000004
074C  89 BC 24 24 01 00 00		mov		dword ptr 0x124[esp],edi
0753  89 84 24 38 01 00 00		mov		dword ptr 0x138[esp],eax
075A  8D 84 24 04 01 00 00		lea		eax,0x104[esp]
0761  89 AC 24 34 01 00 00		mov		dword ptr 0x134[esp],ebp
0768  50				push		eax
0769  89 94 24 08 01 00 00		mov		dword ptr 0x108[esp],edx
0770  89 9C 24 14 01 00 00		mov		dword ptr 0x114[esp],ebx
0777  E8 00 00 00 00			call		_GetSaveFileNameA
077C  85 C0				test		eax,eax
077E  74 5F				je		L$63
0780  E8 00 00 00 00			call		_AccessWinLines_
0785  BA 26 00 00 00			mov		edx,offset DGROUP:L$80
078A  89 E0				mov		eax,esp
078C  E8 00 00 00 00			call		fopen_
0791  89 C3				mov		ebx,eax
0793  85 C0				test		eax,eax
0795  75 0E				jne		L$59
0797  50				push		eax
0798  68 28 00 00 00			push		offset DGROUP:L$81
079D  8D 44 24 08			lea		eax,0x8[esp]
07A1  50				push		eax
07A2  53				push		ebx
07A3  EB 35				jmp		L$62
07A5				L$59:
07A5  8B 56 3E				mov		edx,dword ptr 0x3e[esi]
07A8				L$60:
07A8  85 D2				test		edx,edx
07AA  74 16				je		L$61
07AC  8D 42 09				lea		eax,0x9[edx]
07AF  50				push		eax
07B0  68 3B 00 00 00			push		offset DGROUP:L$82
07B5  53				push		ebx
07B6  E8 00 00 00 00			call		fprintf_
07BB  83 C4 0C				add		esp,0x0000000c
07BE  8B 12				mov		edx,dword ptr [edx]
07C0  EB E6				jmp		L$60
07C2				L$61:
07C2  89 D8				mov		eax,ebx
07C4  E8 00 00 00 00			call		fclose_
07C9  E8 00 00 00 00			call		_ReleaseWinLines_
07CE  52				push		edx
07CF  68 3F 00 00 00			push		offset DGROUP:L$83
07D4  8D 44 24 08			lea		eax,0x8[esp]
07D8  50				push		eax
07D9  52				push		edx
07DA				L$62:
07DA  E8 00 00 00 00			call		_MessageBoxA
07DF				L$63:
07DF  81 C4 50 01 00 00			add		esp,0x00000150
07E5  E9 E7 F8 FF FF			jmp		L$7

Routine Size: 254 bytes,    Routine Base: _TEXT + 06EC

07EA				_CopyAllLines_:
07EA  53				push		ebx
07EB  51				push		ecx
07EC  52				push		edx
07ED  56				push		esi
07EE  57				push		edi
07EF  55				push		ebp
07F0  83 EC 08				sub		esp,0x00000008
07F3  50				push		eax
07F4  8B 14 24				mov		edx,dword ptr [esp]
07F7  E8 00 00 00 00			call		_AccessWinLines_
07FC  31 DB				xor		ebx,ebx
07FE  8B 52 3E				mov		edx,dword ptr 0x3e[edx]
0801				L$64:
0801  85 D2				test		edx,edx
0803  74 1C				je		L$65
0805  8D 7A 09				lea		edi,0x9[edx]
0808  06				push		es
0809  8C D8				mov		eax,ds
080B  8E C0				mov		es,eax
080D  29 C9				sub		ecx,ecx
080F  49				dec		ecx
0810  31 C0				xor		eax,eax
0812  F2 AE				repne scasb	
0814  F7 D1				not		ecx
0816  49				dec		ecx
0817  07				pop		es
0818  83 C1 02				add		ecx,0x00000002
081B  8B 12				mov		edx,dword ptr [edx]
081D  01 CB				add		ebx,ecx
081F  EB E0				jmp		L$64
0821				L$65:
0821  81 FB FE FF 00 00			cmp		ebx,0x0000fffe
0827  76 05				jbe		L$66
0829  BB FE FF 00 00			mov		ebx,0x0000fffe
082E				L$66:
082E  43				inc		ebx
082F  53				push		ebx
0830  6A 02				push		0x00000002
0832  E8 00 00 00 00			call		_GlobalAlloc
0837  89 44 24 04			mov		dword ptr 0x4[esp],eax
083B  85 C0				test		eax,eax
083D  75 16				jne		L$67
083F  50				push		eax
0840  68 52 00 00 00			push		offset DGROUP:L$84
0845  68 64 00 00 00			push		offset DGROUP:L$85
084A  50				push		eax
084B  E8 00 00 00 00			call		_MessageBoxA
0850  E9 AD 00 00 00			jmp		L$70
0855				L$67:
0855  50				push		eax
0856  8B 5C 24 04			mov		ebx,dword ptr 0x4[esp]
085A  E8 00 00 00 00			call		_GlobalLock
085F  89 44 24 08			mov		dword ptr 0x8[esp],eax
0863  8B 5B 3E				mov		ebx,dword ptr 0x3e[ebx]
0866  31 D2				xor		edx,edx
0868				L$68:
0868  85 DB				test		ebx,ebx
086A  74 5D				je		L$69
086C  8D 73 09				lea		esi,0x9[ebx]
086F  89 F7				mov		edi,esi
0871  06				push		es
0872  8C D8				mov		eax,ds
0874  8E C0				mov		es,eax
0876  29 C9				sub		ecx,ecx
0878  49				dec		ecx
0879  31 C0				xor		eax,eax
087B  F2 AE				repne scasb	
087D  F7 D1				not		ecx
087F  49				dec		ecx
0880  07				pop		es
0881  8D 41 02				lea		eax,0x2[ecx]
0884  8D 2C 02				lea		ebp,[edx+eax]
0887  81 FD FE FF 00 00			cmp		ebp,0x0000fffe
088D  77 3A				ja		L$69
088F  8B 7C 24 08			mov		edi,dword ptr 0x8[esp]
0893  83 E8 02				sub		eax,0x00000002
0896  8C D9				mov		ecx,ds
0898  01 D7				add		edi,edx
089A  8C DA				mov		edx,ds
089C  1E				push		ds
089D  06				push		es
089E  57				push		edi
089F  91				xchg		eax,ecx
08A0  8E D8				mov		ds,eax
08A2  8E C2				mov		es,edx
08A4  89 C8				mov		eax,ecx
08A6  C1 E9 02				shr		ecx,0x02
08A9  F2 A5				repne movsd	
08AB  8A C8				mov		cl,al
08AD  80 E1 03				and		cl,0x03
08B0  F2 A4				repne movsb	
08B2  58				pop		eax
08B3  07				pop		es
08B4  1F				pop		ds
08B5  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
08B9  C6 44 2A FE 0D			mov		byte ptr -0x2[edx+ebp],0x0d
08BE  C6 44 2A FF 0A			mov		byte ptr -0x1[edx+ebp],0x0a
08C3  89 EA				mov		edx,ebp
08C5  8B 1B				mov		ebx,dword ptr [ebx]
08C7  EB 9F				jmp		L$68
08C9				L$69:
08C9  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
08CD  8B 4C 24 04			mov		ecx,dword ptr 0x4[esp]
08D1  01 DA				add		edx,ebx
08D3  51				push		ecx
08D4  C6 02 00				mov		byte ptr [edx],0x00
08D7  E8 00 00 00 00			call		_GlobalUnlock
08DC  8B 04 24				mov		eax,dword ptr [esp]
08DF  8B 70 3A				mov		esi,dword ptr 0x3a[eax]
08E2  56				push		esi
08E3  E8 00 00 00 00			call		_OpenClipboard
08E8  85 C0				test		eax,eax
08EA  74 16				je		L$70
08EC  8B 7C 24 04			mov		edi,dword ptr 0x4[esp]
08F0  E8 00 00 00 00			call		_EmptyClipboard
08F5  57				push		edi
08F6  6A 01				push		0x00000001
08F8  E8 00 00 00 00			call		_SetClipboardData
08FD  E8 00 00 00 00			call		_CloseClipboard
0902				L$70:
0902  E8 00 00 00 00			call		_ReleaseWinLines_
0907  83 C4 0C				add		esp,0x0000000c
090A  E9 C2 F7 FF FF			jmp		L$7

Routine Size: 293 bytes,    Routine Base: _TEXT + 07EA

090F				_GetLastLineNumber_:
090F  53				push		ebx
0910  52				push		edx
0911  8B 58 67				mov		ebx,dword ptr 0x67[eax]
0914  8B 50 46				mov		edx,dword ptr 0x46[eax]
0917  85 DB				test		ebx,ebx
0919  74 01				je		L$71
091B  42				inc		edx
091C				L$71:
091C  89 D0				mov		eax,edx
091E  5A				pop		edx
091F  5B				pop		ebx
0920  C3				ret		

Routine Size: 18 bytes,    Routine Base: _TEXT + 090F

No disassembly errors

Segment: CONST DWORD USE32 00000072 bytes
0000				L$72:
0000  20 00                                            .
0002				L$73:
0002  0A 00                                           ..
0004				L$74:
0004  09 00                                           ..
0006				L$75:
0006  0C 00                                           ..
0008				L$76:
0008  0D 00                                           ..
000A				L$77:
000A  08 00                                           ..
000C				L$78:
000C  00                                              .
000D				L$79:
000D  53 61 76 65 20 46 69 6C 65 20 4E 61 6D 65 20 53 Save File Name S
001D  65 6C 65 63 74 69 6F 6E 00                      election.
0026				L$80:
0026  77 00                                           w.
0028				L$81:
0028  45 72 72 6F 72 20 6F 70 65 6E 69 6E 67 20 66 69 Error opening fi
0038  6C 65 00                                        le.
003B				L$82:
003B  25 73 0A 00                                     %s..
003F				L$83:
003F  44 61 74 61 20 73 61 76 65 64 20 74 6F 20 66 69 Data saved to fi
004F  6C 65 00                                        le.
0052				L$84:
0052  43 6F 70 79 20 74 6F 20 43 6C 69 70 62 6F 61 72 Copy to Clipboar
0062  64 00                                           d.
0064				L$85:
0064  4F 75 74 20 6F 66 20 4D 65 6D 6F 72 79 00       Out of Memory.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 0000001D bytes
0000				_filterFiles:
0000  52 65 73 75 6C 74 20 46 69 6C 65 73 20 28 2A 2E Result Files (*.
0010  54 58 54 29 00 2A 2E 54 58 54 00 00 00          TXT).*.TXT...

Segment: _BSS DWORD USE32 00000005 bytes
0000				L$86:
0004				L$87:

BSS Size: 5 bytes

