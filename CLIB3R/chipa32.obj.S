Module: chipa32
GROUP: 'DGROUP' BSS32,DATA32,CONST2,CONST,_DATA

Segment: _TEXT PARA USE32 00000200 bytes
0000				__fpatan_chk:
0000  50				push		eax
0001  51				push		ecx
0002  52				push		edx
0003  83 EC 24				sub		esp,0x00000024
0006  DB 7C 24 0C			fstp		tbyte ptr 0xc[esp]
000A  DB 3C 24				fstp		tbyte ptr [esp]
000D  8B 4C 24 04			mov		ecx,dword ptr 0x4[esp]
0011  01 C9				add		ecx,ecx
0013  0F 83 D7 01 00 00			jae		L$10
0019  8B 44 24 10			mov		eax,dword ptr 0x10[esp]
001D  01 C0				add		eax,eax
001F  0F 83 CB 01 00 00			jae		L$10
0025  8B 4C 24 08			mov		ecx,dword ptr 0x8[esp]
0029  8B 44 24 14			mov		eax,dword ptr 0x14[esp]
002D  81 E1 FF 7F 00 00			and		ecx,0x00007fff
0033  0F 84 B7 01 00 00			je		L$10
0039  25 FF 7F 00 00			and		eax,0x00007fff
003E  0F 84 AC 01 00 00			je		L$10
0044  81 F9 FF 7F 00 00			cmp		ecx,0x00007fff
004A  0F 84 A0 01 00 00			je		L$10
0050  3D FF 7F 00 00			cmp		eax,0x00007fff
0055  0F 84 95 01 00 00			je		L$10
005B  DB 6C 24 0C			fld		tbyte ptr 0xc[esp]
005F  D9 E1				fabs		
0061  DB 2C 24				fld		tbyte ptr [esp]
0064  D9 E1				fabs		
0066  D9 7C 24 18			fnstcw		word ptr 0x18[esp]
006A  8B 54 24 18			mov		edx,dword ptr 0x18[esp]
006E  81 CA 3F 03 00 00			or		edx,0x0000033f
0074  81 E2 FF F3 00 00			and		edx,0x0000f3ff
007A  89 54 24 1C			mov		dword ptr 0x1c[esp],edx
007E  D9 6C 24 1C			fldcw		word ptr 0x1c[esp]
0082  31 D2				xor		edx,edx
0084  D8 D1				fcom		st(1)
0086  50				push		eax
0087  DF E0				fnstsw		ax
0089  9E				sahf		
008A  58				pop		eax
008B  72 03				jb		L$1
008D  D9 C9				fxch		st(1)
008F  42				inc		edx
0090				L$1:
0090  50				push		eax
0091  B8 0F 00 00 00			mov		eax,0x0000000f
0096  E8 00 00 00 00			call		__fdiv_fpr
009B  58				pop		eax
009C  D9 05 44 00 00 00			fld		dword ptr DGROUP:L$15
00A2  D8 C9				fmul		st,st(1)
00A4  DB 5C 24 20			fistp		dword ptr 0x20[esp]
00A8  8B 4C 24 20			mov		ecx,dword ptr 0x20[esp]
00AC  C1 E1 04				shl		ecx,0x04
00AF  DB 44 24 20			fild		dword ptr 0x20[esp]
00B3  D8 0D 48 00 00 00			fmul		dword ptr DGROUP:L$16
00B9  D9 C1				fld		st(1)
00BB  D8 E1				fsub		st,st(1)
00BD  D9 C9				fxch		st(1)
00BF  DE CA				fmulp		st(2),st
00C1  DD 05 00 00 00 00			fld		qword ptr DGROUP:L$11
00C7  DE C2				faddp		st(2),st
00C9  50				push		eax
00CA  B8 0F 00 00 00			mov		eax,0x0000000f
00CF  E8 00 00 00 00			call		__fdiv_fpr
00D4  58				pop		eax
00D5  D9 C0				fld		st
00D7  D8 C9				fmul		st,st(1)
00D9  D9 C0				fld		st
00DB  D8 C9				fmul		st,st(1)
00DD  D9 C0				fld		st
00DF  D8 C9				fmul		st,st(1)
00E1  DB 2D 7E 00 00 00			fld		tbyte ptr DGROUP:L$22
00E7  DB 2D 74 00 00 00			fld		tbyte ptr DGROUP:L$21
00ED  D9 C9				fxch		st(1)
00EF  D8 CA				fmul		st,st(2)
00F1  DB 2D 6A 00 00 00			fld		tbyte ptr DGROUP:L$20
00F7  D9 CA				fxch		st(2)
00F9  D8 CB				fmul		st,st(3)
00FB  DB 2D 60 00 00 00			fld		tbyte ptr DGROUP:L$19
0101  D9 CA				fxch		st(2)
0103  D8 CD				fmul		st,st(5)
0105  D9 CB				fxch		st(3)
0107  DE CC				fmulp		st(4),st
0109  DB 2D 56 00 00 00			fld		tbyte ptr DGROUP:L$18
010F  D9 CB				fxch		st(3)
0111  DE C4				faddp		st(4),st
0113  8B 44 24 14			mov		eax,dword ptr 0x14[esp]
0117  DB 2D 4C 00 00 00			fld		tbyte ptr DGROUP:L$17
011D  D9 C9				fxch		st(1)
011F  C1 E0 10				shl		eax,0x10
0122  D8 CE				fmul		st,st(6)
0124  D9 CA				fxch		st(2)
0126  01 C0				add		eax,eax
0128  D8 CD				fmul		st,st(5)
012A  D9 CB				fxch		st(3)
012C  11 D2				adc		edx,edx
012E  DE CD				fmulp		st(5),st
0130  D9 CA				fxch		st(2)
0132  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
0136  D8 CD				fmul		st,st(5)
0138  D9 CA				fxch		st(2)
013A  C1 E0 10				shl		eax,0x10
013D  DE CD				fmulp		st(5),st
013F  D9 CA				fxch		st(2)
0141  DE C3				faddp		st(3),st
0143  01 C0				add		eax,eax
0145  DE C1				faddp		st(1),st
0147  11 D2				adc		edx,edx
0149  DE C2				faddp		st(2),st
014B  DE C1				faddp		st(1),st
014D  D8 C9				fmul		st,st(1)
014F  DE C1				faddp		st(1),st
0151  DB A9 88 00 00 00			fld		tbyte ptr DGROUP:L$23[ecx]
0157  DE C1				faddp		st(1),st
0159  FF 24 95 10 00 00 00		jmp		dword ptr DGROUP:L$12[edx*4]
0160				L$2:
0160  D9 6C 24 18			fldcw		word ptr 0x18[esp]
0164  83 C4 24				add		esp,0x00000024
0167  5A				pop		edx
0168  59				pop		ecx
0169  58				pop		eax
016A  C3				ret		
016B				L$3:
016B  D9 E0				fchs		
016D  D9 6C 24 18			fldcw		word ptr 0x18[esp]
0171  83 C4 24				add		esp,0x00000024
0174  5A				pop		edx
0175  59				pop		ecx
0176  58				pop		eax
0177  C3				ret		
0178				L$4:
0178  DB 2D 30 00 00 00			fld		tbyte ptr DGROUP:L$13
017E  DE E1				fsubrp		st(1),st
0180  D9 6C 24 18			fldcw		word ptr 0x18[esp]
0184  83 C4 24				add		esp,0x00000024
0187  5A				pop		edx
0188  59				pop		ecx
0189  58				pop		eax
018A  C3				ret		
018B				L$5:
018B  DB 2D 30 00 00 00			fld		tbyte ptr DGROUP:L$13
0191  DE E1				fsubrp		st(1),st
0193  D9 E0				fchs		
0195  D9 6C 24 18			fldcw		word ptr 0x18[esp]
0199  83 C4 24				add		esp,0x00000024
019C  5A				pop		edx
019D  59				pop		ecx
019E  58				pop		eax
019F  C3				ret		
01A0				L$6:
01A0  DB 2D 3A 00 00 00			fld		tbyte ptr DGROUP:L$14
01A6  DE E1				fsubrp		st(1),st
01A8  D9 6C 24 18			fldcw		word ptr 0x18[esp]
01AC  83 C4 24				add		esp,0x00000024
01AF  5A				pop		edx
01B0  59				pop		ecx
01B1  58				pop		eax
01B2  C3				ret		
01B3				L$7:
01B3  DB 2D 3A 00 00 00			fld		tbyte ptr DGROUP:L$14
01B9  DE E1				fsubrp		st(1),st
01BB  D9 E0				fchs		
01BD  D9 6C 24 18			fldcw		word ptr 0x18[esp]
01C1  83 C4 24				add		esp,0x00000024
01C4  5A				pop		edx
01C5  59				pop		ecx
01C6  58				pop		eax
01C7  C3				ret		
01C8				L$8:
01C8  DB 2D 3A 00 00 00			fld		tbyte ptr DGROUP:L$14
01CE  DE C1				faddp		st(1),st
01D0  D9 6C 24 18			fldcw		word ptr 0x18[esp]
01D4  83 C4 24				add		esp,0x00000024
01D7  5A				pop		edx
01D8  59				pop		ecx
01D9  58				pop		eax
01DA  C3				ret		
01DB				L$9:
01DB  DB 2D 3A 00 00 00			fld		tbyte ptr DGROUP:L$14
01E1  DE C1				faddp		st(1),st
01E3  D9 E0				fchs		
01E5  D9 6C 24 18			fldcw		word ptr 0x18[esp]
01E9  83 C4 24				add		esp,0x00000024
01EC  5A				pop		edx
01ED  59				pop		ecx
01EE  58				pop		eax
01EF  C3				ret		
01F0				L$10:
01F0  DB 2C 24				fld		tbyte ptr [esp]
01F3  DB 6C 24 0C			fld		tbyte ptr 0xc[esp]
01F7  D9 F3				fpatan		
01F9  83 C4 24				add		esp,0x00000024
01FC  5A				pop		edx
01FD  59				pop		ecx
01FE  58				pop		eax
01FF  C3				ret		

Routine Size: 512 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: DATA32 DWORD USE32 00000198 bytes
0000				L$11:
0000  00 00 00 00 00 00 F0 3F 00 00 00 00 00 00 F0 BF .......?........
0010				L$12:
0010  60 01 00 00                                     DD	offset L$2
0014  6B 01 00 00                                     DD	offset L$3
0018  78 01 00 00                                     DD	offset L$4
001C  8B 01 00 00                                     DD	offset L$5
0020  A0 01 00 00                                     DD	offset L$6
0024  B3 01 00 00                                     DD	offset L$7
0028  C8 01 00 00                                     DD	offset L$8
002C  DB 01 00 00                                     DD	offset L$9
0030				L$13:
0030  35 C2 68 21 A2 DA 0F C9 00 40                   5.h!.....@
003A				L$14:
003A  35 C2 68 21 A2 DA 0F C9 FF 3F                   5.h!.....?
0044				L$15:
0044  00 00 80 41                                     ...A
0048				L$16:
0048  00 00 80 3D                                     ...=
004C				L$17:
004C  A8 AA AA AA AA AA AA AA FD BF                   ..........
0056				L$18:
0056  6E 2D CC CC CC CC CC CC FC 3F                   n-.......?
0060				L$19:
0060  92 48 F9 41 92 24 49 92 FC BF                   .H.A.$I...
006A				L$20:
006A  92 C5 EC CD 97 38 8E E3 FB 3F                   .....8...?
0074				L$21:
0074  DD 5D 62 C1 7B C1 2D BA FB BF                   .]b.{.-...
007E				L$22:
007E  54 48 8E C7 C7 77 80 9C FB 3F                   TH...w...?
0088				L$23:
0088  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
0098  37 4E EF 67 B9 DD AA FF FA 3F 00 00 00 00 00 00 7N.g.....?......
00A8  33 6E 7B 61 D5 D4 AD FE FB 3F 00 00 00 00 00 00 3n{a.....?......
00B8  35 11 D8 72 5E DA CB BD FC 3F 00 00 00 00 00 00 5..r^....?......
00C8  15 EB 06 64 C9 AF DB FA FC 3F 00 00 00 00 00 00 ...d.....?......
00D8  6A 5E 5E 3F B8 B9 13 9B FD 3F 00 00 00 00 00 00 j^^?.....?......
00E8  74 84 F7 26 0F CA B0 B7 FD 3F 00 00 00 00 00 00 t..&.....?......
00F8  B6 E5 1F 61 1E 76 27 D3 FD 3F 00 00 00 00 00 00 ...a.v'..?......
0108  45 7B DA 0D 2B 38 63 ED FD 3F 00 00 00 00 00 00 E{..+8c..?......
0118  2A 7E 86 D9 A6 F4 2B 83 FE 3F 00 00 00 00 00 00 *~....+..?......
0128  9B 9F F5 F7 5E 5D 00 8F FE 3F 00 00 00 00 00 00 ....^]...?......
0138  20 DA BD 71 E6 80 2F 9A FE 3F 00 00 00 00 00 00  ..q../..?......
0148  24 09 F7 34 19 7D BC A4 FE 3F 00 00 00 00 00 00 $..4.}...?......
0158  80 C0 D8 B4 38 4C AC AE FE 3F 00 00 00 00 00 00 ....8L...?......
0168  74 9E 31 C2 2B 3E 05 B8 FE 3F 00 00 00 00 00 00 t.1.+>...?......
0178  41 66 52 AC B8 85 CE C0 FE 3F 00 00 00 00 00 00 AfR......?......
0188  35 C2 68 21 A2 DA 0F C9 FE 3F 00 00 00 00 00 00 5.h!.....?......

Segment: BSS32 DWORD USE32 00000000 bytes

BSS Size: 0 bytes

