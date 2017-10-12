Module: windlg
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000190 bytes
0000				__GetIntervalBox:
0000  53				push		ebx
0001  56				push		esi
0002  81 EC 80 00 00 00			sub		esp,0x00000080
0008  8B B4 24 8C 00 00 00		mov		esi,dword ptr 0x8c[esp]
000F  8B 84 24 90 00 00 00		mov		eax,dword ptr 0x90[esp]
0016  3D 10 01 00 00			cmp		eax,0x00000110
001B  72 0E				jb		L$1
001D  76 1A				jbe		L$2
001F  3D 11 01 00 00			cmp		eax,0x00000111
0024  74 38				je		L$3
0026  E9 7E 00 00 00			jmp		L$8
002B				L$1:
002B  83 F8 10				cmp		eax,0x00000010
002E  0F 84 70 00 00 00			je		L$7
0034  E9 70 00 00 00			jmp		L$8
0039				L$2:
0039  BB 0A 00 00 00			mov		ebx,0x0000000a
003E  89 E2				mov		edx,esp
0040  A1 00 00 00 00			mov		eax,dword ptr __AutoClearLines
0045  E8 00 00 00 00			call		ultoa_
004A  89 E0				mov		eax,esp
004C  50				push		eax
004D  6A 00				push		0x00000000
004F  68 C2 00 00 00			push		0x000000c2
0054  6A 0A				push		0x0000000a
0056  56				push		esi
0057  E8 00 00 00 00			call		_SendDlgItemMessageA
005C  EB 35				jmp		L$5
005E				L$3:
005E  31 C0				xor		eax,eax
0060  66 8B 84 24 94 00 00 00		mov		ax,word ptr 0x94[esp]
0068  83 F8 01				cmp		eax,0x00000001
006B  75 2D				jne		L$6
006D  68 80 00 00 00			push		0x00000080
0072  8D 44 24 04			lea		eax,0x4[esp]
0076  50				push		eax
0077  6A 0A				push		0x0000000a
0079  56				push		esi
007A  E8 00 00 00 00			call		_GetDlgItemTextA
007F  89 E0				mov		eax,esp
0081  E8 00 00 00 00			call		atol_
0086  6A 01				push		0x00000001
0088  56				push		esi
0089  A3 00 00 00 00			mov		dword ptr __AutoClearLines,eax
008E				L$4:
008E  E8 00 00 00 00			call		_EndDialog
0093				L$5:
0093  B8 01 00 00 00			mov		eax,0x00000001
0098  EB 11				jmp		L$9
009A				L$6:
009A  83 BC 24 94 00 00 00 02		cmp		dword ptr 0x94[esp],0x00000002
00A2  75 05				jne		L$8
00A4				L$7:
00A4  6A 01				push		0x00000001
00A6  56				push		esi
00A7  EB E5				jmp		L$4
00A9				L$8:
00A9  31 C0				xor		eax,eax
00AB				L$9:
00AB  81 C4 80 00 00 00			add		esp,0x00000080
00B1  5E				pop		esi
00B2  5B				pop		ebx
00B3  C2 10 00				ret		0x0010

Routine Size: 182 bytes,    Routine Base: _TEXT + 0000

00B6				_GetClearInterval_:
00B6  53				push		ebx
00B7  51				push		ecx
00B8  52				push		edx
00B9  56				push		esi
00BA  57				push		edi
00BB  55				push		ebp
00BC  68 24 00 00 00			push		offset DGROUP:L$17
00C1  6A 00				push		0x00000000
00C3  68 38 00 00 00			push		offset DGROUP:L$21
00C8  68 24 00 00 00			push		offset DGROUP:L$17
00CD  68 24 00 00 00			push		offset DGROUP:L$17
00D2  B9 96 00 00 00			mov		ecx,0x00000096
00D7  BB 19 00 00 00			mov		ebx,0x00000019
00DC  6A 3C				push		0x0000003c
00DE  BA 16 00 00 00			mov		edx,0x00000016
00E3  B8 A0 00 C8 00			mov		eax,0x00c800a0
00E8  E8 00 00 00 00			call		_DialogTemplate_
00ED  89 C7				mov		edi,eax
00EF  85 C0				test		eax,eax
00F1  0F 84 92 00 00 00			je		L$13
00F7  BD 00 00 00 00			mov		ebp,offset __getint
00FC  31 F6				xor		esi,esi
00FE  83 C5 21				add		ebp,0x00000021
0101  EB 61				jmp		L$12
0103				L$10:
0103  6B C6 22				imul		eax,esi,0x00000022
0106  31 D2				xor		edx,edx
0108  55				push		ebp
0109  8A 90 20 00 00 00			mov		dl,byte ptr __getint+0x20[eax]
010F  52				push		edx
0110  8B 90 1C 00 00 00			mov		edx,dword ptr __getint+0x1c[eax]
0116  52				push		edx
0117  8B 98 18 00 00 00			mov		ebx,dword ptr __getint+0x18[eax]
011D  8B 90 14 00 00 00			mov		edx,dword ptr __getint+0x14[eax]
0123  53				push		ebx
0124  81 CA 00 00 00 10			or		edx,0x10000000
012A  52				push		edx
012B  8B 88 10 00 00 00			mov		ecx,dword ptr __getint+0x10[eax]
0131  51				push		ecx
0132  8B 90 0C 00 00 00			mov		edx,dword ptr __getint+0xc[eax]
0138  8B 98 04 00 00 00			mov		ebx,dword ptr __getint+0x4[eax]
013E  52				push		edx
013F  8B 88 08 00 00 00			mov		ecx,dword ptr __getint+0x8[eax]
0145  8B 90 00 00 00 00			mov		edx,dword ptr __getint[eax]
014B  89 F8				mov		eax,edi
014D  E8 00 00 00 00			call		_AddControl_
0152  85 C0				test		eax,eax
0154  75 08				jne		L$11
0156  57				push		edi
0157  E8 00 00 00 00			call		_GlobalFree
015C  EB 2B				jmp		L$13
015E				L$11:
015E  89 C7				mov		edi,eax
0160  83 C5 22				add		ebp,0x00000022
0163  46				inc		esi
0164				L$12:
0164  83 FE 04				cmp		esi,0x00000004
0167  72 9A				jb		L$10
0169  89 F8				mov		eax,edi
016B  E8 00 00 00 00			call		_DoneAddingControls_
0170  A1 00 00 00 00			mov		eax,dword ptr __MainWindowData
0175  89 F9				mov		ecx,edi
0177  8B 1D 00 00 00 00			mov		ebx,dword ptr __MainWindow
017D  8B 10				mov		edx,dword ptr [eax]
017F  B8 00 00 00 00			mov		eax,offset __GetIntervalBox
0184  E8 00 00 00 00			call		_DynamicDialogBox_
0189				L$13:
0189  5D				pop		ebp
018A  5F				pop		edi
018B  5E				pop		esi
018C  5A				pop		edx
018D  59				pop		ecx
018E  5B				pop		ebx
018F  C3				ret		

Routine Size: 218 bytes,    Routine Base: _TEXT + 00B6

No disassembly errors

Segment: CONST DWORD USE32 00000060 bytes
0000				L$14:
0000  53 54 41 54 49 43 00                            STATIC.
0007				L$15:
0007  26 45 6E 74 65 72 20 4E 75 6D 62 65 72 20 6F 66 &Enter Number of
0017  20 4C 69 6E 65 73 3A 00                          Lines:.
001F				L$16:
001F  45 44 49 54 00                                  EDIT.
0024				L$17:
0024  00                                              .
0025				L$18:
0025  42 55 54 54 4F 4E 00                            BUTTON.
002C				L$19:
002C  26 4F 4B 00                                     &OK.
0030				L$20:
0030  26 43 61 6E 63 65 6C 00                         &Cancel.
0038				L$21:
0038  53 65 74 20 4E 75 6D 62 65 72 20 6F 66 20 4C 69 Set Number of Li
0048  6E 65 73 20 42 65 74 77 65 65 6E 20 41 75 74 6F nes Between Auto
0058  2D 43 6C 65 61 72 73 00                         -Clears.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000088 bytes
0000				__getint:
0000  04 00 00 00 0A 00 00 00 32 00 00 00 18 00 00 00 ........2.......
0010  FF FF FF FF 00 00 00 00                         ........
0018  00 00 00 00                                     DD	offset DGROUP:L$14
001C  07 00 00 00                                     DD	offset DGROUP:L$15
0020  00 00 37 00 00 00 0E 00 00 00 44 00 00 00 0C 00 ..7.......D.....
0030  00 00 0A 00 00 00 00 00 83 00                   ..........
003A  1F 00 00 00                                     DD	offset DGROUP:L$16
003E  24 00 00 00                                     DD	offset DGROUP:L$17
0042  00 00 1E 00 00 00 26 00 00 00 24 00 00 00 0C 00 ......&...$.....
0052  00 00 01 00 00 00 01 00 03 00                   ..........
005C  25 00 00 00                                     DD	offset DGROUP:L$18
0060  2C 00 00 00                                     DD	offset DGROUP:L$19
0064  00 00 54 00 00 00 26 00 00 00 24 00 00 00 0C 00 ..T...&...$.....
0074  00 00 02 00 00 00 00 00 03 00                   ..........
007E  25 00 00 00                                     DD	offset DGROUP:L$18
0082  30 00 00 00                                     DD	offset DGROUP:L$20
0086  00 00                                           ..

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

