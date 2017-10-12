Module: chipd32
GROUP: 'DGROUP' DATA32,BSS32,CONST32,_DATA

Segment: _TEXT DWORD USE32 0000071C bytes
0000				fdiv_main_routine:
0000  DB 6C 24 10			fld		tbyte ptr 0x10[esp]
0004  DB 6C 24 04			fld		tbyte ptr 0x4[esp]
0008				L$1:
0008  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
000C  01 C0				add		eax,eax
000E  0F 83 86 00 00 00			jae		L$5
0014  35 00 00 00 0E			xor		eax,0x0e000000
0019  A9 00 00 00 0E			test		eax,0x0e000000
001E  74 03				je		L$2
0020  DE F9				fdivp		st(1),st
0022  C3				ret		
0023				L$2:
0023  C1 E8 1C				shr		eax,0x1c
0026  80 B8 00 00 00 00 00		cmp		byte ptr DGROUP:L$83[eax],0x00
002D  75 03				jne		L$3
002F  DE F9				fdivp		st(1),st
0031  C3				ret		
0032				L$3:
0032  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
0036  25 FF 7F 00 00			and		eax,0x00007fff
003B  74 67				je		L$6
003D  3D FF 7F 00 00			cmp		eax,0x00007fff
0042  74 60				je		L$6
0044  D9 7C 24 1C			fnstcw		word ptr 0x1c[esp]
0048  8B 44 24 1C			mov		eax,dword ptr 0x1c[esp]
004C  0D 3F 03 00 00			or		eax,0x0000033f
0051  25 FF F3 00 00			and		eax,0x0000f3ff
0056  89 44 24 20			mov		dword ptr 0x20[esp],eax
005A  D9 6C 24 20			fldcw		word ptr 0x20[esp]
005E  8B 44 24 18			mov		eax,dword ptr 0x18[esp]
0062  25 FF 7F 00 00			and		eax,0x00007fff
0067  83 F8 01				cmp		eax,0x00000001
006A  74 17				je		L$4
006C  D8 0D 10 00 00 00			fmul		dword ptr DGROUP:L$84
0072  D9 C9				fxch		st(1)
0074  D8 0D 10 00 00 00			fmul		dword ptr DGROUP:L$84
007A  D9 C9				fxch		st(1)
007C  D9 6C 24 1C			fldcw		word ptr 0x1c[esp]
0080  DE F9				fdivp		st(1),st
0082  C3				ret		
0083				L$4:
0083  D8 0D 14 00 00 00			fmul		dword ptr DGROUP:L$85
0089  D9 C9				fxch		st(1)
008B  D8 0D 14 00 00 00			fmul		dword ptr DGROUP:L$85
0091  D9 C9				fxch		st(1)
0093  D9 6C 24 1C			fldcw		word ptr 0x1c[esp]
0097  DE F9				fdivp		st(1),st
0099  C3				ret		
009A				L$5:
009A  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
009E  0B 44 24 08			or		eax,dword ptr 0x8[esp]
00A2  75 03				jne		L$7
00A4				L$6:
00A4  DE F9				fdivp		st(1),st
00A6  C3				ret		
00A7				L$7:
00A7  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
00AB  25 FF 7F 00 00			and		eax,0x00007fff
00B0  75 F2				jne		L$6
00B2  D9 7C 24 1C			fnstcw		word ptr 0x1c[esp]
00B6  8B 44 24 1C			mov		eax,dword ptr 0x1c[esp]
00BA  0D 3F 03 00 00			or		eax,0x0000033f
00BF  25 FF F3 00 00			and		eax,0x0000f3ff
00C4  89 44 24 20			mov		dword ptr 0x20[esp],eax
00C8  D9 6C 24 20			fldcw		word ptr 0x20[esp]
00CC  8B 44 24 18			mov		eax,dword ptr 0x18[esp]
00D0  25 FF 7F 00 00			and		eax,0x00007fff
00D5  74 11				je		L$8
00D7  3D FF 7F 00 00			cmp		eax,0x00007fff
00DC  74 32				je		L$10
00DE  8B 44 24 14			mov		eax,dword ptr 0x14[esp]
00E2  01 C0				add		eax,eax
00E4  73 2A				jae		L$10
00E6  EB 08				jmp		L$9
00E8				L$8:
00E8  8B 44 24 14			mov		eax,dword ptr 0x14[esp]
00EC  01 C0				add		eax,eax
00EE  72 20				jb		L$10
00F0				L$9:
00F0  D9 C9				fxch		st(1)
00F2  DD D8				fstp		st
00F4  D9 C0				fld		st
00F6  D8 0D 18 00 00 00			fmul		dword ptr DGROUP:L$86
00FC  DB 7C 24 04			fstp		tbyte ptr 0x4[esp]
0100  DB 6C 24 10			fld		tbyte ptr 0x10[esp]
0104  D9 C9				fxch		st(1)
0106  9B D9 6C 24 1C			fldcw		word ptr 0x1c[esp]
010B  E9 F8 FE FF FF			jmp		L$1
0110				L$10:
0110  D9 6C 24 1C			fldcw		word ptr 0x1c[esp]
0114  DE F9				fdivp		st(1),st
0116  C3				ret		

Routine Size: 279 bytes,    Routine Base: _TEXT + 0000

0117				__fdiv_fpr:
0117  83 EC 2C				sub		esp,0x0000002c
011A  FF 24 85 1C 00 00 00		jmp		dword ptr DGROUP:L$87[eax*4]
0121				L$11:
0121  D8 F0				fdiv		st,st
0123  83 C4 2C				add		esp,0x0000002c
0126  C3				ret		
0127				L$12:
0127  83 C4 2C				add		esp,0x0000002c
012A  CD 06				int		0x06
012C				L$13:
012C  D8 F8				fdivr		st,st
012E  83 C4 2C				add		esp,0x0000002c
0131  C3				ret		
0132				L$14:
0132  83 C4 2C				add		esp,0x0000002c
0135  CD 06				int		0x06
0137				L$15:
0137  D8 F0				fdiv		st,st
0139  83 C4 2C				add		esp,0x0000002c
013C  C3				ret		
013D				L$16:
013D  DE F8				fdivp		st,st
013F  83 C4 2C				add		esp,0x0000002c
0142  C3				ret		
0143				L$17:
0143  D8 F8				fdivr		st,st
0145  83 C4 2C				add		esp,0x0000002c
0148  C3				ret		
0149				L$18:
0149  DE F0				fdivrp		st,st
014B  83 C4 2C				add		esp,0x0000002c
014E  C3				ret		
014F				L$19:
014F  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
0153  D9 C0				fld		st
0155  DB 3C 24				fstp		tbyte ptr [esp]
0158  DB 7C 24 20			fstp		tbyte ptr 0x20[esp]
015C  E8 9F FE FF FF			call		fdiv_main_routine
0161  DB 6C 24 20			fld		tbyte ptr 0x20[esp]
0165  D9 C9				fxch		st(1)
0167  83 C4 2C				add		esp,0x0000002c
016A  C3				ret		
016B				L$20:
016B  83 C4 2C				add		esp,0x0000002c
016E  CD 06				int		0x06
0170				L$21:
0170  DB 3C 24				fstp		tbyte ptr [esp]
0173  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
0177  E8 84 FE FF FF			call		fdiv_main_routine
017C  DB 6C 24 0C			fld		tbyte ptr 0xc[esp]
0180  D9 C9				fxch		st(1)
0182  83 C4 2C				add		esp,0x0000002c
0185  C3				ret		
0186				L$22:
0186  83 C4 2C				add		esp,0x0000002c
0189  CD 06				int		0x06
018B				L$23:
018B  D9 C9				fxch		st(1)
018D  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
0191  D9 C0				fld		st
0193  DB 3C 24				fstp		tbyte ptr [esp]
0196  DB 7C 24 20			fstp		tbyte ptr 0x20[esp]
019A  E8 61 FE FF FF			call		fdiv_main_routine
019F  DB 6C 24 20			fld		tbyte ptr 0x20[esp]
01A3  83 C4 2C				add		esp,0x0000002c
01A6  C3				ret		
01A7				L$24:
01A7  DB 3C 24				fstp		tbyte ptr [esp]
01AA  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
01AE  E8 4D FE FF FF			call		fdiv_main_routine
01B3  83 C4 2C				add		esp,0x0000002c
01B6  C3				ret		
01B7				L$25:
01B7  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
01BB  DB 3C 24				fstp		tbyte ptr [esp]
01BE  E8 3D FE FF FF			call		fdiv_main_routine
01C3  DB 6C 24 0C			fld		tbyte ptr 0xc[esp]
01C7  83 C4 2C				add		esp,0x0000002c
01CA  C3				ret		
01CB				L$26:
01CB  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
01CF  DB 3C 24				fstp		tbyte ptr [esp]
01D2  E8 29 FE FF FF			call		fdiv_main_routine
01D7  83 C4 2C				add		esp,0x0000002c
01DA  C3				ret		
01DB				L$27:
01DB  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
01DF  D9 C9				fxch		st(1)
01E1  D9 C0				fld		st
01E3  DB 3C 24				fstp		tbyte ptr [esp]
01E6  DB 7C 24 20			fstp		tbyte ptr 0x20[esp]
01EA  E8 11 FE FF FF			call		fdiv_main_routine
01EF  D9 C9				fxch		st(1)
01F1  DB 6C 24 20			fld		tbyte ptr 0x20[esp]
01F5  D9 CA				fxch		st(2)
01F7  83 C4 2C				add		esp,0x0000002c
01FA  C3				ret		
01FB				L$28:
01FB  83 C4 2C				add		esp,0x0000002c
01FE  CD 06				int		0x06
0200				L$29:
0200  DB 3C 24				fstp		tbyte ptr [esp]
0203  D9 C9				fxch		st(1)
0205  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
0209  E8 F2 FD FF FF			call		fdiv_main_routine
020E  D9 C9				fxch		st(1)
0210  DB 6C 24 0C			fld		tbyte ptr 0xc[esp]
0214  D9 CA				fxch		st(2)
0216  83 C4 2C				add		esp,0x0000002c
0219  C3				ret		
021A				L$30:
021A  83 C4 2C				add		esp,0x0000002c
021D  CD 06				int		0x06
021F				L$31:
021F  D9 CA				fxch		st(2)
0221  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
0225  D9 C9				fxch		st(1)
0227  D9 C0				fld		st
0229  DB 3C 24				fstp		tbyte ptr [esp]
022C  DB 7C 24 20			fstp		tbyte ptr 0x20[esp]
0230  E8 CB FD FF FF			call		fdiv_main_routine
0235  D9 C9				fxch		st(1)
0237  DB 6C 24 20			fld		tbyte ptr 0x20[esp]
023B  83 C4 2C				add		esp,0x0000002c
023E  C3				ret		
023F				L$32:
023F  DB 3C 24				fstp		tbyte ptr [esp]
0242  D9 C9				fxch		st(1)
0244  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
0248  E8 B3 FD FF FF			call		fdiv_main_routine
024D  D9 C9				fxch		st(1)
024F  83 C4 2C				add		esp,0x0000002c
0252  C3				ret		
0253				L$33:
0253  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
0257  D9 C9				fxch		st(1)
0259  DB 3C 24				fstp		tbyte ptr [esp]
025C  E8 9F FD FF FF			call		fdiv_main_routine
0261  D9 C9				fxch		st(1)
0263  DB 6C 24 0C			fld		tbyte ptr 0xc[esp]
0267  83 C4 2C				add		esp,0x0000002c
026A  C3				ret		
026B				L$34:
026B  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
026F  D9 C9				fxch		st(1)
0271  DB 3C 24				fstp		tbyte ptr [esp]
0274  E8 87 FD FF FF			call		fdiv_main_routine
0279  D9 C9				fxch		st(1)
027B  83 C4 2C				add		esp,0x0000002c
027E  C3				ret		
027F				L$35:
027F  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
0283  D9 CA				fxch		st(2)
0285  D9 C0				fld		st
0287  DB 3C 24				fstp		tbyte ptr [esp]
028A  DB 7C 24 20			fstp		tbyte ptr 0x20[esp]
028E  E8 6D FD FF FF			call		fdiv_main_routine
0293  D9 CA				fxch		st(2)
0295  DB 6C 24 20			fld		tbyte ptr 0x20[esp]
0299  D9 CB				fxch		st(3)
029B  83 C4 2C				add		esp,0x0000002c
029E  C3				ret		
029F				L$36:
029F  83 C4 2C				add		esp,0x0000002c
02A2  CD 06				int		0x06
02A4				L$37:
02A4  DB 3C 24				fstp		tbyte ptr [esp]
02A7  D9 CA				fxch		st(2)
02A9  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
02AD  E8 4E FD FF FF			call		fdiv_main_routine
02B2  D9 CA				fxch		st(2)
02B4  DB 6C 24 0C			fld		tbyte ptr 0xc[esp]
02B8  D9 CB				fxch		st(3)
02BA  83 C4 2C				add		esp,0x0000002c
02BD  C3				ret		
02BE				L$38:
02BE  83 C4 2C				add		esp,0x0000002c
02C1  CD 06				int		0x06
02C3				L$39:
02C3  D9 CB				fxch		st(3)
02C5  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
02C9  D9 CA				fxch		st(2)
02CB  D9 C0				fld		st
02CD  DB 3C 24				fstp		tbyte ptr [esp]
02D0  DB 7C 24 20			fstp		tbyte ptr 0x20[esp]
02D4  E8 27 FD FF FF			call		fdiv_main_routine
02D9  D9 CA				fxch		st(2)
02DB  DB 6C 24 20			fld		tbyte ptr 0x20[esp]
02DF  83 C4 2C				add		esp,0x0000002c
02E2  C3				ret		
02E3				L$40:
02E3  DB 3C 24				fstp		tbyte ptr [esp]
02E6  D9 CA				fxch		st(2)
02E8  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
02EC  E8 0F FD FF FF			call		fdiv_main_routine
02F1  D9 CA				fxch		st(2)
02F3  83 C4 2C				add		esp,0x0000002c
02F6  C3				ret		
02F7				L$41:
02F7  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
02FB  D9 CA				fxch		st(2)
02FD  DB 3C 24				fstp		tbyte ptr [esp]
0300  E8 FB FC FF FF			call		fdiv_main_routine
0305  D9 CA				fxch		st(2)
0307  DB 6C 24 0C			fld		tbyte ptr 0xc[esp]
030B  83 C4 2C				add		esp,0x0000002c
030E  C3				ret		
030F				L$42:
030F  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
0313  D9 CA				fxch		st(2)
0315  DB 3C 24				fstp		tbyte ptr [esp]
0318  E8 E3 FC FF FF			call		fdiv_main_routine
031D  D9 CA				fxch		st(2)
031F  83 C4 2C				add		esp,0x0000002c
0322  C3				ret		
0323				L$43:
0323  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
0327  D9 CB				fxch		st(3)
0329  D9 C0				fld		st
032B  DB 3C 24				fstp		tbyte ptr [esp]
032E  DB 7C 24 20			fstp		tbyte ptr 0x20[esp]
0332  E8 C9 FC FF FF			call		fdiv_main_routine
0337  D9 CB				fxch		st(3)
0339  DB 6C 24 20			fld		tbyte ptr 0x20[esp]
033D  D9 CC				fxch		st(4)
033F  83 C4 2C				add		esp,0x0000002c
0342  C3				ret		
0343				L$44:
0343  83 C4 2C				add		esp,0x0000002c
0346  CD 06				int		0x06
0348				L$45:
0348  DB 3C 24				fstp		tbyte ptr [esp]
034B  D9 CB				fxch		st(3)
034D  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
0351  E8 AA FC FF FF			call		fdiv_main_routine
0356  D9 CB				fxch		st(3)
0358  DB 6C 24 0C			fld		tbyte ptr 0xc[esp]
035C  D9 CC				fxch		st(4)
035E  83 C4 2C				add		esp,0x0000002c
0361  C3				ret		
0362				L$46:
0362  83 C4 2C				add		esp,0x0000002c
0365  CD 06				int		0x06
0367				L$47:
0367  D9 CC				fxch		st(4)
0369  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
036D  D9 CB				fxch		st(3)
036F  D9 C0				fld		st
0371  DB 3C 24				fstp		tbyte ptr [esp]
0374  DB 7C 24 20			fstp		tbyte ptr 0x20[esp]
0378  E8 83 FC FF FF			call		fdiv_main_routine
037D  D9 CB				fxch		st(3)
037F  DB 6C 24 20			fld		tbyte ptr 0x20[esp]
0383  83 C4 2C				add		esp,0x0000002c
0386  C3				ret		
0387				L$48:
0387  DB 3C 24				fstp		tbyte ptr [esp]
038A  D9 CB				fxch		st(3)
038C  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
0390  E8 6B FC FF FF			call		fdiv_main_routine
0395  D9 CB				fxch		st(3)
0397  83 C4 2C				add		esp,0x0000002c
039A  C3				ret		
039B				L$49:
039B  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
039F  D9 CB				fxch		st(3)
03A1  DB 3C 24				fstp		tbyte ptr [esp]
03A4  E8 57 FC FF FF			call		fdiv_main_routine
03A9  D9 CB				fxch		st(3)
03AB  DB 6C 24 0C			fld		tbyte ptr 0xc[esp]
03AF  83 C4 2C				add		esp,0x0000002c
03B2  C3				ret		
03B3				L$50:
03B3  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
03B7  D9 CB				fxch		st(3)
03B9  DB 3C 24				fstp		tbyte ptr [esp]
03BC  E8 3F FC FF FF			call		fdiv_main_routine
03C1  D9 CB				fxch		st(3)
03C3  83 C4 2C				add		esp,0x0000002c
03C6  C3				ret		
03C7				L$51:
03C7  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
03CB  D9 CC				fxch		st(4)
03CD  D9 C0				fld		st
03CF  DB 3C 24				fstp		tbyte ptr [esp]
03D2  DB 7C 24 20			fstp		tbyte ptr 0x20[esp]
03D6  E8 25 FC FF FF			call		fdiv_main_routine
03DB  D9 CC				fxch		st(4)
03DD  DB 6C 24 20			fld		tbyte ptr 0x20[esp]
03E1  D9 CD				fxch		st(5)
03E3  83 C4 2C				add		esp,0x0000002c
03E6  C3				ret		
03E7				L$52:
03E7  83 C4 2C				add		esp,0x0000002c
03EA  CD 06				int		0x06
03EC				L$53:
03EC  DB 3C 24				fstp		tbyte ptr [esp]
03EF  D9 CC				fxch		st(4)
03F1  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
03F5  E8 06 FC FF FF			call		fdiv_main_routine
03FA  D9 CC				fxch		st(4)
03FC  DB 6C 24 0C			fld		tbyte ptr 0xc[esp]
0400  D9 CD				fxch		st(5)
0402  83 C4 2C				add		esp,0x0000002c
0405  C3				ret		
0406				L$54:
0406  83 C4 2C				add		esp,0x0000002c
0409  CD 06				int		0x06
040B				L$55:
040B  D9 CD				fxch		st(5)
040D  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
0411  D9 CC				fxch		st(4)
0413  D9 C0				fld		st
0415  DB 3C 24				fstp		tbyte ptr [esp]
0418  DB 7C 24 20			fstp		tbyte ptr 0x20[esp]
041C  E8 DF FB FF FF			call		fdiv_main_routine
0421  D9 CC				fxch		st(4)
0423  DB 6C 24 20			fld		tbyte ptr 0x20[esp]
0427  83 C4 2C				add		esp,0x0000002c
042A  C3				ret		
042B				L$56:
042B  DB 3C 24				fstp		tbyte ptr [esp]
042E  D9 CC				fxch		st(4)
0430  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
0434  E8 C7 FB FF FF			call		fdiv_main_routine
0439  D9 CC				fxch		st(4)
043B  83 C4 2C				add		esp,0x0000002c
043E  C3				ret		
043F				L$57:
043F  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
0443  D9 CC				fxch		st(4)
0445  DB 3C 24				fstp		tbyte ptr [esp]
0448  E8 B3 FB FF FF			call		fdiv_main_routine
044D  D9 CC				fxch		st(4)
044F  DB 6C 24 0C			fld		tbyte ptr 0xc[esp]
0453  83 C4 2C				add		esp,0x0000002c
0456  C3				ret		
0457				L$58:
0457  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
045B  D9 CC				fxch		st(4)
045D  DB 3C 24				fstp		tbyte ptr [esp]
0460  E8 9B FB FF FF			call		fdiv_main_routine
0465  D9 CC				fxch		st(4)
0467  83 C4 2C				add		esp,0x0000002c
046A  C3				ret		
046B				L$59:
046B  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
046F  D9 CD				fxch		st(5)
0471  D9 C0				fld		st
0473  DB 3C 24				fstp		tbyte ptr [esp]
0476  DB 7C 24 20			fstp		tbyte ptr 0x20[esp]
047A  E8 81 FB FF FF			call		fdiv_main_routine
047F  D9 CD				fxch		st(5)
0481  DB 6C 24 20			fld		tbyte ptr 0x20[esp]
0485  D9 CE				fxch		st(6)
0487  83 C4 2C				add		esp,0x0000002c
048A  C3				ret		
048B				L$60:
048B  83 C4 2C				add		esp,0x0000002c
048E  CD 06				int		0x06
0490				L$61:
0490  DB 3C 24				fstp		tbyte ptr [esp]
0493  D9 CD				fxch		st(5)
0495  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
0499  E8 62 FB FF FF			call		fdiv_main_routine
049E  D9 CD				fxch		st(5)
04A0  DB 6C 24 0C			fld		tbyte ptr 0xc[esp]
04A4  D9 CE				fxch		st(6)
04A6  83 C4 2C				add		esp,0x0000002c
04A9  C3				ret		
04AA				L$62:
04AA  83 C4 2C				add		esp,0x0000002c
04AD  CD 06				int		0x06
04AF				L$63:
04AF  D9 CE				fxch		st(6)
04B1  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
04B5  D9 CD				fxch		st(5)
04B7  D9 C0				fld		st
04B9  DB 3C 24				fstp		tbyte ptr [esp]
04BC  DB 7C 24 20			fstp		tbyte ptr 0x20[esp]
04C0  E8 3B FB FF FF			call		fdiv_main_routine
04C5  D9 CD				fxch		st(5)
04C7  DB 6C 24 20			fld		tbyte ptr 0x20[esp]
04CB  83 C4 2C				add		esp,0x0000002c
04CE  C3				ret		
04CF				L$64:
04CF  DB 3C 24				fstp		tbyte ptr [esp]
04D2  D9 CD				fxch		st(5)
04D4  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
04D8  E8 23 FB FF FF			call		fdiv_main_routine
04DD  D9 CD				fxch		st(5)
04DF  83 C4 2C				add		esp,0x0000002c
04E2  C3				ret		
04E3				L$65:
04E3  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
04E7  D9 CD				fxch		st(5)
04E9  DB 3C 24				fstp		tbyte ptr [esp]
04EC  E8 0F FB FF FF			call		fdiv_main_routine
04F1  D9 CD				fxch		st(5)
04F3  DB 6C 24 0C			fld		tbyte ptr 0xc[esp]
04F7  83 C4 2C				add		esp,0x0000002c
04FA  C3				ret		
04FB				L$66:
04FB  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
04FF  D9 CD				fxch		st(5)
0501  DB 3C 24				fstp		tbyte ptr [esp]
0504  E8 F7 FA FF FF			call		fdiv_main_routine
0509  D9 CD				fxch		st(5)
050B  83 C4 2C				add		esp,0x0000002c
050E  C3				ret		
050F				L$67:
050F  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
0513  D9 CE				fxch		st(6)
0515  D9 C0				fld		st
0517  DB 3C 24				fstp		tbyte ptr [esp]
051A  DB 7C 24 20			fstp		tbyte ptr 0x20[esp]
051E  E8 DD FA FF FF			call		fdiv_main_routine
0523  D9 CE				fxch		st(6)
0525  DB 6C 24 20			fld		tbyte ptr 0x20[esp]
0529  D9 CF				fxch		st(7)
052B  83 C4 2C				add		esp,0x0000002c
052E  C3				ret		
052F				L$68:
052F  83 C4 2C				add		esp,0x0000002c
0532  CD 06				int		0x06
0534				L$69:
0534  DB 3C 24				fstp		tbyte ptr [esp]
0537  D9 CE				fxch		st(6)
0539  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
053D  E8 BE FA FF FF			call		fdiv_main_routine
0542  D9 CE				fxch		st(6)
0544  DB 6C 24 0C			fld		tbyte ptr 0xc[esp]
0548  D9 CF				fxch		st(7)
054A  83 C4 2C				add		esp,0x0000002c
054D  C3				ret		
054E				L$70:
054E  83 C4 2C				add		esp,0x0000002c
0551  CD 06				int		0x06
0553				L$71:
0553  D9 CF				fxch		st(7)
0555  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
0559  D9 CE				fxch		st(6)
055B  D9 C0				fld		st
055D  DB 3C 24				fstp		tbyte ptr [esp]
0560  DB 7C 24 20			fstp		tbyte ptr 0x20[esp]
0564  E8 97 FA FF FF			call		fdiv_main_routine
0569  D9 CE				fxch		st(6)
056B  DB 6C 24 20			fld		tbyte ptr 0x20[esp]
056F  83 C4 2C				add		esp,0x0000002c
0572  C3				ret		
0573				L$72:
0573  DB 3C 24				fstp		tbyte ptr [esp]
0576  D9 CE				fxch		st(6)
0578  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
057C  E8 7F FA FF FF			call		fdiv_main_routine
0581  D9 CE				fxch		st(6)
0583  83 C4 2C				add		esp,0x0000002c
0586  C3				ret		
0587				L$73:
0587  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
058B  D9 CE				fxch		st(6)
058D  DB 3C 24				fstp		tbyte ptr [esp]
0590  E8 6B FA FF FF			call		fdiv_main_routine
0595  D9 CE				fxch		st(6)
0597  DB 6C 24 0C			fld		tbyte ptr 0xc[esp]
059B  83 C4 2C				add		esp,0x0000002c
059E  C3				ret		
059F				L$74:
059F  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
05A3  D9 CE				fxch		st(6)
05A5  DB 3C 24				fstp		tbyte ptr [esp]
05A8  E8 53 FA FF FF			call		fdiv_main_routine
05AD  D9 CE				fxch		st(6)
05AF  83 C4 2C				add		esp,0x0000002c
05B2  C3				ret		
05B3				__fdivp_sti_st:
05B3  83 EC 2C				sub		esp,0x0000002c
05B6  DB 3C 24				fstp		tbyte ptr [esp]
05B9  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
05BD  E8 3E FA FF FF			call		fdiv_main_routine
05C2  83 C4 2C				add		esp,0x0000002c
05C5  C3				ret		
05C6				__fdivrp_sti_st:
05C6  83 EC 2C				sub		esp,0x0000002c
05C9  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
05CD  DB 3C 24				fstp		tbyte ptr [esp]
05D0  E8 2B FA FF FF			call		fdiv_main_routine
05D5  83 C4 2C				add		esp,0x0000002c
05D8  C3				ret		

Routine Size: 1218 bytes,    Routine Base: _TEXT + 0117

05D9				__fdiv_chk:
05D9  83 EC 2C				sub		esp,0x0000002c
05DC  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
05E0  DB 3C 24				fstp		tbyte ptr [esp]
05E3  E8 18 FA FF FF			call		fdiv_main_routine
05E8  83 C4 2C				add		esp,0x0000002c
05EB  C3				ret		

Routine Size: 19 bytes,    Routine Base: _TEXT + 05D9

05EC				__fdiv_m32:
05EC  50				push		eax
05ED  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
05F1  25 00 00 80 7F			and		eax,0x7f800000
05F6  3D 00 00 80 7F			cmp		eax,0x7f800000
05FB  74 33				je		L$76
05FD  DF E0				fnstsw		ax
05FF  25 00 38 00 00			and		eax,0x00003800
0604  74 0D				je		L$75
0606  D9 44 24 08			fld		dword ptr 0x8[esp]
060A  E8 A4 FF FF FF			call		__fdivp_sti_st
060F  58				pop		eax
0610  C2 04 00				ret		0x0004
0613				L$75:
0613  D9 C9				fxch		st(1)
0615  83 EC 0C				sub		esp,0x0000000c
0618  DB 3C 24				fstp		tbyte ptr [esp]
061B  D9 44 24 14			fld		dword ptr 0x14[esp]
061F  E8 8F FF FF FF			call		__fdivp_sti_st
0624  DB 2C 24				fld		tbyte ptr [esp]
0627  D9 C9				fxch		st(1)
0629  83 C4 0C				add		esp,0x0000000c
062C  58				pop		eax
062D  C2 04 00				ret		0x0004
0630				L$76:
0630  D8 74 24 08			fdiv		dword ptr 0x8[esp]
0634  58				pop		eax
0635  C2 04 00				ret		0x0004

Routine Size: 76 bytes,    Routine Base: _TEXT + 05EC

0638				__fdiv_m64:
0638  50				push		eax
0639  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
063D  25 00 00 F0 7F			and		eax,0x7ff00000
0642  3D 00 00 F0 7F			cmp		eax,0x7ff00000
0647  74 33				je		L$78
0649  DF E0				fnstsw		ax
064B  25 00 38 00 00			and		eax,0x00003800
0650  74 0D				je		L$77
0652  DD 44 24 08			fld		qword ptr 0x8[esp]
0656  E8 58 FF FF FF			call		__fdivp_sti_st
065B  58				pop		eax
065C  C2 08 00				ret		0x0008
065F				L$77:
065F  D9 C9				fxch		st(1)
0661  83 EC 0C				sub		esp,0x0000000c
0664  DB 3C 24				fstp		tbyte ptr [esp]
0667  DD 44 24 14			fld		qword ptr 0x14[esp]
066B  E8 43 FF FF FF			call		__fdivp_sti_st
0670  DB 2C 24				fld		tbyte ptr [esp]
0673  D9 C9				fxch		st(1)
0675  83 C4 0C				add		esp,0x0000000c
0678  58				pop		eax
0679  C2 08 00				ret		0x0008
067C				L$78:
067C  DC 74 24 08			fdiv		qword ptr 0x8[esp]
0680  58				pop		eax
0681  C2 08 00				ret		0x0008

Routine Size: 76 bytes,    Routine Base: _TEXT + 0638

0684				__fdiv_m32r:
0684  50				push		eax
0685  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
0689  25 00 00 80 7F			and		eax,0x7f800000
068E  3D 00 00 80 7F			cmp		eax,0x7f800000
0693  74 33				je		L$80
0695  DF E0				fnstsw		ax
0697  25 00 38 00 00			and		eax,0x00003800
069C  74 0D				je		L$79
069E  D9 44 24 08			fld		dword ptr 0x8[esp]
06A2  E8 1F FF FF FF			call		__fdivrp_sti_st
06A7  58				pop		eax
06A8  C2 04 00				ret		0x0004
06AB				L$79:
06AB  D9 C9				fxch		st(1)
06AD  83 EC 0C				sub		esp,0x0000000c
06B0  DB 3C 24				fstp		tbyte ptr [esp]
06B3  D9 44 24 14			fld		dword ptr 0x14[esp]
06B7  E8 0A FF FF FF			call		__fdivrp_sti_st
06BC  DB 2C 24				fld		tbyte ptr [esp]
06BF  D9 C9				fxch		st(1)
06C1  83 C4 0C				add		esp,0x0000000c
06C4  58				pop		eax
06C5  C2 04 00				ret		0x0004
06C8				L$80:
06C8  D8 7C 24 08			fdivr		dword ptr 0x8[esp]
06CC  58				pop		eax
06CD  C2 04 00				ret		0x0004

Routine Size: 76 bytes,    Routine Base: _TEXT + 0684

06D0				__fdiv_m64r:
06D0  50				push		eax
06D1  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
06D5  25 00 00 F0 7F			and		eax,0x7ff00000
06DA  3D 00 00 F0 7F			cmp		eax,0x7ff00000
06DF  74 33				je		L$82
06E1  DF E0				fnstsw		ax
06E3  25 00 38 00 00			and		eax,0x00003800
06E8  74 0D				je		L$81
06EA  DD 44 24 08			fld		qword ptr 0x8[esp]
06EE  E8 D3 FE FF FF			call		__fdivrp_sti_st
06F3  58				pop		eax
06F4  C2 08 00				ret		0x0008
06F7				L$81:
06F7  D9 C9				fxch		st(1)
06F9  83 EC 0C				sub		esp,0x0000000c
06FC  DB 3C 24				fstp		tbyte ptr [esp]
06FF  DD 44 24 14			fld		qword ptr 0x14[esp]
0703  E8 BE FE FF FF			call		__fdivrp_sti_st
0708  DB 2C 24				fld		tbyte ptr [esp]
070B  D9 C9				fxch		st(1)
070D  83 C4 0C				add		esp,0x0000000c
0710  58				pop		eax
0711  C2 08 00				ret		0x0008
0714				L$82:
0714  DC 7C 24 08			fdivr		qword ptr 0x8[esp]
0718  58				pop		eax
0719  C2 08 00				ret		0x0008

Routine Size: 76 bytes,    Routine Base: _TEXT + 06D0

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes

Segment: DATA32 DWORD USE32 0000011C bytes
0000				L$83:
0000  00 01 00 00 04 00 00 07 00 00 0A 00 00 0D 00 00 ................
0010				L$84:
0010  00 00 70 3F                                     ..p?
0014				L$85:
0014  00 00 88 3F                                     ...?
0018				L$86:
0018  00 00 00 5F                                     ..._
001C				L$87:
001C  21 01 00 00                                     DD	offset L$11
0020  27 01 00 00                                     DD	offset L$12
0024  2C 01 00 00                                     DD	offset L$13
0028  32 01 00 00                                     DD	offset L$14
002C  37 01 00 00                                     DD	offset L$15
0030  3D 01 00 00                                     DD	offset L$16
0034  43 01 00 00                                     DD	offset L$17
0038  49 01 00 00                                     DD	offset L$18
003C  4F 01 00 00                                     DD	offset L$19
0040  6B 01 00 00                                     DD	offset L$20
0044  70 01 00 00                                     DD	offset L$21
0048  86 01 00 00                                     DD	offset L$22
004C  8B 01 00 00                                     DD	offset L$23
0050  A7 01 00 00                                     DD	offset L$24
0054  B7 01 00 00                                     DD	offset L$25
0058  CB 01 00 00                                     DD	offset L$26
005C  DB 01 00 00                                     DD	offset L$27
0060  FB 01 00 00                                     DD	offset L$28
0064  00 02 00 00                                     DD	offset L$29
0068  1A 02 00 00                                     DD	offset L$30
006C  1F 02 00 00                                     DD	offset L$31
0070  3F 02 00 00                                     DD	offset L$32
0074  53 02 00 00                                     DD	offset L$33
0078  6B 02 00 00                                     DD	offset L$34
007C  7F 02 00 00                                     DD	offset L$35
0080  9F 02 00 00                                     DD	offset L$36
0084  A4 02 00 00                                     DD	offset L$37
0088  BE 02 00 00                                     DD	offset L$38
008C  C3 02 00 00                                     DD	offset L$39
0090  E3 02 00 00                                     DD	offset L$40
0094  F7 02 00 00                                     DD	offset L$41
0098  0F 03 00 00                                     DD	offset L$42
009C  23 03 00 00                                     DD	offset L$43
00A0  43 03 00 00                                     DD	offset L$44
00A4  48 03 00 00                                     DD	offset L$45
00A8  62 03 00 00                                     DD	offset L$46
00AC  67 03 00 00                                     DD	offset L$47
00B0  87 03 00 00                                     DD	offset L$48
00B4  9B 03 00 00                                     DD	offset L$49
00B8  B3 03 00 00                                     DD	offset L$50
00BC  C7 03 00 00                                     DD	offset L$51
00C0  E7 03 00 00                                     DD	offset L$52
00C4  EC 03 00 00                                     DD	offset L$53
00C8  06 04 00 00                                     DD	offset L$54
00CC  0B 04 00 00                                     DD	offset L$55
00D0  2B 04 00 00                                     DD	offset L$56
00D4  3F 04 00 00                                     DD	offset L$57
00D8  57 04 00 00                                     DD	offset L$58
00DC  6B 04 00 00                                     DD	offset L$59
00E0  8B 04 00 00                                     DD	offset L$60
00E4  90 04 00 00                                     DD	offset L$61
00E8  AA 04 00 00                                     DD	offset L$62
00EC  AF 04 00 00                                     DD	offset L$63
00F0  CF 04 00 00                                     DD	offset L$64
00F4  E3 04 00 00                                     DD	offset L$65
00F8  FB 04 00 00                                     DD	offset L$66
00FC  0F 05 00 00                                     DD	offset L$67
0100  2F 05 00 00                                     DD	offset L$68
0104  34 05 00 00                                     DD	offset L$69
0108  4E 05 00 00                                     DD	offset L$70
010C  53 05 00 00                                     DD	offset L$71
0110  73 05 00 00                                     DD	offset L$72
0114  87 05 00 00                                     DD	offset L$73
0118  9F 05 00 00                                     DD	offset L$74

Segment: CONST32 DWORD USE32 00000000 bytes

Segment: BSS32 DWORD USE32 00000000 bytes

BSS Size: 0 bytes

