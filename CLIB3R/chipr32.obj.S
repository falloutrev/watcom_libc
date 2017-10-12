Module: chipr32
GROUP: 'DGROUP' DATA32,BSS32,CONST32,_DATA

Segment: _TEXT DWORD USE32 00000000 bytes

Routine Size: 0 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes

Segment: DATA32 DWORD USE32 00000042 bytes
0000				L$1:
0000  00 01 00 00 04 00 00 07 00 00 0A 00 00 0D 00 00 ................
0010  00 00 00 00 00 00 EE 3F                         .......?
0018				L$2:
0018  00 00 00 00 00 00 F0 43                         .......C
0020				L$3:
0020  00 00 00 00 00 00 F0 3B 00 00 00 00 00 00 F0 3F .......;.......?
0030				L$4:
0030  00 00 00 00 00 00 E0 3F                         .......?
0038				L$5:
0038  00 00 00 00 00 00 FF FF FE 7F                   ..........

Segment: CONST32 DWORD USE32 00000000 bytes

Segment: BSS32 DWORD USE32 00000000 bytes

BSS Size: 0 bytes

Segment: CODE32 DWORD USE32 00000573 bytes
0000				fprem_common:
0000  50				push		eax
0001  53				push		ebx
0002  51				push		ecx
0003  8B 44 24 16			mov		eax,dword ptr 0x16[esp]
0007  35 00 07 00 00			xor		eax,0x00000700
000C  A9 00 07 00 00			test		eax,0x00000700
0011  0F 85 83 01 00 00			jne		L$11
0017  C1 E8 0B				shr		eax,0x0b
001A  83 E0 0F				and		eax,0x0000000f
001D  80 B8 00 00 00 00 00		cmp		byte ptr DGROUP:L$1[eax],0x00
0024  0F 84 70 01 00 00			je		L$11
002A  8B 44 24 16			mov		eax,dword ptr 0x16[esp]
002E  25 00 00 FF 7F			and		eax,0x7fff0000
0033  3D 00 00 FF 7F			cmp		eax,0x7fff0000
0038  0F 84 5C 01 00 00			je		L$11
003E  8B 44 24 2E			mov		eax,dword ptr 0x2e[esp]
0042  25 00 00 FF 7F			and		eax,0x7fff0000
0047  0F 84 4D 01 00 00			je		L$11
004D  3D 00 00 FF 7F			cmp		eax,0x7fff0000
0052  0F 84 42 01 00 00			je		L$11
0058  8B 44 24 2C			mov		eax,dword ptr 0x2c[esp]
005C  01 C0				add		eax,eax
005E  0F 85 36 01 00 00			jne		L$11
0064  8B 44 24 14			mov		eax,dword ptr 0x14[esp]
0068  01 C0				add		eax,eax
006A  0F 85 2A 01 00 00			jne		L$11
0070  8B 44 24 18			mov		eax,dword ptr 0x18[esp]
0074  25 FF 7F 00 00			and		eax,0x00007fff
0079  83 C0 3F				add		eax,0x0000003f
007C  8B 5C 24 30			mov		ebx,dword ptr 0x30[esp]
0080  81 E3 FF 7F 00 00			and		ebx,0x00007fff
0086  29 C3				sub		ebx,eax
0088  77 5E				ja		L$7
008A				L$6:
008A  8B 44 24 18			mov		eax,dword ptr 0x18[esp]
008E  25 FF 7F 00 00			and		eax,0x00007fff
0093  83 C0 0A				add		eax,0x0000000a
0096  8B 5C 24 30			mov		ebx,dword ptr 0x30[esp]
009A  81 E3 FF 7F 00 00			and		ebx,0x00007fff
00A0  29 C3				sub		ebx,eax
00A2  0F 88 F2 00 00 00			js		L$11
00A8  DB 6C 24 28			fld		tbyte ptr 0x28[esp]
00AC  8B 44 24 18			mov		eax,dword ptr 0x18[esp]
00B0  8B 5C 24 30			mov		ebx,dword ptr 0x30[esp]
00B4  81 E3 FF 7F 00 00			and		ebx,0x00007fff
00BA  89 D9				mov		ecx,ebx
00BC  29 C3				sub		ebx,eax
00BE  83 E3 07				and		ebx,0x00000007
00C1  83 CB 04				or		ebx,0x00000004
00C4  29 D9				sub		ecx,ebx
00C6  89 C3				mov		ebx,eax
00C8  81 E3 00 80 00 00			and		ebx,0x00008000
00CE  09 D9				or		ecx,ebx
00D0  89 4C 24 18			mov		dword ptr 0x18[esp],ecx
00D4  DB 6C 24 10			fld		tbyte ptr 0x10[esp]
00D8  89 44 24 18			mov		dword ptr 0x18[esp],eax
00DC  D9 C9				fxch		st(1)
00DE  D9 F8				fprem		
00E0  DB 7C 24 28			fstp		tbyte ptr 0x28[esp]
00E4  DD D8				fstp		st
00E6  EB A2				jmp		L$6
00E8				L$7:
00E8  F7 C2 02 00 00 00			test		edx,0x00000002
00EE  75 08				jne		L$8
00F0  DB 6C 24 10			fld		tbyte ptr 0x10[esp]
00F4  DB 7C 24 1C			fstp		tbyte ptr 0x1c[esp]
00F8				L$8:
00F8  D9 7C 24 34			fnstcw		word ptr 0x34[esp]
00FC  8B 44 24 34			mov		eax,dword ptr 0x34[esp]
0100  0D 3F 03 00 00			or		eax,0x0000033f
0105  89 44 24 38			mov		dword ptr 0x38[esp],eax
0109  D9 6C 24 38			fldcw		word ptr 0x38[esp]
010D  8B 44 24 18			mov		eax,dword ptr 0x18[esp]
0111  25 FF 7F 00 00			and		eax,0x00007fff
0116  8B 5C 24 30			mov		ebx,dword ptr 0x30[esp]
011A  81 E3 FF 7F 00 00			and		ebx,0x00007fff
0120  29 C3				sub		ebx,eax
0122  83 E3 3F				and		ebx,0x0000003f
0125  83 CB 20				or		ebx,0x00000020
0128  83 C3 01				add		ebx,0x00000001
012B  89 D9				mov		ecx,ebx
012D  8B 44 24 18			mov		eax,dword ptr 0x18[esp]
0131  8B 5C 24 30			mov		ebx,dword ptr 0x30[esp]
0135  81 E3 FF 7F 00 00			and		ebx,0x00007fff
013B  25 00 80 00 00			and		eax,0x00008000
0140  09 C3				or		ebx,eax
0142  89 5C 24 18			mov		dword ptr 0x18[esp],ebx
0146  DB 6C 24 10			fld		tbyte ptr 0x10[esp]
014A  D9 E1				fabs		
014C  DB 6C 24 28			fld		tbyte ptr 0x28[esp]
0150  D9 E1				fabs		
0152				L$9:
0152  D8 D1				fcom		st(1)
0154  DF E0				fnstsw		ax
0156  25 00 01 00 00			and		eax,0x00000100
015B  75 02				jne		L$10
015D  D8 E1				fsub		st,st(1)
015F				L$10:
015F  D9 C9				fxch		st(1)
0161  DC 0D 30 00 00 00			fmul		qword ptr DGROUP:L$4
0167  D9 C9				fxch		st(1)
0169  83 E9 01				sub		ecx,0x00000001
016C  75 E4				jne		L$9
016E  8B 5C 24 30			mov		ebx,dword ptr 0x30[esp]
0172  DB 7C 24 28			fstp		tbyte ptr 0x28[esp]
0176  DD D8				fstp		st
0178  DB 6C 24 1C			fld		tbyte ptr 0x1c[esp]
017C  DB 2D 38 00 00 00			fld		tbyte ptr DGROUP:L$5
0182  D9 F8				fprem		
0184  DD D8				fstp		st
0186  DB 6C 24 28			fld		tbyte ptr 0x28[esp]
018A  D9 6C 24 34			fldcw		word ptr 0x34[esp]
018E  81 E3 00 80 00 00			and		ebx,0x00008000
0194  74 0E				je		L$12
0196  D9 E0				fchs		
0198  EB 0A				jmp		L$12
019A				L$11:
019A  DB 6C 24 10			fld		tbyte ptr 0x10[esp]
019E  DB 6C 24 28			fld		tbyte ptr 0x28[esp]
01A2  D9 F8				fprem		
01A4				L$12:
01A4  F7 C2 03 00 00 00			test		edx,0x00000003
01AA  74 56				je		L$14
01AC  DD 7C 24 3C			fnstsw		word ptr 0x3c[esp]
01B0  F7 C2 01 00 00 00			test		edx,0x00000001
01B6  74 1F				je		L$13
01B8  D9 7C 24 34			fnstcw		word ptr 0x34[esp]
01BC  8B 44 24 34			mov		eax,dword ptr 0x34[esp]
01C0  0D 00 03 00 00			or		eax,0x00000300
01C5  89 44 24 38			mov		dword ptr 0x38[esp],eax
01C9  D9 6C 24 38			fldcw		word ptr 0x38[esp]
01CD  DC 0D 20 00 00 00			fmul		qword ptr DGROUP:L$3
01D3  D9 6C 24 34			fldcw		word ptr 0x34[esp]
01D7				L$13:
01D7  8B 44 24 3C			mov		eax,dword ptr 0x3c[esp]
01DB  D9 C9				fxch		st(1)
01DD  DD D8				fstp		st
01DF  DB 6C 24 1C			fld		tbyte ptr 0x1c[esp]
01E3  D9 C9				fxch		st(1)
01E5  25 00 43 00 00			and		eax,0x00004300
01EA  83 EC 1C				sub		esp,0x0000001c
01ED  D9 34 24				fnstenv		[esp]
01F0  81 64 24 04 FF BC 00 00		and		dword ptr 0x4[esp],0x0000bcff
01F8  09 44 24 04			or		dword ptr 0x4[esp],eax
01FC  D9 24 24				fldenv		[esp]
01FF  83 C4 1C				add		esp,0x0000001c
0202				L$14:
0202  59				pop		ecx
0203  5B				pop		ebx
0204  58				pop		eax
0205  C3				ret		

Routine Size: 518 bytes,    Routine Base: CODE32 + 0000

0206				__fprem_chk:
0206  52				push		edx
0207  83 EC 30				sub		esp,0x00000030
020A  DB 7C 24 18			fstp		tbyte ptr 0x18[esp]
020E  DB 3C 24				fstp		tbyte ptr [esp]
0211  31 D2				xor		edx,edx
0213  8B 44 24 06			mov		eax,dword ptr 0x6[esp]
0217  A9 00 00 FF 7F			test		eax,0x7fff0000
021C  74 0A				je		L$15
021E  E8 DD FD FF FF			call		fprem_common
0223  83 C4 30				add		esp,0x00000030
0226  5A				pop		edx
0227  C3				ret		
0228				L$15:
0228  DB 2C 24				fld		tbyte ptr [esp]
022B  DB 6C 24 18			fld		tbyte ptr 0x18[esp]
022F  8B 04 24				mov		eax,dword ptr [esp]
0232  0B 44 24 04			or		eax,dword ptr 0x4[esp]
0236  74 79				je		L$18
0238  D9 C9				fxch		st(1)
023A  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
023E  DB 2C 24				fld		tbyte ptr [esp]
0241  D9 C9				fxch		st(1)
0243  83 CA 02				or		edx,0x00000002
0246  D9 7C 24 24			fnstcw		word ptr 0x24[esp]
024A  8B 44 24 24			mov		eax,dword ptr 0x24[esp]
024E  0D 3F 03 00 00			or		eax,0x0000033f
0253  89 44 24 28			mov		dword ptr 0x28[esp],eax
0257  D9 6C 24 28			fldcw		word ptr 0x28[esp]
025B  8B 44 24 20			mov		eax,dword ptr 0x20[esp]
025F  25 FF 7F 00 00			and		eax,0x00007fff
0264  3D BE 7F 00 00			cmp		eax,0x00007fbe
0269  77 18				ja		L$16
026B  83 CA 01				or		edx,0x00000001
026E  DC 0D 18 00 00 00			fmul		qword ptr DGROUP:L$2
0274  DB 7C 24 18			fstp		tbyte ptr 0x18[esp]
0278  DC 0D 18 00 00 00			fmul		qword ptr DGROUP:L$2
027E  DB 3C 24				fstp		tbyte ptr [esp]
0281  EB 20				jmp		L$17
0283				L$16:
0283  D9 7C 24 24			fnstcw		word ptr 0x24[esp]
0287  8B 44 24 24			mov		eax,dword ptr 0x24[esp]
028B  0D 00 03 00 00			or		eax,0x00000300
0290  89 44 24 28			mov		dword ptr 0x28[esp],eax
0294  D9 6C 24 28			fldcw		word ptr 0x28[esp]
0298  DD D8				fstp		st
029A  DC 0D 18 00 00 00			fmul		qword ptr DGROUP:L$2
02A0  DB 3C 24				fstp		tbyte ptr [esp]
02A3				L$17:
02A3  D9 6C 24 24			fldcw		word ptr 0x24[esp]
02A7  E8 54 FD FF FF			call		fprem_common
02AC  83 C4 30				add		esp,0x00000030
02AF  5A				pop		edx
02B0  C3				ret		
02B1				L$18:
02B1  D9 F8				fprem		
02B3  83 C4 30				add		esp,0x00000030
02B6  5A				pop		edx
02B7  C3				ret		
02B8				fprem1_common:
02B8  50				push		eax
02B9  53				push		ebx
02BA  51				push		ecx
02BB  8B 44 24 16			mov		eax,dword ptr 0x16[esp]
02BF  35 00 07 00 00			xor		eax,0x00000700
02C4  A9 00 07 00 00			test		eax,0x00000700
02C9  0F 85 83 01 00 00			jne		L$24
02CF  C1 E8 0B				shr		eax,0x0b
02D2  83 E0 0F				and		eax,0x0000000f
02D5  80 B8 00 00 00 00 00		cmp		byte ptr DGROUP:L$1[eax],0x00
02DC  0F 84 70 01 00 00			je		L$24
02E2  8B 44 24 16			mov		eax,dword ptr 0x16[esp]
02E6  25 00 00 FF 7F			and		eax,0x7fff0000
02EB  3D 00 00 FF 7F			cmp		eax,0x7fff0000
02F0  0F 84 5C 01 00 00			je		L$24
02F6  8B 44 24 2E			mov		eax,dword ptr 0x2e[esp]
02FA  25 00 00 FF 7F			and		eax,0x7fff0000
02FF  0F 84 4D 01 00 00			je		L$24
0305  3D 00 00 FF 7F			cmp		eax,0x7fff0000
030A  0F 84 42 01 00 00			je		L$24
0310  8B 44 24 2C			mov		eax,dword ptr 0x2c[esp]
0314  01 C0				add		eax,eax
0316  0F 85 36 01 00 00			jne		L$24
031C  8B 44 24 14			mov		eax,dword ptr 0x14[esp]
0320  01 C0				add		eax,eax
0322  0F 85 2A 01 00 00			jne		L$24
0328  8B 44 24 18			mov		eax,dword ptr 0x18[esp]
032C  25 FF 7F 00 00			and		eax,0x00007fff
0331  83 C0 3F				add		eax,0x0000003f
0334  8B 5C 24 30			mov		ebx,dword ptr 0x30[esp]
0338  81 E3 FF 7F 00 00			and		ebx,0x00007fff
033E  29 C3				sub		ebx,eax
0340  77 5E				ja		L$20
0342				L$19:
0342  8B 44 24 18			mov		eax,dword ptr 0x18[esp]
0346  25 FF 7F 00 00			and		eax,0x00007fff
034B  83 C0 0A				add		eax,0x0000000a
034E  8B 5C 24 30			mov		ebx,dword ptr 0x30[esp]
0352  81 E3 FF 7F 00 00			and		ebx,0x00007fff
0358  29 C3				sub		ebx,eax
035A  0F 88 F2 00 00 00			js		L$24
0360  DB 6C 24 28			fld		tbyte ptr 0x28[esp]
0364  8B 44 24 18			mov		eax,dword ptr 0x18[esp]
0368  8B 5C 24 30			mov		ebx,dword ptr 0x30[esp]
036C  81 E3 FF 7F 00 00			and		ebx,0x00007fff
0372  89 D9				mov		ecx,ebx
0374  29 C3				sub		ebx,eax
0376  83 E3 07				and		ebx,0x00000007
0379  83 CB 04				or		ebx,0x00000004
037C  29 D9				sub		ecx,ebx
037E  89 C3				mov		ebx,eax
0380  81 E3 00 80 00 00			and		ebx,0x00008000
0386  09 D9				or		ecx,ebx
0388  89 4C 24 18			mov		dword ptr 0x18[esp],ecx
038C  DB 6C 24 10			fld		tbyte ptr 0x10[esp]
0390  89 44 24 18			mov		dword ptr 0x18[esp],eax
0394  D9 C9				fxch		st(1)
0396  D9 F8				fprem		
0398  DB 7C 24 28			fstp		tbyte ptr 0x28[esp]
039C  DD D8				fstp		st
039E  EB A2				jmp		L$19
03A0				L$20:
03A0  F7 C3 02 00 00 00			test		ebx,0x00000002
03A6  75 08				jne		L$21
03A8  DB 6C 24 10			fld		tbyte ptr 0x10[esp]
03AC  DB 7C 24 1C			fstp		tbyte ptr 0x1c[esp]
03B0				L$21:
03B0  D9 7C 24 34			fnstcw		word ptr 0x34[esp]
03B4  8B 44 24 34			mov		eax,dword ptr 0x34[esp]
03B8  0D 3F 03 00 00			or		eax,0x0000033f
03BD  89 44 24 38			mov		dword ptr 0x38[esp],eax
03C1  D9 6C 24 38			fldcw		word ptr 0x38[esp]
03C5  8B 44 24 18			mov		eax,dword ptr 0x18[esp]
03C9  25 FF 7F 00 00			and		eax,0x00007fff
03CE  8B 5C 24 30			mov		ebx,dword ptr 0x30[esp]
03D2  81 E3 FF 7F 00 00			and		ebx,0x00007fff
03D8  29 C3				sub		ebx,eax
03DA  83 E3 3F				and		ebx,0x0000003f
03DD  83 CB 20				or		ebx,0x00000020
03E0  83 C3 01				add		ebx,0x00000001
03E3  89 D9				mov		ecx,ebx
03E5  8B 44 24 18			mov		eax,dword ptr 0x18[esp]
03E9  8B 5C 24 30			mov		ebx,dword ptr 0x30[esp]
03ED  81 E3 FF 7F 00 00			and		ebx,0x00007fff
03F3  25 00 80 00 00			and		eax,0x00008000
03F8  09 C3				or		ebx,eax
03FA  89 5C 24 18			mov		dword ptr 0x18[esp],ebx
03FE  DB 6C 24 10			fld		tbyte ptr 0x10[esp]
0402  D9 E1				fabs		
0404  DB 6C 24 28			fld		tbyte ptr 0x28[esp]
0408  D9 E1				fabs		
040A				L$22:
040A  D8 D1				fcom		st(1)
040C  DF E0				fnstsw		ax
040E  25 00 01 00 00			and		eax,0x00000100
0413  75 02				jne		L$23
0415  D8 E1				fsub		st,st(1)
0417				L$23:
0417  D9 C9				fxch		st(1)
0419  DC 0D 30 00 00 00			fmul		qword ptr DGROUP:L$4
041F  D9 C9				fxch		st(1)
0421  83 E9 01				sub		ecx,0x00000001
0424  75 E4				jne		L$22
0426  8B 5C 24 30			mov		ebx,dword ptr 0x30[esp]
042A  DB 7C 24 28			fstp		tbyte ptr 0x28[esp]
042E  DD D8				fstp		st
0430  DB 6C 24 1C			fld		tbyte ptr 0x1c[esp]
0434  DB 2D 38 00 00 00			fld		tbyte ptr DGROUP:L$5
043A  D9 F5				fprem1		
043C  DD D8				fstp		st
043E  DB 6C 24 28			fld		tbyte ptr 0x28[esp]
0442  D9 6C 24 34			fldcw		word ptr 0x34[esp]
0446  81 E3 00 80 00 00			and		ebx,0x00008000
044C  74 0E				je		L$25
044E  D9 E0				fchs		
0450  EB 0A				jmp		L$25
0452				L$24:
0452  DB 6C 24 10			fld		tbyte ptr 0x10[esp]
0456  DB 6C 24 28			fld		tbyte ptr 0x28[esp]
045A  D9 F5				fprem1		
045C				L$25:
045C  F7 C2 03 00 00 00			test		edx,0x00000003
0462  74 56				je		L$27
0464  DD 7C 24 3C			fnstsw		word ptr 0x3c[esp]
0468  F7 C2 01 00 00 00			test		edx,0x00000001
046E  74 1F				je		L$26
0470  D9 7C 24 34			fnstcw		word ptr 0x34[esp]
0474  8B 44 24 34			mov		eax,dword ptr 0x34[esp]
0478  0D 00 03 00 00			or		eax,0x00000300
047D  89 44 24 38			mov		dword ptr 0x38[esp],eax
0481  D9 6C 24 38			fldcw		word ptr 0x38[esp]
0485  DC 0D 20 00 00 00			fmul		qword ptr DGROUP:L$3
048B  D9 6C 24 34			fldcw		word ptr 0x34[esp]
048F				L$26:
048F  8B 44 24 3C			mov		eax,dword ptr 0x3c[esp]
0493  D9 C9				fxch		st(1)
0495  DD D8				fstp		st
0497  DB 6C 24 1C			fld		tbyte ptr 0x1c[esp]
049B  D9 C9				fxch		st(1)
049D  25 00 43 00 00			and		eax,0x00004300
04A2  83 EC 1C				sub		esp,0x0000001c
04A5  D9 34 24				fnstenv		[esp]
04A8  81 64 24 04 FF BC 00 00		and		dword ptr 0x4[esp],0x0000bcff
04B0  09 44 24 04			or		dword ptr 0x4[esp],eax
04B4  D9 24 24				fldenv		[esp]
04B7  83 C4 1C				add		esp,0x0000001c
04BA				L$27:
04BA  59				pop		ecx
04BB  5B				pop		ebx
04BC  58				pop		eax
04BD  C3				ret		

Routine Size: 696 bytes,    Routine Base: CODE32 + 0206

04BE				__fprem1_chk:
04BE  52				push		edx
04BF  83 EC 30				sub		esp,0x00000030
04C2  DB 7C 24 18			fstp		tbyte ptr 0x18[esp]
04C6  DB 3C 24				fstp		tbyte ptr [esp]
04C9  BA 00 00 00 00			mov		edx,0x00000000
04CE  8B 44 24 06			mov		eax,dword ptr 0x6[esp]
04D2  A9 00 00 FF 7F			test		eax,0x7fff0000
04D7  74 0A				je		L$28
04D9  E8 DA FD FF FF			call		fprem1_common
04DE  83 C4 30				add		esp,0x00000030
04E1  5A				pop		edx
04E2  C3				ret		
04E3				L$28:
04E3  DB 2C 24				fld		tbyte ptr [esp]
04E6  DB 6C 24 18			fld		tbyte ptr 0x18[esp]
04EA  8B 04 24				mov		eax,dword ptr [esp]
04ED  0B 44 24 04			or		eax,dword ptr 0x4[esp]
04F1  74 79				je		L$31
04F3  D9 C9				fxch		st(1)
04F5  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
04F9  DB 2C 24				fld		tbyte ptr [esp]
04FC  D9 C9				fxch		st(1)
04FE  83 CA 02				or		edx,0x00000002
0501  D9 7C 24 24			fnstcw		word ptr 0x24[esp]
0505  8B 44 24 24			mov		eax,dword ptr 0x24[esp]
0509  0D 3F 03 00 00			or		eax,0x0000033f
050E  89 44 24 28			mov		dword ptr 0x28[esp],eax
0512  D9 6C 24 28			fldcw		word ptr 0x28[esp]
0516  8B 44 24 20			mov		eax,dword ptr 0x20[esp]
051A  25 FF 7F 00 00			and		eax,0x00007fff
051F  3D BE 7F 00 00			cmp		eax,0x00007fbe
0524  77 18				ja		L$29
0526  83 CA 01				or		edx,0x00000001
0529  DC 0D 18 00 00 00			fmul		qword ptr DGROUP:L$2
052F  DB 7C 24 18			fstp		tbyte ptr 0x18[esp]
0533  DC 0D 18 00 00 00			fmul		qword ptr DGROUP:L$2
0539  DB 3C 24				fstp		tbyte ptr [esp]
053C  EB 20				jmp		L$30
053E				L$29:
053E  D9 7C 24 24			fnstcw		word ptr 0x24[esp]
0542  8B 44 24 24			mov		eax,dword ptr 0x24[esp]
0546  0D 00 03 00 00			or		eax,0x00000300
054B  89 44 24 28			mov		dword ptr 0x28[esp],eax
054F  D9 6C 24 28			fldcw		word ptr 0x28[esp]
0553  DD D8				fstp		st
0555  DC 0D 18 00 00 00			fmul		qword ptr DGROUP:L$2
055B  DB 3C 24				fstp		tbyte ptr [esp]
055E				L$30:
055E  D9 6C 24 24			fldcw		word ptr 0x24[esp]
0562  E8 51 FD FF FF			call		fprem1_common
0567  83 C4 30				add		esp,0x00000030
056A  5A				pop		edx
056B  C3				ret		
056C				L$31:
056C  D9 F8				fprem		
056E  83 C4 30				add		esp,0x00000030
0571  5A				pop		edx
0572  C3				ret		

Routine Size: 181 bytes,    Routine Base: CODE32 + 04BE

No disassembly errors

