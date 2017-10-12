Module: signlwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000006F0 bytes
0000				_CtrlSignalHandler:
0000  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0004  85 C0				test		eax,eax
0006  76 0A				jbe		L$1
0008  83 F8 01				cmp		eax,0x00000001
000B  74 23				je		L$5
000D  31 C0				xor		eax,eax
000F  C2 04 00				ret		0x0004
0012				L$1:
0012  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0018  8B 50 78				mov		edx,dword ptr 0x78[eax]
001B  85 D2				test		edx,edx
001D  75 05				jne		L$3
001F				L$2:
001F  31 C0				xor		eax,eax
0021  C2 04 00				ret		0x0004
0024				L$3:
0024  B8 04 00 00 00			mov		eax,0x00000004
0029				L$4:
0029  E8 00 00 00 00			call		raise_
002E  EB 17				jmp		L$6
0030				L$5:
0030  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0036  8B 90 90 00 00 00			mov		edx,dword ptr 0x90[eax]
003C  85 D2				test		edx,edx
003E  74 DF				je		L$2
0040  B8 07 00 00 00			mov		eax,0x00000007
0045  EB E2				jmp		L$4
0047				L$6:
0047  83 FA 02				cmp		edx,0x00000002
004A  74 D3				je		L$2
004C  83 FA 03				cmp		edx,0x00000003
004F  74 CE				je		L$2
0051  B8 01 00 00 00			mov		eax,0x00000001
0056  C2 04 00				ret		0x0004
0059				CtrlHandlerIsNeeded_:
0059  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
005F  83 78 78 02			cmp		dword ptr 0x78[eax],0x00000002
0063  74 0C				je		L$7
0065  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
006B  83 78 78 03			cmp		dword ptr 0x78[eax],0x00000003
006F  75 1E				jne		L$8
0071				L$7:
0071  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0077  83 B8 90 00 00 00 02		cmp		dword ptr 0x90[eax],0x00000002
007E  74 15				je		L$9
0080  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0086  83 B8 90 00 00 00 03		cmp		dword ptr 0x90[eax],0x00000003
008D  74 06				je		L$9
008F				L$8:
008F  B8 01 00 00 00			mov		eax,0x00000001
0094  C3				ret		
0095				L$9:
0095  31 C0				xor		eax,eax
0097  C3				ret		
0098				StartCtrlHandler_:
0098  51				push		ecx
0099  52				push		edx
009A  80 3D 00 00 00 00 00		cmp		byte ptr _CtrlHandlerRunning,0x00
00A1  75 17				jne		L$10
00A3  6A 01				push		0x00000001
00A5  68 00 00 00 00			push		offset _CtrlSignalHandler
00AA  E8 00 00 00 00			call		_SetConsoleCtrlHandler
00AF  85 C0				test		eax,eax
00B1  74 07				je		L$10
00B3  C6 05 00 00 00 00 01		mov		byte ptr _CtrlHandlerRunning,0x01
00BA				L$10:
00BA  31 C0				xor		eax,eax
00BC  A0 00 00 00 00			mov		al,byte ptr _CtrlHandlerRunning
00C1  5A				pop		edx
00C2  59				pop		ecx
00C3  C3				ret		
00C4				KillCtrlHandler_:
00C4  51				push		ecx
00C5  52				push		edx
00C6  80 3D 00 00 00 00 00		cmp		byte ptr _CtrlHandlerRunning,0x00
00CD  74 18				je		L$11
00CF  6A 00				push		0x00000000
00D1  68 00 00 00 00			push		offset _CtrlSignalHandler
00D6  E8 00 00 00 00			call		_SetConsoleCtrlHandler
00DB  85 C0				test		eax,eax
00DD  74 08				je		L$11
00DF  30 D2				xor		dl,dl
00E1  88 15 00 00 00 00			mov		byte ptr _CtrlHandlerRunning,dl
00E7				L$11:
00E7  31 C0				xor		eax,eax
00E9  A0 00 00 00 00			mov		al,byte ptr _CtrlHandlerRunning
00EE  85 C0				test		eax,eax
00F0  0F 94 C0				sete		al
00F3  25 FF 00 00 00			and		eax,0x000000ff
00F8  5A				pop		edx
00F9  59				pop		ecx
00FA  C3				ret		

Routine Size: 251 bytes,    Routine Base: _TEXT + 0000

00FB				__sigabort_:
00FB  B8 01 00 00 00			mov		eax,0x00000001

Routine Size: 5 bytes,    Routine Base: _TEXT + 00FB

0100				raise_:
0100  53				push		ebx
0101  51				push		ecx
0102  52				push		edx
0103  83 EC 04				sub		esp,0x00000004
0106  89 C2				mov		edx,eax
0108  89 D3				mov		ebx,edx
010A  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0110  8B 44 D8 58			mov		eax,dword ptr 0x58[eax+ebx*8]
0114  89 04 24				mov		dword ptr [esp],eax
0117  83 FA 02				cmp		edx,0x00000002
011A  0F 82 E7 00 00 00			jb		L$18
0120  0F 86 EB 00 00 00			jbe		L$19
0126  83 FA 0C				cmp		edx,0x0000000c
0129  0F 86 F8 00 00 00			jbe		L$21
012F				L$12:
012F  B8 FF FF FF FF			mov		eax,0xffffffff
0134  E9 25 01 00 00			jmp		L$24

Routine Size: 57 bytes,    Routine Base: _TEXT + 0100

0139				__sigfpe_handler_:
0139  52				push		edx
013A  83 EC 04				sub		esp,0x00000004
013D  89 C2				mov		edx,eax
013F  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0145  8B 40 68				mov		eax,dword ptr 0x68[eax]
0148  89 04 24				mov		dword ptr [esp],eax
014B  83 F8 01				cmp		eax,0x00000001
014E  74 26				je		L$13
0150  83 F8 02				cmp		eax,0x00000002
0153  74 21				je		L$13
0155  83 F8 03				cmp		eax,0x00000003
0158  74 1C				je		L$13
015A  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0160  C7 40 68 02 00 00 00		mov		dword ptr 0x68[eax],0x00000002
0167  B8 02 00 00 00			mov		eax,0x00000002
016C  FF 14 24				call		dword ptr [esp]
016F  31 C0				xor		eax,eax
0171  83 C4 04				add		esp,0x00000004
0174  5A				pop		edx
0175  C3				ret		
0176				L$13:
0176  B8 FF FF FF FF			mov		eax,0xffffffff
017B  83 C4 04				add		esp,0x00000004
017E  5A				pop		edx
017F  C3				ret		

Routine Size: 71 bytes,    Routine Base: _TEXT + 0139

0180				signal_:
0180  53				push		ebx
0181  51				push		ecx
0182  89 C3				mov		ebx,eax
0184  89 D1				mov		ecx,edx
0186  83 F8 01				cmp		eax,0x00000001
0189  7C 05				jl		L$14
018B  83 F8 0C				cmp		eax,0x0000000c
018E  7E 12				jle		L$15
0190				L$14:
0190  B8 09 00 00 00			mov		eax,0x00000009
0195  E8 00 00 00 00			call		__set_errno_
019A  B8 03 00 00 00			mov		eax,0x00000003
019F  59				pop		ecx
01A0  5B				pop		ebx
01A1  C3				ret		
01A2				L$15:
01A2  C7 05 00 00 00 00 00 00 00 00
					mov		dword ptr ___abort,offset __sigabort_
01AC  83 F9 02				cmp		ecx,0x00000002
01AF  74 25				je		L$16
01B1  83 F9 03				cmp		ecx,0x00000003
01B4  74 20				je		L$16
01B6  89 DA				mov		edx,ebx
01B8  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
01BE  83 7C D0 5C 00			cmp		dword ptr 0x5c[eax+edx*8],0x00000000
01C3  74 11				je		L$16
01C5  83 FB 02				cmp		ebx,0x00000002
01C8  75 0C				jne		L$16
01CA  BA 9F 00 00 00			mov		edx,0x0000009f
01CF  31 C0				xor		eax,eax
01D1  E8 00 00 00 00			call		_control87_
01D6				L$16:
01D6  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
01DC  8B 54 D8 58			mov		edx,dword ptr 0x58[eax+ebx*8]
01E0  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
01E6  89 4C D8 58			mov		dword ptr 0x58[eax+ebx*8],ecx
01EA  E8 00 00 00 00			call		CtrlHandlerIsNeeded_
01EF  85 C0				test		eax,eax
01F1  74 0A				je		L$17
01F3  E8 00 00 00 00			call		StartCtrlHandler_
01F8  89 D0				mov		eax,edx
01FA  59				pop		ecx
01FB  5B				pop		ebx
01FC  C3				ret		
01FD				L$17:
01FD  E8 00 00 00 00			call		KillCtrlHandler_
0202  89 D0				mov		eax,edx
0204  59				pop		ecx
0205  5B				pop		ebx
0206  C3				ret		
0207				L$18:
0207  83 FA 01				cmp		edx,0x00000001
020A  74 11				je		L$20
020C  E9 1E FF FF FF			jmp		L$12
0211				L$19:
0211  B8 8C 00 00 00			mov		eax,0x0000008c
0216  E8 00 00 00 00			call		__sigfpe_handler_
021B  EB 3F				jmp		L$23
021D				L$20:
021D  83 F8 02				cmp		eax,0x00000002
0220  75 05				jne		L$21
0222  E8 00 00 00 00			call		__terminate_
0227				L$21:
0227  8B 0C 24				mov		ecx,dword ptr [esp]
022A  83 F9 01				cmp		ecx,0x00000001
022D  74 1F				je		L$22
022F  83 F9 02				cmp		ecx,0x00000002
0232  74 1A				je		L$22
0234  83 F9 03				cmp		ecx,0x00000003
0237  74 15				je		L$22
0239  89 D3				mov		ebx,edx
023B  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0241  C7 44 D8 58 02 00 00 00		mov		dword ptr 0x58[eax+ebx*8],0x00000002
0249  89 D0				mov		eax,edx
024B  FF 14 24				call		dword ptr [esp]
024E				L$22:
024E  E8 00 00 00 00			call		CtrlHandlerIsNeeded_
0253  85 C0				test		eax,eax
0255  75 05				jne		L$23
0257  E8 00 00 00 00			call		KillCtrlHandler_
025C				L$23:
025C  31 C0				xor		eax,eax
025E				L$24:
025E  83 C4 04				add		esp,0x00000004
0261  5A				pop		edx
0262  59				pop		ecx
0263  5B				pop		ebx
0264  C3				ret		

Routine Size: 229 bytes,    Routine Base: _TEXT + 0180

0265				__SigInit_:
0265  52				push		edx
0266  56				push		esi
0267  57				push		edi
0268  06				push		es
0269  BA 08 00 00 00			mov		edx,0x00000008
026E				L$25:
026E  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0274  8D 34 10				lea		esi,[eax+edx]
0277  8C D8				mov		eax,ds
0279  8E C0				mov		es,eax
027B  8D 7E 58				lea		edi,0x58[esi]
027E  8D B2 00 00 00 00			lea		esi,_SignalTable[edx]
0284  83 C2 08				add		edx,0x00000008
0287  A5				movsd		
0288  A5				movsd		
0289  83 FA 68				cmp		edx,0x00000068
028C  75 E0				jne		L$25
028E  07				pop		es
028F  5F				pop		edi
0290  5E				pop		esi
0291  5A				pop		edx

Routine Size: 45 bytes,    Routine Base: _TEXT + 0265

0292				__SigFini_:
0292  C3				ret		
0293  90				nop		
0294				L$26:
0294  04 03 00 00                                     DD	offset L$27
0298  CC 03 00 00                                     DD	offset L$35
029C  0E 03 00 00                                     DD	offset L$28
02A0  18 03 00 00                                     DD	offset L$29
02A4  D3 03 00 00                                     DD	offset L$36
02A8  DA 03 00 00                                     DD	offset L$37
02AC  EE 03 00 00                                     DD	offset L$39

Routine Size: 30 bytes,    Routine Base: _TEXT + 0292

02B0				___ExceptionFilter:
02B0  53				push		ebx
02B1  56				push		esi
02B2  57				push		edi
02B3  06				push		es
02B4  55				push		ebp
02B5  81 EC 20 02 00 00			sub		esp,0x00000220
02BB  8B 9C 24 38 02 00 00		mov		ebx,dword ptr 0x238[esp]
02C2  8B B4 24 40 02 00 00		mov		esi,dword ptr 0x240[esp]
02C9  83 BC 24 3C 02 00 00 00		cmp		dword ptr 0x23c[esp],0x00000000
02D1  0F 84 79 03 00 00			je		L$63
02D7  8A 63 04				mov		ah,byte ptr 0x4[ebx]
02DA  F6 C4 01				test		ah,0x01
02DD  0F 85 6D 03 00 00			jne		L$63
02E3  F6 C4 06				test		ah,0x06
02E6  0F 85 64 03 00 00			jne		L$63
02EC  8B 03				mov		eax,dword ptr [ebx]
02EE  05 73 FF FF 3F			add		eax,0x3fffff73
02F3  83 F8 06				cmp		eax,0x00000006
02F6  0F 87 F9 00 00 00			ja		L$40
02FC  2E FF 24 85 94 02 00 00		jmp		dword ptr cs:L$26[eax*4]
0304				L$27:
0304  B8 82 00 00 00			mov		eax,0x00000082
0309  E9 EC 00 00 00			jmp		L$41
030E				L$28:
030E  B8 86 00 00 00			mov		eax,0x00000086
0313  E9 E2 00 00 00			jmp		L$41
0318				L$29:
0318  8B 56 28				mov		edx,dword ptr 0x28[esi]
031B  31 C9				xor		ecx,ecx
031D  66 8B 0A				mov		cx,word ptr [edx]
0320  B8 81 00 00 00			mov		eax,0x00000081
0325  81 F9 D9 FA 00 00			cmp		ecx,0x0000fad9
032B  75 0A				jne		L$30
032D  B8 88 00 00 00			mov		eax,0x00000088
0332  E9 C3 00 00 00			jmp		L$41
0337				L$30:
0337  81 F9 D9 F1 00 00			cmp		ecx,0x0000f1d9
033D  75 0A				jne		L$31
033F  B8 8E 00 00 00			mov		eax,0x0000008e
0344  E9 B1 00 00 00			jmp		L$41
0349				L$31:
0349  75 0A				jne		L$32
034B  B8 8F 00 00 00			mov		eax,0x0000008f
0350  E9 A5 00 00 00			jmp		L$41
0355				L$32:
0355  31 C9				xor		ecx,ecx
0357  8A 0A				mov		cl,byte ptr [edx]
0359  81 F9 DB 00 00 00			cmp		ecx,0x000000db
035F  74 08				je		L$33
0361  81 F9 DF 00 00 00			cmp		ecx,0x000000df
0367  75 16				jne		L$34
0369				L$33:
0369  8A 4A 01				mov		cl,byte ptr 0x1[edx]
036C  80 E1 30				and		cl,0x30
036F  81 E1 FF 00 00 00			and		ecx,0x000000ff
0375  83 F9 10				cmp		ecx,0x00000010
0378  75 05				jne		L$34
037A  B8 8D 00 00 00			mov		eax,0x0000008d
037F				L$34:
037F  8A 0A				mov		cl,byte ptr [edx]
0381  80 E1 01				and		cl,0x01
0384  81 E1 FF 00 00 00			and		ecx,0x000000ff
038A  0F 85 6A 00 00 00			jne		L$41
0390  8A 52 01				mov		dl,byte ptr 0x1[edx]
0393  80 E2 30				and		dl,0x30
0396  81 E2 FF 00 00 00			and		edx,0x000000ff
039C  83 FA 30				cmp		edx,0x00000030
039F  75 59				jne		L$41
03A1  8B 4E 20				mov		ecx,dword ptr 0x20[esi]
03A4  81 E1 FF FF 00 00			and		ecx,0x0000ffff
03AA  8B 56 24				mov		edx,dword ptr 0x24[esi]
03AD  C1 E1 02				shl		ecx,0x02
03B0  81 E2 FF FF 00 00			and		edx,0x0000ffff
03B6  66 C1 E9 0D			shr		cx,0x0d
03BA  81 E1 FF FF 00 00			and		ecx,0x0000ffff
03C0  01 C9				add		ecx,ecx
03C2  D3 EA				shr		edx,cl
03C4  83 E2 01				and		edx,0x00000001
03C7  83 FA 01				cmp		edx,0x00000001
03CA  75 2E				jne		L$41
03CC				L$35:
03CC  B8 83 00 00 00			mov		eax,0x00000083
03D1  EB 27				jmp		L$41
03D3				L$36:
03D3  B8 84 00 00 00			mov		eax,0x00000084
03D8  EB 20				jmp		L$41
03DA				L$37:
03DA  F6 46 21 02			test		byte ptr 0x21[esi],0x02
03DE  74 07				je		L$38
03E0  B8 8A 00 00 00			mov		eax,0x0000008a
03E5  EB 13				jmp		L$41
03E7				L$38:
03E7  B8 8B 00 00 00			mov		eax,0x0000008b
03EC  EB 0C				jmp		L$41
03EE				L$39:
03EE  B8 85 00 00 00			mov		eax,0x00000085
03F3  EB 05				jmp		L$41
03F5				L$40:
03F5  B8 FF FF FF FF			mov		eax,0xffffffff
03FA				L$41:
03FA  83 F8 FF				cmp		eax,0xffffffff
03FD  74 3C				je		L$43
03FF  C6 05 00 00 00 00 01		mov		byte ptr ___ExceptionHandled,0x01
0406  E8 00 00 00 00			call		__sigfpe_handler_
040B  85 C0				test		eax,eax
040D  75 22				jne		L$42
040F  80 3D 00 00 00 00 00		cmp		byte ptr ___ExceptionHandled,0x00
0416  74 19				je		L$42
0418  E8 00 00 00 00			call		_fpreset_
041D  66 8B 56 20			mov		dx,word ptr 0x20[esi]
0421  30 D2				xor		dl,dl
0423  80 E6 7F				and		dh,0x7f
0426  31 C0				xor		eax,eax
0428  66 89 56 20			mov		word ptr 0x20[esi],dx
042C  E9 24 02 00 00			jmp		L$64
0431				L$42:
0431  E8 00 00 00 00			call		_fpreset_
0436  E9 15 02 00 00			jmp		L$63
043B				L$43:
043B  B9 01 00 00 00			mov		ecx,0x00000001
0440  BA 08 00 00 00			mov		edx,0x00000008
0445				L$44:
0445  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
044B  8B 33				mov		esi,dword ptr [ebx]
044D  3B 74 02 5C			cmp		esi,dword ptr 0x5c[edx+eax]
0451  75 49				jne		L$45
0453  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0459  83 7C 02 58 01			cmp		dword ptr 0x58[edx+eax],0x00000001
045E  74 45				je		L$46
0460  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0466  83 7C 02 58 02			cmp		dword ptr 0x58[edx+eax],0x00000002
046B  74 38				je		L$46
046D  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0473  83 7C 02 58 03			cmp		dword ptr 0x58[edx+eax],0x00000003
0478  74 2B				je		L$46
047A  C6 05 00 00 00 00 01		mov		byte ptr ___ExceptionHandled,0x01
0481  89 C8				mov		eax,ecx
0483  E8 00 00 00 00			call		raise_
0488  80 3D 00 00 00 00 00		cmp		byte ptr ___ExceptionHandled,0x00
048F  0F 84 BB 01 00 00			je		L$63
0495  31 C0				xor		eax,eax
0497  E9 B9 01 00 00			jmp		L$64
049C				L$45:
049C  83 C2 08				add		edx,0x00000008
049F  41				inc		ecx
04A0  83 FA 60				cmp		edx,0x00000060
04A3  7E A0				jle		L$44
04A5				L$46:
04A5  8B 03				mov		eax,dword ptr [ebx]
04A7  3D 94 00 00 C0			cmp		eax,0xc0000094
04AC  72 23				jb		L$47
04AE  0F 86 7B 00 00 00			jbe		L$53
04B4  3D 96 00 00 C0			cmp		eax,0xc0000096
04B9  0F 82 86 00 00 00			jb		L$55
04BF  76 58				jbe		L$51
04C1  3D FD 00 00 C0			cmp		eax,0xc00000fd
04C6  0F 84 6E 00 00 00			je		L$54
04CC  E9 74 00 00 00			jmp		L$55
04D1				L$47:
04D1  3D 05 00 00 C0			cmp		eax,0xc0000005
04D6  0F 82 69 00 00 00			jb		L$55
04DC  76 09				jbe		L$48
04DE  3D 1D 00 00 C0			cmp		eax,0xc000001d
04E3  74 3F				je		L$52
04E5  EB 5E				jmp		L$55
04E7				L$48:
04E7  83 7B 14 00			cmp		dword ptr 0x14[ebx],0x00000000
04EB  75 07				jne		L$49
04ED  B8 00 00 00 00			mov		eax,offset DGROUP:L$67
04F2  EB 05				jmp		L$50
04F4				L$49:
04F4  B8 0A 00 00 00			mov		eax,offset DGROUP:L$68
04F9				L$50:
04F9  50				push		eax
04FA  8B 7B 18				mov		edi,dword ptr 0x18[ebx]
04FD  57				push		edi
04FE  8B 6B 0C				mov		ebp,dword ptr 0xc[ebx]
0501  55				push		ebp
0502  68 12 00 00 00			push		offset DGROUP:L$69
0507  8D 84 24 28 01 00 00		lea		eax,0x128[esp]
050E  50				push		eax
050F  E8 00 00 00 00			call		_wsprintfA
0514  83 C4 14				add		esp,0x00000014
0517  EB 45				jmp		L$57
0519				L$51:
0519  8B 43 0C				mov		eax,dword ptr 0xc[ebx]
051C  50				push		eax
051D  68 61 00 00 00			push		offset DGROUP:L$70
0522  EB 2A				jmp		L$56
0524				L$52:
0524  8B 4B 0C				mov		ecx,dword ptr 0xc[ebx]
0527  51				push		ecx
0528  68 99 00 00 00			push		offset DGROUP:L$71
052D  EB 1F				jmp		L$56
052F				L$53:
052F  8B 53 0C				mov		edx,dword ptr 0xc[ebx]
0532  52				push		edx
0533  68 CE 00 00 00			push		offset DGROUP:L$72
0538  EB 14				jmp		L$56
053A				L$54:
053A  8B 6B 0C				mov		ebp,dword ptr 0xc[ebx]
053D  55				push		ebp
053E  68 09 01 00 00			push		offset DGROUP:L$73
0543  EB 09				jmp		L$56
0545				L$55:
0545  8B 43 0C				mov		eax,dword ptr 0xc[ebx]
0548  50				push		eax
0549  68 3B 01 00 00			push		offset DGROUP:L$74
054E				L$56:
054E  8D 84 24 20 01 00 00		lea		eax,0x120[esp]
0555  50				push		eax
0556  E8 00 00 00 00			call		_wsprintfA
055B  83 C4 0C				add		esp,0x0000000c
055E				L$57:
055E  E8 00 00 00 00			call		_GetActiveWindow
0563  31 DB				xor		ebx,ebx
0565  85 C0				test		eax,eax
0567  75 0E				jne		L$58
0569  E8 00 00 00 00			call		__NTConsoleOutput_
056E  83 F8 FF				cmp		eax,0xffffffff
0571  0F 85 9E 00 00 00			jne		L$62
0577				L$58:
0577  68 82 01 00 00			push		offset DGROUP:L$75
057C  E8 00 00 00 00			call		_LoadLibraryA
0581  89 C3				mov		ebx,eax
0583  85 C0				test		eax,eax
0585  0F 84 8A 00 00 00			je		L$62
058B  68 8D 01 00 00			push		offset DGROUP:L$76
0590  50				push		eax
0591  E8 00 00 00 00			call		_GetProcAddress
0596  89 84 24 18 02 00 00		mov		dword ptr 0x218[esp],eax
059D  85 C0				test		eax,eax
059F  74 72				je		L$61
05A1  89 E7				mov		edi,esp
05A3  8C D8				mov		eax,ds
05A5  68 04 01 00 00			push		0x00000104
05AA  8E C0				mov		es,eax
05AC  8D 44 24 17			lea		eax,0x17[esp]
05B0  BE 9B 01 00 00			mov		esi,offset DGROUP:L$77
05B5  50				push		eax
05B6  A5				movsd		
05B7  A5				movsd		
05B8  A5				movsd		
05B9  A5				movsd		
05BA  A5				movsd		
05BB  6A 00				push		0x00000000
05BD  BE AF 01 00 00			mov		esi,offset DGROUP:L$78
05C2  8D BC 24 24 01 00 00		lea		edi,0x124[esp]
05C9  E8 00 00 00 00			call		_GetModuleFileNameA
05CE  06				push		es
05CF  1E				push		ds
05D0  07				pop		es
05D1  57				push		edi
05D2  2B C9				sub		ecx,ecx
05D4  49				dec		ecx
05D5  B0 00				mov		al,0x00
05D7  F2 AE				repne scasb	
05D9  4F				dec		edi
05DA				L$59:
05DA  8A 06				mov		al,byte ptr [esi]
05DC  88 07				mov		byte ptr [edi],al
05DE  3C 00				cmp		al,0x00
05E0  74 10				je		L$60
05E2  8A 46 01				mov		al,byte ptr 0x1[esi]
05E5  83 C6 02				add		esi,0x00000002
05E8  88 47 01				mov		byte ptr 0x1[edi],al
05EB  83 C7 02				add		edi,0x00000002
05EE  3C 00				cmp		al,0x00
05F0  75 E8				jne		L$59
05F2				L$60:
05F2  5F				pop		edi
05F3  07				pop		es
05F4  6A 00				push		0x00000000
05F6  68 10 20 00 00			push		0x00002010
05FB  8D 44 24 08			lea		eax,0x8[esp]
05FF  50				push		eax
0600  8D 84 24 24 01 00 00		lea		eax,0x124[esp]
0607  50				push		eax
0608  6A 00				push		0x00000000
060A  FF 94 24 2C 02 00 00		call		dword ptr 0x22c[esp]
0611  EB 02				jmp		L$62
0613				L$61:
0613  31 DB				xor		ebx,ebx
0615				L$62:
0615  85 DB				test		ebx,ebx
0617  75 37				jne		L$63
0619  53				push		ebx
061A  8D 84 24 20 02 00 00		lea		eax,0x220[esp]
0621  50				push		eax
0622  8D BC 24 20 01 00 00		lea		edi,0x120[esp]
0629  06				push		es
062A  8C D8				mov		eax,ds
062C  8E C0				mov		es,eax
062E  29 C9				sub		ecx,ecx
0630  49				dec		ecx
0631  31 C0				xor		eax,eax
0633  F2 AE				repne scasb	
0635  F7 D1				not		ecx
0637  49				dec		ecx
0638  07				pop		es
0639  51				push		ecx
063A  8D 84 24 24 01 00 00		lea		eax,0x124[esp]
0641  50				push		eax
0642  A1 00 00 00 00			mov		eax,dword ptr ___FileHandleIDs
0647  8B 50 08				mov		edx,dword ptr 0x8[eax]
064A  52				push		edx
064B  E8 00 00 00 00			call		_WriteFile
0650				L$63:
0650  B8 01 00 00 00			mov		eax,0x00000001
0655				L$64:
0655  81 C4 20 02 00 00			add		esp,0x00000220
065B  5D				pop		ebp
065C  07				pop		es
065D  5F				pop		edi
065E  5E				pop		esi
065F  5B				pop		ebx
0660  C2 10 00				ret		0x0010

Routine Size: 947 bytes,    Routine Base: _TEXT + 02B0

0663				__NewExceptionHandler_:
0663  52				push		edx
0664  89 C2				mov		edx,eax
0666  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
066C  89 50 54				mov		dword ptr 0x54[eax],edx
066F  31 C0				xor		eax,eax
0671  64 8B 00				mov		eax,dword ptr fs:[eax]
0674  89 C2				mov		edx,eax
0676  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
067C  8B 40 54				mov		eax,dword ptr 0x54[eax]
067F  89 10				mov		dword ptr [eax],edx
0681  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0687  8B 40 54				mov		eax,dword ptr 0x54[eax]
068A  31 D2				xor		edx,edx
068C  C7 40 04 00 00 00 00		mov		dword ptr 0x4[eax],offset ___ExceptionFilter
0693  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0699  8B 40 54				mov		eax,dword ptr 0x54[eax]
069C  64 89 02				mov		dword ptr fs:[edx],eax
069F  5A				pop		edx
06A0  C3				ret		

Routine Size: 62 bytes,    Routine Base: _TEXT + 0663

06A1				__DoneExceptionHandler_:
06A1  52				push		edx
06A2  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
06A8  8B 40 54				mov		eax,dword ptr 0x54[eax]
06AB  85 C0				test		eax,eax
06AD  74 07				je		L$65
06AF  8B 00				mov		eax,dword ptr [eax]
06B1  31 D2				xor		edx,edx
06B3  64 89 02				mov		dword ptr fs:[edx],eax
06B6				L$65:
06B6  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
06BC  C7 40 54 00 00 00 00		mov		dword ptr 0x54[eax],0x00000000
06C3  E8 00 00 00 00			call		CtrlHandlerIsNeeded_
06C8  85 C0				test		eax,eax
06CA  74 22				je		L$66
06CC  E8 00 00 00 00			call		KillCtrlHandler_
06D1  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
06D7  C7 40 78 02 00 00 00		mov		dword ptr 0x78[eax],0x00000002
06DE  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
06E4  C7 80 90 00 00 00 02 00 00 00
					mov		dword ptr 0x90[eax],0x00000002
06EE				L$66:
06EE  5A				pop		edx
06EF  C3				ret		

Routine Size: 79 bytes,    Routine Base: _TEXT + 06A1

No disassembly errors

Segment: CONST DWORD USE32 000001DA bytes
0000				L$67:
0000  72 65 61 64 20 66 72 6F 6D 00                   read from.
000A				L$68:
000A  77 72 69 74 74 65 6E 00                         written.
0012				L$69:
0012  54 68 65 20 69 6E 73 74 72 75 63 74 69 6F 6E 20 The instruction 
0022  61 74 20 25 30 38 6C 78 20 72 65 66 65 72 65 6E at %08lx referen
0032  63 65 64 20 6D 65 6D 6F 72 79 20 61 74 20 25 30 ced memory at %0
0042  38 6C 78 0A 54 68 65 20 6D 65 6D 6F 72 79 20 63 8lx.The memory c
0052  6F 75 6C 64 20 6E 6F 74 20 62 65 20 25 73 00    ould not be %s.
0061				L$70:
0061  41 6E 20 70 72 69 76 69 6C 65 67 65 64 20 69 6E An privileged in
0071  73 74 72 75 63 74 69 6F 6E 20 77 61 73 20 65 78 struction was ex
0081  65 63 75 74 65 64 20 61 74 20 61 64 64 72 65 73 ecuted at addres
0091  73 20 25 30 38 6C 78 00                         s %08lx.
0099				L$71:
0099  41 6E 20 69 6C 6C 65 67 61 6C 20 69 6E 73 74 72 An illegal instr
00A9  75 63 74 69 6F 6E 20 77 61 73 20 65 78 65 63 75 uction was execu
00B9  74 65 64 20 61 74 20 61 64 64 72 65 73 73 20 25 ted at address %
00C9  30 38 6C 78 00                                  08lx.
00CE				L$72:
00CE  41 6E 20 69 6E 74 65 67 65 72 20 64 69 76 69 64 An integer divid
00DE  65 20 62 79 20 7A 65 72 6F 20 77 61 73 20 65 6E e by zero was en
00EE  63 6F 75 6E 74 65 72 65 64 20 61 74 20 61 64 64 countered at add
00FE  72 65 73 73 20 25 30 38 6C 78 00                ress %08lx.
0109				L$73:
0109  41 20 73 74 61 63 6B 20 6F 76 65 72 66 6C 6F 77 A stack overflow
0119  20 77 61 73 20 65 6E 63 6F 75 6E 74 65 72 65 64  was encountered
0129  20 61 74 20 61 64 64 72 65 73 73 20 25 30 38 6C  at address %08l
0139  78 00                                           x.
013B				L$74:
013B  54 68 65 20 70 72 6F 67 72 61 6D 20 65 6E 63 6F The program enco
014B  75 6E 74 65 72 65 64 20 61 20 70 72 6F 62 6C 65 untered a proble
015B  6D 20 61 74 20 61 64 64 72 65 73 73 20 25 30 38 m at address %08
016B  6C 78 20 61 6E 64 20 63 61 6E 6E 6F 74 20 63 6F lx and cannot co
017B  6E 74 69 6E 75 65 00                            ntinue.
0182				L$75:
0182  75 73 65 72 33 32 2E 64 6C 6C 00                user32.dll.
018D				L$76:
018D  4D 65 73 73 61 67 65 42 6F 78 45 78 41 00       MessageBoxExA.
019B				L$77:
019B  41 70 70 6C 69 63 61 74 69 6F 6E 20 45 72 72 6F Application Erro
01AB  72 3A 20 00                                     r: .
01AF				L$78:
01AF  0A 0A 43 6C 69 63 6B 20 6F 6E 20 4F 4B 20 74 6F ..Click on OK to
01BF  20 74 65 72 6D 69 6E 61 74 65 20 74 68 65 20 61  terminate the a
01CF  70 70 6C 69 63 61 74 69 6F 6E 00                pplication.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000069 bytes
0000				_SignalTable:
0000  01 00 00 00 FF FF FF FF 02 00 00 00 FF FF FF FF ................
0010  01 00 00 00 FF FF FF FF 02 00 00 00 1D 00 00 C0 ................
0020  02 00 00 00 3A 01 00 C0 02 00 00 00 05 00 00 C0 ....:...........
0030  02 00 00 00 3A 01 00 C0 02 00 00 00 3A 01 00 C0 ....:.......:...
0040  01 00 00 00 FF FF FF FF 01 00 00 00 FF FF FF FF ................
0050  01 00 00 00 FF FF FF FF 02 00 00 00 94 00 00 C0 ................
0060  02 00 00 00 95 00 00 C0                         ........
0068				_CtrlHandlerRunning:
0068  00                                              .

Segment: _BSS DWORD USE32 00000001 bytes
0000				___ExceptionHandled:

BSS Size: 1 bytes

