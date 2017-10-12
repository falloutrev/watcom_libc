Module: fopen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000002BA bytes
0000				__open_flags_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  83 EC 04				sub		esp,0x00000004
0007  89 C3				mov		ebx,eax
0009  31 C0				xor		eax,eax
000B  8A 03				mov		al,byte ptr [ebx]
000D  31 D2				xor		edx,edx
000F  E8 00 00 00 00			call		tolower_
0014  88 04 24				mov		byte ptr [esp],al
0017  25 FF 00 00 00			and		eax,0x000000ff
001C  83 F8 72				cmp		eax,0x00000072
001F  74 1B				je		L$1
0021  83 F8 77				cmp		eax,0x00000077
0024  74 16				je		L$1
0026  83 F8 61				cmp		eax,0x00000061
0029  74 11				je		L$1
002B  B8 09 00 00 00			mov		eax,0x00000009
0030  E8 00 00 00 00			call		__set_errno_
0035  31 C0				xor		eax,eax
0037  E9 8D 00 00 00			jmp		L$12
003C				L$1:
003C  31 C9				xor		ecx,ecx
003E  89 D6				mov		esi,edx
0040  8A 4B 01				mov		cl,byte ptr 0x1[ebx]
0043  66 83 CE 03			or		si,0x0003
0047  83 F9 2B				cmp		ecx,0x0000002b
004A  75 25				jne		L$4
004C  31 C0				xor		eax,eax
004E  89 F2				mov		edx,esi
0050  8A 43 02				mov		al,byte ptr 0x2[ebx]
0053  66 83 CE 40			or		si,0x0040
0057  83 F8 62				cmp		eax,0x00000062
005A  74 11				je		L$3
005C  83 F8 74				cmp		eax,0x00000074
005F  74 4A				je		L$8
0061  81 3D 00 00 00 00 00 02 00 00
					cmp		dword ptr __fmode,0x00000200
006B				L$2:
006B  75 3E				jne		L$8
006D				L$3:
006D  89 F2				mov		edx,esi
006F  EB 3A				jmp		L$8
0071				L$4:
0071  89 D0				mov		eax,edx
0073  0C 40				or		al,0x40
0075  83 F9 62				cmp		ecx,0x00000062
0078  75 14				jne		L$5
007A  89 C2				mov		edx,eax
007C  8A 5B 02				mov		bl,byte ptr 0x2[ebx]
007F  81 E3 FF 00 00 00			and		ebx,0x000000ff
0085  83 FB 2B				cmp		ebx,0x0000002b
0088  75 21				jne		L$8
008A  0C 03				or		al,0x03
008C  EB 1B				jmp		L$7
008E				L$5:
008E  83 F9 74				cmp		ecx,0x00000074
0091  75 0A				jne		L$6
0093  31 C0				xor		eax,eax
0095  8A 43 02				mov		al,byte ptr 0x2[ebx]
0098  83 F8 2B				cmp		eax,0x0000002b
009B  EB CE				jmp		L$2
009D				L$6:
009D  81 3D 00 00 00 00 00 02 00 00
					cmp		dword ptr __fmode,0x00000200
00A7  75 02				jne		L$8
00A9				L$7:
00A9  89 C2				mov		edx,eax
00AB				L$8:
00AB  31 C0				xor		eax,eax
00AD  8A 04 24				mov		al,byte ptr [esp]
00B0  83 F8 77				cmp		eax,0x00000077
00B3  75 05				jne		L$9
00B5  80 CA 02				or		dl,0x02
00B8  EB 0D				jmp		L$11
00BA				L$9:
00BA  83 F8 61				cmp		eax,0x00000061
00BD  75 05				jne		L$10
00BF  80 CA 82				or		dl,0x82
00C2  EB 03				jmp		L$11
00C4				L$10:
00C4  80 CA 01				or		dl,0x01
00C7				L$11:
00C7  89 D0				mov		eax,edx
00C9				L$12:
00C9  83 C4 04				add		esp,0x00000004
00CC  5E				pop		esi
00CD  5A				pop		edx
00CE  59				pop		ecx
00CF  5B				pop		ebx
00D0  C3				ret		
00D1				__doopen_:
00D1  56				push		esi
00D2  89 C6				mov		esi,eax
00D4  88 D0				mov		al,dl
00D6  89 CA				mov		edx,ecx
00D8  8B 4C 24 08			mov		ecx,dword ptr 0x8[esp]
00DC  80 61 0C FC			and		byte ptr 0xc[ecx],0xfc
00E0  09 59 0C				or		dword ptr 0xc[ecx],ebx
00E3  25 FF 00 00 00			and		eax,0x000000ff
00E8  E8 00 00 00 00			call		tolower_
00ED  25 FF 00 00 00			and		eax,0x000000ff
00F2  83 F8 72				cmp		eax,0x00000072
00F5  75 1D				jne		L$16
00F7  31 C0				xor		eax,eax
00F9  F6 C3 02				test		bl,0x02
00FC  74 05				je		L$13
00FE  B8 02 00 00 00			mov		eax,0x00000002
0103				L$13:
0103  F6 C3 40				test		bl,0x40
0106  74 05				je		L$14
0108  80 CC 02				or		ah,0x02
010B  EB 03				jmp		L$15
010D				L$14:
010D  80 CC 01				or		ah,0x01
0110				L$15:
0110  6A 00				push		0x00000000
0112  EB 2B				jmp		L$21
0114				L$16:
0114  F6 C3 01				test		bl,0x01
0117  0F 95 C0				setne		al
011A  25 FF 00 00 00			and		eax,0x000000ff
011F  83 C0 21				add		eax,0x00000021
0122  F6 C3 80				test		bl,0x80
0125  74 04				je		L$17
0127  0C 10				or		al,0x10
0129  EB 02				jmp		L$18
012B				L$17:
012B  0C 40				or		al,0x40
012D				L$18:
012D  F6 C3 40				test		bl,0x40
0130  74 05				je		L$19
0132  80 CC 02				or		ah,0x02
0135  EB 03				jmp		L$20
0137				L$19:
0137  80 CC 01				or		ah,0x01
013A				L$20:
013A  68 80 01 00 00			push		0x00000180
013F				L$21:
013F  52				push		edx
0140  50				push		eax
0141  56				push		esi
0142  E8 00 00 00 00			call		sopen_
0147  83 C4 10				add		esp,0x00000010
014A  89 41 10				mov		dword ptr 0x10[ecx],eax
014D  83 79 10 FF			cmp		dword ptr 0x10[ecx],0xffffffff
0151  75 0D				jne		L$22
0153  89 C8				mov		eax,ecx
0155  E8 00 00 00 00			call		__freefp_
015A  31 C0				xor		eax,eax
015C  5E				pop		esi
015D  C2 04 00				ret		0x0004
0160				L$22:
0160  C7 41 04 00 00 00 00		mov		dword ptr 0x4[ecx],0x00000000
0167  C7 41 08 00 00 00 00		mov		dword ptr 0x8[ecx],0x00000000
016E  C7 41 14 00 00 00 00		mov		dword ptr 0x14[ecx],0x00000000
0175  F6 C3 80				test		bl,0x80
0178  74 0E				je		L$23
017A  BB 02 00 00 00			mov		ebx,0x00000002
017F  89 C8				mov		eax,ecx
0181  31 D2				xor		edx,edx
0183  E8 00 00 00 00			call		fseek_
0188				L$23:
0188  89 C8				mov		eax,ecx
018A  E8 00 00 00 00			call		__chktty_
018F  89 C8				mov		eax,ecx
0191  5E				pop		esi
0192  C2 04 00				ret		0x0004

Routine Size: 405 bytes,    Routine Base: _TEXT + 0000

0195				_fsopen_:
0195  51				push		ecx
0196  56				push		esi
0197  57				push		edi
0198  89 C6				mov		esi,eax
019A  89 D9				mov		ecx,ebx
019C  89 D0				mov		eax,edx
019E  E8 00 00 00 00			call		__open_flags_
01A3  89 C3				mov		ebx,eax
01A5  85 C0				test		eax,eax
01A7  74 21				je		L$25
01A9  31 C0				xor		eax,eax
01AB  E8 00 00 00 00			call		__allocfp_
01B0  89 C7				mov		edi,eax
01B2  85 C0				test		eax,eax
01B4  74 12				je		L$24
01B6  50				push		eax
01B7  8A 12				mov		dl,byte ptr [edx]
01B9  81 E2 FF 00 00 00			and		edx,0x000000ff
01BF  89 F0				mov		eax,esi
01C1  E8 00 00 00 00			call		__doopen_
01C6  89 C7				mov		edi,eax
01C8				L$24:
01C8  89 F8				mov		eax,edi
01CA				L$25:
01CA  5F				pop		edi
01CB  5E				pop		esi
01CC  59				pop		ecx
01CD  C3				ret		

Routine Size: 57 bytes,    Routine Base: _TEXT + 0195

01CE				fopen_:
01CE  53				push		ebx
01CF  31 DB				xor		ebx,ebx
01D1  E8 00 00 00 00			call		_fsopen_
01D6  5B				pop		ebx
01D7  C3				ret		
01D8				close_file_:
01D8  53				push		ebx
01D9  51				push		ecx
01DA  52				push		edx
01DB  89 C3				mov		ebx,eax
01DD  FF 15 00 00 00 00			call		dword ptr __AccessIOB
01E3  A1 00 00 00 00			mov		eax,dword ptr ___OpenStreams
01E8				L$26:
01E8  85 C0				test		eax,eax
01EA  74 29				je		L$29
01EC  8B 50 04				mov		edx,dword ptr 0x4[eax]
01EF  39 D3				cmp		ebx,edx
01F1  75 1E				jne		L$28
01F3  F6 42 0C 03			test		byte ptr 0xc[edx],0x03
01F7  74 0C				je		L$27
01F9  BA 01 00 00 00			mov		edx,0x00000001
01FE  89 D8				mov		eax,ebx
0200  E8 00 00 00 00			call		__doclose_
0205				L$27:
0205  FF 15 00 00 00 00			call		dword ptr __ReleaseIOB
020B  89 D8				mov		eax,ebx
020D  5A				pop		edx
020E  59				pop		ecx
020F  5B				pop		ebx
0210  C3				ret		
0211				L$28:
0211  8B 00				mov		eax,dword ptr [eax]
0213  EB D3				jmp		L$26
0215				L$29:
0215  BA 00 00 00 00			mov		edx,offset ___ClosedStreams
021A				L$30:
021A  8B 02				mov		eax,dword ptr [edx]
021C  85 C0				test		eax,eax
021E  74 1C				je		L$32
0220  3B 58 04				cmp		ebx,dword ptr 0x4[eax]
0223  75 13				jne		L$31
0225  8B 08				mov		ecx,dword ptr [eax]
0227  89 0A				mov		dword ptr [edx],ecx
0229  8B 15 00 00 00 00			mov		edx,dword ptr ___OpenStreams
022F  A3 00 00 00 00			mov		dword ptr ___OpenStreams,eax
0234  89 10				mov		dword ptr [eax],edx
0236  EB CD				jmp		L$27
0238				L$31:
0238  89 C2				mov		edx,eax
023A  EB DE				jmp		L$30
023C				L$32:
023C  B8 04 00 00 00			mov		eax,0x00000004
0241  E8 00 00 00 00			call		__set_errno_
0246  FF 15 00 00 00 00			call		dword ptr __ReleaseIOB
024C  31 C0				xor		eax,eax
024E  5A				pop		edx
024F  59				pop		ecx
0250  5B				pop		ebx
0251  C3				ret		

Routine Size: 132 bytes,    Routine Base: _TEXT + 01CE

0252				freopen_:
0252  51				push		ecx
0253  56				push		esi
0254  57				push		edi
0255  55				push		ebp
0256  89 C7				mov		edi,eax
0258  89 D0				mov		eax,edx
025A  E8 00 00 00 00			call		__open_flags_
025F  89 C5				mov		ebp,eax
0261  85 C0				test		eax,eax
0263  74 50				je		L$35
0265  8B 73 10				mov		esi,dword ptr 0x10[ebx]
0268  89 F0				mov		eax,esi
026A  FF 15 00 00 00 00			call		dword ptr __AccessFileH
0270  83 3D 00 00 00 00 00		cmp		dword ptr __WindowsRemoveWindowedHandle,0x00000000
0277  74 08				je		L$33
0279  89 F0				mov		eax,esi
027B  FF 15 00 00 00 00			call		dword ptr __WindowsRemoveWindowedHandle
0281				L$33:
0281  89 D8				mov		eax,ebx
0283  E8 00 00 00 00			call		close_file_
0288  89 C3				mov		ebx,eax
028A  85 C0				test		eax,eax
028C  74 1D				je		L$34
028E  81 60 0C 00 40 00 00		and		dword ptr 0xc[eax],0x00004000
0295  50				push		eax
0296  8A 12				mov		dl,byte ptr [edx]
0298  81 E2 FF 00 00 00			and		edx,0x000000ff
029E  89 EB				mov		ebx,ebp
02A0  89 F8				mov		eax,edi
02A2  31 C9				xor		ecx,ecx
02A4  E8 00 00 00 00			call		__doopen_
02A9  89 C3				mov		ebx,eax
02AB				L$34:
02AB  89 F0				mov		eax,esi
02AD  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
02B3  89 D8				mov		eax,ebx
02B5				L$35:
02B5  5D				pop		ebp
02B6  5F				pop		edi
02B7  5E				pop		esi
02B8  59				pop		ecx
02B9  C3				ret		

Routine Size: 104 bytes,    Routine Base: _TEXT + 0252

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

