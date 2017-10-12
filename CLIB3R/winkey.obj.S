Module: winkey
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000007BA bytes
0000				_WindowsKeyUp_:
0000  66 3D 10 00			cmp		ax,0x0010
0004  72 18				jb		L$3
0006  76 07				jbe		L$1
0008  66 3D 11 00			cmp		ax,0x0011
000C  74 09				je		L$2
000E  C3				ret		
000F				L$1:
000F  80 25 00 00 00 00 FD		and		byte ptr _shiftState,0xfd
0016  C3				ret		
0017				L$2:
0017  80 25 00 00 00 00 F7		and		byte ptr _shiftState,0xf7
001E				L$3:
001E  C3				ret		

Routine Size: 31 bytes,    Routine Base: _TEXT + 0000

001F				_WindowsKeyPush_:
001F  53				push		ebx
0020  89 C3				mov		ebx,eax
0022  89 D0				mov		eax,edx
0024  81 E3 FF FF 00 00			and		ebx,0x0000ffff
002A  8B 15 00 00 00 00			mov		edx,dword ptr _keyTop
0030  88 9A 00 00 00 00			mov		byte ptr _charList[edx],bl
0036  8B 15 00 00 00 00			mov		edx,dword ptr _keyTop
003C  88 82 00 00 00 00			mov		byte ptr _scanList[edx],al
0042  8B 15 00 00 00 00			mov		edx,dword ptr _keyTop
0048  42				inc		edx
0049  BB 20 00 00 00			mov		ebx,0x00000020
004E  89 D0				mov		eax,edx
0050  C1 FA 1F				sar		edx,0x1f
0053  F7 FB				idiv		ebx
0055  89 15 00 00 00 00			mov		dword ptr _keyTop,edx
005B  5B				pop		ebx
005C  C3				ret		

Routine Size: 62 bytes,    Routine Base: _TEXT + 001F

005D				_WindowsVirtualKeyPush_:
005D  53				push		ebx
005E  51				push		ecx
005F  56				push		esi
0060  BE 01 00 00 00			mov		esi,0x00000001
0065  88 D3				mov		bl,dl
0067  31 C9				xor		ecx,ecx
0069  66 3D 23 00			cmp		ax,0x0023
006D  72 1C				jb		L$4
006F  66 3D 25 00			cmp		ax,0x0025
0073  76 24				jbe		L$5
0075  66 3D 27 00			cmp		ax,0x0027
0079  72 2B				jb		L$6
007B  76 1C				jbe		L$5
007D  66 3D 2D 00			cmp		ax,0x002d
0081  72 23				jb		L$6
0083  66 3D 2E 00			cmp		ax,0x002e
0087  76 10				jbe		L$5
0089  EB 1B				jmp		L$6
008B				L$4:
008B  66 3D 08 00			cmp		ax,0x0008
008F  72 15				jb		L$6
0091  76 06				jbe		L$5
0093  66 3D 0D 00			cmp		ax,0x000d
0097  75 0D				jne		L$6
0099				L$5:
0099  31 C9				xor		ecx,ecx
009B  66 89 C1				mov		cx,ax
009E  B3 FF				mov		bl,0xff
00A0  81 C1 80 00 00 00			add		ecx,0x00000080
00A6				L$6:
00A6  85 F6				test		esi,esi
00A8  74 31				je		L$7
00AA  8B 15 00 00 00 00			mov		edx,dword ptr _keyTop
00B0  88 8A 00 00 00 00			mov		byte ptr _charList[edx],cl
00B6  8B 15 00 00 00 00			mov		edx,dword ptr _keyTop
00BC  88 9A 00 00 00 00			mov		byte ptr _scanList[edx],bl
00C2  8B 15 00 00 00 00			mov		edx,dword ptr _keyTop
00C8  42				inc		edx
00C9  B9 20 00 00 00			mov		ecx,0x00000020
00CE  89 D0				mov		eax,edx
00D0  C1 FA 1F				sar		edx,0x1f
00D3  F7 F9				idiv		ecx
00D5  89 15 00 00 00 00			mov		dword ptr _keyTop,edx
00DB				L$7:
00DB  5E				pop		esi
00DC  59				pop		ecx
00DD  5B				pop		ebx
00DE  C3				ret		

Routine Size: 130 bytes,    Routine Base: _TEXT + 005D

00DF				_KeyboardHit_:
00DF  51				push		ecx
00E0  52				push		edx
00E1  8B 15 00 00 00 00			mov		edx,dword ptr _keyTop
00E7  3B 15 00 00 00 00			cmp		edx,dword ptr _keyBottom
00ED  74 08				je		L$9
00EF				L$8:
00EF  B8 01 00 00 00			mov		eax,0x00000001
00F4  5A				pop		edx
00F5  59				pop		ecx
00F6  C3				ret		
00F7				L$9:
00F7  85 C0				test		eax,eax
00F9  74 0C				je		L$10
00FB  B8 01 00 00 00			mov		eax,0x00000001
0100  E8 00 00 00 00			call		_BlockingMessageLoop_
0105  EB 0A				jmp		L$11
0107				L$10:
0107  B8 01 00 00 00			mov		eax,0x00000001
010C  E8 00 00 00 00			call		_MessageLoop_
0111				L$11:
0111  A1 00 00 00 00			mov		eax,dword ptr _keyTop
0116  8B 0D 00 00 00 00			mov		ecx,dword ptr _keyBottom
011C  39 C8				cmp		eax,ecx
011E  75 CF				jne		L$8
0120  31 C8				xor		eax,ecx
0122  5A				pop		edx
0123  59				pop		ecx
0124  C3				ret		

Routine Size: 70 bytes,    Routine Base: _TEXT + 00DF

0125				_GetKeyboard_:
0125  53				push		ebx
0126  51				push		ecx
0127  52				push		edx
0128  8B 15 00 00 00 00			mov		edx,dword ptr _keyBottom
012E  31 DB				xor		ebx,ebx
0130  8A 9A 00 00 00 00			mov		bl,byte ptr _charList[edx]
0136  85 C0				test		eax,eax
0138  74 14				je		L$12
013A  8B 15 00 00 00 00			mov		edx,dword ptr _keyBottom
0140  8A 92 00 00 00 00			mov		dl,byte ptr _scanList[edx]
0146  81 E2 FF 00 00 00			and		edx,0x000000ff
014C  89 10				mov		dword ptr [eax],edx
014E				L$12:
014E  8B 15 00 00 00 00			mov		edx,dword ptr _keyBottom
0154  42				inc		edx
0155  B9 20 00 00 00			mov		ecx,0x00000020
015A  89 D0				mov		eax,edx
015C  C1 FA 1F				sar		edx,0x1f
015F  F7 F9				idiv		ecx
0161  89 15 00 00 00 00			mov		dword ptr _keyBottom,edx
0167  89 D8				mov		eax,ebx
0169  5A				pop		edx
016A  59				pop		ecx
016B  5B				pop		ebx
016C  C3				ret		

Routine Size: 72 bytes,    Routine Base: _TEXT + 0125

016D				_GetString_:
016D  51				push		ecx
016E  56				push		esi
016F  57				push		edi
0170  55				push		ebp
0171  83 EC 34				sub		esp,0x00000034
0174  50				push		eax
0175  52				push		edx
0176  89 5C 24 24			mov		dword ptr 0x24[esp],ebx
017A  31 D2				xor		edx,edx
017C  31 F6				xor		esi,esi
017E  89 54 24 1C			mov		dword ptr 0x1c[esp],edx
0182  89 54 24 28			mov		dword ptr 0x28[esp],edx
0186  8D 04 1B				lea		eax,[ebx+ebx]
0189  89 54 24 2C			mov		dword ptr 0x2c[esp],edx
018D  83 C0 02				add		eax,0x00000002
0190  89 54 24 30			mov		dword ptr 0x30[esp],edx
0194  E8 00 00 00 00			call		_MemAlloc_
0199  89 44 24 08			mov		dword ptr 0x8[esp],eax
019D  85 C0				test		eax,eax
019F  0F 84 89 04 00 00			je		L$61
01A5  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
01A9  8B 40 3A				mov		eax,dword ptr 0x3a[eax]
01AC  89 44 24 20			mov		dword ptr 0x20[esp],eax
01B0  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
01B4  31 DB				xor		ebx,ebx
01B6  E8 00 00 00 00			call		_GetLastLineNumber_
01BB  89 C2				mov		edx,eax
01BD  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
01C1  E8 00 00 00 00			call		_MoveToLine_
01C6  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
01CA  31 D2				xor		edx,edx
01CC  E8 00 00 00 00			call		_NewCursor_
01D1  BA 01 00 00 00			mov		edx,0x00000001
01D6  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
01DA  E8 00 00 00 00			call		_SetInputMode_
01DF  31 C0				xor		eax,eax
01E1  A3 00 00 00 00			mov		dword ptr __GotEOF,eax
01E6  8B 04 24				mov		eax,dword ptr [esp]
01E9  C6 00 00				mov		byte ptr [eax],0x00
01EC				L$13:
01EC  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
01F0  89 70 5B				mov		dword ptr 0x5b[eax],esi
01F3  E8 00 00 00 00			call		_DisplayCursor_
01F8				L$14:
01F8  B8 01 00 00 00			mov		eax,0x00000001
01FD  E8 00 00 00 00			call		_KeyboardHit_
0202  85 C0				test		eax,eax
0204  74 F2				je		L$14
0206  8D 44 24 14			lea		eax,0x14[esp]
020A  8B 54 24 20			mov		edx,dword ptr 0x20[esp]
020E  E8 00 00 00 00			call		_GetKeyboard_
0213  52				push		edx
0214  89 C3				mov		ebx,eax
0216  88 44 24 3C			mov		byte ptr 0x3c[esp],al
021A  E8 00 00 00 00			call		_HideCaret
021F  83 7C 24 28 00			cmp		dword ptr 0x28[esp],0x00000000
0224  74 18				je		L$15
0226  8B 04 24				mov		eax,dword ptr [esp]
0229  89 F2				mov		edx,esi
022B  E8 00 00 00 00			call		__mbsninc_
0230  46				inc		esi
0231  31 D2				xor		edx,edx
0233  88 18				mov		byte ptr [eax],bl
0235  89 54 24 28			mov		dword ptr 0x28[esp],edx
0239  E9 BE 04 00 00			jmp		L$70
023E				L$15:
023E  31 D2				xor		edx,edx
0240  88 DA				mov		dl,bl
0242  83 FA 16				cmp		edx,0x00000016
0245  74 0E				je		L$16
0247  81 7C 24 14 FF 00 00 00		cmp		dword ptr 0x14[esp],0x000000ff
024F  0F 84 BC 02 00 00			je		L$49
0255				L$16:
0255  31 C0				xor		eax,eax
0257  8A 44 24 38			mov		al,byte ptr 0x38[esp]
025B  83 F8 16				cmp		eax,0x00000016
025E  75 0F				jne		L$17
0260  BD 01 00 00 00			mov		ebp,0x00000001
0265  B4 5E				mov		ah,0x5e
0267  89 6C 24 28			mov		dword ptr 0x28[esp],ebp
026B  88 64 24 38			mov		byte ptr 0x38[esp],ah
026F				L$17:
026F  8B 44 24 2C			mov		eax,dword ptr 0x2c[esp]
0273  85 C0				test		eax,eax
0275  0F 84 EF 00 00 00			je		L$29
027B  8B 44 24 1C			mov		eax,dword ptr 0x1c[esp]
027F  3B 44 24 24			cmp		eax,dword ptr 0x24[esp]
0283  0F 8D 63 FF FF FF			jge		L$13
0289  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
028D  8B 40 63				mov		eax,dword ptr 0x63[eax]
0290  8B 5C 24 1C			mov		ebx,dword ptr 0x1c[esp]
0294  83 E8 02				sub		eax,0x00000002
0297  39 D8				cmp		eax,ebx
0299  0F 9F C0				setg		al
029C  25 FF 00 00 00			and		eax,0x000000ff
02A1  0F 84 45 FF FF FF			je		L$13
02A7  83 7C 24 30 00			cmp		dword ptr 0x30[esp],0x00000000
02AC  0F 85 9A 00 00 00			jne		L$26
02B2  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
02B9  74 15				je		L$18
02BB  31 C0				xor		eax,eax
02BD  8A 44 24 38			mov		al,byte ptr 0x38[esp]
02C1  8A 80 01 00 00 00			mov		al,byte ptr ___MBCSIsTable+0x1[eax]
02C7  24 01				and		al,0x01
02C9  25 FF 00 00 00			and		eax,0x000000ff
02CE  EB 02				jmp		L$19
02D0				L$18:
02D0  31 C0				xor		eax,eax
02D2				L$19:
02D2  74 44				je		L$23
02D4  B8 01 00 00 00			mov		eax,0x00000001
02D9  89 F2				mov		edx,esi
02DB  89 44 24 30			mov		dword ptr 0x30[esp],eax
02DF  8B 04 24				mov		eax,dword ptr [esp]
02E2  E8 00 00 00 00			call		__mbsninc_
02E7  89 C3				mov		ebx,eax
02E9  89 C7				mov		edi,eax
02EB  89 C5				mov		ebp,eax
02ED  06				push		es
02EE  8C D8				mov		eax,ds
02F0  8E C0				mov		es,eax
02F2  29 C9				sub		ecx,ecx
02F4  49				dec		ecx
02F5  31 C0				xor		eax,eax
02F7  F2 AE				repne scasb	
02F9  F7 D1				not		ecx
02FB  49				dec		ecx
02FC  07				pop		es
02FD  89 CA				mov		edx,ecx
02FF  8D 04 19				lea		eax,[ecx+ebx]
0302  EB 07				jmp		L$21
0304				L$20:
0304  8A 18				mov		bl,byte ptr [eax]
0306  48				dec		eax
0307  4A				dec		edx
0308  88 58 03				mov		byte ptr 0x3[eax],bl
030B				L$21:
030B  85 D2				test		edx,edx
030D  7D F5				jge		L$20
030F				L$22:
030F  8A 44 24 38			mov		al,byte ptr 0x38[esp]
0313  88 45 00				mov		byte ptr [ebp],al
0316  EB 4B				jmp		L$28
0318				L$23:
0318  8B 04 24				mov		eax,dword ptr [esp]
031B  89 F2				mov		edx,esi
031D  E8 00 00 00 00			call		__mbsninc_
0322  89 C3				mov		ebx,eax
0324  89 C7				mov		edi,eax
0326  89 C5				mov		ebp,eax
0328  06				push		es
0329  8C D8				mov		eax,ds
032B  8E C0				mov		es,eax
032D  29 C9				sub		ecx,ecx
032F  49				dec		ecx
0330  31 C0				xor		eax,eax
0332  F2 AE				repne scasb	
0334  F7 D1				not		ecx
0336  49				dec		ecx
0337  07				pop		es
0338  89 CA				mov		edx,ecx
033A  8D 04 19				lea		eax,[ecx+ebx]
033D  EB 07				jmp		L$25
033F				L$24:
033F  8A 18				mov		bl,byte ptr [eax]
0341  48				dec		eax
0342  4A				dec		edx
0343  88 58 02				mov		byte ptr 0x2[eax],bl
0346				L$25:
0346  85 D2				test		edx,edx
0348  7D F5				jge		L$24
034A  EB C3				jmp		L$22
034C				L$26:
034C  8B 04 24				mov		eax,dword ptr [esp]
034F  89 F2				mov		edx,esi
0351  E8 00 00 00 00			call		__mbsninc_
0356  31 FF				xor		edi,edi
0358  8A 54 24 38			mov		dl,byte ptr 0x38[esp]
035C  89 7C 24 30			mov		dword ptr 0x30[esp],edi
0360				L$27:
0360  88 50 01				mov		byte ptr 0x1[eax],dl
0363				L$28:
0363  31 C0				xor		eax,eax
0365  E9 7F 01 00 00			jmp		L$48
036A				L$29:
036A  8B 54 24 1C			mov		edx,dword ptr 0x1c[esp]
036E  39 D6				cmp		esi,edx
0370  0F 85 72 00 00 00			jne		L$34
0376  3B 54 24 24			cmp		edx,dword ptr 0x24[esp]
037A  0F 8D 6C FE FF FF			jge		L$13
0380  83 7C 24 30 00			cmp		dword ptr 0x30[esp],0x00000000
0385  75 48				jne		L$33
0387  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
038E  74 11				je		L$30
0390  8A 44 24 38			mov		al,byte ptr 0x38[esp]
0394  8A 80 01 00 00 00			mov		al,byte ptr ___MBCSIsTable+0x1[eax]
039A  24 01				and		al,0x01
039C  25 FF 00 00 00			and		eax,0x000000ff
03A1				L$30:
03A1  85 C0				test		eax,eax
03A3  74 0F				je		L$31
03A5  B8 01 00 00 00			mov		eax,0x00000001
03AA  8B 54 24 1C			mov		edx,dword ptr 0x1c[esp]
03AE  89 44 24 30			mov		dword ptr 0x30[esp],eax
03B2  EB 04				jmp		L$32
03B4				L$31:
03B4  8B 54 24 1C			mov		edx,dword ptr 0x1c[esp]
03B8				L$32:
03B8  8B 04 24				mov		eax,dword ptr [esp]
03BB  E8 00 00 00 00			call		__mbsninc_
03C0  8A 54 24 38			mov		dl,byte ptr 0x38[esp]
03C4  C6 40 02 00			mov		byte ptr 0x2[eax],0x00
03C8  88 10				mov		byte ptr [eax],dl
03CA  8A 50 02				mov		dl,byte ptr 0x2[eax]
03CD  EB 91				jmp		L$27
03CF				L$33:
03CF  89 44 24 30			mov		dword ptr 0x30[esp],eax
03D3  8B 04 24				mov		eax,dword ptr [esp]
03D6  E8 00 00 00 00			call		__mbsninc_
03DB  8A 54 24 38			mov		dl,byte ptr 0x38[esp]
03DF  C6 40 02 00			mov		byte ptr 0x2[eax],0x00
03E3  E9 78 FF FF FF			jmp		L$27
03E8				L$34:
03E8  8B 04 24				mov		eax,dword ptr [esp]
03EB  89 F2				mov		edx,esi
03ED  8B 5C 24 30			mov		ebx,dword ptr 0x30[esp]
03F1  E8 00 00 00 00			call		__mbsninc_
03F6  89 44 24 10			mov		dword ptr 0x10[esp],eax
03FA  85 DB				test		ebx,ebx
03FC  0F 85 D5 00 00 00			jne		L$46
0402  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
0409  74 15				je		L$35
040B  31 C0				xor		eax,eax
040D  8A 44 24 38			mov		al,byte ptr 0x38[esp]
0411  8A 80 01 00 00 00			mov		al,byte ptr ___MBCSIsTable+0x1[eax]
0417  24 01				and		al,0x01
0419  25 FF 00 00 00			and		eax,0x000000ff
041E  EB 02				jmp		L$36
0420				L$35:
0420  31 C0				xor		eax,eax
0422				L$36:
0422  74 65				je		L$42
0424  B8 01 00 00 00			mov		eax,0x00000001
0429  8B 15 00 00 00 00			mov		edx,dword ptr ___IsDBCS
042F  89 44 24 30			mov		dword ptr 0x30[esp],eax
0433  85 D2				test		edx,edx
0435  74 17				je		L$37
0437  8B 54 24 10			mov		edx,dword ptr 0x10[esp]
043B  31 C0				xor		eax,eax
043D  8A 02				mov		al,byte ptr [edx]
043F  8A 80 01 00 00 00			mov		al,byte ptr ___MBCSIsTable+0x1[eax]
0445  24 01				and		al,0x01
0447  25 FF 00 00 00			and		eax,0x000000ff
044C  EB 02				jmp		L$38
044E				L$37:
044E  31 C0				xor		eax,eax
0450				L$38:
0450  75 2B				jne		L$41
0452  8B 7C 24 10			mov		edi,dword ptr 0x10[esp]
0456  47				inc		edi
0457  06				push		es
0458  8C D8				mov		eax,ds
045A  8E C0				mov		es,eax
045C  29 C9				sub		ecx,ecx
045E  49				dec		ecx
045F  31 C0				xor		eax,eax
0461  F2 AE				repne scasb	
0463  F7 D1				not		ecx
0465  49				dec		ecx
0466  07				pop		es
0467  8B 44 24 10			mov		eax,dword ptr 0x10[esp]
046B  89 CA				mov		edx,ecx
046D  01 C8				add		eax,ecx
046F  EB 08				jmp		L$40
0471				L$39:
0471  48				dec		eax
0472  8A 58 02				mov		bl,byte ptr 0x2[eax]
0475  4A				dec		edx
0476  88 58 03				mov		byte ptr 0x3[eax],bl
0479				L$40:
0479  85 D2				test		edx,edx
047B  7D F4				jge		L$39
047D				L$41:
047D  8B 54 24 10			mov		edx,dword ptr 0x10[esp]
0481  8A 44 24 38			mov		al,byte ptr 0x38[esp]
0485  88 02				mov		byte ptr [edx],al
0487  EB 5B				jmp		L$47
0489				L$42:
0489  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
0490  74 13				je		L$43
0492  8B 54 24 10			mov		edx,dword ptr 0x10[esp]
0496  8A 02				mov		al,byte ptr [edx]
0498  8A 80 01 00 00 00			mov		al,byte ptr ___MBCSIsTable+0x1[eax]
049E  24 01				and		al,0x01
04A0  25 FF 00 00 00			and		eax,0x000000ff
04A5				L$43:
04A5  85 C0				test		eax,eax
04A7  74 D4				je		L$41
04A9  BD 01 00 00 00			mov		ebp,0x00000001
04AE  8B 5C 24 10			mov		ebx,dword ptr 0x10[esp]
04B2  01 EB				add		ebx,ebp
04B4  89 DA				mov		edx,ebx
04B6  EB 07				jmp		L$45
04B8				L$44:
04B8  8A 42 01				mov		al,byte ptr 0x1[edx]
04BB  45				inc		ebp
04BC  88 02				mov		byte ptr [edx],al
04BE  42				inc		edx
04BF				L$45:
04BF  89 DF				mov		edi,ebx
04C1  06				push		es
04C2  8C D8				mov		eax,ds
04C4  8E C0				mov		es,eax
04C6  29 C9				sub		ecx,ecx
04C8  49				dec		ecx
04C9  31 C0				xor		eax,eax
04CB  F2 AE				repne scasb	
04CD  F7 D1				not		ecx
04CF  49				dec		ecx
04D0  07				pop		es
04D1  39 CD				cmp		ebp,ecx
04D3  76 E3				jbe		L$44
04D5  EB A6				jmp		L$41
04D7				L$46:
04D7  31 C9				xor		ecx,ecx
04D9  8A 54 24 38			mov		dl,byte ptr 0x38[esp]
04DD  89 4C 24 30			mov		dword ptr 0x30[esp],ecx
04E1  88 50 01				mov		byte ptr 0x1[eax],dl
04E4				L$47:
04E4  B8 01 00 00 00			mov		eax,0x00000001
04E9				L$48:
04E9  83 7C 24 28 00			cmp		dword ptr 0x28[esp],0x00000000
04EE  0F 85 08 02 00 00			jne		L$70
04F4  83 7C 24 30 00			cmp		dword ptr 0x30[esp],0x00000000
04F9  0F 85 FD 01 00 00			jne		L$70
04FF  46				inc		esi
0500  85 C0				test		eax,eax
0502  0F 85 F4 01 00 00			jne		L$70
0508  FF 44 24 1C			inc		dword ptr 0x1c[esp]
050C  E9 EB 01 00 00			jmp		L$70
0511				L$49:
0511  88 D8				mov		al,bl
0513  81 FA 80 00 00 00			cmp		edx,0x00000080
0519  7C 02				jl		L$50
051B  2C 80				sub		al,0x80
051D				L$50:
051D  3C 24				cmp		al,0x24
051F  72 37				jb		L$52
0521  76 51				jbe		L$54
0523  3C 27				cmp		al,0x27
0525  72 24				jb		L$51
0527  8D 56 01				lea		edx,0x1[esi]
052A  0F 86 14 01 00 00			jbe		L$63
0530  3C 2D				cmp		al,0x2d
0532  0F 82 B4 FC FF FF			jb		L$13
0538  0F 86 90 01 00 00			jbe		L$68
053E  3C 2E				cmp		al,0x2e
0540  0F 84 0F 01 00 00			je		L$64
0546  E9 A1 FC FF FF			jmp		L$13
054B				L$51:
054B  3C 25				cmp		al,0x25
054D  0F 84 E3 00 00 00			je		L$62
0553  E9 94 FC FF FF			jmp		L$13
0558				L$52:
0558  3C 0D				cmp		al,0x0d
055A  72 0B				jb		L$53
055C  76 26				jbe		L$56
055E  3C 23				cmp		al,0x23
0560  74 19				je		L$55
0562  E9 85 FC FF FF			jmp		L$13
0567				L$53:
0567  3C 08				cmp		al,0x08
0569  0F 84 F6 00 00 00			je		L$65
056F  E9 78 FC FF FF			jmp		L$13
0574				L$54:
0574  31 F6				xor		esi,esi
0576  E9 81 01 00 00			jmp		L$70
057B				L$55:
057B  8B 74 24 1C			mov		esi,dword ptr 0x1c[esp]
057F  E9 78 01 00 00			jmp		L$70
0584				L$56:
0584  8B 54 24 1C			mov		edx,dword ptr 0x1c[esp]
0588  8B 04 24				mov		eax,dword ptr [esp]
058B  E8 00 00 00 00			call		__mbsninc_
0590  BA 02 00 00 00			mov		edx,0x00000002
0595  C6 00 00				mov		byte ptr [eax],0x00
0598  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
059C  B9 01 00 00 00			mov		ecx,0x00000001
05A1  E8 00 00 00 00			call		_NewCursor_
05A6  8B 04 24				mov		eax,dword ptr [esp]
05A9  8B 14 24				mov		edx,dword ptr [esp]
05AC  E8 00 00 00 00			call		__mbslen_
05B1  89 C3				mov		ebx,eax
05B3  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
05B7  8B 34 24				mov		esi,dword ptr [esp]
05BA  E8 00 00 00 00			call		_UpdateInputLine_
05BF  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
05C3  31 D2				xor		edx,edx
05C5  8B 7C 24 08			mov		edi,dword ptr 0x8[esp]
05C9  E8 00 00 00 00			call		_SetInputMode_
05CE  06				push		es
05CF  1E				push		ds
05D0  07				pop		es
05D1  57				push		edi
05D2  2B C9				sub		ecx,ecx
05D4  49				dec		ecx
05D5  B0 00				mov		al,0x00
05D7  F2 AE				repne scasb	
05D9  4F				dec		edi
05DA				L$57:
05DA  8A 06				mov		al,byte ptr [esi]
05DC  88 07				mov		byte ptr [edi],al
05DE  3C 00				cmp		al,0x00
05E0  74 10				je		L$58
05E2  8A 46 01				mov		al,byte ptr 0x1[esi]
05E5  83 C6 02				add		esi,0x00000002
05E8  88 47 01				mov		byte ptr 0x1[edi],al
05EB  83 C7 02				add		edi,0x00000002
05EE  3C 00				cmp		al,0x00
05F0  75 E8				jne		L$57
05F2				L$58:
05F2  5F				pop		edi
05F3  07				pop		es
05F4  89 FE				mov		esi,edi
05F6  8B 3C 24				mov		edi,dword ptr [esp]
05F9  57				push		edi
05FA				L$59:
05FA  8A 06				mov		al,byte ptr [esi]
05FC  88 07				mov		byte ptr [edi],al
05FE  3C 00				cmp		al,0x00
0600  74 10				je		L$60
0602  8A 46 01				mov		al,byte ptr 0x1[esi]
0605  83 C6 02				add		esi,0x00000002
0608  88 47 01				mov		byte ptr 0x1[edi],al
060B  83 C7 02				add		edi,0x00000002
060E  3C 00				cmp		al,0x00
0610  75 E8				jne		L$59
0612				L$60:
0612  5F				pop		edi
0613  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
0617  E8 00 00 00 00			call		_MemFree_
061C  06				push		es
061D  8C D8				mov		eax,ds
061F  8E C0				mov		es,eax
0621  29 C9				sub		ecx,ecx
0623  49				dec		ecx
0624  31 C0				xor		eax,eax
0626  F2 AE				repne scasb	
0628  F7 D1				not		ecx
062A  49				dec		ecx
062B  07				pop		es
062C  89 C8				mov		eax,ecx
062E				L$61:
062E  83 C4 3C				add		esp,0x0000003c
0631  5D				pop		ebp
0632  5F				pop		edi
0633  5E				pop		esi
0634  59				pop		ecx
0635  C3				ret		
0636				L$62:
0636  85 F6				test		esi,esi
0638  0F 8E BE 00 00 00			jle		L$70
063E  4E				dec		esi
063F  E9 B8 00 00 00			jmp		L$70
0644				L$63:
0644  3B 74 24 1C			cmp		esi,dword ptr 0x1c[esp]
0648  0F 8D AE 00 00 00			jge		L$70
064E  89 D6				mov		esi,edx
0650  E9 A7 00 00 00			jmp		L$70
0655				L$64:
0655  8B 6C 24 1C			mov		ebp,dword ptr 0x1c[esp]
0659  39 EE				cmp		esi,ebp
065B  0F 84 9B 00 00 00			je		L$70
0661  7D 02				jge		L$65
0663  89 D6				mov		esi,edx
0665				L$65:
0665  85 F6				test		esi,esi
0667  0F 8E 8F 00 00 00			jle		L$70
066D  8B 04 24				mov		eax,dword ptr [esp]
0670  8D 56 FF				lea		edx,-0x1[esi]
0673  E8 00 00 00 00			call		__mbsninc_
0678  89 F1				mov		ecx,esi
067A  8D 5E 01				lea		ebx,0x1[esi]
067D  89 C7				mov		edi,eax
067F  89 F0				mov		eax,esi
0681  F7 D8				neg		eax
0683  01 C3				add		ebx,eax
0685  EB 27				jmp		L$67
0687				L$66:
0687  89 C8				mov		eax,ecx
0689  29 F0				sub		eax,esi
068B  89 DA				mov		edx,ebx
068D  89 44 24 18			mov		dword ptr 0x18[esp],eax
0691  89 F8				mov		eax,edi
0693  E8 00 00 00 00			call		__mbsninc_
0698  8B 54 24 18			mov		edx,dword ptr 0x18[esp]
069C  89 C5				mov		ebp,eax
069E  89 F8				mov		eax,edi
06A0  43				inc		ebx
06A1  E8 00 00 00 00			call		__mbsninc_
06A6  89 EA				mov		edx,ebp
06A8  41				inc		ecx
06A9  E8 00 00 00 00			call		_mbccpy_
06AE				L$67:
06AE  8B 6C 24 1C			mov		ebp,dword ptr 0x1c[esp]
06B2  39 E9				cmp		ecx,ebp
06B4  7C D1				jl		L$66
06B6  8B 04 24				mov		eax,dword ptr [esp]
06B9  8D 51 FF				lea		edx,-0x1[ecx]
06BC  E8 00 00 00 00			call		__mbsninc_
06C1  C6 00 00				mov		byte ptr [eax],0x00
06C4  8D 45 FF				lea		eax,-0x1[ebp]
06C7  4E				dec		esi
06C8  89 44 24 1C			mov		dword ptr 0x1c[esp],eax
06CC  EB 2E				jmp		L$70
06CE				L$68:
06CE  83 7C 24 2C 00			cmp		dword ptr 0x2c[esp],0x00000000
06D3  74 13				je		L$69
06D5  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
06D9  31 D2				xor		edx,edx
06DB  31 C9				xor		ecx,ecx
06DD  E8 00 00 00 00			call		_NewCursor_
06E2  89 4C 24 2C			mov		dword ptr 0x2c[esp],ecx
06E6  EB 14				jmp		L$70
06E8				L$69:
06E8  BB 01 00 00 00			mov		ebx,0x00000001
06ED  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
06F1  89 DA				mov		edx,ebx
06F3  89 5C 24 2C			mov		dword ptr 0x2c[esp],ebx
06F7  E8 00 00 00 00			call		_NewCursor_
06FC				L$70:
06FC  8B 7C 24 30			mov		edi,dword ptr 0x30[esp]
0700  31 C9				xor		ecx,ecx
0702  85 FF				test		edi,edi
0704  74 0B				je		L$71
0706  8B 04 24				mov		eax,dword ptr [esp]
0709  E8 00 00 00 00			call		__mbslen_
070E  48				dec		eax
070F  EB 08				jmp		L$72
0711				L$71:
0711  8B 04 24				mov		eax,dword ptr [esp]
0714  E8 00 00 00 00			call		__mbslen_
0719				L$72:
0719  8B 14 24				mov		edx,dword ptr [esp]
071C  89 C3				mov		ebx,eax
071E  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0722  E8 00 00 00 00			call		_UpdateInputLine_
0727  89 C2				mov		edx,eax
0729  89 C5				mov		ebp,eax
072B  85 C0				test		eax,eax
072D  0F 8C B9 FA FF FF			jl		L$13
0733  8B 04 24				mov		eax,dword ptr [esp]
0736  E8 00 00 00 00			call		__mbslen_
073B  89 C3				mov		ebx,eax
073D  89 44 24 0C			mov		dword ptr 0xc[esp],eax
0741  29 D3				sub		ebx,edx
0743  8B 04 24				mov		eax,dword ptr [esp]
0746  89 DA				mov		edx,ebx
0748  8B 34 24				mov		esi,dword ptr [esp]
074B  E8 00 00 00 00			call		__mbsninc_
0750  89 C2				mov		edx,eax
0752  8A 00				mov		al,byte ptr [eax]
0754  8B 7C 24 08			mov		edi,dword ptr 0x8[esp]
0758  88 44 24 34			mov		byte ptr 0x34[esp],al
075C  C6 02 00				mov		byte ptr [edx],0x00
075F  06				push		es
0760  1E				push		ds
0761  07				pop		es
0762  57				push		edi
0763  2B C9				sub		ecx,ecx
0765  49				dec		ecx
0766  B0 00				mov		al,0x00
0768  F2 AE				repne scasb	
076A  4F				dec		edi
076B				L$73:
076B  8A 06				mov		al,byte ptr [esi]
076D  88 07				mov		byte ptr [edi],al
076F  3C 00				cmp		al,0x00
0771  74 10				je		L$74
0773  8A 46 01				mov		al,byte ptr 0x1[esi]
0776  83 C6 02				add		esi,0x00000002
0779  88 47 01				mov		byte ptr 0x1[edi],al
077C  83 C7 02				add		edi,0x00000002
077F  3C 00				cmp		al,0x00
0781  75 E8				jne		L$73
0783				L$74:
0783  5F				pop		edi
0784  07				pop		es
0785  8A 44 24 34			mov		al,byte ptr 0x34[esp]
0789  88 02				mov		byte ptr [edx],al
078B  8B 04 24				mov		eax,dword ptr [esp]
078E  31 D2				xor		edx,edx
0790  8D 34 18				lea		esi,[eax+ebx]
0793  EB 07				jmp		L$76
0795				L$75:
0795  42				inc		edx
0796  8A 1E				mov		bl,byte ptr [esi]
0798  46				inc		esi
0799  88 18				mov		byte ptr [eax],bl
079B  40				inc		eax
079C				L$76:
079C  39 EA				cmp		edx,ebp
079E  7E F5				jle		L$75
07A0  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
07A4  89 EE				mov		esi,ebp
07A6  89 6C 24 1C			mov		dword ptr 0x1c[esp],ebp
07AA  8B 6C 24 24			mov		ebp,dword ptr 0x24[esp]
07AE  40				inc		eax
07AF  29 C5				sub		ebp,eax
07B1  89 6C 24 24			mov		dword ptr 0x24[esp],ebp
07B5  E9 32 FA FF FF			jmp		L$13

Routine Size: 1613 bytes,    Routine Base: _TEXT + 016D

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 0000000C bytes
0000				_keyTop:
0000  00 00 00 00                                     ....
0004				_keyBottom:
0004  00 00 00 00                                     ....
0008				_shiftState:
0008  00 00 00 00                                     ....

Segment: _BSS DWORD USE32 00000040 bytes
0000				_charList:
0020				_scanList:

BSS Size: 64 bytes

