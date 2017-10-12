Module: windlg2
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000039C bytes
0000				copyString_:
0000  51				push		ecx
0001  56				push		esi
0002  89 C1				mov		ecx,eax
0004  89 D6				mov		esi,edx
0006  89 DA				mov		edx,ebx
0008  89 D0				mov		eax,edx
000A  C1 FA 1F				sar		edx,0x1f
000D  2B C2				sub		eax,edx
000F  D1 F8				sar		eax,0x01
0011  31 DB				xor		ebx,ebx
0013  89 C2				mov		edx,eax
0015  EB 0C				jmp		L$2
0017				L$1:
0017  31 C0				xor		eax,eax
0019  43				inc		ebx
001A  8A 06				mov		al,byte ptr [esi]
001C  46				inc		esi
001D  66 89 01				mov		word ptr [ecx],ax
0020  83 C1 02				add		ecx,0x00000002
0023				L$2:
0023  39 D3				cmp		ebx,edx
0025  7C F0				jl		L$1
0027  89 C8				mov		eax,ecx
0029  5E				pop		esi
002A  59				pop		ecx
002B  C3				ret		

Routine Size: 44 bytes,    Routine Base: _TEXT + 0000

002C				_DialogTemplate_:
002C  56				push		esi
002D  57				push		edi
002E  55				push		ebp
002F  83 EC 08				sub		esp,0x00000008
0032  50				push		eax
0033  52				push		edx
0034  53				push		ebx
0035  51				push		ecx
0036  8B 7C 24 2C			mov		edi,dword ptr 0x2c[esp]
003A  06				push		es
003B  8C D8				mov		eax,ds
003D  8E C0				mov		es,eax
003F  29 C9				sub		ecx,ecx
0041  49				dec		ecx
0042  31 C0				xor		eax,eax
0044  F2 AE				repne scasb	
0046  F7 D1				not		ecx
0048  49				dec		ecx
0049  07				pop		es
004A  8D 1C 09				lea		ebx,[ecx+ecx]
004D  8D 43 02				lea		eax,0x2[ebx]
0050  8B 7C 24 30			mov		edi,dword ptr 0x30[esp]
0054  89 44 24 10			mov		dword ptr 0x10[esp],eax
0058  06				push		es
0059  8C D8				mov		eax,ds
005B  8E C0				mov		es,eax
005D  29 C9				sub		ecx,ecx
005F  49				dec		ecx
0060  31 C0				xor		eax,eax
0062  F2 AE				repne scasb	
0064  F7 D1				not		ecx
0066  49				dec		ecx
0067  07				pop		es
0068  01 C9				add		ecx,ecx
006A  8B 7C 24 34			mov		edi,dword ptr 0x34[esp]
006E  8D 69 02				lea		ebp,0x2[ecx]
0071  83 C3 18				add		ebx,0x00000018
0074  06				push		es
0075  8C D8				mov		eax,ds
0077  8E C0				mov		es,eax
0079  29 C9				sub		ecx,ecx
007B  49				dec		ecx
007C  31 C0				xor		eax,eax
007E  F2 AE				repne scasb	
0080  F7 D1				not		ecx
0082  49				dec		ecx
0083  07				pop		es
0084  01 C9				add		ecx,ecx
0086  01 EB				add		ebx,ebp
0088  8D 71 02				lea		esi,0x2[ecx]
008B  01 F3				add		ebx,esi
008D  83 C3 03				add		ebx,0x00000003
0090  8A 64 24 0C			mov		ah,byte ptr 0xc[esp]
0094  80 E3 FC				and		bl,0xfc
0097  F6 C4 40				test		ah,0x40
009A  74 20				je		L$3
009C  8B 7C 24 3C			mov		edi,dword ptr 0x3c[esp]
00A0  06				push		es
00A1  8C D8				mov		eax,ds
00A3  8E C0				mov		es,eax
00A5  29 C9				sub		ecx,ecx
00A7  49				dec		ecx
00A8  31 C0				xor		eax,eax
00AA  F2 AE				repne scasb	
00AC  F7 D1				not		ecx
00AE  49				dec		ecx
00AF  07				pop		es
00B0  01 C9				add		ecx,ecx
00B2  8D 79 02				lea		edi,0x2[ecx]
00B5  83 C1 04				add		ecx,0x00000004
00B8  01 CB				add		ebx,ecx
00BA  EB 02				jmp		L$4
00BC				L$3:
00BC  31 FF				xor		edi,edi
00BE				L$4:
00BE  53				push		ebx
00BF  6A 42				push		0x00000042
00C1  E8 00 00 00 00			call		_GlobalAlloc
00C6  89 44 24 14			mov		dword ptr 0x14[esp],eax
00CA  85 C0				test		eax,eax
00CC  0F 84 86 00 00 00			je		L$6
00D2  50				push		eax
00D3  E8 00 00 00 00			call		_GlobalLock
00D8  89 18				mov		dword ptr [eax],ebx
00DA  83 C0 04				add		eax,0x00000004
00DD  8B 5C 24 0C			mov		ebx,dword ptr 0xc[esp]
00E1  89 18				mov		dword ptr [eax],ebx
00E3  83 C0 12				add		eax,0x00000012
00E6  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
00EA  66 89 58 F8			mov		word ptr -0x8[eax],bx
00EE  8B 5C 24 04			mov		ebx,dword ptr 0x4[esp]
00F2  66 89 58 FA			mov		word ptr -0x6[eax],bx
00F6  8B 1C 24				mov		ebx,dword ptr [esp]
00F9  66 89 58 FC			mov		word ptr -0x4[eax],bx
00FD  8B 5C 24 28			mov		ebx,dword ptr 0x28[esp]
0101  8B 54 24 2C			mov		edx,dword ptr 0x2c[esp]
0105  66 89 58 FE			mov		word ptr -0x2[eax],bx
0109  8B 5C 24 10			mov		ebx,dword ptr 0x10[esp]
010D  66 C7 40 F6 00 00			mov		word ptr -0xa[eax],0x0000
0113  E8 00 00 00 00			call		copyString_
0118  8B 54 24 30			mov		edx,dword ptr 0x30[esp]
011C  89 EB				mov		ebx,ebp
011E  E8 00 00 00 00			call		copyString_
0123  8B 54 24 34			mov		edx,dword ptr 0x34[esp]
0127  89 F3				mov		ebx,esi
0129  E8 00 00 00 00			call		copyString_
012E  F6 44 24 0C 40			test		byte ptr 0xc[esp],0x40
0133  74 15				je		L$5
0135  8B 5C 24 38			mov		ebx,dword ptr 0x38[esp]
0139  8B 54 24 3C			mov		edx,dword ptr 0x3c[esp]
013D  66 89 18				mov		word ptr [eax],bx
0140  83 C0 02				add		eax,0x00000002
0143  89 FB				mov		ebx,edi
0145  E8 00 00 00 00			call		copyString_
014A				L$5:
014A  8B 54 24 14			mov		edx,dword ptr 0x14[esp]
014E  52				push		edx
014F  E8 00 00 00 00			call		_GlobalUnlock
0154  8B 44 24 14			mov		eax,dword ptr 0x14[esp]
0158				L$6:
0158  83 C4 18				add		esp,0x00000018
015B  5D				pop		ebp
015C  5F				pop		edi
015D  5E				pop		esi
015E  C2 18 00				ret		0x0018

Routine Size: 309 bytes,    Routine Base: _TEXT + 002C

0161				_AddControl_:
0161  56				push		esi
0162  57				push		edi
0163  55				push		ebp
0164  83 EC 20				sub		esp,0x00000020
0167  8B 6C 24 3C			mov		ebp,dword ptr 0x3c[esp]
016B  89 C6				mov		esi,eax
016D  89 54 24 10			mov		dword ptr 0x10[esp],edx
0171  89 5C 24 08			mov		dword ptr 0x8[esp],ebx
0175  89 4C 24 04			mov		dword ptr 0x4[esp],ecx
0179  8A 64 24 3B			mov		ah,byte ptr 0x3b[esp]
017D  80 CC 40				or		ah,0x40
0180  BA 00 00 00 00			mov		edx,offset DGROUP:L$12
0185  88 64 24 3B			mov		byte ptr 0x3b[esp],ah
0189  89 E8				mov		eax,ebp
018B  BB 02 00 00 00			mov		ebx,0x00000002
0190  E8 00 00 00 00			call		stricmp_
0195  85 C0				test		eax,eax
0197  75 07				jne		L$7
0199  C6 44 24 1C 83			mov		byte ptr 0x1c[esp],0x83
019E  EB 43				jmp		L$10
01A0				L$7:
01A0  BA 08 00 00 00			mov		edx,offset DGROUP:L$13
01A5  89 E8				mov		eax,ebp
01A7  E8 00 00 00 00			call		stricmp_
01AC  85 C0				test		eax,eax
01AE  75 07				jne		L$8
01B0  C6 44 24 1C 82			mov		byte ptr 0x1c[esp],0x82
01B5  EB 2C				jmp		L$10
01B7				L$8:
01B7  BA 0F 00 00 00			mov		edx,offset DGROUP:L$14
01BC  89 E8				mov		eax,ebp
01BE  E8 00 00 00 00			call		stricmp_
01C3  85 C0				test		eax,eax
01C5  75 07				jne		L$9
01C7  C6 44 24 1C 81			mov		byte ptr 0x1c[esp],0x81
01CC  EB 15				jmp		L$10
01CE				L$9:
01CE  BA 14 00 00 00			mov		edx,offset DGROUP:L$15
01D3  89 E8				mov		eax,ebp
01D5  E8 00 00 00 00			call		stricmp_
01DA  85 C0				test		eax,eax
01DC  75 05				jne		L$10
01DE  C6 44 24 1C 80			mov		byte ptr 0x1c[esp],0x80
01E3				L$10:
01E3  30 C0				xor		al,al
01E5  8B 7C 24 40			mov		edi,dword ptr 0x40[esp]
01E9  88 44 24 1D			mov		byte ptr 0x1d[esp],al
01ED  06				push		es
01EE  8C D8				mov		eax,ds
01F0  8E C0				mov		es,eax
01F2  29 C9				sub		ecx,ecx
01F4  49				dec		ecx
01F5  31 C0				xor		eax,eax
01F7  F2 AE				repne scasb	
01F9  F7 D1				not		ecx
01FB  49				dec		ecx
01FC  07				pop		es
01FD  01 C9				add		ecx,ecx
01FF  83 C1 02				add		ecx,0x00000002
0202  8D 43 14				lea		eax,0x14[ebx]
0205  89 4C 24 0C			mov		dword ptr 0xc[esp],ecx
0209  01 C8				add		eax,ecx
020B  31 C9				xor		ecx,ecx
020D  56				push		esi
020E  8A 4C 24 48			mov		cl,byte ptr 0x48[esp]
0212  83 C0 02				add		eax,0x00000002
0215  89 4C 24 18			mov		dword ptr 0x18[esp],ecx
0219  8D 2C 01				lea		ebp,[ecx+eax]
021C  E8 00 00 00 00			call		_GlobalLock
0221  83 C5 07				add		ebp,0x00000007
0224  8B 08				mov		ecx,dword ptr [eax]
0226  83 E5 F8				and		ebp,0xfffffff8
0229  56				push		esi
022A  01 CD				add		ebp,ecx
022C  E8 00 00 00 00			call		_GlobalUnlock
0231  6A 42				push		0x00000042
0233  55				push		ebp
0234  56				push		esi
0235  E8 00 00 00 00			call		_GlobalReAlloc
023A  89 44 24 18			mov		dword ptr 0x18[esp],eax
023E  85 C0				test		eax,eax
0240  0F 84 E4 00 00 00			je		L$11
0246  50				push		eax
0247  E8 00 00 00 00			call		_GlobalLock
024C  89 C5				mov		ebp,eax
024E  66 8B 50 0C			mov		dx,word ptr 0xc[eax]
0252  83 C0 04				add		eax,0x00000004
0255  42				inc		edx
0256  66 89 50 08			mov		word ptr 0x8[eax],dx
025A  8B 45 00				mov		eax,dword ptr [ebp]
025D  01 E8				add		eax,ebp
025F  8B 4C 24 38			mov		ecx,dword ptr 0x38[esp]
0263  89 08				mov		dword ptr [eax],ecx
0265  83 C0 14				add		eax,0x00000014
0268  66 C7 40 FE FF FF			mov		word ptr -0x2[eax],0xffff
026E  8B 4C 24 10			mov		ecx,dword ptr 0x10[esp]
0272  66 89 48 F4			mov		word ptr -0xc[eax],cx
0276  8B 4C 24 08			mov		ecx,dword ptr 0x8[esp]
027A  66 89 48 F6			mov		word ptr -0xa[eax],cx
027E  8B 4C 24 04			mov		ecx,dword ptr 0x4[esp]
0282  66 89 48 F8			mov		word ptr -0x8[eax],cx
0286  8B 4C 24 30			mov		ecx,dword ptr 0x30[esp]
028A  8D 74 24 1C			lea		esi,0x1c[esp]
028E  66 89 48 FA			mov		word ptr -0x6[eax],cx
0292  8B 4C 24 34			mov		ecx,dword ptr 0x34[esp]
0296  89 C7				mov		edi,eax
0298  66 89 48 FC			mov		word ptr -0x4[eax],cx
029C  89 D9				mov		ecx,ebx
029E  89 04 24				mov		dword ptr [esp],eax
02A1  06				push		es
02A2  8C D8				mov		eax,ds
02A4  8E C0				mov		es,eax
02A6  57				push		edi
02A7  89 C8				mov		eax,ecx
02A9  C1 E9 02				shr		ecx,0x02
02AC  F2 A5				repne movsd	
02AE  8A C8				mov		cl,al
02B0  80 E1 03				and		cl,0x03
02B3  F2 A4				repne movsb	
02B5  5F				pop		edi
02B6  07				pop		es
02B7  8D 43 01				lea		eax,0x1[ebx]
02BA  89 FA				mov		edx,edi
02BC  24 FE				and		al,0xfe
02BE  01 C2				add		edx,eax
02C0  8B 5C 24 0C			mov		ebx,dword ptr 0xc[esp]
02C4  89 14 24				mov		dword ptr [esp],edx
02C7  8B 54 24 40			mov		edx,dword ptr 0x40[esp]
02CB  8B 04 24				mov		eax,dword ptr [esp]
02CE  E8 00 00 00 00			call		copyString_
02D3  89 C6				mov		esi,eax
02D5  30 E4				xor		ah,ah
02D7  8A 44 24 44			mov		al,byte ptr 0x44[esp]
02DB  66 89 06				mov		word ptr [esi],ax
02DE  83 C6 02				add		esi,0x00000002
02E1  8B 4C 24 14			mov		ecx,dword ptr 0x14[esp]
02E5  89 34 24				mov		dword ptr [esp],esi
02E8  8B 74 24 48			mov		esi,dword ptr 0x48[esp]
02EC  8B 3C 24				mov		edi,dword ptr [esp]
02EF  06				push		es
02F0  8C D8				mov		eax,ds
02F2  8E C0				mov		es,eax
02F4  57				push		edi
02F5  89 C8				mov		eax,ecx
02F7  C1 E9 02				shr		ecx,0x02
02FA  F2 A5				repne movsd	
02FC  8A C8				mov		cl,al
02FE  80 E1 03				and		cl,0x03
0301  F2 A4				repne movsb	
0303  5F				pop		edi
0304  07				pop		es
0305  8B 44 24 14			mov		eax,dword ptr 0x14[esp]
0309  8D 1C 07				lea		ebx,[edi+eax]
030C  89 D8				mov		eax,ebx
030E  29 E8				sub		eax,ebp
0310  8B 4C 24 18			mov		ecx,dword ptr 0x18[esp]
0314  83 C0 03				add		eax,0x00000003
0317  51				push		ecx
0318  24 FC				and		al,0xfc
031A  89 5C 24 04			mov		dword ptr 0x4[esp],ebx
031E  89 45 00				mov		dword ptr [ebp],eax
0321  E8 00 00 00 00			call		_GlobalUnlock
0326  8B 44 24 18			mov		eax,dword ptr 0x18[esp]
032A				L$11:
032A  83 C4 20				add		esp,0x00000020
032D  5D				pop		ebp
032E  5F				pop		edi
032F  5E				pop		esi
0330  C2 1C 00				ret		0x001c

Routine Size: 466 bytes,    Routine Base: _TEXT + 0161

0333				_DoneAddingControls_:
0333  53				push		ebx
0334  51				push		ecx
0335  52				push		edx
0336  56				push		esi
0337  57				push		edi
0338  89 C3				mov		ebx,eax
033A  50				push		eax
033B  E8 00 00 00 00			call		_GlobalLock
0340  8B 08				mov		ecx,dword ptr [eax]
0342  8D 70 04				lea		esi,0x4[eax]
0345  83 E9 02				sub		ecx,0x00000002
0348  89 C7				mov		edi,eax
034A  06				push		es
034B  8C D8				mov		eax,ds
034D  8E C0				mov		es,eax
034F  57				push		edi
0350  89 C8				mov		eax,ecx
0352  C1 E9 02				shr		ecx,0x02
0355  F2 A5				repne movsd	
0357  8A C8				mov		cl,al
0359  80 E1 03				and		cl,0x03
035C  F2 A4				repne movsb	
035E  5F				pop		edi
035F  07				pop		es
0360  53				push		ebx
0361  E8 00 00 00 00			call		_GlobalUnlock
0366  5F				pop		edi
0367  5E				pop		esi
0368  5A				pop		edx
0369  59				pop		ecx
036A  5B				pop		ebx
036B  C3				ret		

Routine Size: 57 bytes,    Routine Base: _TEXT + 0333

036C				_DynamicDialogBox_:
036C  56				push		esi
036D  57				push		edi
036E  55				push		ebp
036F  89 C5				mov		ebp,eax
0371  89 D7				mov		edi,edx
0373  89 DE				mov		esi,ebx
0375  89 CB				mov		ebx,ecx
0377  51				push		ecx
0378  E8 00 00 00 00			call		_GlobalLock
037D  6A 00				push		0x00000000
037F  55				push		ebp
0380  56				push		esi
0381  50				push		eax
0382  57				push		edi
0383  E8 00 00 00 00			call		_DialogBoxIndirectParamA
0388  53				push		ebx
0389  89 C6				mov		esi,eax
038B  E8 00 00 00 00			call		_GlobalUnlock
0390  53				push		ebx
0391  E8 00 00 00 00			call		_GlobalFree
0396  89 F0				mov		eax,esi
0398  5D				pop		ebp
0399  5F				pop		edi
039A  5E				pop		esi
039B  C3				ret		

Routine Size: 48 bytes,    Routine Base: _TEXT + 036C

No disassembly errors

Segment: CONST DWORD USE32 0000001B bytes
0000				L$12:
0000  6C 69 73 74 62 6F 78 00                         listbox.
0008				L$13:
0008  73 74 61 74 69 63 00                            static.
000F				L$14:
000F  65 64 69 74 00                                  edit.
0014				L$15:
0014  62 75 74 74 6F 6E 00                            button.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

