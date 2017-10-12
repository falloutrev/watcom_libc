Module: wingen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000524 bytes
0000				_GetWindowData_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  57				push		edi
0005  8B 35 00 00 00 00			mov		esi,dword ptr __MainWindowData
000B  89 C1				mov		ecx,eax
000D  31 D2				xor		edx,edx
000F  31 DB				xor		ebx,ebx
0011  EB 0F				jmp		L$2
0013				L$1:
0013  8B 46 04				mov		eax,dword ptr 0x4[esi]
0016  8B 04 03				mov		eax,dword ptr [ebx+eax]
0019  3B 48 3A				cmp		ecx,dword ptr 0x3a[eax]
001C  74 0F				je		L$3
001E  83 C3 04				add		ebx,0x00000004
0021  42				inc		edx
0022				L$2:
0022  8B 7E 08				mov		edi,dword ptr 0x8[esi]
0025  89 F0				mov		eax,esi
0027  39 FA				cmp		edx,edi
0029  7C E8				jl		L$1
002B  31 F0				xor		eax,esi
002D				L$3:
002D  89 35 00 00 00 00			mov		dword ptr __MainWindowData,esi
0033  E9 93 00 00 00			jmp		L$13

Routine Size: 56 bytes,    Routine Base: _TEXT + 0000

0038				_GetActiveWindowData_:
0038  53				push		ebx
0039  51				push		ecx
003A  52				push		edx
003B  56				push		esi
003C  8B 35 00 00 00 00			mov		esi,dword ptr __MainWindowData
0042  31 DB				xor		ebx,ebx
0044  31 D2				xor		edx,edx
0046  EB 10				jmp		L$5
0048				L$4:
0048  8B 46 04				mov		eax,dword ptr 0x4[esi]
004B  8B 04 02				mov		eax,dword ptr [edx+eax]
004E  F6 40 52 02			test		byte ptr 0x52[eax],0x02
0052  75 0F				jne		L$6
0054  83 C2 04				add		edx,0x00000004
0057  43				inc		ebx
0058				L$5:
0058  8B 4E 08				mov		ecx,dword ptr 0x8[esi]
005B  89 F0				mov		eax,esi
005D  39 CB				cmp		ebx,ecx
005F  7C E7				jl		L$4
0061  31 F0				xor		eax,esi
0063				L$6:
0063  89 35 00 00 00 00			mov		dword ptr __MainWindowData,esi
0069  5E				pop		esi
006A  5A				pop		edx
006B  59				pop		ecx
006C  5B				pop		ebx
006D  C3				ret		

Routine Size: 54 bytes,    Routine Base: _TEXT + 0038

006E				_MakeWindowActive_:
006E  53				push		ebx
006F  51				push		ecx
0070  52				push		edx
0071  56				push		esi
0072  57				push		edi
0073  55				push		ebp
0074  8B 2D 00 00 00 00			mov		ebp,dword ptr __MainWindowData
007A  89 C6				mov		esi,eax
007C  31 FF				xor		edi,edi
007E  31 DB				xor		ebx,ebx
0080  31 D2				xor		edx,edx
0082  EB 1E				jmp		L$9
0084				L$7:
0084  8B 45 04				mov		eax,dword ptr 0x4[ebp]
0087  8B 04 02				mov		eax,dword ptr [edx+eax]
008A  8A 48 52				mov		cl,byte ptr 0x52[eax]
008D  F6 C1 02				test		cl,0x02
0090  74 0C				je		L$8
0092  88 CD				mov		ch,cl
0094  80 E5 FD				and		ch,0xfd
0097  89 C7				mov		edi,eax
0099  88 68 52				mov		byte ptr 0x52[eax],ch
009C  EB 0D				jmp		L$10
009E				L$8:
009E  83 C2 04				add		edx,0x00000004
00A1  43				inc		ebx
00A2				L$9:
00A2  8B 4D 08				mov		ecx,dword ptr 0x8[ebp]
00A5  89 E8				mov		eax,ebp
00A7  39 CB				cmp		ebx,ecx
00A9  7C D9				jl		L$7
00AB				L$10:
00AB  80 4E 52 02			or		byte ptr 0x52[esi],0x02
00AF  39 F7				cmp		edi,esi
00B1  75 02				jne		L$11
00B3  31 F7				xor		edi,esi
00B5				L$11:
00B5  89 FA				mov		edx,edi
00B7  89 F0				mov		eax,esi
00B9  89 2D 00 00 00 00			mov		dword ptr __MainWindowData,ebp
00BF  E8 00 00 00 00			call		_ShowWindowActive_
00C4  8B 2D 00 00 00 00			mov		ebp,dword ptr __MainWindowData
00CA				L$12:
00CA  5D				pop		ebp
00CB				L$13:
00CB  5F				pop		edi
00CC  5E				pop		esi
00CD  5A				pop		edx
00CE  59				pop		ecx
00CF  5B				pop		ebx
00D0  C3				ret		

Routine Size: 99 bytes,    Routine Base: _TEXT + 006E

00D1				_IsWindowedHandle_:
00D1  53				push		ebx
00D2  51				push		ecx
00D3  52				push		edx
00D4  56				push		esi
00D5  57				push		edi
00D6  55				push		ebp
00D7  89 C6				mov		esi,eax
00D9  31 FF				xor		edi,edi
00DB  31 ED				xor		ebp,ebp
00DD  EB 20				jmp		L$17
00DF				L$14:
00DF  8B 40 04				mov		eax,dword ptr 0x4[eax]
00E2  31 D2				xor		edx,edx
00E4  31 DB				xor		ebx,ebx
00E6  8B 04 28				mov		eax,dword ptr [eax+ebp]
00E9  EB 0B				jmp		L$16
00EB				L$15:
00EB  8B 08				mov		ecx,dword ptr [eax]
00ED  3B 34 19				cmp		esi,dword ptr [ecx+ebx]
00F0  74 D8				je		L$12
00F2  83 C3 04				add		ebx,0x00000004
00F5  42				inc		edx
00F6				L$16:
00F6  3B 50 04				cmp		edx,dword ptr 0x4[eax]
00F9  7C F0				jl		L$15
00FB  83 C5 04				add		ebp,0x00000004
00FE  47				inc		edi
00FF				L$17:
00FF  A1 00 00 00 00			mov		eax,dword ptr __MainWindowData
0104  3B 78 08				cmp		edi,dword ptr 0x8[eax]
0107  7C D6				jl		L$14
0109  31 C0				xor		eax,eax
010B  EB BD				jmp		L$12

Routine Size: 60 bytes,    Routine Base: _TEXT + 00D1

010D				_RemoveWindowedHandle_:
010D  53				push		ebx
010E  51				push		ecx
010F  52				push		edx
0110  56				push		esi
0111  57				push		edi
0112  55				push		ebp
0113  83 EC 08				sub		esp,0x00000008
0116  50				push		eax
0117  31 D2				xor		edx,edx
0119  89 54 24 04			mov		dword ptr 0x4[esp],edx
011D  89 54 24 08			mov		dword ptr 0x8[esp],edx
0121  EB 5A				jmp		L$24
0123				L$18:
0123  8B 74 24 08			mov		esi,dword ptr 0x8[esp]
0127  8B 50 04				mov		edx,dword ptr 0x4[eax]
012A  01 F2				add		edx,esi
012C  31 FF				xor		edi,edi
012E  31 ED				xor		ebp,ebp
0130  8B 12				mov		edx,dword ptr [edx]
0132  EB 30				jmp		L$23
0134				L$19:
0134  8B 02				mov		eax,dword ptr [edx]
0136  8B 1C 24				mov		ebx,dword ptr [esp]
0139  3B 1C 28				cmp		ebx,dword ptr [eax+ebp]
013C  75 22				jne		L$22
013E  89 F9				mov		ecx,edi
0140  8B 72 04				mov		esi,dword ptr 0x4[edx]
0143  89 FB				mov		ebx,edi
0145  4E				dec		esi
0146  C1 E3 02				shl		ebx,0x02
0149  89 72 04				mov		dword ptr 0x4[edx],esi
014C  EB 0D				jmp		L$21
014E				L$20:
014E  8B 02				mov		eax,dword ptr [edx]
0150  8B 74 03 04			mov		esi,dword ptr 0x4[ebx+eax]
0154  41				inc		ecx
0155  89 34 03				mov		dword ptr [ebx+eax],esi
0158  83 C3 04				add		ebx,0x00000004
015B				L$21:
015B  3B 4A 04				cmp		ecx,dword ptr 0x4[edx]
015E  7C EE				jl		L$20
0160				L$22:
0160  83 C5 04				add		ebp,0x00000004
0163  47				inc		edi
0164				L$23:
0164  3B 7A 04				cmp		edi,dword ptr 0x4[edx]
0167  7C CB				jl		L$19
0169  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
016D  8B 5C 24 04			mov		ebx,dword ptr 0x4[esp]
0171  83 C2 04				add		edx,0x00000004
0174  43				inc		ebx
0175  89 54 24 08			mov		dword ptr 0x8[esp],edx
0179  89 5C 24 04			mov		dword ptr 0x4[esp],ebx
017D				L$24:
017D  A1 00 00 00 00			mov		eax,dword ptr __MainWindowData
0182  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0186  3B 50 08				cmp		edx,dword ptr 0x8[eax]
0189  7C 98				jl		L$18
018B  83 C4 0C				add		esp,0x0000000c
018E  E9 37 FF FF FF			jmp		L$12

Routine Size: 134 bytes,    Routine Base: _TEXT + 010D

0193				_WindowsExit_:
0193  53				push		ebx
0194  E8 00 00 00 00			call		_ExecutionComplete_
0199  83 3D 00 00 00 00 00		cmp		dword ptr __MainWindowDestroyed,0x00000000
01A0  75 0B				jne		L$26
01A2				L$25:
01A2  31 C0				xor		eax,eax
01A4  E8 00 00 00 00			call		_BlockingMessageLoop_
01A9  85 C0				test		eax,eax
01AB  75 F5				jne		L$25
01AD				L$26:
01AD  31 DB				xor		ebx,ebx
01AF  89 1D 00 00 00 00			mov		dword ptr __WindowExitRtn,ebx
01B5  5B				pop		ebx
01B6  C3				ret		

Routine Size: 36 bytes,    Routine Base: _TEXT + 0193

01B7				_DestroyOnClose_:
01B7  80 48 52 20			or		byte ptr 0x52[eax],0x20
01BB				L$27:
01BB  B8 01 00 00 00			mov		eax,0x00000001
01C0  C3				ret		

Routine Size: 10 bytes,    Routine Base: _TEXT + 01B7

01C1				_YieldControl_:
01C1  B8 01 00 00 00			mov		eax,0x00000001
01C6  E8 00 00 00 00			call		_MessageLoop_
01CB  EB EE				jmp		L$27

Routine Size: 12 bytes,    Routine Base: _TEXT + 01C1

01CD				_InitFunctionPointers_:
01CD  53				push		ebx
01CE  51				push		ecx
01CF  52				push		edx
01D0  56				push		esi
01D1  57				push		edi
01D2  55				push		ebp
01D3  BA 00 00 00 00			mov		edx,offset _DoStdin_
01D8  BB 00 00 00 00			mov		ebx,offset _DoStdout_
01DD  B9 00 00 00 00			mov		ecx,offset _DoKbhit_
01E2  BE 00 00 00 00			mov		esi,offset _DoGetch_
01E7  BF 00 00 00 00			mov		edi,offset _DoGetche_
01EC  BD 00 00 00 00			mov		ebp,offset _DoPutch_
01F1  B8 00 00 00 00			mov		eax,offset _WindowsExit_
01F6  89 15 00 00 00 00			mov		dword ptr __WindowsStdin,edx
01FC  89 1D 00 00 00 00			mov		dword ptr __WindowsStdout,ebx
0202  89 0D 00 00 00 00			mov		dword ptr __WindowsKbhit,ecx
0208  89 35 00 00 00 00			mov		dword ptr __WindowsGetch,esi
020E  89 3D 00 00 00 00			mov		dword ptr __WindowsGetche,edi
0214  89 2D 00 00 00 00			mov		dword ptr __WindowsPutch,ebp
021A  A3 00 00 00 00			mov		dword ptr __WindowExitRtn,eax
021F  BA 00 00 00 00			mov		edx,offset _IsWindowedHandle_
0224  BB 00 00 00 00			mov		ebx,offset _RemoveWindowedHandle_
0229  B9 00 00 00 00			mov		ecx,offset _NewWindow_
022E  BE 00 00 00 00			mov		esi,offset _CloseWindow_
0233  BF 00 00 00 00			mov		edi,offset _SetAboutDlg_
0238  BD 00 00 00 00			mov		ebp,offset _SetAppTitle_
023D  B8 00 00 00 00			mov		eax,offset _SetConTitle_
0242  89 15 00 00 00 00			mov		dword ptr __WindowsIsWindowedHandle,edx
0248  89 1D 00 00 00 00			mov		dword ptr __WindowsRemoveWindowedHandle,ebx
024E  89 0D 00 00 00 00			mov		dword ptr __WindowsNewWindow,ecx
0254  89 35 00 00 00 00			mov		dword ptr __WindowsCloseWindow,esi
025A  89 3D 00 00 00 00			mov		dword ptr __WindowsSetAbout,edi
0260  89 2D 00 00 00 00			mov		dword ptr __WindowsSetAppTitle,ebp
0266  A3 00 00 00 00			mov		dword ptr __WindowsSetConTitle,eax
026B  BA 00 00 00 00			mov		edx,offset _DestroyOnClose_
0270  BB 00 00 00 00			mov		ebx,offset _YieldControl_
0275  B9 00 00 00 00			mov		ecx,offset _ShutDown_
027A  89 15 00 00 00 00			mov		dword ptr __WindowsDestroyOnClose,edx
0280  89 1D 00 00 00 00			mov		dword ptr __WindowsYieldControl,ebx
0286  89 0D 00 00 00 00			mov		dword ptr __WindowsShutDown,ecx
028C  E9 39 FE FF FF			jmp		L$12

Routine Size: 196 bytes,    Routine Base: _TEXT + 01CD

0291				_MemAlloc_:
0291  53				push		ebx
0292  51				push		ecx
0293  52				push		edx
0294  89 C3				mov		ebx,eax
0296  E8 00 00 00 00			call		malloc_
029B  89 C1				mov		ecx,eax
029D  85 C0				test		eax,eax
029F  75 1A				jne		L$29
02A1  E8 00 00 00 00			call		_OutOfMemory_
02A6				L$28:
02A6  31 C0				xor		eax,eax
02A8  E8 00 00 00 00			call		_MessageLoop_
02AD  85 C0				test		eax,eax
02AF  75 F5				jne		L$28
02B1  A3 00 00 00 00			mov		dword ptr __WindowExitRtn,eax
02B6  E8 00 00 00 00			call		exit_
02BB				L$29:
02BB  89 C8				mov		eax,ecx
02BD  31 D2				xor		edx,edx
02BF  E8 00 00 00 00			call		memset_
02C4  89 C8				mov		eax,ecx
02C6  5A				pop		edx
02C7  59				pop		ecx
02C8  5B				pop		ebx
02C9  C3				ret		

Routine Size: 57 bytes,    Routine Base: _TEXT + 0291

02CA				_MemReAlloc_:
02CA  E8 00 00 00 00			call		realloc_
02CF  89 C2				mov		edx,eax
02D1  85 C0				test		eax,eax
02D3  75 1A				jne		L$31
02D5  E8 00 00 00 00			call		_OutOfMemory_
02DA				L$30:
02DA  31 C0				xor		eax,eax
02DC  E8 00 00 00 00			call		_MessageLoop_
02E1  85 C0				test		eax,eax
02E3  75 F5				jne		L$30
02E5  A3 00 00 00 00			mov		dword ptr __WindowExitRtn,eax
02EA  E8 00 00 00 00			call		exit_
02EF				L$31:
02EF  89 D0				mov		eax,edx
02F1  C3				ret		

Routine Size: 40 bytes,    Routine Base: _TEXT + 02CA

02F2				_MemFree_:
02F2  E9 00 00 00 00			jmp		free_

Routine Size: 5 bytes,    Routine Base: _TEXT + 02F2

02F7				_GetWindowNameAndCoords_:
02F7  56				push		esi
02F8  57				push		edi
02F9  55				push		ebp
02FA  85 C0				test		eax,eax
02FC  75 1E				jne		L$32
02FE  8B 35 00 00 00 00			mov		esi,dword ptr DGROUP:L$47
0304  46				inc		esi
0305  56				push		esi
0306  68 00 00 00 00			push		offset DGROUP:L$46
030B  52				push		edx
030C  89 35 00 00 00 00			mov		dword ptr DGROUP:L$47,esi
0312  E8 00 00 00 00			call		sprintf_
0317  83 C4 0C				add		esp,0x0000000c
031A  EB 1E				jmp		L$35
031C				L$32:
031C  89 C6				mov		esi,eax
031E  89 D7				mov		edi,edx
0320  57				push		edi
0321				L$33:
0321  8A 06				mov		al,byte ptr [esi]
0323  88 07				mov		byte ptr [edi],al
0325  3C 00				cmp		al,0x00
0327  74 10				je		L$34
0329  8A 46 01				mov		al,byte ptr 0x1[esi]
032C  83 C6 02				add		esi,0x00000002
032F  88 47 01				mov		byte ptr 0x1[edi],al
0332  83 C7 02				add		edi,0x00000002
0335  3C 00				cmp		al,0x00
0337  75 E8				jne		L$33
0339				L$34:
0339  5F				pop		edi
033A				L$35:
033A  8B 54 24 10			mov		edx,dword ptr 0x10[esp]
033E  8B 2D 04 00 00 00			mov		ebp,dword ptr DGROUP:L$48
0344  A1 04 00 00 00			mov		eax,dword ptr DGROUP:L$48
0349  83 C5 02				add		ebp,0x00000002
034C  89 03				mov		dword ptr [ebx],eax
034E  A1 08 00 00 00			mov		eax,dword ptr DGROUP:L$49
0353  8B 1D 10 00 00 00			mov		ebx,dword ptr DGROUP:L$51
0359  89 2D 04 00 00 00			mov		dword ptr DGROUP:L$48,ebp
035F  89 01				mov		dword ptr [ecx],eax
0361  A1 0C 00 00 00			mov		eax,dword ptr DGROUP:L$50
0366  83 EB 02				sub		ebx,0x00000002
0369  89 02				mov		dword ptr [edx],eax
036B  8B 54 24 14			mov		edx,dword ptr 0x14[esp]
036F  A1 10 00 00 00			mov		eax,dword ptr DGROUP:L$51
0374  89 1D 10 00 00 00			mov		dword ptr DGROUP:L$51,ebx
037A  89 02				mov		dword ptr [edx],eax
037C  A1 0C 00 00 00			mov		eax,dword ptr DGROUP:L$50
0381  8B 15 08 00 00 00			mov		edx,dword ptr DGROUP:L$49
0387  83 C0 02				add		eax,0x00000002
038A  83 EA 02				sub		edx,0x00000002
038D  A3 0C 00 00 00			mov		dword ptr DGROUP:L$50,eax
0392  89 15 08 00 00 00			mov		dword ptr DGROUP:L$49,edx
0398  83 FD 17				cmp		ebp,0x00000017
039B  7E 13				jle		L$36
039D  31 F6				xor		esi,esi
039F  BF 46 00 00 00			mov		edi,0x00000046
03A4  89 35 04 00 00 00			mov		dword ptr DGROUP:L$48,esi
03AA  89 3D 08 00 00 00			mov		dword ptr DGROUP:L$49,edi
03B0				L$36:
03B0  83 3D 0C 00 00 00 09		cmp		dword ptr DGROUP:L$50,0x00000009
03B7  7E 12				jle		L$37
03B9  31 C0				xor		eax,eax
03BB  BA 1B 00 00 00			mov		edx,0x0000001b
03C0  A3 0C 00 00 00			mov		dword ptr DGROUP:L$50,eax
03C5  89 15 10 00 00 00			mov		dword ptr DGROUP:L$51,edx
03CB				L$37:
03CB  5D				pop		ebp
03CC  5F				pop		edi
03CD  5E				pop		esi
03CE  C2 08 00				ret		0x0008

Routine Size: 218 bytes,    Routine Base: _TEXT + 02F7

03D1				_InitMainWindowData_:
03D1  53				push		ebx
03D2  51				push		ecx
03D3  52				push		edx
03D4  89 C1				mov		ecx,eax
03D6  B8 70 00 00 00			mov		eax,0x00000070
03DB  BB 70 00 00 00			mov		ebx,0x00000070
03E0  E8 00 00 00 00			call		_MemAlloc_
03E5  31 D2				xor		edx,edx
03E7  A3 00 00 00 00			mov		dword ptr __MainWindowData,eax
03EC  E8 00 00 00 00			call		memset_
03F1  A1 00 00 00 00			mov		eax,dword ptr __MainWindowData
03F6  C7 40 08 00 00 00 00		mov		dword ptr 0x8[eax],0x00000000
03FD  C7 40 04 00 00 00 00		mov		dword ptr 0x4[eax],0x00000000
0404  89 08				mov		dword ptr [eax],ecx
0406  5A				pop		edx
0407  59				pop		ecx
0408  5B				pop		ebx
0409  C3				ret		

Routine Size: 57 bytes,    Routine Base: _TEXT + 03D1

040A				_AnotherWindowData_:
040A  53				push		ebx
040B  51				push		ecx
040C  56				push		esi
040D  57				push		edi
040E  55				push		ebp
040F  83 EC 04				sub		esp,0x00000004
0412  89 C7				mov		edi,eax
0414  89 D1				mov		ecx,edx
0416  B8 70 00 00 00			mov		eax,0x00000070
041B  BB 70 00 00 00			mov		ebx,0x00000070
0420  E8 00 00 00 00			call		_MemAlloc_
0425  31 D2				xor		edx,edx
0427  89 C6				mov		esi,eax
0429  89 04 24				mov		dword ptr [esp],eax
042C  E8 00 00 00 00			call		memset_
0431  A1 00 00 00 00			mov		eax,dword ptr __MainWindowData
0436  8B 50 08				mov		edx,dword ptr 0x8[eax]
0439  42				inc		edx
043A  8B 40 04				mov		eax,dword ptr 0x4[eax]
043D  C1 E2 02				shl		edx,0x02
0440  E8 00 00 00 00			call		_MemReAlloc_
0445  89 C2				mov		edx,eax
0447  A1 00 00 00 00			mov		eax,dword ptr __MainWindowData
044C  8B 58 08				mov		ebx,dword ptr 0x8[eax]
044F  89 50 04				mov		dword ptr 0x4[eax],edx
0452  89 34 9A				mov		dword ptr [edx+ebx*4],esi
0455  FF 40 08				inc		dword ptr 0x8[eax]
0458  C7 46 4A 01 00 00 00		mov		dword ptr 0x4a[esi],0x00000001
045F  C7 46 4E 01 00 00 00		mov		dword ptr 0x4e[esi],0x00000001
0466  B8 8B 00 00 00			mov		eax,0x0000008b
046B  C7 46 46 01 00 00 00		mov		dword ptr 0x46[esi],0x00000001
0472  E8 00 00 00 00			call		_MemAlloc_
0477  C6 46 6F 02			mov		byte ptr 0x6f[esi],0x02
047B  89 46 53				mov		dword ptr 0x53[esi],eax
047E  BB 04 00 00 00			mov		ebx,0x00000004
0483  89 7E 3A				mov		dword ptr 0x3a[esi],edi
0486  31 F6				xor		esi,esi
0488  31 C0				xor		eax,eax
048A				L$38:
048A  8B 39				mov		edi,dword ptr [ecx]
048C  83 C7 04				add		edi,0x00000004
048F  89 39				mov		dword ptr [ecx],edi
0491  8B 7F FC				mov		edi,dword ptr -0x4[edi]
0494  83 FF FF				cmp		edi,0xffffffff
0497  74 12				je		L$39
0499  89 DA				mov		edx,ebx
049B  89 F5				mov		ebp,esi
049D  E8 00 00 00 00			call		realloc_
04A2  83 C3 04				add		ebx,0x00000004
04A5  46				inc		esi
04A6  89 3C A8				mov		dword ptr [eax+ebp*4],edi
04A9  EB DF				jmp		L$38
04AB				L$39:
04AB  8B 14 24				mov		edx,dword ptr [esp]
04AE  89 02				mov		dword ptr [edx],eax
04B0  89 72 04				mov		dword ptr 0x4[edx],esi
04B3  89 D0				mov		eax,edx
04B5  83 C4 04				add		esp,0x00000004
04B8  5D				pop		ebp
04B9  5F				pop		edi
04BA  5E				pop		esi
04BB  59				pop		ecx
04BC  5B				pop		ebx
04BD  C3				ret		

Routine Size: 180 bytes,    Routine Base: _TEXT + 040A

04BE				_DestroyAWindow_:
04BE  53				push		ebx
04BF  51				push		ecx
04C0  52				push		edx
04C1  56				push		esi
04C2  55				push		ebp
04C3  89 C6				mov		esi,eax
04C5  A1 00 00 00 00			mov		eax,dword ptr __MainWindowData
04CA  31 D2				xor		edx,edx
04CC  31 DB				xor		ebx,ebx
04CE  EB 49				jmp		L$44
04D0				L$40:
04D0  8B 48 04				mov		ecx,dword ptr 0x4[eax]
04D3  3B 34 19				cmp		esi,dword ptr [ecx+ebx]
04D6  75 3D				jne		L$43
04D8  8B 68 08				mov		ebp,dword ptr 0x8[eax]
04DB  89 D3				mov		ebx,edx
04DD  4D				dec		ebp
04DE  C1 E2 02				shl		edx,0x02
04E1  89 68 08				mov		dword ptr 0x8[eax],ebp
04E4  EB 0E				jmp		L$42
04E6				L$41:
04E6  8B 40 04				mov		eax,dword ptr 0x4[eax]
04E9  8B 4C 02 04			mov		ecx,dword ptr 0x4[edx+eax]
04ED  43				inc		ebx
04EE  89 0C 02				mov		dword ptr [edx+eax],ecx
04F1  83 C2 04				add		edx,0x00000004
04F4				L$42:
04F4  A1 00 00 00 00			mov		eax,dword ptr __MainWindowData
04F9  3B 58 08				cmp		ebx,dword ptr 0x8[eax]
04FC  7C E8				jl		L$41
04FE  89 F0				mov		eax,esi
0500  E8 00 00 00 00			call		_ReleaseWindowResources_
0505  8B 06				mov		eax,dword ptr [esi]
0507  E8 00 00 00 00			call		free_
050C  89 F0				mov		eax,esi
050E  E8 00 00 00 00			call		free_
0513  EB 09				jmp		L$45
0515				L$43:
0515  83 C3 04				add		ebx,0x00000004
0518  42				inc		edx
0519				L$44:
0519  3B 50 08				cmp		edx,dword ptr 0x8[eax]
051C  7C B2				jl		L$40
051E				L$45:
051E  5D				pop		ebp
051F  5E				pop		esi
0520  5A				pop		edx
0521  59				pop		ecx
0522  5B				pop		ebx
0523  C3				ret		

Routine Size: 102 bytes,    Routine Base: _TEXT + 04BE

No disassembly errors

Segment: CONST DWORD USE32 0000000B bytes
0000				L$46:
0000  43 6F 6E 73 6F 6C 65 20 25 64 00                Console %d.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000014 bytes
0000				L$47:
0000  00 00 00 00                                     ....
0004				L$48:
0004  00 00 00 00                                     ....
0008				L$49:
0008  46 00 00 00                                     F...
000C				L$50:
000C  00 00 00 00                                     ....
0010				L$51:
0010  1B 00 00 00                                     ....

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

