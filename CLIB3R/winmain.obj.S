Module: winmain
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000004FA bytes
0000				__InitDefaultWin_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  E8 00 00 00 00			call		_GetCommandLineA
0008  E8 00 00 00 00			call		strdup_
000D				L$1:
000D  8A 10				mov		dl,byte ptr [eax]
000F  FE C2				inc		dl
0011  81 E2 FF 00 00 00			and		edx,0x000000ff
0017  8A 92 00 00 00 00			mov		dl,byte ptr __IsTable[edx]
001D  80 E2 02				and		dl,0x02
0020  81 E2 FF 00 00 00			and		edx,0x000000ff
0026  75 08				jne		L$2
0028  80 38 00				cmp		byte ptr [eax],0x00
002B  74 03				je		L$2
002D  40				inc		eax
002E  EB DD				jmp		L$1
0030				L$2:
0030  8A 10				mov		dl,byte ptr [eax]
0032  FE C2				inc		dl
0034  81 E2 FF 00 00 00			and		edx,0x000000ff
003A  8A 92 00 00 00 00			mov		dl,byte ptr __IsTable[edx]
0040  80 E2 02				and		dl,0x02
0043  81 E2 FF 00 00 00			and		edx,0x000000ff
0049  74 03				je		L$3
004B  40				inc		eax
004C  EB E2				jmp		L$2
004E				L$3:
004E  52				push		edx
004F  E8 00 00 00 00			call		_GetModuleHandleA
0054  89 C3				mov		ebx,eax
0056  E8 00 00 00 00			call		firstInstance_
005B  85 C0				test		eax,eax
005D  74 1A				je		L$4
005F  BA 0A 00 00 00			mov		edx,0x0000000a
0064  89 D8				mov		eax,ebx
0066  E8 00 00 00 00			call		windowsInit_
006B  85 C0				test		eax,eax
006D  74 0A				je		L$4
006F  E8 00 00 00 00			call		_InitFunctionPointers_
0074  B8 01 00 00 00			mov		eax,0x00000001
0079				L$4:
0079  5A				pop		edx
007A  59				pop		ecx
007B  5B				pop		ebx

Routine Size: 124 bytes,    Routine Base: _TEXT + 0000

007C				__FiniDefaultWin_:
007C  C3				ret		

Routine Size: 1 bytes,    Routine Base: _TEXT + 007C

007D				DEFAULTWINMAIN:
007D  8B 5C 24 10			mov		ebx,dword ptr 0x10[esp]
0081  89 D8				mov		eax,ebx
0083  E8 00 00 00 00			call		firstInstance_
0088  85 C0				test		eax,eax
008A  75 03				jne		L$5
008C  C2 10 00				ret		0x0010
008F				L$5:
008F  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0093  89 D8				mov		eax,ebx
0095  E8 00 00 00 00			call		windowsInit_
009A  85 C0				test		eax,eax
009C  75 03				jne		L$6
009E  C2 10 00				ret		0x0010
00A1				L$6:
00A1  E8 00 00 00 00			call		_InitFunctionPointers_
00A6  8B 15 00 00 00 00			mov		edx,dword ptr ____Argv
00AC  A1 00 00 00 00			mov		eax,dword ptr ____Argc
00B1  E8 00 00 00 00			call		main_
00B6  89 C2				mov		edx,eax
00B8  E8 00 00 00 00			call		_WindowsExit_
00BD  89 D0				mov		eax,edx
00BF  C2 10 00				ret		0x0010
00C2				firstInstance_:
00C2  53				push		ebx
00C3  51				push		ecx
00C4  52				push		edx
00C5  56				push		esi
00C6  57				push		edi
00C7  55				push		ebp
00C8  81 EC A8 00 00 00			sub		esp,0x000000a8
00CE  89 C5				mov		ebp,eax
00D0  50				push		eax
00D1  68 00 00 00 00			push		offset DGROUP:L$15
00D6  8D 44 24 08			lea		eax,0x8[esp]
00DA  50				push		eax
00DB  E8 00 00 00 00			call		sprintf_
00E0  83 C4 0C				add		esp,0x0000000c
00E3  89 E7				mov		edi,esp
00E5  06				push		es
00E6  8C D8				mov		eax,ds
00E8  8E C0				mov		es,eax
00EA  29 C9				sub		ecx,ecx
00EC  49				dec		ecx
00ED  31 C0				xor		eax,eax
00EF  F2 AE				repne scasb	
00F1  F7 D1				not		ecx
00F3  49				dec		ecx
00F4  07				pop		es
00F5  8D 41 01				lea		eax,0x1[ecx]
00F8  E8 00 00 00 00			call		malloc_
00FD  A3 00 00 00 00			mov		dword ptr _mainClass,eax
0102  85 C0				test		eax,eax
0104  0F 84 98 02 00 00			je		L$11
010A  89 E6				mov		esi,esp
010C  89 C7				mov		edi,eax
010E  57				push		edi
010F				L$7:
010F  8A 06				mov		al,byte ptr [esi]
0111  88 07				mov		byte ptr [edi],al
0113  3C 00				cmp		al,0x00
0115  74 10				je		L$8
0117  8A 46 01				mov		al,byte ptr 0x1[esi]
011A  83 C6 02				add		esi,0x00000002
011D  88 47 01				mov		byte ptr 0x1[edi],al
0120  83 C7 02				add		edi,0x00000002
0123  3C 00				cmp		al,0x00
0125  75 E8				jne		L$7
0127				L$8:
0127  5F				pop		edi
0128  55				push		ebp
0129  68 0B 00 00 00			push		offset DGROUP:L$16
012E  8D 44 24 08			lea		eax,0x8[esp]
0132  50				push		eax
0133  E8 00 00 00 00			call		sprintf_
0138  83 C4 0C				add		esp,0x0000000c
013B  89 E7				mov		edi,esp
013D  06				push		es
013E  8C D8				mov		eax,ds
0140  8E C0				mov		es,eax
0142  29 C9				sub		ecx,ecx
0144  49				dec		ecx
0145  31 C0				xor		eax,eax
0147  F2 AE				repne scasb	
0149  F7 D1				not		ecx
014B  49				dec		ecx
014C  07				pop		es
014D  8D 41 01				lea		eax,0x1[ecx]
0150  E8 00 00 00 00			call		malloc_
0155  A3 00 00 00 00			mov		dword ptr __ClassName,eax
015A  85 C0				test		eax,eax
015C  0F 84 40 02 00 00			je		L$11
0162  89 E6				mov		esi,esp
0164  89 C7				mov		edi,eax
0166  57				push		edi
0167				L$9:
0167  8A 06				mov		al,byte ptr [esi]
0169  88 07				mov		byte ptr [edi],al
016B  3C 00				cmp		al,0x00
016D  74 10				je		L$10
016F  8A 46 01				mov		al,byte ptr 0x1[esi]
0172  83 C6 02				add		esi,0x00000002
0175  88 47 01				mov		byte ptr 0x1[edi],al
0178  83 C7 02				add		edi,0x00000002
017B  3C 00				cmp		al,0x00
017D  75 E8				jne		L$9
017F				L$10:
017F  5F				pop		edi
0180  E8 00 00 00 00			call		_CreateMenu
0185  89 C3				mov		ebx,eax
0187  85 C0				test		eax,eax
0189  0F 84 13 02 00 00			je		L$11
018F  68 19 00 00 00			push		offset DGROUP:L$17
0194  6A 03				push		0x00000003
0196  6A 00				push		0x00000000
0198  50				push		eax
0199  E8 00 00 00 00			call		_AppendMenuA
019E  68 26 00 00 00			push		offset DGROUP:L$18
01A3  6A 05				push		0x00000005
01A5  6A 00				push		0x00000000
01A7  53				push		ebx
01A8  E8 00 00 00 00			call		_AppendMenuA
01AD  6A 00				push		0x00000000
01AF  6A 00				push		0x00000000
01B1  68 00 08 00 00			push		0x00000800
01B6  53				push		ebx
01B7  E8 00 00 00 00			call		_AppendMenuA
01BC  68 49 00 00 00			push		offset DGROUP:L$19
01C1  6A 01				push		0x00000001
01C3  6A 00				push		0x00000000
01C5  53				push		ebx
01C6  E8 00 00 00 00			call		_AppendMenuA
01CB  E8 00 00 00 00			call		_CreateMenu
01D0  89 C6				mov		esi,eax
01D2  85 C0				test		eax,eax
01D4  0F 84 C8 01 00 00			je		L$11
01DA  68 4F 00 00 00			push		offset DGROUP:L$20
01DF  6A 06				push		0x00000006
01E1  6A 00				push		0x00000000
01E3  50				push		eax
01E4  E8 00 00 00 00			call		_AppendMenuA
01E9  E8 00 00 00 00			call		_CreateMenu
01EE  A3 00 00 00 00			mov		dword ptr __SubMenuEdit,eax
01F3  85 C0				test		eax,eax
01F5  0F 84 A7 01 00 00			je		L$11
01FB  68 59 00 00 00			push		offset DGROUP:L$21
0200  6A 02				push		0x00000002
0202  6A 00				push		0x00000000
0204  50				push		eax
0205  E8 00 00 00 00			call		_AppendMenuA
020A  68 60 00 00 00			push		offset DGROUP:L$22
020F  6A 04				push		0x00000004
0211  6A 00				push		0x00000000
0213  8B 15 00 00 00 00			mov		edx,dword ptr __SubMenuEdit
0219  52				push		edx
021A  E8 00 00 00 00			call		_AppendMenuA
021F  E8 00 00 00 00			call		_CreateMenu
0224  A3 00 00 00 00			mov		dword ptr __SubMenuWindows,eax
0229  E8 00 00 00 00			call		_CreateMenu
022E  A3 00 00 00 00			mov		dword ptr __MainMenu,eax
0233  85 C0				test		eax,eax
0235  0F 84 67 01 00 00			je		L$11
023B  68 66 00 00 00			push		offset DGROUP:L$23
0240  53				push		ebx
0241  6A 10				push		0x00000010
0243  50				push		eax
0244  E8 00 00 00 00			call		_AppendMenuA
0249  68 6C 00 00 00			push		offset DGROUP:L$24
024E  8B 1D 00 00 00 00			mov		ebx,dword ptr __SubMenuEdit
0254  53				push		ebx
0255  6A 10				push		0x00000010
0257  8B 0D 00 00 00 00			mov		ecx,dword ptr __MainMenu
025D  51				push		ecx
025E  E8 00 00 00 00			call		_AppendMenuA
0263  68 72 00 00 00			push		offset DGROUP:L$25
0268  8B 3D 00 00 00 00			mov		edi,dword ptr __SubMenuWindows
026E  57				push		edi
026F  6A 10				push		0x00000010
0271  A1 00 00 00 00			mov		eax,dword ptr __MainMenu
0276  50				push		eax
0277  E8 00 00 00 00			call		_AppendMenuA
027C  68 7B 00 00 00			push		offset DGROUP:L$26
0281  56				push		esi
0282  6A 10				push		0x00000010
0284  8B 15 00 00 00 00			mov		edx,dword ptr __MainMenu
028A  52				push		edx
028B  31 DB				xor		ebx,ebx
028D  E8 00 00 00 00			call		_AppendMenuA
0292  B9 00 00 00 00			mov		ecx,offset __MainDriver
0297  68 00 7F 00 00			push		0x00007f00
029C  89 9C 24 84 00 00 00		mov		dword ptr 0x84[esp],ebx
02A3  89 9C 24 8C 00 00 00		mov		dword ptr 0x8c[esp],ebx
02AA  89 9C 24 90 00 00 00		mov		dword ptr 0x90[esp],ebx
02B1  53				push		ebx
02B2  89 AC 24 98 00 00 00		mov		dword ptr 0x98[esp],ebp
02B9  89 8C 24 8C 00 00 00		mov		dword ptr 0x8c[esp],ecx
02C0  E8 00 00 00 00			call		_LoadIconA
02C5  68 00 7F 00 00			push		0x00007f00
02CA  53				push		ebx
02CB  89 84 24 9C 00 00 00		mov		dword ptr 0x9c[esp],eax
02D2  E8 00 00 00 00			call		_LoadCursorA
02D7  6A 02				push		0x00000002
02D9  89 84 24 9C 00 00 00		mov		dword ptr 0x9c[esp],eax
02E0  E8 00 00 00 00			call		_GetStockObject
02E5  89 84 24 9C 00 00 00		mov		dword ptr 0x9c[esp],eax
02EC  A1 00 00 00 00			mov		eax,dword ptr _mainClass
02F1  89 84 24 A4 00 00 00		mov		dword ptr 0xa4[esp],eax
02F8  8D 84 24 80 00 00 00		lea		eax,0x80[esp]
02FF  50				push		eax
0300  89 9C 24 A4 00 00 00		mov		dword ptr 0xa4[esp],ebx
0307  E8 00 00 00 00			call		_RegisterClassA
030C  25 FF FF 00 00			and		eax,0x0000ffff
0311  0F 84 8B 00 00 00			je		L$11
0317  68 00 7F 00 00			push		0x00007f00
031C  89 9C 24 84 00 00 00		mov		dword ptr 0x84[esp],ebx
0323  89 AC 24 94 00 00 00		mov		dword ptr 0x94[esp],ebp
032A  31 C9				xor		ecx,ecx
032C  BB 00 00 00 00			mov		ebx,offset __MainDriver
0331  89 8C 24 8C 00 00 00		mov		dword ptr 0x8c[esp],ecx
0338  51				push		ecx
0339  89 8C 24 94 00 00 00		mov		dword ptr 0x94[esp],ecx
0340  89 9C 24 8C 00 00 00		mov		dword ptr 0x8c[esp],ebx
0347  E8 00 00 00 00			call		_LoadIconA
034C  68 00 7F 00 00			push		0x00007f00
0351  31 F6				xor		esi,esi
0353  56				push		esi
0354  89 84 24 9C 00 00 00		mov		dword ptr 0x9c[esp],eax
035B  E8 00 00 00 00			call		_LoadCursorA
0360  56				push		esi
0361  89 84 24 9C 00 00 00		mov		dword ptr 0x9c[esp],eax
0368  E8 00 00 00 00			call		_GetStockObject
036D  89 84 24 9C 00 00 00		mov		dword ptr 0x9c[esp],eax
0374  A1 00 00 00 00			mov		eax,dword ptr __ClassName
0379  89 84 24 A4 00 00 00		mov		dword ptr 0xa4[esp],eax
0380  8D 84 24 80 00 00 00		lea		eax,0x80[esp]
0387  31 FF				xor		edi,edi
0389  50				push		eax
038A  89 BC 24 A4 00 00 00		mov		dword ptr 0xa4[esp],edi
0391  E8 00 00 00 00			call		_RegisterClassA
0396  25 FF FF 00 00			and		eax,0x0000ffff
039B  74 05				je		L$11
039D  B8 01 00 00 00			mov		eax,0x00000001
03A2				L$11:
03A2  81 C4 A8 00 00 00			add		esp,0x000000a8
03A8  5D				pop		ebp
03A9  5F				pop		edi
03AA  5E				pop		esi
03AB  5A				pop		edx
03AC  59				pop		ecx
03AD  5B				pop		ebx
03AE  C3				ret		
03AF				windowsInit_:
03AF  53				push		ebx
03B0  51				push		ecx
03B1  56				push		esi
03B2  57				push		edi
03B3  55				push		ebp
03B4  83 EC 3C				sub		esp,0x0000003c
03B7  89 C3				mov		ebx,eax
03B9  89 D6				mov		esi,edx
03BB  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
03C2  74 04				je		L$12
03C4  6A 0D				push		0x0000000d
03C6  EB 02				jmp		L$13
03C8				L$12:
03C8  6A 10				push		0x00000010
03CA				L$13:
03CA  E8 00 00 00 00			call		_GetStockObject
03CF  A3 00 00 00 00			mov		dword ptr __FixedFont,eax
03D4  89 E0				mov		eax,esp
03D6  50				push		eax
03D7  6A 3C				push		0x0000003c
03D9  8B 0D 00 00 00 00			mov		ecx,dword ptr __FixedFont
03DF  51				push		ecx
03E0  E8 00 00 00 00			call		_GetObjectA
03E5  89 E0				mov		eax,esp
03E7  50				push		eax
03E8  E8 00 00 00 00			call		_CreateFontIndirectA
03ED  6A 00				push		0x00000000
03EF  A3 00 00 00 00			mov		dword ptr __FixedFont,eax
03F4  E8 00 00 00 00			call		_GetSystemMetrics
03F9  6A 01				push		0x00000001
03FB  89 C7				mov		edi,eax
03FD  E8 00 00 00 00			call		_GetSystemMetrics
0402  89 C2				mov		edx,eax
0404  89 D8				mov		eax,ebx
0406  E8 00 00 00 00			call		_InitMainWindowData_
040B  6A 00				push		0x00000000
040D  53				push		ebx
040E  8B 2D 00 00 00 00			mov		ebp,dword ptr __MainMenu
0414  55				push		ebp
0415  31 C0				xor		eax,eax
0417  6A 00				push		0x00000000
0419  66 89 D0				mov		ax,dx
041C  50				push		eax
041D  31 C0				xor		eax,eax
041F  66 89 F8				mov		ax,di
0422  50				push		eax
0423  6A 00				push		0x00000000
0425  6A 00				push		0x00000000
0427  68 00 00 CF 02			push		0x02cf0000
042C  68 00 00 00 00			push		offset ___WinTitleBar
0431  A1 00 00 00 00			mov		eax,dword ptr _mainClass
0436  50				push		eax
0437  6A 00				push		0x00000000
0439  E8 00 00 00 00			call		_CreateWindowExA
043E  A3 00 00 00 00			mov		dword ptr __MainWindow,eax
0443  85 C0				test		eax,eax
0445  0F 84 A6 00 00 00			je		L$14
044B  56				push		esi
044C  50				push		eax
044D  E8 00 00 00 00			call		_ShowWindow
0452  8B 15 00 00 00 00			mov		edx,dword ptr __MainWindow
0458  52				push		edx
0459  E8 00 00 00 00			call		_UpdateWindow
045E  31 C0				xor		eax,eax
0460  E8 00 00 00 00			call		__IOMode_
0465  80 CC 20				or		ah,0x20
0468  89 C2				mov		edx,eax
046A  31 C0				xor		eax,eax
046C  E8 00 00 00 00			call		__SetIOMode_
0471  80 0D 0D 00 00 00 22		or		byte ptr ___iob+0xd,0x22
0478  B8 01 00 00 00			mov		eax,0x00000001
047D  E8 00 00 00 00			call		__IOMode_
0482  80 CC 20				or		ah,0x20
0485  89 C2				mov		edx,eax
0487  B8 01 00 00 00			mov		eax,0x00000001
048C  E8 00 00 00 00			call		__SetIOMode_
0491  8A 15 27 00 00 00			mov		dl,byte ptr ___iob+0x27
0497  80 CA 22				or		dl,0x22
049A  B8 02 00 00 00			mov		eax,0x00000002
049F  88 15 27 00 00 00			mov		byte ptr ___iob+0x27,dl
04A5  E8 00 00 00 00			call		__IOMode_
04AA  80 CC 20				or		ah,0x20
04AD  89 C2				mov		edx,eax
04AF  B8 02 00 00 00			mov		eax,0x00000002
04B4  E8 00 00 00 00			call		__SetIOMode_
04B9  6A FF				push		0xffffffff
04BB  8B 1D 44 00 00 00			mov		ebx,dword ptr ___iob+0x44
04C1  53				push		ebx
04C2  8B 0D 2A 00 00 00			mov		ecx,dword ptr ___iob+0x2a
04C8  51				push		ecx
04C9  8B 35 10 00 00 00			mov		esi,dword ptr ___iob+0x10
04CF  8A 35 41 00 00 00			mov		dh,byte ptr ___iob+0x41
04D5  56				push		esi
04D6  80 CE 22				or		dh,0x22
04D9  68 81 00 00 00			push		offset DGROUP:L$27
04DE  88 35 41 00 00 00			mov		byte ptr ___iob+0x41,dh
04E4  E8 00 00 00 00			call		_NewWindow_
04E9  B8 01 00 00 00			mov		eax,0x00000001
04EE  83 C4 14				add		esp,0x00000014
04F1				L$14:
04F1  83 C4 3C				add		esp,0x0000003c
04F4  5D				pop		ebp
04F5  5F				pop		edi
04F6  5E				pop		esi
04F7  59				pop		ecx
04F8  5B				pop		ebx
04F9  C3				ret		

Routine Size: 1149 bytes,    Routine Base: _TEXT + 007D

No disassembly errors

Segment: CONST DWORD USE32 0000008D bytes
0000				L$15:
0000  57 41 54 43 4C 41 53 53 25 64 00                WATCLASS%d.
000B				L$16:
000B  57 41 54 53 55 42 43 4C 41 53 53 25 64 00       WATSUBCLASS%d.
0019				L$17:
0019  26 53 61 76 65 20 41 73 20 2E 2E 2E 00          &Save As ....
0026				L$18:
0026  53 65 74 20 26 4C 69 6E 65 73 20 42 65 74 77 65 Set &Lines Betwe
0036  65 6E 20 41 75 74 6F 2D 43 6C 65 61 72 73 20 2E en Auto-Clears .
0046  2E 2E 00                                        ...
0049				L$19:
0049  45 26 78 69 74 00                               E&xit.
004F				L$20:
004F  26 41 62 6F 75 74 2E 2E 2E 00                   &About....
0059				L$21:
0059  26 43 6C 65 61 72 00                            &Clear.
0060				L$22:
0060  26 43 6F 70 79 00                               &Copy.
0066				L$23:
0066  26 46 69 6C 65 00                               &File.
006C				L$24:
006C  26 45 64 69 74 00                               &Edit.
0072				L$25:
0072  26 57 69 6E 64 6F 77 73 00                      &Windows.
007B				L$26:
007B  26 48 65 6C 70 00                               &Help.
0081				L$27:
0081  53 74 61 6E 64 61 72 64 20 49 4F 00             Standard IO.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000004 bytes
0000				_mainClass:

BSS Size: 4 bytes

