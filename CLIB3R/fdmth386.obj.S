Module: fdmth386
GROUP: 'DGROUP' _DATA

Segment: _TEXT WORD USE32 0000035A bytes
0000				__FDS:
0000  81 F1 00 00 00 80			xor		ecx,0x80000000

Routine Size: 6 bytes,    Routine Base: _TEXT + 0000

0006				__FDA:
0006  09 DB				or		ebx,ebx
0008  75 06				jne		L$1
000A  01 C9				add		ecx,ecx
000C  74 0E				je		L$2
000E  D1 D9				rcr		ecx,0x01
0010				L$1:
0010  09 C0				or		eax,eax
0012  75 0B				jne		L$4
0014  01 D2				add		edx,edx
0016  75 05				jne		L$3
0018  89 CA				mov		edx,ecx
001A  89 D8				mov		eax,ebx
001C				L$2:
001C  C3				ret		
001D				L$3:
001D  D1 DA				rcr		edx,0x01
001F				L$4:
001F  80 3D 00 00 00 00 00		cmp		byte ptr DGROUP:__real87,0x00
0026  74 21				je		L$7
0028  52				push		edx
0029  50				push		eax
002A  DD 04 24				fld		qword ptr [esp]
002D  51				push		ecx
002E  53				push		ebx
002F  DC 04 24				fadd		qword ptr [esp]
0032				L$5:
0032  DD 5C 24 08			fstp		qword ptr 0x8[esp]
0036  83 C4 08				add		esp,0x00000008
0039  9B				fwait		
003A  58				pop		eax
003B  5A				pop		edx
003C  81 FA 00 00 00 80			cmp		edx,0x80000000
0042  75 04				jne		L$6
0044  29 D2				sub		edx,edx
0046  89 D0				mov		eax,edx
0048				L$6:
0048  C3				ret		
0049				L$7:
0049  55				push		ebp
004A  57				push		edi
004B  56				push		esi
004C  89 D7				mov		edi,edx
004E  89 CE				mov		esi,ecx
0050  C1 FF 14				sar		edi,0x14
0053  C1 F9 14				sar		ecx,0x14
0056  81 E7 FF 07 00 80			and		edi,0x800007ff
005C  81 E1 FF 07 00 80			and		ecx,0x800007ff
0062  89 CD				mov		ebp,ecx
0064  C1 C7 10				rol		edi,0x10
0067  C1 C1 10				rol		ecx,0x10
006A  66 01 F9				add		cx,di
006D  C1 C7 10				rol		edi,0x10
0070  C1 C1 10				rol		ecx,0x10
0073  81 E2 FF FF 0F 00			and		edx,0x000fffff
0079  81 E6 FF FF 0F 00			and		esi,0x000fffff
007F  66 09 FF				or		di,di
0082  74 06				je		L$8
0084  81 CA 00 00 10 00			or		edx,0x00100000
008A				L$8:
008A  66 09 C9				or		cx,cx
008D  74 06				je		L$9
008F  81 CE 00 00 10 00			or		esi,0x00100000
0095				L$9:
0095  01 C0				add		eax,eax
0097  11 D2				adc		edx,edx
0099  01 DB				add		ebx,ebx
009B  11 F6				adc		esi,esi
009D  66 29 F9				sub		cx,di
00A0  74 2F				je		L$11
00A2  73 08				jae		L$10
00A4  89 FD				mov		ebp,edi
00A6  66 F7 D9				neg		cx
00A9  93				xchg		eax,ebx
00AA  87 F2				xchg		edx,esi
00AC				L$10:
00AC  66 83 F9 36			cmp		cx,0x0036
00B0  76 1F				jbe		L$11
00B2  89 F2				mov		edx,esi
00B4  89 D8				mov		eax,ebx
00B6  01 ED				add		ebp,ebp
00B8  D1 DA				rcr		edx,0x01
00BA  D1 D8				rcr		eax,0x01
00BC  81 E2 FF FF 0F 80			and		edx,0x800fffff
00C2  C1 CD 0D				ror		ebp,0x0d
00C5  81 E5 00 00 F0 7F			and		ebp,0x7ff00000
00CB  09 EA				or		edx,ebp
00CD  5E				pop		esi
00CE  5F				pop		edi
00CF  5D				pop		ebp
00D0  C3				ret		
00D1				L$11:
00D1  09 C9				or		ecx,ecx
00D3  79 0D				jns		L$12
00D5  F7 DE				neg		esi
00D7  F7 DB				neg		ebx
00D9  83 DE 00				sbb		esi,0x00000000
00DC  81 F5 00 00 00 80			xor		ebp,0x80000000
00E2				L$12:
00E2  29 FF				sub		edi,edi
00E4  80 F9 00				cmp		cl,0x00
00E7  74 23				je		L$14
00E9  53				push		ebx
00EA  29 DB				sub		ebx,ebx
00EC  80 F9 20				cmp		cl,0x20
00EF  72 0D				jb		L$13
00F1  09 C0				or		eax,eax
00F3  0F 95 C3				setne		bl
00F6  89 DF				mov		edi,ebx
00F8  29 DB				sub		ebx,ebx
00FA  89 D0				mov		eax,edx
00FC  29 D2				sub		edx,edx
00FE				L$13:
00FE  0F AD C3				shrd		ebx,eax,cl
0101  09 DF				or		edi,ebx
0103  29 DB				sub		ebx,ebx
0105  0F AD D0				shrd		eax,edx,cl
0108  0F AD DA				shrd		edx,ebx,cl
010B  5B				pop		ebx
010C				L$14:
010C  01 D8				add		eax,ebx
010E  11 F2				adc		edx,esi
0110  79 23				jns		L$16
0112  80 F9 35				cmp		cl,0x35
0115  72 11				jb		L$15
0117  F7 C7 FF FF FF 7F			test		edi,0x7fffffff
011D  0F 95 C3				setne		bl
0120  D1 EB				shr		ebx,0x01
0122  83 D0 00				adc		eax,0x00000000
0125  83 D2 00				adc		edx,0x00000000
0128				L$15:
0128  F7 DA				neg		edx
012A  F7 D8				neg		eax
012C  83 DA 00				sbb		edx,0x00000000
012F  81 F5 00 00 00 80			xor		ebp,0x80000000
0135				L$16:
0135  89 C3				mov		ebx,eax
0137  09 D3				or		ebx,edx
0139  74 6A				je		L$21
013B  66 09 ED				or		bp,bp
013E  74 69				je		L$22
0140				L$17:
0140  F7 C2 00 00 E0 7F			test		edx,0x7fe00000
0146  75 0A				jne		L$18
0148  66 4D				dec		bp
014A  74 5D				je		L$22
014C  01 C0				add		eax,eax
014E  11 D2				adc		edx,edx
0150  EB EE				jmp		L$17
0152				L$18:
0152  F7 C2 00 00 40 00			test		edx,0x00400000
0158  74 10				je		L$19
015A  D1 EA				shr		edx,0x01
015C  D1 D8				rcr		eax,0x01
015E  83 D7 00				adc		edi,0x00000000
0161  66 45				inc		bp
0163  66 81 FD FF 07			cmp		bp,0x07ff
0168  74 49				je		L$23
016A				L$19:
016A  D1 EA				shr		edx,0x01
016C  D1 D8				rcr		eax,0x01
016E  73 24				jae		L$20
0170  09 FF				or		edi,edi
0172  0F 95 C3				setne		bl
0175  09 C3				or		ebx,eax
0177  D1 EB				shr		ebx,0x01
0179  83 D0 00				adc		eax,0x00000000
017C  83 D2 00				adc		edx,0x00000000
017F  F7 C2 00 00 20 00			test		edx,0x00200000
0185  74 0D				je		L$20
0187  D1 EA				shr		edx,0x01
0189  D1 D8				rcr		eax,0x01
018B  66 45				inc		bp
018D  66 81 FD FF 07			cmp		bp,0x07ff
0192  74 1F				je		L$23
0194				L$20:
0194  81 E2 FF FF 0F 00			and		edx,0x000fffff
019A  89 E9				mov		ecx,ebp
019C  C1 E5 15				shl		ebp,0x15
019F  01 C9				add		ecx,ecx
01A1  D1 DD				rcr		ebp,0x01
01A3  09 EA				or		edx,ebp
01A5				L$21:
01A5  5E				pop		esi
01A6  5F				pop		edi
01A7  5D				pop		ebp
01A8  C3				ret		
01A9				L$22:
01A9  01 ED				add		ebp,ebp
01AB  D1 DA				rcr		edx,0x01
01AD  D1 D8				rcr		eax,0x01
01AF  5E				pop		esi
01B0  5F				pop		edi
01B1  5D				pop		ebp
01B2  C3				ret		
01B3				L$23:
01B3  89 E8				mov		eax,ebp
01B5  5E				pop		esi
01B6  5F				pop		edi
01B7  5D				pop		ebp
01B8  E9 00 00 00 00			jmp		F8OverFlow

Routine Size: 439 bytes,    Routine Base: _TEXT + 0006

01BD				__FDM:
01BD  09 C0				or		eax,eax
01BF  75 07				jne		L$25
01C1  01 D2				add		edx,edx
01C3  75 01				jne		L$24
01C5  C3				ret		
01C6				L$24:
01C6  D1 DA				rcr		edx,0x01
01C8				L$25:
01C8  09 DB				or		ebx,ebx
01CA  75 0B				jne		L$27
01CC  01 C9				add		ecx,ecx
01CE  75 05				jne		L$26
01D0  29 C0				sub		eax,eax
01D2  29 D2				sub		edx,edx
01D4  C3				ret		
01D5				L$26:
01D5  D1 D9				rcr		ecx,0x01
01D7				L$27:
01D7  80 3D 00 00 00 00 00		cmp		byte ptr DGROUP:__real87,0x00
01DE  74 0F				je		L$28
01E0  52				push		edx
01E1  50				push		eax
01E2  DD 04 24				fld		qword ptr [esp]
01E5  51				push		ecx
01E6  53				push		ebx
01E7  DC 0C 24				fmul		qword ptr [esp]
01EA  E9 43 FE FF FF			jmp		L$5
01EF				L$28:
01EF  55				push		ebp
01F0  57				push		edi
01F1  56				push		esi
01F2  89 D7				mov		edi,edx
01F4  89 CE				mov		esi,ecx
01F6  C1 FF 14				sar		edi,0x14
01F9  C1 F9 14				sar		ecx,0x14
01FC  81 E7 FF 07 00 80			and		edi,0x800007ff
0202  81 E1 FF 07 00 80			and		ecx,0x800007ff
0208  C1 C7 10				rol		edi,0x10
020B  C1 C1 10				rol		ecx,0x10
020E  66 01 F9				add		cx,di
0211  C1 C7 10				rol		edi,0x10
0214  C1 C1 10				rol		ecx,0x10
0217  81 E2 FF FF 0F 00			and		edx,0x000fffff
021D  81 E6 FF FF 0F 00			and		esi,0x000fffff
0223  66 09 FF				or		di,di
0226  75 10				jne		L$30
0228  66 47				inc		di
022A				L$29:
022A  66 4F				dec		di
022C  01 C0				add		eax,eax
022E  11 D2				adc		edx,edx
0230  F7 C2 00 00 10 00			test		edx,0x00100000
0236  74 F2				je		L$29
0238				L$30:
0238  81 CA 00 00 10 00			or		edx,0x00100000
023E  66 09 C9				or		cx,cx
0241  75 10				jne		L$32
0243  66 41				inc		cx
0245				L$31:
0245  66 49				dec		cx
0247  01 DB				add		ebx,ebx
0249  11 F6				adc		esi,esi
024B  F7 C6 00 00 10 00			test		esi,0x00100000
0251  74 F2				je		L$31
0253				L$32:
0253  81 CE 00 00 10 00			or		esi,0x00100000
0259  66 01 F9				add		cx,di
025C  66 81 E9 FF 03			sub		cx,0x03ff
0261  78 11				js		L$33
0263  66 81 F9 FF 07			cmp		cx,0x07ff
0268  72 0A				jb		L$33
026A  89 C8				mov		eax,ecx
026C  5E				pop		esi
026D  5F				pop		edi
026E  5D				pop		ebp
026F  E9 00 00 00 00			jmp		F8OverFlow
0274				L$33:
0274  66 83 F9 CB			cmp		cx,0xffcb
0278  7D 08				jge		L$34
027A  5E				pop		esi
027B  5F				pop		edi
027C  5D				pop		ebp
027D  E9 00 00 00 00			jmp		F8UnderFlow
0282				L$34:
0282  51				push		ecx
0283  B1 0B				mov		cl,0x0b
0285  0F A5 C2				shld		edx,eax,cl
0288  0F A5 E8				shld		eax,ebp,cl
028B  25 00 F8 FF FF			and		eax,0xfffff800
0290  0F A5 DE				shld		esi,ebx,cl
0293  0F A5 EB				shld		ebx,ebp,cl
0296  81 E3 00 F8 FF FF			and		ebx,0xfffff800
029C  29 ED				sub		ebp,ebp
029E  56				push		esi
029F  52				push		edx
02A0  50				push		eax
02A1  F7 E3				mul		ebx
02A3  96				xchg		eax,esi
02A4  89 D1				mov		ecx,edx
02A6  5A				pop		edx
02A7  F7 E2				mul		edx
02A9  89 D7				mov		edi,edx
02AB  01 C1				add		ecx,eax
02AD  11 EF				adc		edi,ebp
02AF  11 ED				adc		ebp,ebp
02B1  58				pop		eax
02B2  93				xchg		eax,ebx
02B3  F7 E3				mul		ebx
02B5  01 C1				add		ecx,eax
02B7  11 D7				adc		edi,edx
02B9  83 D5 00				adc		ebp,0x00000000
02BC  89 D8				mov		eax,ebx
02BE  5A				pop		edx
02BF  F7 E2				mul		edx
02C1  01 F8				add		eax,edi
02C3  11 EA				adc		edx,ebp
02C5  29 DB				sub		ebx,ebx
02C7  B1 0A				mov		cl,0x0a
02C9  0F AD C3				shrd		ebx,eax,cl
02CC  0F AD D0				shrd		eax,edx,cl
02CF  0F AD DA				shrd		edx,ebx,cl
02D2  59				pop		ecx
02D3				L$35:
02D3  F7 C2 00 00 20 00			test		edx,0x00200000
02D9  74 11				je		L$36
02DB  D1 EA				shr		edx,0x01
02DD  D1 D8				rcr		eax,0x01
02DF  D1 DB				rcr		ebx,0x01
02E1  66 41				inc		cx
02E3  66 81 F9 FF 07			cmp		cx,0x07ff
02E8  74 66				je		L$42
02EA  EB E7				jmp		L$35
02EC				L$36:
02EC  01 DB				add		ebx,ebx
02EE  73 2A				jae		L$38
02F0  75 0D				jne		L$37
02F2  09 F6				or		esi,esi
02F4  0F 95 C3				setne		bl
02F7  D1 EB				shr		ebx,0x01
02F9  72 04				jb		L$37
02FB  89 C6				mov		esi,eax
02FD  D1 EE				shr		esi,0x01
02FF				L$37:
02FF  83 D0 00				adc		eax,0x00000000
0302  83 D2 00				adc		edx,0x00000000
0305  F7 C2 00 00 20 00			test		edx,0x00200000
030B  74 0D				je		L$38
030D  D1 EA				shr		edx,0x01
030F  D1 D8				rcr		eax,0x01
0311  66 41				inc		cx
0313  66 81 F9 FF 07			cmp		cx,0x07ff
0318  74 36				je		L$42
031A				L$38:
031A  66 09 C9				or		cx,cx
031D  7F 16				jg		L$41
031F  75 04				jne		L$39
0321  B1 01				mov		cl,0x01
0323  EB 05				jmp		L$40
0325				L$39:
0325  66 F7 D9				neg		cx
0328  66 49				dec		cx
032A				L$40:
032A  29 DB				sub		ebx,ebx
032C  0F AD D0				shrd		eax,edx,cl
032F  0F AD DA				shrd		edx,ebx,cl
0332  66 29 C9				sub		cx,cx
0335				L$41:
0335  81 E2 FF FF 0F 00			and		edx,0x000fffff
033B  89 CE				mov		esi,ecx
033D  C1 C9 0B				ror		ecx,0x0b
0340  01 F6				add		esi,esi
0342  D1 D9				rcr		ecx,0x01
0344  81 E1 00 00 F0 FF			and		ecx,0xfff00000
034A  09 CA				or		edx,ecx
034C  5E				pop		esi
034D  5F				pop		edi
034E  5D				pop		ebp
034F  C3				ret		
0350				L$42:
0350  89 C8				mov		eax,ecx
0352  5E				pop		esi
0353  5F				pop		edi
0354  5D				pop		ebp
0355  E9 00 00 00 00			jmp		F8OverFlow

Routine Size: 413 bytes,    Routine Base: _TEXT + 01BD

No disassembly errors

Segment: _DATA DWORD USE32 00000000 bytes

