Module: fjstrnse
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000016B bytes
0000				_fjstrnset_:
0000  56				push		esi
0001  57				push		edi
0002  06				push		es
0003  0F A0				push		fs
0005  55				push		ebp
0006  83 EC 20				sub		esp,0x00000020
0009  8E C2				mov		es,edx
000B  89 C6				mov		esi,eax
000D  66 89 5C 24 14			mov		word ptr 0x14[esp],bx
0012  89 4C 24 10			mov		dword ptr 0x10[esp],ecx
0016  89 54 24 1C			mov		dword ptr 0x1c[esp],edx
001A  89 04 24				mov		dword ptr [esp],eax
001D  85 C9				test		ecx,ecx
001F  0F 84 3C 01 00 00			je		L$13
0025  31 DB				xor		ebx,ebx
0027  66 8B 5C 24 14			mov		bx,word ptr 0x14[esp]
002C  89 D8				mov		eax,ebx
002E  E8 00 00 00 00			call		jiszen_
0033  85 C0				test		eax,eax
0035  0F 95 C0				setne		al
0038  25 FF 00 00 00			and		eax,0x000000ff
003D  40				inc		eax
003E  0F AF C8				imul		ecx,eax
0041  89 F7				mov		edi,esi
0043  89 4C 24 04			mov		dword ptr 0x4[esp],ecx
0047  89 D1				mov		ecx,edx
0049  06				push		es
004A  8E C1				mov		es,ecx
004C  31 C0				xor		eax,eax
004E  89 C1				mov		ecx,eax
0050  49				dec		ecx
0051  F2 AE				repne scasb	
0053  F7 D1				not		ecx
0055  49				dec		ecx
0056  07				pop		es
0057  89 CF				mov		edi,ecx
0059  89 4C 24 08			mov		dword ptr 0x8[esp],ecx
005D  8B 4C 24 04			mov		ecx,dword ptr 0x4[esp]
0061  39 CF				cmp		edi,ecx
0063  77 4B				ja		L$4
0065  89 D8				mov		eax,ebx
0067  E8 00 00 00 00			call		jiszen_
006C  85 C0				test		eax,eax
006E  74 35				je		L$3
0070  D1 EF				shr		edi,0x01
0072  31 C9				xor		ecx,ecx
0074  EB 17				jmp		L$2
0076				L$1:
0076  8C C2				mov		edx,es
0078  31 DB				xor		ebx,ebx
007A  89 F0				mov		eax,esi
007C  66 8B 5C 24 14			mov		bx,word ptr 0x14[esp]
0081  41				inc		ecx
0082  9A 00 00 00 00 00 00		call		_fjputmoji_
0089  8E C2				mov		es,edx
008B  89 C6				mov		esi,eax
008D				L$2:
008D  39 F9				cmp		ecx,edi
008F  72 E5				jb		L$1
0091  F6 44 24 08 01			test		byte ptr 0x8[esp],0x01
0096  0F 84 BE 00 00 00			je		L$12
009C  26 C6 06 20			mov		byte ptr es:[esi],0x20
00A0  E9 B5 00 00 00			jmp		L$12
00A5				L$3:
00A5  8A 44 24 14			mov		al,byte ptr 0x14[esp]
00A9  89 F9				mov		ecx,edi
00AB  E9 97 00 00 00			jmp		L$11
00B0				L$4:
00B0  8E E2				mov		fs,edx
00B2  8D 41 FF				lea		eax,-0x1[ecx]
00B5  89 F7				mov		edi,esi
00B7  89 44 24 0C			mov		dword ptr 0xc[esp],eax
00BB  EB 15				jmp		L$6
00BD				L$5:
00BD  8D 5C 24 18			lea		ebx,0x18[esp]
00C1  8C D9				mov		ecx,ds
00C3  8C E2				mov		edx,fs
00C5  89 F8				mov		eax,edi
00C7  9A 00 00 00 00 00 00		call		_fjgetmoji_
00CE  8E E2				mov		fs,edx
00D0  89 C7				mov		edi,eax
00D2				L$6:
00D2  89 FD				mov		ebp,edi
00D4  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
00D8  29 F5				sub		ebp,esi
00DA  39 C5				cmp		ebp,eax
00DC  72 DF				jb		L$5
00DE  8D 5C 24 18			lea		ebx,0x18[esp]
00E2  8C D9				mov		ecx,ds
00E4  8C E2				mov		edx,fs
00E6  89 F8				mov		eax,edi
00E8  9A 00 00 00 00 00 00		call		_fjgetmoji_
00EF  3B 6C 24 04			cmp		ebp,dword ptr 0x4[esp]
00F3  74 15				je		L$7
00F5  31 C0				xor		eax,eax
00F7  66 8B 44 24 18			mov		ax,word ptr 0x18[esp]
00FC  E8 00 00 00 00			call		jiszen_
0101  85 C0				test		eax,eax
0103  74 05				je		L$7
0105  64 C6 47 01 20			mov		byte ptr fs:0x1[edi],0x20
010A				L$7:
010A  31 C0				xor		eax,eax
010C  66 8B 44 24 14			mov		ax,word ptr 0x14[esp]
0111  E8 00 00 00 00			call		jiszen_
0116  85 C0				test		eax,eax
0118  74 23				je		L$10
011A  31 C9				xor		ecx,ecx
011C  EB 17				jmp		L$9
011E				L$8:
011E  8C C2				mov		edx,es
0120  31 DB				xor		ebx,ebx
0122  89 F0				mov		eax,esi
0124  66 8B 5C 24 14			mov		bx,word ptr 0x14[esp]
0129  41				inc		ecx
012A  9A 00 00 00 00 00 00		call		_fjputmoji_
0131  8E C2				mov		es,edx
0133  89 C6				mov		esi,eax
0135				L$9:
0135  3B 4C 24 10			cmp		ecx,dword ptr 0x10[esp]
0139  73 1F				jae		L$12
013B  EB E1				jmp		L$8
013D				L$10:
013D  8B 4C 24 10			mov		ecx,dword ptr 0x10[esp]
0141  8A 44 24 14			mov		al,byte ptr 0x14[esp]
0145  8C C2				mov		edx,es
0147				L$11:
0147  89 F7				mov		edi,esi
0149  06				push		es
014A  57				push		edi
014B  8E C2				mov		es,edx
014D  88 C4				mov		ah,al
014F  D1 E9				shr		ecx,0x01
0151  F2 66 AB				repne stosw	
0154  11 C9				adc		ecx,ecx
0156  F2 AA				repne stosb	
0158  5F				pop		edi
0159  07				pop		es
015A				L$12:
015A  8B 54 24 1C			mov		edx,dword ptr 0x1c[esp]
015E  8B 04 24				mov		eax,dword ptr [esp]
0161				L$13:
0161  83 C4 20				add		esp,0x00000020
0164  5D				pop		ebp
0165  0F A1				pop		fs
0167  07				pop		es
0168  5F				pop		edi
0169  5E				pop		esi
016A  CB				retf		

Routine Size: 363 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

