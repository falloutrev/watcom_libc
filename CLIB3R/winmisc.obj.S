Module: winmisc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000318 bytes
0000				_SetMyDC_:
0000  51				push		ecx
0001  56				push		esi
0002  89 C6				mov		esi,eax
0004  52				push		edx
0005  50				push		eax
0006  E8 00 00 00 00			call		_SetBkColor
000B  53				push		ebx
000C  56				push		esi
000D  E8 00 00 00 00			call		_SetTextColor
0012  8B 15 00 00 00 00			mov		edx,dword ptr __FixedFont
0018  52				push		edx
0019  56				push		esi
001A  E8 00 00 00 00			call		_SelectObject
001F  5E				pop		esi
0020  59				pop		ecx
0021  C3				ret		

Routine Size: 34 bytes,    Routine Base: _TEXT + 0000

0022				_MessageLoop_:
0022  53				push		ebx
0023  51				push		ecx
0024  52				push		edx
0025  56				push		esi
0026  83 EC 1C				sub		esp,0x0000001c
0029  89 C6				mov		esi,eax
002B  BB 01 00 00 00			mov		ebx,0x00000001
0030				L$1:
0030  6A 02				push		0x00000002
0032  6A 00				push		0x00000000
0034  6A 00				push		0x00000000
0036  6A 00				push		0x00000000
0038  8D 44 24 10			lea		eax,0x10[esp]
003C  50				push		eax
003D  E8 00 00 00 00			call		_PeekMessageA
0042  85 C0				test		eax,eax
0044  74 40				je		L$3
0046  6A 00				push		0x00000000
0048  6A 00				push		0x00000000
004A  6A 00				push		0x00000000
004C  8D 44 24 0C			lea		eax,0xc[esp]
0050  50				push		eax
0051  E8 00 00 00 00			call		_GetMessageA
0056  89 C3				mov		ebx,eax
0058  66 85 C0				test		ax,ax
005B  75 17				jne		L$2
005D  85 F6				test		esi,esi
005F  74 25				je		L$3
0061  31 D2				xor		edx,edx
0063  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
0067  89 15 00 00 00 00			mov		dword ptr __WindowExitRtn,edx
006D  E8 00 00 00 00			call		exit_
0072  EB 12				jmp		L$3
0074				L$2:
0074  89 E0				mov		eax,esp
0076  50				push		eax
0077  E8 00 00 00 00			call		_TranslateMessage
007C  89 E0				mov		eax,esp
007E  50				push		eax
007F  E8 00 00 00 00			call		_DispatchMessageA
0084  EB AA				jmp		L$1
0086				L$3:
0086  6A 00				push		0x00000000
0088  E8 00 00 00 00			call		_Sleep
008D  31 C0				xor		eax,eax
008F  66 89 D8				mov		ax,bx
0092  83 C4 1C				add		esp,0x0000001c
0095  5E				pop		esi
0096  5A				pop		edx
0097  59				pop		ecx
0098  5B				pop		ebx
0099  C3				ret		

Routine Size: 120 bytes,    Routine Base: _TEXT + 0022

009A				_BlockingMessageLoop_:
009A  53				push		ebx
009B  51				push		ecx
009C  52				push		edx
009D  83 EC 1C				sub		esp,0x0000001c
00A0  89 C3				mov		ebx,eax
00A2  6A 00				push		0x00000000
00A4  6A 00				push		0x00000000
00A6  6A 00				push		0x00000000
00A8  8D 44 24 0C			lea		eax,0xc[esp]
00AC  50				push		eax
00AD  E8 00 00 00 00			call		_GetMessageA
00B2  66 85 C0				test		ax,ax
00B5  75 17				jne		L$4
00B7  85 DB				test		ebx,ebx
00B9  74 23				je		L$5
00BB  31 D2				xor		edx,edx
00BD  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
00C1  89 15 00 00 00 00			mov		dword ptr __WindowExitRtn,edx
00C7  E8 00 00 00 00			call		exit_
00CC  EB 10				jmp		L$5
00CE				L$4:
00CE  89 E0				mov		eax,esp
00D0  50				push		eax
00D1  E8 00 00 00 00			call		_TranslateMessage
00D6  89 E0				mov		eax,esp
00D8  50				push		eax
00D9  E8 00 00 00 00			call		_DispatchMessageA
00DE				L$5:
00DE  89 D8				mov		eax,ebx
00E0  E8 00 00 00 00			call		_MessageLoop_
00E5  83 C4 1C				add		esp,0x0000001c
00E8  5A				pop		edx
00E9  59				pop		ecx
00EA  5B				pop		ebx
00EB  C3				ret		

Routine Size: 82 bytes,    Routine Base: _TEXT + 009A

00EC				_OutOfMemory_:
00EC  51				push		ecx
00ED  52				push		edx
00EE  6A 00				push		0x00000000
00F0  68 00 00 00 00			push		offset DGROUP:L$14
00F5  68 0D 00 00 00			push		offset DGROUP:L$15
00FA  6A 00				push		0x00000000
00FC  E8 00 00 00 00			call		_MessageBoxA
0101  5A				pop		edx
0102  59				pop		ecx
0103  C3				ret		

Routine Size: 24 bytes,    Routine Base: _TEXT + 00EC

0104				_ExecutionComplete_:
0104  E9 00 00 00 00			jmp		flushall_

Routine Size: 5 bytes,    Routine Base: _TEXT + 0104

0109				_SetConTitle_:
0109  51				push		ecx
010A  52				push		edx
010B  8B 50 3A				mov		edx,dword ptr 0x3a[eax]
010E  52				push		edx
010F  E8 00 00 00 00			call		_SetWindowTextA
0114  B8 01 00 00 00			mov		eax,0x00000001
0119  59				pop		ecx
011A  C3				ret		

Routine Size: 18 bytes,    Routine Base: _TEXT + 0109

011B				_SetAppTitle_:
011B  51				push		ecx
011C  52				push		edx
011D  50				push		eax
011E  8B 15 00 00 00 00			mov		edx,dword ptr __MainWindow
0124  52				push		edx
0125  E8 00 00 00 00			call		_SetWindowTextA
012A  B8 01 00 00 00			mov		eax,0x00000001
012F  5A				pop		edx
0130  59				pop		ecx
0131  C3				ret		

Routine Size: 23 bytes,    Routine Base: _TEXT + 011B

0132				_ShutDown_:
0132  53				push		ebx
0133  51				push		ecx
0134  52				push		edx
0135  E8 00 00 00 00			call		flushall_
013A  8B 15 00 00 00 00			mov		edx,dword ptr __MainWindow
0140  52				push		edx
0141  BB 01 00 00 00			mov		ebx,0x00000001
0146  E8 00 00 00 00			call		_DestroyWindow
014B  89 1D 00 00 00 00			mov		dword ptr __MainWindowDestroyed,ebx
0151  31 C0				xor		eax,eax
0153  5A				pop		edx
0154  59				pop		ecx
0155  5B				pop		ebx
0156  C3				ret		

Routine Size: 37 bytes,    Routine Base: _TEXT + 0132

0157				_CloseWindow_:
0157  51				push		ecx
0158  52				push		edx
0159  F6 40 52 20			test		byte ptr 0x52[eax],0x20
015D  74 09				je		L$6
015F  8B 50 3A				mov		edx,dword ptr 0x3a[eax]
0162  52				push		edx
0163  E8 00 00 00 00			call		_DestroyWindow
0168				L$6:
0168  31 C0				xor		eax,eax
016A  5A				pop		edx
016B  59				pop		ecx
016C  C3				ret		

Routine Size: 22 bytes,    Routine Base: _TEXT + 0157

016D				_NewCursor_:
016D  53				push		ebx
016E  51				push		ecx
016F  56				push		esi
0170  57				push		edi
0171  83 EC 04				sub		esp,0x00000004
0174  89 C3				mov		ebx,eax
0176  88 14 24				mov		byte ptr [esp],dl
0179  F6 40 52 04			test		byte ptr 0x52[eax],0x04
017D  74 09				je		L$7
017F  E8 00 00 00 00			call		_DestroyCaret
0184  80 63 52 FB			and		byte ptr 0x52[ebx],0xfb
0188				L$7:
0188  8A 34 24				mov		dh,byte ptr [esp]
018B  80 FE 03				cmp		dh,0x03
018E  74 33				je		L$11
0190  88 73 6F				mov		byte ptr 0x6f[ebx],dh
0193  80 FE 01				cmp		dh,0x01
0196  72 04				jb		L$8
0198  76 14				jbe		L$9
019A  EB 27				jmp		L$11
019C				L$8:
019C  84 F6				test		dh,dh
019E  75 23				jne		L$11
01A0  8B 73 2C				mov		esi,dword ptr 0x2c[ebx]
01A3  56				push		esi
01A4  6A 00				push		0x00000000
01A6  6A 00				push		0x00000000
01A8  8B 7B 3A				mov		edi,dword ptr 0x3a[ebx]
01AB  57				push		edi
01AC  EB 0C				jmp		L$10
01AE				L$9:
01AE  8B 53 2C				mov		edx,dword ptr 0x2c[ebx]
01B1  52				push		edx
01B2  6A 04				push		0x00000004
01B4  6A 00				push		0x00000000
01B6  8B 4B 3A				mov		ecx,dword ptr 0x3a[ebx]
01B9  51				push		ecx
01BA				L$10:
01BA  E8 00 00 00 00			call		_CreateCaret
01BF  80 4B 52 04			or		byte ptr 0x52[ebx],0x04
01C3				L$11:
01C3  83 C4 04				add		esp,0x00000004
01C6  5F				pop		edi
01C7  5E				pop		esi
01C8  59				pop		ecx
01C9  5B				pop		ebx
01CA  C3				ret		

Routine Size: 94 bytes,    Routine Base: _TEXT + 016D

01CB				_DisplayCursor_:
01CB  53				push		ebx
01CC  51				push		ecx
01CD  52				push		edx
01CE  56				push		esi
01CF  57				push		edi
01D0  55				push		ebp
01D1  83 EC 08				sub		esp,0x00000008
01D4  89 C3				mov		ebx,eax
01D6  8B 50 3A				mov		edx,dword ptr 0x3a[eax]
01D9  52				push		edx
01DA  E8 00 00 00 00			call		_GetDC
01DF  8B 0D 00 00 00 00			mov		ecx,dword ptr __FixedFont
01E5  51				push		ecx
01E6  50				push		eax
01E7  89 C6				mov		esi,eax
01E9  E8 00 00 00 00			call		_SelectObject
01EE  89 E0				mov		eax,esp
01F0  8B 53 57				mov		edx,dword ptr 0x57[ebx]
01F3  8B 7B 5B				mov		edi,dword ptr 0x5b[ebx]
01F6  50				push		eax
01F7  8B 43 53				mov		eax,dword ptr 0x53[ebx]
01FA  01 FA				add		edx,edi
01FC  83 C0 09				add		eax,0x00000009
01FF  E8 00 00 00 00			call		_mbsnbcnt_
0204  50				push		eax
0205  8B 43 53				mov		eax,dword ptr 0x53[ebx]
0208  83 C0 09				add		eax,0x00000009
020B  50				push		eax
020C  56				push		esi
020D  E8 00 00 00 00			call		_GetTextExtentPoint32A
0212  8B 43 46				mov		eax,dword ptr 0x46[ebx]
0215  8B 6B 4E				mov		ebp,dword ptr 0x4e[ebx]
0218  8B 53 2C				mov		edx,dword ptr 0x2c[ebx]
021B  29 E8				sub		eax,ebp
021D  0F AF C2				imul		eax,edx
0220  50				push		eax
0221  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0225  40				inc		eax
0226  50				push		eax
0227  E8 00 00 00 00			call		_SetCaretPos
022C  56				push		esi
022D  8B 4B 3A				mov		ecx,dword ptr 0x3a[ebx]
0230  51				push		ecx
0231  E8 00 00 00 00			call		_ReleaseDC
0236  8B 73 3A				mov		esi,dword ptr 0x3a[ebx]
0239  56				push		esi
023A  E8 00 00 00 00			call		_ShowCaret
023F  83 C4 08				add		esp,0x00000008
0242  5D				pop		ebp
0243  5F				pop		edi
0244  5E				pop		esi
0245  5A				pop		edx
0246  59				pop		ecx
0247  5B				pop		ebx
0248  C3				ret		

Routine Size: 126 bytes,    Routine Base: _TEXT + 01CB

0249				_SetInputMode_:
0249  53				push		ebx
024A  51				push		ecx
024B  89 50 6B				mov		dword ptr 0x6b[eax],edx
024E  85 D2				test		edx,edx
0250  0F 95 C0				setne		al
0253  30 E4				xor		ah,ah
0255  25 FF FF 00 00			and		eax,0x0000ffff
025A  50				push		eax
025B  6A 02				push		0x00000002
025D  8B 1D 00 00 00 00			mov		ebx,dword ptr __SubMenuEdit
0263  53				push		ebx
0264  E8 00 00 00 00			call		_EnableMenuItem
0269  59				pop		ecx
026A  5B				pop		ebx
026B  C3				ret		

Routine Size: 35 bytes,    Routine Base: _TEXT + 0249

026C				_ShowWindowActive_:
026C  53				push		ebx
026D  51				push		ecx
026E  56				push		esi
026F  57				push		edi
0270  55				push		ebp
0271  89 C3				mov		ebx,eax
0273  89 D6				mov		esi,edx
0275  85 D2				test		edx,edx
0277  74 3D				je		L$12
0279  8B 12				mov		edx,dword ptr [edx]
027B  8B 12				mov		edx,dword ptr [edx]
027D  6A 00				push		0x00000000
027F  81 C2 C8 00 00 00			add		edx,0x000000c8
0285  52				push		edx
0286  8B 15 00 00 00 00			mov		edx,dword ptr __SubMenuWindows
028C  52				push		edx
028D  E8 00 00 00 00			call		_CheckMenuItem
0292  6A 00				push		0x00000000
0294  6A 00				push		0x00000000
0296  68 86 00 00 00			push		0x00000086
029B  8B 4E 3A				mov		ecx,dword ptr 0x3a[esi]
029E  51				push		ecx
029F  E8 00 00 00 00			call		_SendMessageA
02A4  80 7E 6F 02			cmp		byte ptr 0x6f[esi],0x02
02A8  74 0C				je		L$12
02AA  BA 03 00 00 00			mov		edx,0x00000003
02AF  89 F0				mov		eax,esi
02B1  E8 00 00 00 00			call		_NewCursor_
02B6				L$12:
02B6  85 DB				test		ebx,ebx
02B8  74 58				je		L$13
02BA  8B 33				mov		esi,dword ptr [ebx]
02BC  8B 16				mov		edx,dword ptr [esi]
02BE  6A 08				push		0x00000008
02C0  81 C2 C8 00 00 00			add		edx,0x000000c8
02C6  52				push		edx
02C7  8B 35 00 00 00 00			mov		esi,dword ptr __SubMenuWindows
02CD  56				push		esi
02CE  E8 00 00 00 00			call		_CheckMenuItem
02D3  6A 05				push		0x00000005
02D5  8B 7B 3A				mov		edi,dword ptr 0x3a[ebx]
02D8  57				push		edi
02D9  E8 00 00 00 00			call		_ShowWindow
02DE  6A 00				push		0x00000000
02E0  6A 01				push		0x00000001
02E2  68 86 00 00 00			push		0x00000086
02E7  8B 6B 3A				mov		ebp,dword ptr 0x3a[ebx]
02EA  55				push		ebp
02EB  E8 00 00 00 00			call		_SendMessageA
02F0  8B 43 3A				mov		eax,dword ptr 0x3a[ebx]
02F3  50				push		eax
02F4  E8 00 00 00 00			call		_BringWindowToTop
02F9  80 7B 6F 02			cmp		byte ptr 0x6f[ebx],0x02
02FD  74 13				je		L$13
02FF  31 D2				xor		edx,edx
0301  89 D8				mov		eax,ebx
0303  8A 53 6F				mov		dl,byte ptr 0x6f[ebx]
0306  E8 00 00 00 00			call		_NewCursor_
030B  89 D8				mov		eax,ebx
030D  E8 00 00 00 00			call		_DisplayCursor_
0312				L$13:
0312  5D				pop		ebp
0313  5F				pop		edi
0314  5E				pop		esi
0315  59				pop		ecx
0316  5B				pop		ebx
0317  C3				ret		

Routine Size: 172 bytes,    Routine Base: _TEXT + 026C

No disassembly errors

Segment: CONST DWORD USE32 0000001C bytes
0000				L$14:
0000  53 59 53 54 45 4D 20 45 52 52 4F 52 00          SYSTEM ERROR.
000D				L$15:
000D  4F 75 74 20 4F 66 20 4D 65 6D 6F 72 79 21 00    Out Of Memory!.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

