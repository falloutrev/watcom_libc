Module: winmove
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001CD bytes
0000				_MovePageUp_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  57				push		edi
0005  89 C3				mov		ebx,eax
0007  83 78 4E 01			cmp		dword ptr 0x4e[eax],0x00000001
000B  74 47				je		L$4
000D  8B 40 24				mov		eax,dword ptr 0x24[eax]
0010  8B 4B 4A				mov		ecx,dword ptr 0x4a[ebx]
0013  48				dec		eax
0014  29 C1				sub		ecx,eax
0016  8B 43 24				mov		eax,dword ptr 0x24[ebx]
0019  8B 73 4E				mov		esi,dword ptr 0x4e[ebx]
001C  48				dec		eax
001D  89 4B 4A				mov		dword ptr 0x4a[ebx],ecx
0020  29 C6				sub		esi,eax
0022  8B 7B 4A				mov		edi,dword ptr 0x4a[ebx]
0025  89 73 4E				mov		dword ptr 0x4e[ebx],esi
0028  83 FF 01				cmp		edi,0x00000001
002B  7D 07				jge		L$1
002D  C7 43 4A 01 00 00 00		mov		dword ptr 0x4a[ebx],0x00000001
0034				L$1:
0034  83 7B 4E 01			cmp		dword ptr 0x4e[ebx],0x00000001
0038				L$2:
0038  7D 07				jge		L$3
003A  C7 43 4E 01 00 00 00		mov		dword ptr 0x4e[ebx],0x00000001
0041				L$3:
0041  89 D8				mov		eax,ebx
0043  BA 01 00 00 00			mov		edx,0x00000001
0048  E8 00 00 00 00			call		_PositionScrollThumb_
004D  89 D8				mov		eax,ebx
004F  E8 00 00 00 00			call		_DisplayAllLines_
0054				L$4:
0054  5F				pop		edi
0055  5E				pop		esi
0056  5A				pop		edx
0057  59				pop		ecx
0058  5B				pop		ebx
0059  C3				ret		

Routine Size: 90 bytes,    Routine Base: _TEXT + 0000

005A				_MovePageDown_:
005A  53				push		ebx
005B  51				push		ecx
005C  52				push		edx
005D  56				push		esi
005E  57				push		edi
005F  89 C3				mov		ebx,eax
0061  E8 00 00 00 00			call		_GetLastLineNumber_
0066  8B 53 24				mov		edx,dword ptr 0x24[ebx]
0069  8B 4B 4A				mov		ecx,dword ptr 0x4a[ebx]
006C  4A				dec		edx
006D  01 D1				add		ecx,edx
006F  8B 53 24				mov		edx,dword ptr 0x24[ebx]
0072  8B 73 4E				mov		esi,dword ptr 0x4e[ebx]
0075  4A				dec		edx
0076  89 4B 4A				mov		dword ptr 0x4a[ebx],ecx
0079  01 D6				add		esi,edx
007B  8B 7B 4A				mov		edi,dword ptr 0x4a[ebx]
007E  89 73 4E				mov		dword ptr 0x4e[ebx],esi
0081  39 F8				cmp		eax,edi
0083  73 BC				jae		L$3
0085  89 43 4A				mov		dword ptr 0x4a[ebx],eax
0088  8B 43 24				mov		eax,dword ptr 0x24[ebx]
008B  89 C2				mov		edx,eax
008D  C1 FA 1F				sar		edx,0x1f
0090  2B C2				sub		eax,edx
0092  D1 F8				sar		eax,0x01
0094  89 C2				mov		edx,eax
0096  8B 43 4A				mov		eax,dword ptr 0x4a[ebx]
0099  29 D0				sub		eax,edx
009B  89 43 4E				mov		dword ptr 0x4e[ebx],eax
009E  83 F8 01				cmp		eax,0x00000001
00A1  EB 95				jmp		L$2

Routine Size: 73 bytes,    Routine Base: _TEXT + 005A

00A3				_MoveLineUp_:
00A3  53				push		ebx
00A4  51				push		ecx
00A5  52				push		edx
00A6  56				push		esi
00A7  89 C1				mov		ecx,eax
00A9  83 78 4E 01			cmp		dword ptr 0x4e[eax],0x00000001
00AD  74 38				je		L$5
00AF  8B 58 4A				mov		ebx,dword ptr 0x4a[eax]
00B2  8B 70 4E				mov		esi,dword ptr 0x4e[eax]
00B5  4B				dec		ebx
00B6  4E				dec		esi
00B7  89 58 4A				mov		dword ptr 0x4a[eax],ebx
00BA  BA FF FF FF FF			mov		edx,0xffffffff
00BF  89 70 4E				mov		dword ptr 0x4e[eax],esi
00C2  E8 00 00 00 00			call		_ShiftWindow_
00C7  89 C8				mov		eax,ecx
00C9  8B 51 4E				mov		edx,dword ptr 0x4e[ecx]
00CC  E8 00 00 00 00			call		_GetLineDataPointer_
00D1  8D 58 09				lea		ebx,0x9[eax]
00D4  BA 01 00 00 00			mov		edx,0x00000001
00D9  89 C8				mov		eax,ecx
00DB  E8 00 00 00 00			call		_DisplayLineInWindow_
00E0  89 C8				mov		eax,ecx
00E2  E8 00 00 00 00			call		_PositionScrollThumb_
00E7				L$5:
00E7  5E				pop		esi
00E8  5A				pop		edx
00E9  59				pop		ecx
00EA  5B				pop		ebx
00EB  C3				ret		

Routine Size: 73 bytes,    Routine Base: _TEXT + 00A3

00EC				_MoveLineDown_:
00EC  53				push		ebx
00ED  51				push		ecx
00EE  52				push		edx
00EF  56				push		esi
00F0  57				push		edi
00F1  89 C1				mov		ecx,eax
00F3  E8 00 00 00 00			call		_GetLastLineNumber_
00F8  3B 41 4A				cmp		eax,dword ptr 0x4a[ecx]
00FB  0F 84 53 FF FF FF			je		L$4
0101  8B 51 4E				mov		edx,dword ptr 0x4e[ecx]
0104  03 51 24				add		edx,dword ptr 0x24[ecx]
0107  8D 5A FF				lea		ebx,-0x1[edx]
010A  39 C3				cmp		ebx,eax
010C  0F 83 42 FF FF FF			jae		L$4
0112  BA 01 00 00 00			mov		edx,0x00000001
0117  89 C8				mov		eax,ecx
0119  E8 00 00 00 00			call		_ShiftWindow_
011E  89 DA				mov		edx,ebx
0120  89 C8				mov		eax,ecx
0122  E8 00 00 00 00			call		_GetLineDataPointer_
0127  85 C0				test		eax,eax
0129  74 0E				je		L$6
012B  8B 51 24				mov		edx,dword ptr 0x24[ecx]
012E  8D 58 09				lea		ebx,0x9[eax]
0131  4A				dec		edx
0132  89 C8				mov		eax,ecx
0134  E8 00 00 00 00			call		_DisplayLineInWindow_
0139				L$6:
0139  8B 71 4A				mov		esi,dword ptr 0x4a[ecx]
013C  8B 79 4E				mov		edi,dword ptr 0x4e[ecx]
013F  46				inc		esi
0140  47				inc		edi
0141  89 71 4A				mov		dword ptr 0x4a[ecx],esi
0144  89 C8				mov		eax,ecx
0146  89 79 4E				mov		dword ptr 0x4e[ecx],edi
0149  E8 00 00 00 00			call		_PositionScrollThumb_
014E  E9 01 FF FF FF			jmp		L$4

Routine Size: 103 bytes,    Routine Base: _TEXT + 00EC

0153				_MoveToLine_:
0153  51				push		ecx
0154  56				push		esi
0155  57				push		edi
0156  55				push		ebp
0157  89 C1				mov		ecx,eax
0159  89 D6				mov		esi,edx
015B  89 DF				mov		edi,ebx
015D  8B 50 24				mov		edx,dword ptr 0x24[eax]
0160  8B 58 4E				mov		ebx,dword ptr 0x4e[eax]
0163  E8 00 00 00 00			call		_GetLastLineNumber_
0168  83 EA 02				sub		edx,0x00000002
016B  8B 69 4E				mov		ebp,dword ptr 0x4e[ecx]
016E  01 D3				add		ebx,edx
0170  39 EE				cmp		esi,ebp
0172  72 08				jb		L$7
0174  39 DE				cmp		esi,ebx
0176  77 04				ja		L$7
0178  85 FF				test		edi,edi
017A  74 4C				je		L$13
017C				L$7:
017C  85 FF				test		edi,edi
017E  75 04				jne		L$8
0180  39 C3				cmp		ebx,eax
0182  73 12				jae		L$9
0184				L$8:
0184  89 D0				mov		eax,edx
0186  C1 FA 1F				sar		edx,0x1f
0189  2B C2				sub		eax,edx
018B  D1 F8				sar		eax,0x01
018D  89 F2				mov		edx,esi
018F  29 C2				sub		edx,eax
0191  89 51 4E				mov		dword ptr 0x4e[ecx],edx
0194  EB 0F				jmp		L$11
0196				L$9:
0196  76 02				jbe		L$10
0198  89 C3				mov		ebx,eax
019A				L$10:
019A  39 F3				cmp		ebx,esi
019C  76 07				jbe		L$11
019E  89 F0				mov		eax,esi
01A0  29 D0				sub		eax,edx
01A2  89 41 4E				mov		dword ptr 0x4e[ecx],eax
01A5				L$11:
01A5  83 79 4E 01			cmp		dword ptr 0x4e[ecx],0x00000001
01A9  7D 07				jge		L$12
01AB  C7 41 4E 01 00 00 00		mov		dword ptr 0x4e[ecx],0x00000001
01B2				L$12:
01B2  BA 01 00 00 00			mov		edx,0x00000001
01B7  89 C8				mov		eax,ecx
01B9  89 71 4A				mov		dword ptr 0x4a[ecx],esi
01BC  E8 00 00 00 00			call		_PositionScrollThumb_
01C1  89 C8				mov		eax,ecx
01C3  E8 00 00 00 00			call		_DisplayAllLines_
01C8				L$13:
01C8  5D				pop		ebp
01C9  5F				pop		edi
01CA  5E				pop		esi
01CB  59				pop		ecx
01CC  C3				ret		

Routine Size: 122 bytes,    Routine Base: _TEXT + 0153

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

