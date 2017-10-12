Module: windisp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000044A bytes
0000				_DisplayAllLines_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  57				push		edi
0004  55				push		ebp
0005  83 EC 14				sub		esp,0x00000014
0008  89 C6				mov		esi,eax
000A  85 D2				test		edx,edx
000C  74 4F				je		L$1
000E  8B 50 3A				mov		edx,dword ptr 0x3a[eax]
0011  52				push		edx
0012  E8 00 00 00 00			call		_GetDC
0017  8B 4E 36				mov		ecx,dword ptr 0x36[esi]
001A  51				push		ecx
001B  50				push		eax
001C  89 C3				mov		ebx,eax
001E  E8 00 00 00 00			call		_SelectObject
0023  6A 00				push		0x00000000
0025  6A 00				push		0x00000000
0027  6A 00				push		0x00000000
0029  53				push		ebx
002A  89 C7				mov		edi,eax
002C  E8 00 00 00 00			call		_SetBrushOrgEx
0031  89 E2				mov		edx,esp
0033  52				push		edx
0034  8B 6E 3A				mov		ebp,dword ptr 0x3a[esi]
0037  55				push		ebp
0038  E8 00 00 00 00			call		_GetClientRect
003D  8B 46 36				mov		eax,dword ptr 0x36[esi]
0040  50				push		eax
0041  8D 54 24 04			lea		edx,0x4[esp]
0045  52				push		edx
0046  53				push		ebx
0047  E8 00 00 00 00			call		_FillRect
004C  57				push		edi
004D  53				push		ebx
004E  E8 00 00 00 00			call		_SelectObject
0053  53				push		ebx
0054  8B 56 3A				mov		edx,dword ptr 0x3a[esi]
0057  52				push		edx
0058  E8 00 00 00 00			call		_ReleaseDC
005D				L$1:
005D  8B 7E 4E				mov		edi,dword ptr 0x4e[esi]
0060  89 F0				mov		eax,esi
0062  89 FA				mov		edx,edi
0064  B9 01 00 00 00			mov		ecx,0x00000001
0069  E8 00 00 00 00			call		_GetLineDataPointer_
006E  8B 56 24				mov		edx,dword ptr 0x24[esi]
0071  89 C5				mov		ebp,eax
0073  89 54 24 10			mov		dword ptr 0x10[esp],edx
0077  EB 2D				jmp		L$5
0079				L$2:
0079  85 ED				test		ebp,ebp
007B  75 10				jne		L$3
007D  BB 00 00 00 00			mov		ebx,offset DGROUP:L$22
0082  89 CA				mov		edx,ecx
0084  89 F0				mov		eax,esi
0086  E8 00 00 00 00			call		_DisplayLineInWindow_
008B  EB 18				jmp		L$4
008D				L$3:
008D  8D 5D 09				lea		ebx,0x9[ebp]
0090  89 CA				mov		edx,ecx
0092  89 F0				mov		eax,esi
0094  47				inc		edi
0095  E8 00 00 00 00			call		_DisplayLineInWindow_
009A  89 FA				mov		edx,edi
009C  89 F0				mov		eax,esi
009E  E8 00 00 00 00			call		_GetLineDataPointer_
00A3  89 C5				mov		ebp,eax
00A5				L$4:
00A5  41				inc		ecx
00A6				L$5:
00A6  3B 4C 24 10			cmp		ecx,dword ptr 0x10[esp]
00AA  7C CD				jl		L$2
00AC  83 C4 14				add		esp,0x00000014
00AF				L$6:
00AF  5D				pop		ebp
00B0  5F				pop		edi
00B1  5E				pop		esi
00B2  59				pop		ecx
00B3  5B				pop		ebx
00B4  C3				ret		

Routine Size: 181 bytes,    Routine Base: _TEXT + 0000

00B5				_DisplayLineInWindowWithColor_:
00B5  56				push		esi
00B6  57				push		edi
00B7  55				push		ebp
00B8  81 EC 18 01 00 00			sub		esp,0x00000118
00BE  89 C6				mov		esi,eax
00C0  89 D7				mov		edi,edx
00C2  89 8C 24 08 01 00 00		mov		dword ptr 0x108[esp],ecx
00C9  89 D8				mov		eax,ebx
00CB  8B 56 3A				mov		edx,dword ptr 0x3a[esi]
00CE  89 94 24 0C 01 00 00		mov		dword ptr 0x10c[esp],edx
00D5  8B 94 24 30 01 00 00		mov		edx,dword ptr 0x130[esp]
00DC  E8 00 00 00 00			call		__mbsninc_
00E1  89 C1				mov		ecx,eax
00E3  E8 00 00 00 00			call		__mbslen_
00E8  83 FF 01				cmp		edi,0x00000001
00EB  0F 8C 54 01 00 00			jl		L$12
00F1  3B 7E 24				cmp		edi,dword ptr 0x24[esi]
00F4  0F 8D 4B 01 00 00			jge		L$12
00FA  31 DB				xor		ebx,ebx
00FC  8B AC 24 2C 01 00 00		mov		ebp,dword ptr 0x12c[esp]
0103  89 9C 24 10 01 00 00		mov		dword ptr 0x110[esp],ebx
010A  8B 5E 20				mov		ebx,dword ptr 0x20[esi]
010D  29 EB				sub		ebx,ebp
010F  89 9C 24 04 01 00 00		mov		dword ptr 0x104[esp],ebx
0116  39 D8				cmp		eax,ebx
0118  7D 02				jge		L$7
011A  89 C3				mov		ebx,eax
011C				L$7:
011C  8B 84 24 10 01 00 00		mov		eax,dword ptr 0x110[esp]
0123  89 DA				mov		edx,ebx
0125  29 C2				sub		edx,eax
0127  89 C8				mov		eax,ecx
0129  E8 00 00 00 00			call		_mbsnbcnt_
012E  89 C5				mov		ebp,eax
0130  8B 84 24 04 01 00 00		mov		eax,dword ptr 0x104[esp]
0137  29 D8				sub		eax,ebx
0139  8B 94 24 10 01 00 00		mov		edx,dword ptr 0x110[esp]
0140  89 84 24 00 01 00 00		mov		dword ptr 0x100[esp],eax
0147  89 EB				mov		ebx,ebp
0149  89 E0				mov		eax,esp
014B  29 D3				sub		ebx,edx
014D  89 CA				mov		edx,ecx
014F  E8 00 00 00 00			call		_mbsnbcpy_
0154  89 E0				mov		eax,esp
0156  8B 9C 24 00 01 00 00		mov		ebx,dword ptr 0x100[esp]
015D  BA 20 00 00 00			mov		edx,0x00000020
0162  01 E8				add		eax,ebp
0164  E8 00 00 00 00			call		memset_
0169  8B 94 24 00 01 00 00		mov		edx,dword ptr 0x100[esp]
0170  89 E0				mov		eax,esp
0172  01 EA				add		edx,ebp
0174  8B 9C 24 0C 01 00 00		mov		ebx,dword ptr 0x10c[esp]
017B  E8 00 00 00 00			call		__mbsninc_
0180  53				push		ebx
0181  C6 00 00				mov		byte ptr [eax],0x00
0184  E8 00 00 00 00			call		_GetDC
0189  89 C5				mov		ebp,eax
018B  8B 84 24 08 01 00 00		mov		eax,dword ptr 0x108[esp]
0192  8B 1C 85 00 00 00 00		mov		ebx,dword ptr __ColorMap[eax*4]
0199  8B 84 24 28 01 00 00		mov		eax,dword ptr 0x128[esp]
01A0  8B 14 85 00 00 00 00		mov		edx,dword ptr __ColorMap[eax*4]
01A7  89 E8				mov		eax,ebp
01A9  E8 00 00 00 00			call		_SetMyDC_
01AE  89 E0				mov		eax,esp
01B0  8B 56 20				mov		edx,dword ptr 0x20[esi]
01B3  E8 00 00 00 00			call		_mbsnbcnt_
01B8  50				push		eax
01B9  8D 44 24 04			lea		eax,0x4[esp]
01BD  4F				dec		edi
01BE  50				push		eax
01BF  8B 46 2C				mov		eax,dword ptr 0x2c[esi]
01C2  0F AF C7				imul		eax,edi
01C5  50				push		eax
01C6  6A 00				push		0x00000000
01C8  55				push		ebp
01C9  E8 00 00 00 00			call		_TextOutA
01CE  55				push		ebp
01CF  8B 8C 24 10 01 00 00		mov		ecx,dword ptr 0x110[esp]
01D6  51				push		ecx
01D7  E8 00 00 00 00			call		_ReleaseDC
01DC  66 0F AF 7E 20			imul		di,word ptr 0x20[esi]
01E1  8B 84 24 30 01 00 00		mov		eax,dword ptr 0x130[esp]
01E8  31 DB				xor		ebx,ebx
01EA  01 F8				add		eax,edi
01EC  89 E2				mov		edx,esp
01EE  89 84 24 14 01 00 00		mov		dword ptr 0x114[esp],eax
01F5  EB 3E				jmp		L$11
01F7				L$8:
01F7  89 D0				mov		eax,edx
01F9  E8 00 00 00 00			call		_mbptov_
01FE  8B 2D 00 00 00 00			mov		ebp,dword ptr ___IsDBCS
0204  89 C7				mov		edi,eax
0206  85 ED				test		ebp,ebp
0208  74 13				je		L$9
020A  31 C0				xor		eax,eax
020C  8A 02				mov		al,byte ptr [edx]
020E  8A 80 01 00 00 00			mov		al,byte ptr ___MBCSIsTable+0x1[eax]
0214  24 01				and		al,0x01
0216  25 FF 00 00 00			and		eax,0x000000ff
021B  EB 02				jmp		L$10
021D				L$9:
021D  31 C0				xor		eax,eax
021F				L$10:
021F  42				inc		edx
0220  01 C2				add		edx,eax
0222  31 C0				xor		eax,eax
0224  66 8B 84 24 14 01 00 00		mov		ax,word ptr 0x114[esp]
022C  8B 4E 32				mov		ecx,dword ptr 0x32[esi]
022F  01 D8				add		eax,ebx
0231  43				inc		ebx
0232  89 3C 81				mov		dword ptr [ecx+eax*4],edi
0235				L$11:
0235  8B BC 24 30 01 00 00		mov		edi,dword ptr 0x130[esp]
023C  8B 46 20				mov		eax,dword ptr 0x20[esi]
023F  29 F8				sub		eax,edi
0241  39 C3				cmp		ebx,eax
0243  7C B2				jl		L$8
0245				L$12:
0245  81 C4 18 01 00 00			add		esp,0x00000118
024B  5D				pop		ebp
024C  5F				pop		edi
024D  5E				pop		esi
024E  C2 0C 00				ret		0x000c

Routine Size: 412 bytes,    Routine Base: _TEXT + 00B5

0251				_DisplayLineInWindow_:
0251  51				push		ecx
0252  56				push		esi
0253  6A 00				push		0x00000000
0255  6A 00				push		0x00000000
0257  8B 70 0C				mov		esi,dword ptr 0xc[eax]
025A  56				push		esi
025B  8B 48 08				mov		ecx,dword ptr 0x8[eax]
025E  E8 00 00 00 00			call		_DisplayLineInWindowWithColor_
0263  5E				pop		esi
0264  59				pop		ecx
0265  C3				ret		

Routine Size: 21 bytes,    Routine Base: _TEXT + 0251

0266				_ClearWindow_:
0266  53				push		ebx
0267  51				push		ecx
0268  52				push		edx
0269  56				push		esi
026A  57				push		edi
026B  83 EC 10				sub		esp,0x00000010
026E  89 C3				mov		ebx,eax
0270  8B 78 3A				mov		edi,dword ptr 0x3a[eax]
0273  31 C9				xor		ecx,ecx
0275  B8 00 00 00 00			mov		eax,offset DGROUP:L$22
027A  31 D2				xor		edx,edx
027C  E8 00 00 00 00			call		_mbptov_
0281  89 C6				mov		esi,eax
0283  EB 0A				jmp		L$14
0285				L$13:
0285  8B 43 32				mov		eax,dword ptr 0x32[ebx]
0288  41				inc		ecx
0289  89 34 02				mov		dword ptr [edx+eax],esi
028C  83 C2 04				add		edx,0x00000004
028F				L$14:
028F  8B 43 20				mov		eax,dword ptr 0x20[ebx]
0292  0F AF 43 24			imul		eax,dword ptr 0x24[ebx]
0296  39 C1				cmp		ecx,eax
0298  7C EB				jl		L$13
029A  57				push		edi
029B  E8 00 00 00 00			call		_GetDC
02A0  89 C6				mov		esi,eax
02A2  8B 43 36				mov		eax,dword ptr 0x36[ebx]
02A5  50				push		eax
02A6  56				push		esi
02A7  E8 00 00 00 00			call		_SelectObject
02AC  6A 00				push		0x00000000
02AE  6A 00				push		0x00000000
02B0  6A 00				push		0x00000000
02B2  56				push		esi
02B3  E8 00 00 00 00			call		_SetBrushOrgEx
02B8  89 E0				mov		eax,esp
02BA  50				push		eax
02BB  57				push		edi
02BC  E8 00 00 00 00			call		_GetClientRect
02C1  8B 53 36				mov		edx,dword ptr 0x36[ebx]
02C4  52				push		edx
02C5  8D 44 24 04			lea		eax,0x4[esp]
02C9  50				push		eax
02CA  56				push		esi
02CB  E8 00 00 00 00			call		_FillRect
02D0  56				push		esi
02D1  57				push		edi
02D2  E8 00 00 00 00			call		_ReleaseDC
02D7  83 C4 10				add		esp,0x00000010
02DA  5F				pop		edi
02DB  5E				pop		esi
02DC  5A				pop		edx
02DD  59				pop		ecx
02DE  5B				pop		ebx
02DF  C3				ret		

Routine Size: 122 bytes,    Routine Base: _TEXT + 0266

02E0				_ShiftWindow_:
02E0  53				push		ebx
02E1  51				push		ecx
02E2  56				push		esi
02E3  57				push		edi
02E4  55				push		ebp
02E5  83 EC 18				sub		esp,0x00000018
02E8  89 C3				mov		ebx,eax
02EA  89 D5				mov		ebp,edx
02EC  89 D7				mov		edi,edx
02EE  F7 DF				neg		edi
02F0  0F AF 78 2C			imul		edi,dword ptr 0x2c[eax]
02F4  8B 70 3A				mov		esi,dword ptr 0x3a[eax]
02F7  89 E0				mov		eax,esp
02F9  50				push		eax
02FA  56				push		esi
02FB  E8 00 00 00 00			call		_GetClientRect
0300  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
0304  42				inc		edx
0305  8B 4B 2C				mov		ecx,dword ptr 0x2c[ebx]
0308  89 D0				mov		eax,edx
030A  C1 FA 1F				sar		edx,0x1f
030D  F7 F9				idiv		ecx
030F  89 CA				mov		edx,ecx
0311  0F AF D0				imul		edx,eax
0314  89 E0				mov		eax,esp
0316  50				push		eax
0317  6A 00				push		0x00000000
0319  57				push		edi
031A  6A 00				push		0x00000000
031C  56				push		esi
031D  89 54 24 20			mov		dword ptr 0x20[esp],edx
0321  E8 00 00 00 00			call		_ScrollWindow
0326  85 ED				test		ebp,ebp
0328  7D 19				jge		L$15
032A  B8 FF FF FF FF			mov		eax,0xffffffff
032F  8B 53 24				mov		edx,dword ptr 0x24[ebx]
0332  31 FF				xor		edi,edi
0334  83 EA 03				sub		edx,0x00000003
0337  89 7C 24 10			mov		dword ptr 0x10[esp],edi
033B  89 44 24 14			mov		dword ptr 0x14[esp],eax
033F  01 EA				add		edx,ebp
0341  EB 13				jmp		L$16
0343				L$15:
0343  BE 01 00 00 00			mov		esi,0x00000001
0348  8B 43 24				mov		eax,dword ptr 0x24[ebx]
034B  89 EA				mov		edx,ebp
034D  48				dec		eax
034E  89 74 24 14			mov		dword ptr 0x14[esp],esi
0352  89 44 24 10			mov		dword ptr 0x10[esp],eax
0356				L$16:
0356  8B 73 20				mov		esi,dword ptr 0x20[ebx]
0359  0F AF F2				imul		esi,edx
035C  89 D1				mov		ecx,edx
035E  8B 43 20				mov		eax,dword ptr 0x20[ebx]
0361  29 E9				sub		ecx,ebp
0363  0F AF C8				imul		ecx,eax
0366  8B 7B 32				mov		edi,dword ptr 0x32[ebx]
0369  C1 E6 02				shl		esi,0x02
036C  C1 E1 02				shl		ecx,0x02
036F  01 FE				add		esi,edi
0371  01 CF				add		edi,ecx
0373  89 C1				mov		ecx,eax
0375  C1 E1 02				shl		ecx,0x02
0378  06				push		es
0379  8C D8				mov		eax,ds
037B  8E C0				mov		es,eax
037D  57				push		edi
037E  89 C8				mov		eax,ecx
0380  C1 E9 02				shr		ecx,0x02
0383  F2 A5				repne movsd	
0385  8A C8				mov		cl,al
0387  80 E1 03				and		cl,0x03
038A  F2 A4				repne movsb	
038C  5F				pop		edi
038D  07				pop		es
038E  3B 54 24 10			cmp		edx,dword ptr 0x10[esp]
0392  74 06				je		L$17
0394  03 54 24 14			add		edx,dword ptr 0x14[esp]
0398  EB BC				jmp		L$16
039A				L$17:
039A  83 C4 18				add		esp,0x00000018
039D  E9 0D FD FF FF			jmp		L$6

Routine Size: 194 bytes,    Routine Base: _TEXT + 02E0

03A2				_ResizeWin_:
03A2  56				push		esi
03A3  57				push		edi
03A4  55				push		ebp
03A5  89 C6				mov		esi,eax
03A7  89 D7				mov		edi,edx
03A9  8B 54 24 10			mov		edx,dword ptr 0x10[esp]
03AD  29 DA				sub		edx,ebx
03AF  42				inc		edx
03B0  8B 6E 2C				mov		ebp,dword ptr 0x2c[esi]
03B3  89 D0				mov		eax,edx
03B5  C1 FA 1F				sar		edx,0x1f
03B8  F7 FD				idiv		ebp
03BA  8D 68 01				lea		ebp,0x1[eax]
03BD  8B 56 4E				mov		edx,dword ptr 0x4e[esi]
03C0  8B 46 4A				mov		eax,dword ptr 0x4a[esi]
03C3  29 D0				sub		eax,edx
03C5  39 E8				cmp		eax,ebp
03C7  72 07				jb		L$18
03C9  8D 44 2A FF			lea		eax,-0x1[edx+ebp]
03CD  89 46 4A				mov		dword ptr 0x4a[esi],eax
03D0				L$18:
03D0  8B 44 24 10			mov		eax,dword ptr 0x10[esp]
03D4  89 CA				mov		edx,ecx
03D6  89 5E 14				mov		dword ptr 0x14[esi],ebx
03D9  29 FA				sub		edx,edi
03DB  8B 5E 28				mov		ebx,dword ptr 0x28[esi]
03DE  42				inc		edx
03DF  89 46 1C				mov		dword ptr 0x1c[esi],eax
03E2  89 D0				mov		eax,edx
03E4  C1 FA 1F				sar		edx,0x1f
03E7  F7 FB				idiv		ebx
03E9  89 7E 10				mov		dword ptr 0x10[esi],edi
03EC  89 4E 18				mov		dword ptr 0x18[esi],ecx
03EF  40				inc		eax
03F0  89 46 20				mov		dword ptr 0x20[esi],eax
03F3  8B 46 32				mov		eax,dword ptr 0x32[esi]
03F6  89 6E 24				mov		dword ptr 0x24[esi],ebp
03F9  E8 00 00 00 00			call		_MemFree_
03FE  8B 46 20				mov		eax,dword ptr 0x20[esi]
0401  8B 4E 24				mov		ecx,dword ptr 0x24[esi]
0404  C1 E0 02				shl		eax,0x02
0407  0F AF C1				imul		eax,ecx
040A  31 DB				xor		ebx,ebx
040C  E8 00 00 00 00			call		_MemAlloc_
0411  89 46 32				mov		dword ptr 0x32[esi],eax
0414  B8 00 00 00 00			mov		eax,offset DGROUP:L$22
0419  31 D2				xor		edx,edx
041B  E8 00 00 00 00			call		_mbptov_
0420  89 C1				mov		ecx,eax
0422  EB 0A				jmp		L$20
0424				L$19:
0424  8B 46 32				mov		eax,dword ptr 0x32[esi]
0427  43				inc		ebx
0428  89 0C 02				mov		dword ptr [edx+eax],ecx
042B  83 C2 04				add		edx,0x00000004
042E				L$20:
042E  8B 46 20				mov		eax,dword ptr 0x20[esi]
0431  0F AF 46 24			imul		eax,dword ptr 0x24[esi]
0435  39 C3				cmp		ebx,eax
0437  7C EB				jl		L$19
0439  8B 46 20				mov		eax,dword ptr 0x20[esi]
043C  3B 46 63				cmp		eax,dword ptr 0x63[esi]
043F  7E 03				jle		L$21
0441  89 46 63				mov		dword ptr 0x63[esi],eax
0444				L$21:
0444  5D				pop		ebp
0445  5F				pop		edi
0446  5E				pop		esi
0447  C2 04 00				ret		0x0004

Routine Size: 168 bytes,    Routine Base: _TEXT + 03A2

No disassembly errors

Segment: CONST DWORD USE32 00000002 bytes
0000				L$22:
0000  20 00                                            .

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

