Module: div386
GROUP: 'DGROUP' _DATA

Segment: _TEXT WORD USE32 00000206 bytes
0000				__FDD:
0000  09 DB				or		ebx,ebx
0002  75 0B				jne		L$2
0004  01 C9				add		ecx,ecx
0006  75 05				jne		L$1
0008  E9 00 00 00 00			jmp		F8DivZero
000D				L$1:
000D  D1 D9				rcr		ecx,0x01
000F				L$2:
000F  09 C0				or		eax,eax
0011  75 07				jne		L$4
0013  01 D2				add		edx,edx
0015  75 01				jne		L$3
0017  C3				ret		
0018				L$3:
0018  D1 DA				rcr		edx,0x01
001A				L$4:
001A  80 3D 00 00 00 00 00		cmp		byte ptr DGROUP:__real87,0x00
0021  74 30				je		L$8
0023  52				push		edx
0024  50				push		eax
0025  DD 04 24				fld		qword ptr [esp]
0028  51				push		ecx
0029  53				push		ebx
002A  F6 05 00 00 00 00 01		test		byte ptr DGROUP:__chipbug,0x01
0031  74 07				je		L$5
0033  E8 00 00 00 00			call		__fdiv_m64
0038  EB 06				jmp		L$6
003A				L$5:
003A  DC 34 24				fdiv		qword ptr [esp]
003D  83 C4 08				add		esp,0x00000008
0040				L$6:
0040  DD 1C 24				fstp		qword ptr [esp]
0043  9B				fwait		
0044  58				pop		eax
0045  5A				pop		edx
0046  81 FA 00 00 00 80			cmp		edx,0x80000000
004C  75 04				jne		L$7
004E  29 D2				sub		edx,edx
0050  89 D0				mov		eax,edx
0052				L$7:
0052  C3				ret		
0053				L$8:
0053  55				push		ebp
0054  89 E5				mov		ebp,esp
0056  57				push		edi
0057  56				push		esi
0058  89 D7				mov		edi,edx
005A  89 CE				mov		esi,ecx
005C  C1 FF 14				sar		edi,0x14
005F  C1 F9 14				sar		ecx,0x14
0062  81 E7 FF 07 00 80			and		edi,0x800007ff
0068  81 E1 FF 07 00 80			and		ecx,0x800007ff
006E  C1 C7 10				rol		edi,0x10
0071  C1 C1 10				rol		ecx,0x10
0074  66 01 CF				add		di,cx
0077  C1 C7 10				rol		edi,0x10
007A  C1 C1 10				rol		ecx,0x10
007D  81 E2 FF FF 0F 00			and		edx,0x000fffff
0083  81 E6 FF FF 0F 00			and		esi,0x000fffff
0089  66 09 FF				or		di,di
008C  74 08				je		L$9
008E  81 CA 00 00 10 00			or		edx,0x00100000
0094  EB 0E				jmp		L$10
0096				L$9:
0096  01 C0				add		eax,eax
0098  11 D2				adc		edx,edx
009A  66 4F				dec		di
009C  F7 C2 00 00 10 00			test		edx,0x00100000
00A2  74 F2				je		L$9
00A4				L$10:
00A4  66 09 C9				or		cx,cx
00A7  74 08				je		L$11
00A9  81 CE 00 00 10 00			or		esi,0x00100000
00AF  EB 0E				jmp		L$12
00B1				L$11:
00B1  01 DB				add		ebx,ebx
00B3  11 F6				adc		esi,esi
00B5  66 49				dec		cx
00B7  F7 C6 00 00 10 00			test		esi,0x00100000
00BD  74 F2				je		L$11
00BF				L$12:
00BF  66 29 CF				sub		di,cx
00C2  66 81 C7 FF 03			add		di,0x03ff
00C7  78 11				js		L$13
00C9  66 81 FF FF 07			cmp		di,0x07ff
00CE  72 0A				jb		L$13
00D0  89 C8				mov		eax,ecx
00D2  5E				pop		esi
00D3  5F				pop		edi
00D4  5D				pop		ebp
00D5  E9 00 00 00 00			jmp		F8OverFlow
00DA				L$13:
00DA  66 83 FF CC			cmp		di,0xffcc
00DE  7D 08				jge		L$14
00E0  5E				pop		esi
00E1  5F				pop		edi
00E2  5D				pop		ebp
00E3  E9 00 00 00 00			jmp		F8UnderFlow
00E8				L$14:
00E8  57				push		edi
00E9  B1 0B				mov		cl,0x0b
00EB  0F A5 C2				shld		edx,eax,cl
00EE  0F A5 E8				shld		eax,ebp,cl
00F1  25 00 F8 FF FF			and		eax,0xfffff800
00F6  0F A5 DE				shld		esi,ebx,cl
00F9  0F A5 EB				shld		ebx,ebp,cl
00FC  81 E3 00 F8 FF FF			and		ebx,0xfffff800
0102  56				push		esi
0103  53				push		ebx
0104  89 F1				mov		ecx,esi
0106  89 D7				mov		edi,edx
0108  89 C6				mov		esi,eax
010A  29 C0				sub		eax,eax
010C  39 D1				cmp		ecx,edx
010E  77 03				ja		L$15
0110  29 CA				sub		edx,ecx
0112  40				inc		eax
0113				L$15:
0113  50				push		eax
0114  89 F0				mov		eax,esi
0116  F7 F1				div		ecx
0118  50				push		eax
0119  93				xchg		eax,ebx
011A  F7 E3				mul		ebx
011C  91				xchg		eax,ecx
011D  87 D3				xchg		ebx,edx
011F  F7 E2				mul		edx
0121  01 D8				add		eax,ebx
0123  83 D2 00				adc		edx,0x00000000
0126  8B 5D EC				mov		ebx,dword ptr -0x14[ebp]
0129  F6 45 E8 01			test		byte ptr -0x18[ebp],0x01
012D  74 05				je		L$16
012F  01 D8				add		eax,ebx
0131  13 55 F0				adc		edx,dword ptr -0x10[ebp]
0134				L$16:
0134  F7 D9				neg		ecx
0136  19 C6				sbb		esi,eax
0138  19 D7				sbb		edi,edx
013A  74 12				je		L$18
013C				L$17:
013C  83 6D E4 01			sub		dword ptr -0x1c[ebp],0x00000001
0140  83 5D E8 00			sbb		dword ptr -0x18[ebp],0x00000000
0144  01 D9				add		ecx,ebx
0146  13 75 F0				adc		esi,dword ptr -0x10[ebp]
0149  83 D7 00				adc		edi,0x00000000
014C  75 EE				jne		L$17
014E				L$18:
014E  89 F7				mov		edi,esi
0150  89 CE				mov		esi,ecx
0152  8B 4D F0				mov		ecx,dword ptr -0x10[ebp]
0155  39 F9				cmp		ecx,edi
0157  77 0A				ja		L$19
0159  29 CF				sub		edi,ecx
015B  83 45 E4 01			add		dword ptr -0x1c[ebp],0x00000001
015F  83 55 E8 00			adc		dword ptr -0x18[ebp],0x00000000
0163				L$19:
0163  89 FA				mov		edx,edi
0165  89 F0				mov		eax,esi
0167  F7 F1				div		ecx
0169  50				push		eax
016A  09 C0				or		eax,eax
016C  74 2C				je		L$21
016E  93				xchg		eax,ebx
016F  F7 E3				mul		ebx
0171  91				xchg		eax,ecx
0172  87 D3				xchg		ebx,edx
0174  F7 E2				mul		edx
0176  01 D8				add		eax,ebx
0178  83 D2 00				adc		edx,0x00000000
017B  F7 D9				neg		ecx
017D  19 C6				sbb		esi,eax
017F  19 D7				sbb		edi,edx
0181  74 17				je		L$21
0183				L$20:
0183  83 6D E0 01			sub		dword ptr -0x20[ebp],0x00000001
0187  83 5D E4 00			sbb		dword ptr -0x1c[ebp],0x00000000
018B  83 5D E8 00			sbb		dword ptr -0x18[ebp],0x00000000
018F  03 4D EC				add		ecx,dword ptr -0x14[ebp]
0192  13 75 F0				adc		esi,dword ptr -0x10[ebp]
0195  83 D7 00				adc		edi,0x00000000
0198  75 E9				jne		L$20
019A				L$21:
019A  58				pop		eax
019B  5A				pop		edx
019C  5B				pop		ebx
019D  83 C4 08				add		esp,0x00000008
01A0  5F				pop		edi
01A1  66 4F				dec		di
01A3  D1 EB				shr		ebx,0x01
01A5  73 05				jae		L$22
01A7  D1 DA				rcr		edx,0x01
01A9  D1 D8				rcr		eax,0x01
01AB  47				inc		edi
01AC				L$22:
01AC  29 F6				sub		esi,esi
01AE  B1 0B				mov		cl,0x0b
01B0  0F AD D0				shrd		eax,edx,cl
01B3  D1 DE				rcr		esi,0x01
01B5  0F AD F2				shrd		edx,esi,cl
01B8  81 CA 00 00 F0 FF			or		edx,0xfff00000
01BE  01 F6				add		esi,esi
01C0  83 D0 00				adc		eax,0x00000000
01C3  83 D2 00				adc		edx,0x00000000
01C6  83 D7 00				adc		edi,0x00000000
01C9  66 09 FF				or		di,di
01CC  7F 1D				jg		L$25
01CE  75 04				jne		L$23
01D0  B1 01				mov		cl,0x01
01D2  EB 06				jmp		L$24
01D4				L$23:
01D4  66 F7 DF				neg		di
01D7  66 89 F9				mov		cx,di
01DA				L$24:
01DA  81 E2 FF FF 1F 00			and		edx,0x001fffff
01E0  29 DB				sub		ebx,ebx
01E2  0F AD D0				shrd		eax,edx,cl
01E5  0F AD DA				shrd		edx,ebx,cl
01E8  66 29 FF				sub		di,di
01EB				L$25:
01EB  81 E2 FF FF 0F 00			and		edx,0x000fffff
01F1  89 FE				mov		esi,edi
01F3  C1 CF 0B				ror		edi,0x0b
01F6  01 F6				add		esi,esi
01F8  D1 DF				rcr		edi,0x01
01FA  81 E7 00 00 F0 FF			and		edi,0xfff00000
0200  09 FA				or		edx,edi
0202  5E				pop		esi
0203  5F				pop		edi
0204  5D				pop		ebp
0205  C3				ret		

Routine Size: 518 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: _DATA DWORD USE32 00000000 bytes

