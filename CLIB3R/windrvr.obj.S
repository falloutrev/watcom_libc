Module: windrvr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000006C2 bytes
0000				_SetAboutDlg_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  57				push		edi
0004  89 C6				mov		esi,eax
0006  85 C0				test		eax,eax
0008  74 58				je		L$4
000A  8B 1D 00 00 00 00			mov		ebx,dword ptr _AboutTitle
0010  81 FB 00 00 00 00			cmp		ebx,offset _DefaultAboutTitle
0016  74 07				je		L$1
0018  89 D8				mov		eax,ebx
001A  E8 00 00 00 00			call		_MemFree_
001F				L$1:
001F  89 F7				mov		edi,esi
0021  06				push		es
0022  8C D8				mov		eax,ds
0024  8E C0				mov		es,eax
0026  29 C9				sub		ecx,ecx
0028  49				dec		ecx
0029  31 C0				xor		eax,eax
002B  F2 AE				repne scasb	
002D  F7 D1				not		ecx
002F  49				dec		ecx
0030  07				pop		es
0031  8D 41 01				lea		eax,0x1[ecx]
0034  E8 00 00 00 00			call		_MemAlloc_
0039  A3 00 00 00 00			mov		dword ptr _AboutTitle,eax
003E  85 C0				test		eax,eax
0040  0F 84 7B 00 00 00			je		L$9
0046  89 C7				mov		edi,eax
0048  57				push		edi
0049				L$2:
0049  8A 06				mov		al,byte ptr [esi]
004B  88 07				mov		byte ptr [edi],al
004D  3C 00				cmp		al,0x00
004F  74 10				je		L$3
0051  8A 46 01				mov		al,byte ptr 0x1[esi]
0054  83 C6 02				add		esi,0x00000002
0057  88 47 01				mov		byte ptr 0x1[edi],al
005A  83 C7 02				add		edi,0x00000002
005D  3C 00				cmp		al,0x00
005F  75 E8				jne		L$2
0061				L$3:
0061  5F				pop		edi
0062				L$4:
0062  85 D2				test		edx,edx
0064  74 56				je		L$8
0066  8B 0D 00 00 00 00			mov		ecx,dword ptr _AboutMsg
006C  81 F9 00 00 00 00			cmp		ecx,offset _DefaultAboutMsg
0072  74 07				je		L$5
0074  89 C8				mov		eax,ecx
0076  E8 00 00 00 00			call		_MemFree_
007B				L$5:
007B  89 D7				mov		edi,edx
007D  06				push		es
007E  8C D8				mov		eax,ds
0080  8E C0				mov		es,eax
0082  29 C9				sub		ecx,ecx
0084  49				dec		ecx
0085  31 C0				xor		eax,eax
0087  F2 AE				repne scasb	
0089  F7 D1				not		ecx
008B  49				dec		ecx
008C  07				pop		es
008D  8D 41 01				lea		eax,0x1[ecx]
0090  E8 00 00 00 00			call		_MemAlloc_
0095  A3 00 00 00 00			mov		dword ptr _AboutMsg,eax
009A  85 C0				test		eax,eax
009C  74 23				je		L$9
009E  89 D6				mov		esi,edx
00A0  89 C7				mov		edi,eax
00A2  57				push		edi
00A3				L$6:
00A3  8A 06				mov		al,byte ptr [esi]
00A5  88 07				mov		byte ptr [edi],al
00A7  3C 00				cmp		al,0x00
00A9  74 10				je		L$7
00AB  8A 46 01				mov		al,byte ptr 0x1[esi]
00AE  83 C6 02				add		esi,0x00000002
00B1  88 47 01				mov		byte ptr 0x1[edi],al
00B4  83 C7 02				add		edi,0x00000002
00B7  3C 00				cmp		al,0x00
00B9  75 E8				jne		L$6
00BB				L$7:
00BB  5F				pop		edi
00BC				L$8:
00BC  B8 01 00 00 00			mov		eax,0x00000001
00C1				L$9:
00C1  5F				pop		edi
00C2  5E				pop		esi
00C3  59				pop		ecx
00C4  5B				pop		ebx
00C5  C3				ret		
00C6  8B C0				mov		eax,eax
00C8				L$10:
00C8  35 02 00 00                                     DD	offset L$24
00CC  40 02 00 00                                     DD	offset L$25
00D0  74 02 00 00                                     DD	offset L$26
00D4  14 02 00 00                                     DD	offset L$23
00D8  D8 01 00 00                                     DD	offset L$22
00DC  BD 01 00 00                                     DD	offset L$20
00E0				L$11:
00E0  46 03 00 00                                     DD	offset L$35
00E4  52 03 00 00                                     DD	offset L$36
00E8  6E 03 00 00                                     DD	offset L$39
00EC  5E 03 00 00                                     DD	offset L$37
00F0  80 03 00 00                                     DD	offset L$40
00F4  3A 03 00 00                                     DD	offset L$34
00F8  80 03 00 00                                     DD	offset L$40
00FC  2E 03 00 00                                     DD	offset L$33
0100				MainWindowProc_:
0100  56				push		esi
0101  57				push		edi
0102  55				push		ebp
0103  81 EC 80 00 00 00			sub		esp,0x00000080
0109  89 C7				mov		edi,eax
010B  89 D6				mov		esi,edx
010D  89 CD				mov		ebp,ecx
010F  81 FA 00 01 00 00			cmp		edx,0x00000100
0115  72 22				jb		L$12
0117  0F 86 86 01 00 00			jbe		L$28
011D  81 FA 02 01 00 00			cmp		edx,0x00000102
0123  0F 82 C6 02 00 00			jb		L$44
0129  0F 86 9B 02 00 00			jbe		L$43
012F  81 FA 11 01 00 00			cmp		edx,0x00000111
0135  74 4A				je		L$18
0137  EB 2D				jmp		L$16
0139				L$12:
0139  83 FA 07				cmp		edx,0x00000007
013C  72 09				jb		L$13
013E  76 34				jbe		L$17
0140  83 FA 08				cmp		edx,0x00000008
0143  74 0D				je		L$14
0145  EB 1F				jmp		L$16
0147				L$13:
0147  83 FA 02				cmp		edx,0x00000002
014A  0F 84 3B 01 00 00			je		L$27
0150  EB 14				jmp		L$16
0152				L$14:
0152  E8 00 00 00 00			call		_GetActiveWindowData_
0157  85 C0				test		eax,eax
0159  74 0B				je		L$16
015B  31 C9				xor		ecx,ecx
015D  89 C2				mov		edx,eax
015F  89 C8				mov		eax,ecx
0161				L$15:
0161  E8 00 00 00 00			call		_ShowWindowActive_
0166				L$16:
0166  55				push		ebp
0167  53				push		ebx
0168  56				push		esi
0169  57				push		edi
016A  E8 00 00 00 00			call		_DefWindowProcA
016F  E9 A2 02 00 00			jmp		L$47
0174				L$17:
0174  E8 00 00 00 00			call		_GetActiveWindowData_
0179  85 C0				test		eax,eax
017B  74 E9				je		L$16
017D  31 D2				xor		edx,edx
017F  EB E0				jmp		L$15
0181				L$18:
0181  31 C0				xor		eax,eax
0183  66 89 D8				mov		ax,bx
0186  3D C8 00 00 00			cmp		eax,0x000000c8
018B  7C 1C				jl		L$19
018D  2D C8 00 00 00			sub		eax,0x000000c8
0192  E8 00 00 00 00			call		_IsWindowedHandle_
0197  85 C0				test		eax,eax
0199  0F 84 75 02 00 00			je		L$46
019F  E8 00 00 00 00			call		_MakeWindowActive_
01A4  E9 6B 02 00 00			jmp		L$46
01A9				L$19:
01A9  48				dec		eax
01AA  66 3D 05 00			cmp		ax,0x0005
01AE  77 B6				ja		L$16
01B0  25 FF FF 00 00			and		eax,0x0000ffff
01B5  2E FF 24 85 C8 00 00 00		jmp		dword ptr cs:L$10[eax*4]
01BD				L$20:
01BD  6A 40				push		0x00000040
01BF  8B 15 00 00 00 00			mov		edx,dword ptr _AboutTitle
01C5  52				push		edx
01C6  8B 1D 00 00 00 00			mov		ebx,dword ptr _AboutMsg
01CC  53				push		ebx
01CD  57				push		edi
01CE				L$21:
01CE  E8 00 00 00 00			call		_MessageBoxA
01D3  E9 3C 02 00 00			jmp		L$46
01D8				L$22:
01D8  8B 15 00 00 00 00			mov		edx,dword ptr __AutoClearLines
01DE  E8 00 00 00 00			call		_GetClearInterval_
01E3  8B 0D 00 00 00 00			mov		ecx,dword ptr __AutoClearLines
01E9  39 CA				cmp		edx,ecx
01EB  0F 84 23 02 00 00			je		L$46
01F1  51				push		ecx
01F2  68 00 00 00 00			push		offset DGROUP:L$75
01F7  8D 44 24 08			lea		eax,0x8[esp]
01FB  50				push		eax
01FC  E8 00 00 00 00			call		sprintf_
0201  83 C4 0C				add		esp,0x0000000c
0204  6A 00				push		0x00000000
0206  68 28 00 00 00			push		offset DGROUP:L$76
020B  8D 44 24 08			lea		eax,0x8[esp]
020F  50				push		eax
0210  6A 00				push		0x00000000
0212  EB BA				jmp		L$21
0214				L$23:
0214  E8 00 00 00 00			call		_GetActiveWindowData_
0219  85 C0				test		eax,eax
021B  0F 84 F3 01 00 00			je		L$46
0221  F6 40 52 08			test		byte ptr 0x52[eax],0x08
0225  0F 85 E9 01 00 00			jne		L$46
022B  E8 00 00 00 00			call		_CopyAllLines_
0230  E9 DF 01 00 00			jmp		L$46
0235				L$24:
0235  57				push		edi
0236  E8 00 00 00 00			call		_DestroyWindow
023B  E9 D4 01 00 00			jmp		L$46
0240				L$25:
0240  E8 00 00 00 00			call		_GetActiveWindowData_
0245  89 C3				mov		ebx,eax
0247  85 C0				test		eax,eax
0249  0F 84 C5 01 00 00			je		L$46
024F  83 78 6B 00			cmp		dword ptr 0x6b[eax],0x00000000
0253  0F 85 BB 01 00 00			jne		L$46
0259  F6 40 52 08			test		byte ptr 0x52[eax],0x08
025D  0F 85 B1 01 00 00			jne		L$46
0263  E8 00 00 00 00			call		_FreeAllLines_
0268  89 D8				mov		eax,ebx
026A  E8 00 00 00 00			call		_ClearWindow_
026F  E9 A0 01 00 00			jmp		L$46
0274				L$26:
0274  E8 00 00 00 00			call		_GetActiveWindowData_
0279  85 C0				test		eax,eax
027B  0F 84 93 01 00 00			je		L$46
0281  E8 00 00 00 00			call		_SaveAllLines_
0286  E9 89 01 00 00			jmp		L$46
028B				L$27:
028B  8B 2D 00 00 00 00			mov		ebp,dword ptr __FixedFont
0291  55				push		ebp
0292  E8 00 00 00 00			call		_DeleteObject
0297  6A 00				push		0x00000000
0299  E8 00 00 00 00			call		_PostQuitMessage
029E  E9 71 01 00 00			jmp		L$46
02A3				L$28:
02A3  E8 00 00 00 00			call		_GetActiveWindowData_
02A8  89 C6				mov		esi,eax
02AA  83 FB 11				cmp		ebx,0x00000011
02AD  75 09				jne		L$29
02AF  80 0D 00 00 00 00 08		or		byte ptr _shiftState,0x08
02B6  EB 5F				jmp		L$32
02B8				L$29:
02B8  83 FB 03				cmp		ebx,0x00000003
02BB  75 2A				jne		L$31
02BD  6A 40				push		0x00000040
02BF  B8 33 00 00 00			mov		eax,offset DGROUP:L$77
02C4  50				push		eax
02C5  B8 3C 00 00 00			mov		eax,offset DGROUP:L$78
02CA  50				push		eax
02CB  57				push		edi
02CC  E8 00 00 00 00			call		_MessageBoxA
02D1  80 25 00 00 00 00 F7		and		byte ptr _shiftState,0xf7
02D8  B8 07 00 00 00			mov		eax,0x00000007
02DD				L$30:
02DD  E8 00 00 00 00			call		raise_
02E2  E9 2D 01 00 00			jmp		L$46
02E7				L$31:
02E7  F6 05 00 00 00 00 08		test		byte ptr _shiftState,0x08
02EE  74 27				je		L$32
02F0  83 FB 43				cmp		ebx,0x00000043
02F3  75 22				jne		L$32
02F5  6A 40				push		0x00000040
02F7  B8 3D 00 00 00			mov		eax,offset DGROUP:L$79
02FC  50				push		eax
02FD  B8 3C 00 00 00			mov		eax,offset DGROUP:L$78
0302  50				push		eax
0303  57				push		edi
0304  E8 00 00 00 00			call		_MessageBoxA
0309  80 25 00 00 00 00 F7		and		byte ptr _shiftState,0xf7
0310  B8 04 00 00 00			mov		eax,0x00000004
0315  EB C6				jmp		L$30
0317				L$32:
0317  6A 00				push		0x00000000
0319  E8 00 00 00 00			call		_ShowCursor
031E  8D 43 DF				lea		eax,-0x21[ebx]
0321  83 F8 07				cmp		eax,0x00000007
0324  77 5A				ja		L$40
0326  2E FF 24 85 E0 00 00 00		jmp		dword ptr cs:L$11[eax*4]
032E				L$33:
032E  89 F0				mov		eax,esi
0330  E8 00 00 00 00			call		_MoveLineDown_
0335  E9 87 00 00 00			jmp		L$42
033A				L$34:
033A  89 F0				mov		eax,esi
033C  E8 00 00 00 00			call		_MoveLineUp_
0341  E9 7B 00 00 00			jmp		L$42
0346				L$35:
0346  89 F0				mov		eax,esi
0348  E8 00 00 00 00			call		_MovePageUp_
034D  E9 6F 00 00 00			jmp		L$42
0352				L$36:
0352  89 F0				mov		eax,esi
0354  E8 00 00 00 00			call		_MovePageDown_
0359  E9 63 00 00 00			jmp		L$42
035E				L$37:
035E  BB 01 00 00 00			mov		ebx,0x00000001
0363  89 F0				mov		eax,esi
0365  89 DA				mov		edx,ebx
0367				L$38:
0367  E8 00 00 00 00			call		_MoveToLine_
036C  EB 53				jmp		L$42
036E				L$39:
036E  89 F0				mov		eax,esi
0370  BB 01 00 00 00			mov		ebx,0x00000001
0375  E8 00 00 00 00			call		_GetLastLineNumber_
037A  89 C2				mov		edx,eax
037C  89 F0				mov		eax,esi
037E  EB E7				jmp		L$38
0380				L$40:
0380  83 FB 24				cmp		ebx,0x00000024
0383  74 23				je		L$41
0385  83 FB 23				cmp		ebx,0x00000023
0388  74 1E				je		L$41
038A  83 FB 0D				cmp		ebx,0x0000000d
038D  74 19				je		L$41
038F  83 FB 25				cmp		ebx,0x00000025
0392  74 14				je		L$41
0394  83 FB 27				cmp		ebx,0x00000027
0397  74 0F				je		L$41
0399  83 FB 2E				cmp		ebx,0x0000002e
039C  74 0A				je		L$41
039E  83 FB 08				cmp		ebx,0x00000008
03A1  74 05				je		L$41
03A3  83 FB 2D				cmp		ebx,0x0000002d
03A6  75 19				jne		L$42
03A8				L$41:
03A8  89 E8				mov		eax,ebp
03AA  C1 E8 10				shr		eax,0x10
03AD  31 D2				xor		edx,edx
03AF  25 FF FF 00 00			and		eax,0x0000ffff
03B4  66 89 C2				mov		dx,ax
03B7  31 C0				xor		eax,eax
03B9  66 89 D8				mov		ax,bx
03BC  E8 00 00 00 00			call		_WindowsVirtualKeyPush_
03C1				L$42:
03C1  6A 01				push		0x00000001
03C3  E8 00 00 00 00			call		_ShowCursor
03C8  EB 4A				jmp		L$46
03CA				L$43:
03CA  83 FB 0D				cmp		ebx,0x0000000d
03CD  74 45				je		L$46
03CF  83 FB 08				cmp		ebx,0x00000008
03D2  74 40				je		L$46
03D4  89 C8				mov		eax,ecx
03D6  C1 E8 10				shr		eax,0x10
03D9  31 D2				xor		edx,edx
03DB  25 FF FF 00 00			and		eax,0x0000ffff
03E0  66 89 C2				mov		dx,ax
03E3  31 C0				xor		eax,eax
03E5  66 89 D8				mov		ax,bx
03E8  E8 00 00 00 00			call		_WindowsKeyPush_
03ED  EB 25				jmp		L$46
03EF				L$44:
03EF  83 FB 11				cmp		ebx,0x00000011
03F2  75 07				jne		L$45
03F4  80 25 00 00 00 00 F7		and		byte ptr _shiftState,0xf7
03FB				L$45:
03FB  89 E8				mov		eax,ebp
03FD  C1 E8 10				shr		eax,0x10
0400  31 D2				xor		edx,edx
0402  25 FF FF 00 00			and		eax,0x0000ffff
0407  66 89 C2				mov		dx,ax
040A  31 C0				xor		eax,eax
040C  66 89 D8				mov		ax,bx
040F  E8 00 00 00 00			call		_WindowsKeyUp_
0414				L$46:
0414  31 C0				xor		eax,eax
0416				L$47:
0416  81 C4 80 00 00 00			add		esp,0x00000080
041C  5D				pop		ebp
041D  5F				pop		edi
041E  5E				pop		esi
041F  C3				ret		
0420				L$48:
0420  A5 06 00 00                                     DD	offset L$72
0424  9C 06 00 00                                     DD	offset L$71
0428  93 06 00 00                                     DD	offset L$70
042C  8A 06 00 00                                     DD	offset L$69
0430  62 06 00 00                                     DD	offset L$68

Routine Size: 1076 bytes,    Routine Base: _TEXT + 0000

0434				__MainDriver:
0434  53				push		ebx
0435  56				push		esi
0436  57				push		edi
0437  55				push		ebp
0438  83 EC 54				sub		esp,0x00000054
043B  8B 6C 24 68			mov		ebp,dword ptr 0x68[esp]
043F  8B 7C 24 6C			mov		edi,dword ptr 0x6c[esp]
0443  3B 2D 00 00 00 00			cmp		ebp,dword ptr __MainWindow
0449  75 16				jne		L$49
044B  8B 4C 24 74			mov		ecx,dword ptr 0x74[esp]
044F  8B 5C 24 70			mov		ebx,dword ptr 0x70[esp]
0453  89 FA				mov		edx,edi
0455  89 E8				mov		eax,ebp
0457  E8 00 00 00 00			call		MainWindowProc_
045C  E9 05 01 00 00			jmp		L$62
0461				L$49:
0461  89 E8				mov		eax,ebp
0463  E8 00 00 00 00			call		_GetWindowData_
0468  89 C6				mov		esi,eax
046A  89 C3				mov		ebx,eax
046C  85 C0				test		eax,eax
046E  75 16				jne		L$52
0470  8B 5C 24 74			mov		ebx,dword ptr 0x74[esp]
0474				L$50:
0474  53				push		ebx
0475  8B 4C 24 74			mov		ecx,dword ptr 0x74[esp]
0479  51				push		ecx
047A				L$51:
047A  57				push		edi
047B  55				push		ebp
047C  E8 00 00 00 00			call		_DefWindowProcA
0481  E9 E0 00 00 00			jmp		L$62
0486				L$52:
0486  83 FF 0F				cmp		edi,0x0000000f
0489  72 3A				jb		L$54
048B  0F 86 E6 00 00 00			jbe		L$64
0491  83 FF 41				cmp		edi,0x00000041
0494  72 25				jb		L$53
0496  0F 86 9B 00 00 00			jbe		L$60
049C  81 FF 12 01 00 00			cmp		edi,0x00000112
04A2  0F 82 0B 02 00 00			jb		L$74
04A8  76 55				jbe		L$57
04AA  81 FF 15 01 00 00			cmp		edi,0x00000115
04B0  0F 84 8E 01 00 00			je		L$67
04B6  E9 F8 01 00 00			jmp		L$74
04BB				L$53:
04BB  83 FF 21				cmp		edi,0x00000021
04BE  74 3F				je		L$57
04C0  E9 EE 01 00 00			jmp		L$74
04C5				L$54:
04C5  83 FF 05				cmp		edi,0x00000005
04C8  72 1B				jb		L$55
04CA  0F 86 C8 00 00 00			jbe		L$65
04D0  83 FF 07				cmp		edi,0x00000007
04D3  0F 82 DA 01 00 00			jb		L$74
04D9  76 18				jbe		L$56
04DB  83 FF 08				cmp		edi,0x00000008
04DE  74 2F				je		L$58
04E0  E9 CE 01 00 00			jmp		L$74
04E5				L$55:
04E5  83 FF 02				cmp		edi,0x00000002
04E8  0F 84 82 00 00 00			je		L$63
04EE  E9 C0 01 00 00			jmp		L$74
04F3				L$56:
04F3  8B 15 00 00 00 00			mov		edx,dword ptr __MainWindow
04F9  52				push		edx
04FA  E8 00 00 00 00			call		_SetFocus
04FF				L$57:
04FF  89 D8				mov		eax,ebx
0501  8B 5C 24 74			mov		ebx,dword ptr 0x74[esp]
0505  E8 00 00 00 00			call		_MakeWindowActive_
050A  E9 65 FF FF FF			jmp		L$50
050F				L$58:
050F  8B 5C 24 70			mov		ebx,dword ptr 0x70[esp]
0513  85 DB				test		ebx,ebx
0515  74 11				je		L$59
0517  3B 1D 00 00 00 00			cmp		ebx,dword ptr __MainWindow
051D  74 09				je		L$59
051F  89 C2				mov		edx,eax
0521  31 C0				xor		eax,eax
0523  E8 00 00 00 00			call		_ShowWindowActive_
0528				L$59:
0528  8B 74 24 74			mov		esi,dword ptr 0x74[esp]
052C  56				push		esi
052D  8B 44 24 74			mov		eax,dword ptr 0x74[esp]
0531  50				push		eax
0532  E9 43 FF FF FF			jmp		L$51
0537				L$60:
0537  68 31 20 00 00			push		0x00002031
053C  68 44 00 00 00			push		offset DGROUP:L$80
0541  68 53 00 00 00			push		offset DGROUP:L$81
0546  6A 00				push		0x00000000
0548  E8 00 00 00 00			call		_MessageBoxA
054D  83 F8 01				cmp		eax,0x00000001
0550  0F 85 0E 00 00 00			jne		L$61
0556  89 F0				mov		eax,esi
0558  E8 00 00 00 00			call		_FreeAllLines_
055D  89 F0				mov		eax,esi
055F  E8 00 00 00 00			call		_ClearWindow_
0564				L$61:
0564  31 C0				xor		eax,eax
0566				L$62:
0566  83 C4 54				add		esp,0x00000054
0569  5D				pop		ebp
056A  5F				pop		edi
056B  5E				pop		esi
056C  5B				pop		ebx
056D  C2 10 00				ret		0x0010
0570				L$63:
0570  E8 00 00 00 00			call		_DestroyAWindow_
0575  EB ED				jmp		L$61
0577				L$64:
0577  89 E0				mov		eax,esp
0579  50				push		eax
057A  55				push		ebp
057B  E8 00 00 00 00			call		_BeginPaint
0580  8D 54 24 08			lea		edx,0x8[esp]
0584  89 C3				mov		ebx,eax
0586  89 F0				mov		eax,esi
0588  E8 00 00 00 00			call		_RepaintWindow_
058D  89 E0				mov		eax,esp
058F  50				push		eax
0590  55				push		ebp
0591  E8 00 00 00 00			call		_EndPaint
0596  EB CC				jmp		L$61
0598				L$65:
0598  F6 40 52 01			test		byte ptr 0x52[eax],0x01
059C  74 18				je		L$66
059E  8A 56 52				mov		dl,byte ptr 0x52[esi]
05A1  8B 4C 24 74			mov		ecx,dword ptr 0x74[esp]
05A5  80 E2 FE				and		dl,0xfe
05A8  51				push		ecx
05A9  88 56 52				mov		byte ptr 0x52[esi],dl
05AC  8B 74 24 74			mov		esi,dword ptr 0x74[esp]
05B0  56				push		esi
05B1  E9 C4 FE FF FF			jmp		L$51
05B6				L$66:
05B6  8B 44 24 74			mov		eax,dword ptr 0x74[esp]
05BA  C1 E8 10				shr		eax,0x10
05BD  25 FF FF 00 00			and		eax,0x0000ffff
05C2  55				push		ebp
05C3  89 44 24 54			mov		dword ptr 0x54[esp],eax
05C7  E8 00 00 00 00			call		_GetDC
05CC  8B 7E 36				mov		edi,dword ptr 0x36[esi]
05CF  57				push		edi
05D0  50				push		eax
05D1  89 C3				mov		ebx,eax
05D3  E8 00 00 00 00			call		_SelectObject
05D8  6A 00				push		0x00000000
05DA  6A 00				push		0x00000000
05DC  6A 00				push		0x00000000
05DE  53				push		ebx
05DF  89 C7				mov		edi,eax
05E1  E8 00 00 00 00			call		_SetBrushOrgEx
05E6  8D 44 24 40			lea		eax,0x40[esp]
05EA  50				push		eax
05EB  55				push		ebp
05EC  E8 00 00 00 00			call		_GetClientRect
05F1  8B 46 36				mov		eax,dword ptr 0x36[esi]
05F4  50				push		eax
05F5  8D 44 24 44			lea		eax,0x44[esp]
05F9  50				push		eax
05FA  53				push		ebx
05FB  E8 00 00 00 00			call		_FillRect
0600  57				push		edi
0601  53				push		ebx
0602  E8 00 00 00 00			call		_SelectObject
0607  53				push		ebx
0608  55				push		ebp
0609  E8 00 00 00 00			call		_ReleaseDC
060E  8B 54 24 44			mov		edx,dword ptr 0x44[esp]
0612  8B 5C 24 40			mov		ebx,dword ptr 0x40[esp]
0616  31 C0				xor		eax,eax
0618  31 C9				xor		ecx,ecx
061A  66 8B 44 24 50			mov		ax,word ptr 0x50[esp]
061F  66 8B 4C 24 74			mov		cx,word ptr 0x74[esp]
0624  01 D0				add		eax,edx
0626  01 D9				add		ecx,ebx
0628  50				push		eax
0629  89 D3				mov		ebx,edx
062B  8B 54 24 44			mov		edx,dword ptr 0x44[esp]
062F  89 F0				mov		eax,esi
0631  E8 00 00 00 00			call		_ResizeWin_
0636  89 F0				mov		eax,esi
0638  31 D2				xor		edx,edx
063A  E8 00 00 00 00			call		_DisplayAllLines_
063F  E9 20 FF FF FF			jmp		L$61
0644				L$67:
0644  6A 00				push		0x00000000
0646  E8 00 00 00 00			call		_ShowCursor
064B  8B 54 24 70			mov		edx,dword ptr 0x70[esp]
064F  66 83 FA 04			cmp		dx,0x0004
0653  77 57				ja		L$73
0655  31 C0				xor		eax,eax
0657  66 89 D0				mov		ax,dx
065A  2E FF 24 85 20 04 00 00		jmp		dword ptr cs:L$48[eax*4]
0662				L$68:
0662  8B 44 24 70			mov		eax,dword ptr 0x70[esp]
0666  C1 E8 10				shr		eax,0x10
0669  31 D2				xor		edx,edx
066B  25 FF FF 00 00			and		eax,0x0000ffff
0670  66 89 C2				mov		dx,ax
0673  89 F0				mov		eax,esi
0675  BB 01 00 00 00			mov		ebx,0x00000001
067A  E8 00 00 00 00			call		_GetLineFromThumbPosition_
067F  89 C2				mov		edx,eax
0681  89 F0				mov		eax,esi
0683  E8 00 00 00 00			call		_MoveToLine_
0688  EB 22				jmp		L$73
068A				L$69:
068A  89 F0				mov		eax,esi
068C  E8 00 00 00 00			call		_MovePageDown_
0691  EB 19				jmp		L$73
0693				L$70:
0693  89 F0				mov		eax,esi
0695  E8 00 00 00 00			call		_MovePageUp_
069A  EB 10				jmp		L$73
069C				L$71:
069C  89 F0				mov		eax,esi
069E  E8 00 00 00 00			call		_MoveLineDown_
06A3  EB 07				jmp		L$73
06A5				L$72:
06A5  89 F0				mov		eax,esi
06A7  E8 00 00 00 00			call		_MoveLineUp_
06AC				L$73:
06AC  6A 01				push		0x00000001
06AE  E8 00 00 00 00			call		_ShowCursor
06B3				L$74:
06B3  8B 44 24 74			mov		eax,dword ptr 0x74[esp]
06B7  50				push		eax
06B8  8B 54 24 74			mov		edx,dword ptr 0x74[esp]
06BC  52				push		edx
06BD  E9 B8 FD FF FF			jmp		L$51

Routine Size: 654 bytes,    Routine Base: _TEXT + 0434

No disassembly errors

Segment: CONST DWORD USE32 00000081 bytes
0000				L$75:
0000  42 75 66 66 65 72 73 20 77 69 6C 6C 20 62 65 20 Buffers will be 
0010  63 6C 65 61 72 65 64 20 61 66 74 65 72 20 25 6C cleared after %l
0020  64 20 6C 69 6E 65 73 00                         d lines.
0028				L$76:
0028  41 6D 6F 75 6E 74 20 53 65 74 00                Amount Set.
0033				L$77:
0033  53 49 47 42 52 45 41 4B 00                      SIGBREAK.
003C				L$78:
003C  00                                              .
003D				L$79:
003D  53 49 47 49 4E 54 00                            SIGINT.
0044				L$80:
0044  53 79 73 74 65 6D 20 52 65 71 75 65 73 74 00    System Request.
0053				L$81:
0053  53 79 73 74 65 6D 20 68 61 73 20 69 6E 64 69 63 System has indic
0063  61 74 65 64 20 6C 6F 77 20 6D 65 6D 6F 72 79 2C ated low memory,
0073  20 43 6C 65 61 72 20 4C 69 6E 65 73 3F 00        Clear Lines?.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000093 bytes
0000				_DefaultAboutMsg:
0000  20 20 20 57 41 54 43 4F 4D 20 44 65 66 61 75 6C    WATCOM Defaul
0010  74 20 57 69 6E 64 6F 77 20 53 79 73 74 65 6D 0A t Window System.
0020  0A 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 .               
0030  20 56 65 72 73 69 6F 6E 20 31 30 2E 30 0A 0A 20  Version 10.0.. 
0040  A9 20 31 39 39 31 2D 31 39 39 34 20 57 41 54 43 . 1991-1994 WATC
0050  4F 4D 20 53 79 73 74 65 6D 73 2C 20 49 6E 63 2E OM Systems, Inc.
0060  00                                              .
0061				_AboutMsg:
0061  00 00 00 00                                     DD	offset _DefaultAboutMsg
0065				_DefaultAboutTitle:
0065  41 62 6F 75 74 20 57 41 54 43 4F 4D 20 44 65 66 About WATCOM Def
0075  61 75 6C 74 20 57 69 6E 64 6F 77 69 6E 67 20 53 ault Windowing S
0085  79 73 74 65 6D 00                               ystem.
008B				_AboutTitle:
008B  00 00 00 00                                     DD	offset _DefaultAboutTitle
008F				_shiftState:
008F  00 00 00 00                                     ....

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

