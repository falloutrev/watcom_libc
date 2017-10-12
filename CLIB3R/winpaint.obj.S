Module: winpaint
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001E3 bytes
0000				_RepaintWindow_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 1C				sub		esp,0x0000001c
0007  50				push		eax
0008  89 D1				mov		ecx,edx
000A  89 5C 24 08			mov		dword ptr 0x8[esp],ebx
000E  8B 52 04				mov		edx,dword ptr 0x4[edx]
0011  8B 1C 24				mov		ebx,dword ptr [esp]
0014  89 D0				mov		eax,edx
0016  8B 73 2C				mov		esi,dword ptr 0x2c[ebx]
0019  C1 FA 1F				sar		edx,0x1f
001C  F7 FE				idiv		esi
001E  89 C3				mov		ebx,eax
0020  66 85 C0				test		ax,ax
0023  74 15				je		L$1
0025  8B 51 04				mov		edx,dword ptr 0x4[ecx]
0028  8B 34 24				mov		esi,dword ptr [esp]
002B  89 D0				mov		eax,edx
002D  8B 7E 2C				mov		edi,dword ptr 0x2c[esi]
0030  C1 FA 1F				sar		edx,0x1f
0033  F7 FF				idiv		edi
0035  85 D2				test		edx,edx
0037  74 01				je		L$1
0039  4B				dec		ebx
003A				L$1:
003A  8B 51 0C				mov		edx,dword ptr 0xc[ecx]
003D  8B 34 24				mov		esi,dword ptr [esp]
0040  89 D0				mov		eax,edx
0042  8B 6E 2C				mov		ebp,dword ptr 0x2c[esi]
0045  C1 FA 1F				sar		edx,0x1f
0048  F7 FD				idiv		ebp
004A  89 44 24 14			mov		dword ptr 0x14[esp],eax
004E  66 85 C0				test		ax,ax
0051  0F 84 84 01 00 00			je		L$10
0057  31 C0				xor		eax,eax
0059  8B 76 24				mov		esi,dword ptr 0x24[esi]
005C  66 8B 44 24 14			mov		ax,word ptr 0x14[esp]
0061  39 F0				cmp		eax,esi
0063  7C 0C				jl		L$2
0065  8B 04 24				mov		eax,dword ptr [esp]
0068  66 8B 40 24			mov		ax,word ptr 0x24[eax]
006C  48				dec		eax
006D  89 44 24 14			mov		dword ptr 0x14[esp],eax
0071				L$2:
0071  8B 51 0C				mov		edx,dword ptr 0xc[ecx]
0074  8B 0C 24				mov		ecx,dword ptr [esp]
0077  89 D0				mov		eax,edx
0079  C1 FA 1F				sar		edx,0x1f
007C  F7 79 2C				idiv		dword ptr 0x2c[ecx]
007F  85 D2				test		edx,edx
0081  75 04				jne		L$3
0083  FF 4C 24 14			dec		dword ptr 0x14[esp]
0087				L$3:
0087  8B 04 24				mov		eax,dword ptr [esp]
008A  66 8B 40 20			mov		ax,word ptr 0x20[eax]
008E  89 44 24 18			mov		dword ptr 0x18[esp],eax
0092  8B 04 24				mov		eax,dword ptr [esp]
0095  66 8B 70 28			mov		si,word ptr 0x28[eax]
0099  6B C6 00				imul		eax,esi,0x00000000
009C  89 44 24 10			mov		dword ptr 0x10[esp],eax
00A0  8B 04 24				mov		eax,dword ptr [esp]
00A3  66 8B 40 2C			mov		ax,word ptr 0x2c[eax]
00A7  0F AF C3				imul		eax,ebx
00AA  8B 2D 00 00 00 00			mov		ebp,dword ptr __FixedFont
00B0  55				push		ebp
00B1  89 44 24 20			mov		dword ptr 0x20[esp],eax
00B5  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
00B9  50				push		eax
00BA  E8 00 00 00 00			call		_SelectObject
00BF  89 44 24 04			mov		dword ptr 0x4[esp],eax
00C3  31 C0				xor		eax,eax
00C5  66 89 D8				mov		ax,bx
00C8  89 44 24 0C			mov		dword ptr 0xc[esp],eax
00CC  E9 E8 00 00 00			jmp		L$9
00D1				L$4:
00D1  8B 04 24				mov		eax,dword ptr [esp]
00D4  0F AF 50 20			imul		edx,dword ptr 0x20[eax]
00D8  8B 40 32				mov		eax,dword ptr 0x32[eax]
00DB  C1 E2 02				shl		edx,0x02
00DE  8D 34 10				lea		esi,[eax+edx]
00E1  8B 04 24				mov		eax,dword ptr [esp]
00E4  8B 40 0C				mov		eax,dword ptr 0xc[eax]
00E7  8B 3C 85 00 00 00 00		mov		edi,dword ptr __ColorMap[eax*4]
00EE  57				push		edi
00EF  8B 6C 24 0C			mov		ebp,dword ptr 0xc[esp]
00F3  55				push		ebp
00F4  E8 00 00 00 00			call		_SetBkColor
00F9  8B 04 24				mov		eax,dword ptr [esp]
00FC  8B 40 08				mov		eax,dword ptr 0x8[eax]
00FF  8B 14 85 00 00 00 00		mov		edx,dword ptr __ColorMap[eax*4]
0106  52				push		edx
0107  55				push		ebp
0108  E8 00 00 00 00			call		_SetTextColor
010D  31 C0				xor		eax,eax
010F  66 8B 44 24 18			mov		ax,word ptr 0x18[esp]
0114  C1 E0 02				shl		eax,0x02
0117  31 DB				xor		ebx,ebx
0119  83 C0 04				add		eax,0x00000004
011C  89 F2				mov		edx,esi
011E  E8 00 00 00 00			call		_MemAlloc_
0123  89 C5				mov		ebp,eax
0125  C6 00 00				mov		byte ptr [eax],0x00
0128  89 EF				mov		edi,ebp
012A  EB 33				jmp		L$8
012C				L$5:
012C  8B 02				mov		eax,dword ptr [edx]
012E  E8 00 00 00 00			call		__mbvtop_
0133  89 C6				mov		esi,eax
0135  43				inc		ebx
0136  06				push		es
0137  1E				push		ds
0138  07				pop		es
0139  57				push		edi
013A  2B C9				sub		ecx,ecx
013C  49				dec		ecx
013D  B0 00				mov		al,0x00
013F  F2 AE				repne scasb	
0141  4F				dec		edi
0142				L$6:
0142  8A 06				mov		al,byte ptr [esi]
0144  88 07				mov		byte ptr [edi],al
0146  3C 00				cmp		al,0x00
0148  74 10				je		L$7
014A  8A 46 01				mov		al,byte ptr 0x1[esi]
014D  83 C6 02				add		esi,0x00000002
0150  88 47 01				mov		byte ptr 0x1[edi],al
0153  83 C7 02				add		edi,0x00000002
0156  3C 00				cmp		al,0x00
0158  75 E8				jne		L$6
015A				L$7:
015A  5F				pop		edi
015B  07				pop		es
015C  83 C2 04				add		edx,0x00000004
015F				L$8:
015F  31 C0				xor		eax,eax
0161  66 8B 44 24 18			mov		ax,word ptr 0x18[esp]
0166  39 C3				cmp		ebx,eax
0168  7C C2				jl		L$5
016A  89 EF				mov		edi,ebp
016C  06				push		es
016D  8C D8				mov		eax,ds
016F  8E C0				mov		es,eax
0171  29 C9				sub		ecx,ecx
0173  49				dec		ecx
0174  31 C0				xor		eax,eax
0176  F2 AE				repne scasb	
0178  F7 D1				not		ecx
017A  49				dec		ecx
017B  07				pop		es
017C  51				push		ecx
017D  31 C0				xor		eax,eax
017F  55				push		ebp
0180  66 8B 44 24 24			mov		ax,word ptr 0x24[esp]
0185  50				push		eax
0186  31 C0				xor		eax,eax
0188  66 8B 44 24 1C			mov		ax,word ptr 0x1c[esp]
018D  50				push		eax
018E  8B 4C 24 18			mov		ecx,dword ptr 0x18[esp]
0192  51				push		ecx
0193  E8 00 00 00 00			call		_TextOutA
0198  89 E8				mov		eax,ebp
019A  E8 00 00 00 00			call		_MemFree_
019F  8B 04 24				mov		eax,dword ptr [esp]
01A2  8B 74 24 0C			mov		esi,dword ptr 0xc[esp]
01A6  8B 7C 24 1C			mov		edi,dword ptr 0x1c[esp]
01AA  66 8B 40 2C			mov		ax,word ptr 0x2c[eax]
01AE  46				inc		esi
01AF  01 C7				add		edi,eax
01B1  89 74 24 0C			mov		dword ptr 0xc[esp],esi
01B5  89 7C 24 1C			mov		dword ptr 0x1c[esp],edi
01B9				L$9:
01B9  31 C0				xor		eax,eax
01BB  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
01BF  66 8B 44 24 14			mov		ax,word ptr 0x14[esp]
01C4  39 D0				cmp		eax,edx
01C6  0F 8D 05 FF FF FF			jge		L$4
01CC  8B 5C 24 04			mov		ebx,dword ptr 0x4[esp]
01D0  53				push		ebx
01D1  8B 4C 24 0C			mov		ecx,dword ptr 0xc[esp]
01D5  51				push		ecx
01D6  E8 00 00 00 00			call		_SelectObject
01DB				L$10:
01DB  83 C4 20				add		esp,0x00000020
01DE  5D				pop		ebp
01DF  5F				pop		edi
01E0  5E				pop		esi
01E1  59				pop		ecx
01E2  C3				ret		

Routine Size: 483 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

