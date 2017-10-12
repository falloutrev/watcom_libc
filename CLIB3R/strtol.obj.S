Module: strtol
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001D3 bytes
0000				_stol_:
0000  56				push		esi
0001  57				push		edi
0002  55				push		ebp
0003  83 EC 0C				sub		esp,0x0000000c
0006  50				push		eax
0007  89 D5				mov		ebp,edx
0009  89 DE				mov		esi,ebx
000B  89 4C 24 04			mov		dword ptr 0x4[esp],ecx
000F  85 D2				test		edx,edx
0011  74 02				je		L$1
0013  89 02				mov		dword ptr [edx],eax
0015				L$1:
0015  8B 14 24				mov		edx,dword ptr [esp]
0018				L$2:
0018  8A 02				mov		al,byte ptr [edx]
001A  FE C0				inc		al
001C  25 FF 00 00 00			and		eax,0x000000ff
0021  8A 80 00 00 00 00			mov		al,byte ptr __IsTable[eax]
0027  24 02				and		al,0x02
0029  25 FF 00 00 00			and		eax,0x000000ff
002E  74 03				je		L$3
0030  42				inc		edx
0031  EB E5				jmp		L$2
0033				L$3:
0033  8A 2A				mov		ch,byte ptr [edx]
0035  88 E8				mov		al,ch
0037  83 F8 2B				cmp		eax,0x0000002b
003A  74 05				je		L$4
003C  83 F8 2D				cmp		eax,0x0000002d
003F  75 01				jne		L$5
0041				L$4:
0041  42				inc		edx
0042				L$5:
0042  85 F6				test		esi,esi
0044  75 34				jne		L$9
0046  31 C0				xor		eax,eax
0048  8A 02				mov		al,byte ptr [edx]
004A  83 F8 30				cmp		eax,0x00000030
004D  75 16				jne		L$7
004F  31 C0				xor		eax,eax
0051  8A 42 01				mov		al,byte ptr 0x1[edx]
0054  83 F8 78				cmp		eax,0x00000078
0057  74 05				je		L$6
0059  83 F8 58				cmp		eax,0x00000058
005C  75 07				jne		L$7
005E				L$6:
005E  BE 10 00 00 00			mov		esi,0x00000010
0063  EB 15				jmp		L$9
0065				L$7:
0065  31 C0				xor		eax,eax
0067  8A 02				mov		al,byte ptr [edx]
0069  83 F8 30				cmp		eax,0x00000030
006C  75 07				jne		L$8
006E  BE 08 00 00 00			mov		esi,0x00000008
0073  EB 05				jmp		L$9
0075				L$8:
0075  BE 0A 00 00 00			mov		esi,0x0000000a
007A				L$9:
007A  83 FE 02				cmp		esi,0x00000002
007D  7C 05				jl		L$10
007F  83 FE 24				cmp		esi,0x00000024
0082  7E 11				jle		L$11
0084				L$10:
0084  B8 0D 00 00 00			mov		eax,0x0000000d
0089  E8 00 00 00 00			call		__set_errno_
008E  31 DB				xor		ebx,ebx
0090  E9 C5 00 00 00			jmp		L$25
0095				L$11:
0095  83 FE 10				cmp		esi,0x00000010
0098  75 1B				jne		L$13
009A  31 C0				xor		eax,eax
009C  8A 02				mov		al,byte ptr [edx]
009E  83 F8 30				cmp		eax,0x00000030
00A1  75 12				jne		L$13
00A3  31 C0				xor		eax,eax
00A5  8A 42 01				mov		al,byte ptr 0x1[edx]
00A8  83 F8 78				cmp		eax,0x00000078
00AB  74 05				je		L$12
00AD  83 F8 58				cmp		eax,0x00000058
00B0  75 03				jne		L$13
00B2				L$12:
00B2  83 C2 02				add		edx,0x00000002
00B5				L$13:
00B5  89 54 24 08			mov		dword ptr 0x8[esp],edx
00B9  89 F7				mov		edi,esi
00BB  30 C9				xor		cl,cl
00BD  31 DB				xor		ebx,ebx
00BF  C1 E7 02				shl		edi,0x02
00C2				L$14:
00C2  31 C0				xor		eax,eax
00C4  8A 02				mov		al,byte ptr [edx]
00C6  E8 00 00 00 00			call		radix_value_
00CB  89 44 24 0C			mov		dword ptr 0xc[esp],eax
00CF  39 F0				cmp		eax,esi
00D1  7D 1C				jge		L$17
00D3  3B 9F F8 FF FF FF			cmp		ebx,dword ptr _nearly_overflowing-0x8[edi]
00D9  76 02				jbe		L$15
00DB  B1 01				mov		cl,0x01
00DD				L$15:
00DD  89 D8				mov		eax,ebx
00DF  0F AF DE				imul		ebx,esi
00E2  03 5C 24 0C			add		ebx,dword ptr 0xc[esp]
00E6  39 C3				cmp		ebx,eax
00E8  73 02				jae		L$16
00EA  B1 01				mov		cl,0x01
00EC				L$16:
00EC  42				inc		edx
00ED  EB D3				jmp		L$14
00EF				L$17:
00EF  3B 54 24 08			cmp		edx,dword ptr 0x8[esp]
00F3  75 03				jne		L$18
00F5  8B 14 24				mov		edx,dword ptr [esp]
00F8				L$18:
00F8  85 ED				test		ebp,ebp
00FA  74 03				je		L$19
00FC  89 55 00				mov		dword ptr [ebp],edx
00FF				L$19:
00FF  83 7C 24 04 01			cmp		dword ptr 0x4[esp],0x00000001
0104  75 15				jne		L$21
0106  81 FB 00 00 00 80			cmp		ebx,0x80000000
010C  72 0D				jb		L$21
010E  75 09				jne		L$20
0110  31 C0				xor		eax,eax
0112  88 E8				mov		al,ch
0114  83 F8 2D				cmp		eax,0x0000002d
0117  74 02				je		L$21
0119				L$20:
0119  B1 01				mov		cl,0x01
011B				L$21:
011B  84 C9				test		cl,cl
011D  74 30				je		L$24
011F  B8 0E 00 00 00			mov		eax,0x0000000e
0124  8B 6C 24 04			mov		ebp,dword ptr 0x4[esp]
0128  E8 00 00 00 00			call		__set_errno_
012D  85 ED				test		ebp,ebp
012F  75 07				jne		L$22
0131  BB FF FF FF FF			mov		ebx,0xffffffff
0136  EB 22				jmp		L$25
0138				L$22:
0138  31 C0				xor		eax,eax
013A  88 E8				mov		al,ch
013C  83 F8 2D				cmp		eax,0x0000002d
013F  75 07				jne		L$23
0141  BB 00 00 00 80			mov		ebx,0x80000000
0146  EB 12				jmp		L$25
0148				L$23:
0148  BB FF FF FF 7F			mov		ebx,0x7fffffff
014D  EB 0B				jmp		L$25
014F				L$24:
014F  31 C0				xor		eax,eax
0151  88 E8				mov		al,ch
0153  83 F8 2D				cmp		eax,0x0000002d
0156  75 02				jne		L$25
0158  F7 DB				neg		ebx
015A				L$25:
015A  89 D8				mov		eax,ebx
015C  83 C4 10				add		esp,0x00000010
015F  5D				pop		ebp
0160  5F				pop		edi
0161  5E				pop		esi
0162  C3				ret		

Routine Size: 355 bytes,    Routine Base: _TEXT + 0000

0163				strtoul_:
0163  51				push		ecx
0164  31 C9				xor		ecx,ecx
0166				L$26:
0166  E8 00 00 00 00			call		_stol_
016B  59				pop		ecx
016C  C3				ret		

Routine Size: 10 bytes,    Routine Base: _TEXT + 0163

016D				strtol_:
016D  51				push		ecx
016E  B9 01 00 00 00			mov		ecx,0x00000001
0173  EB F1				jmp		L$26
0175				radix_value_:
0175  52				push		edx
0176  31 D2				xor		edx,edx
0178  88 C2				mov		dl,al
017A  83 FA 30				cmp		edx,0x00000030
017D  7C 0A				jl		L$27
017F  83 FA 39				cmp		edx,0x00000039
0182  7F 05				jg		L$27
0184  8D 42 D0				lea		eax,-0x30[edx]
0187  5A				pop		edx
0188  C3				ret		
0189				L$27:
0189  25 FF 00 00 00			and		eax,0x000000ff
018E  E8 00 00 00 00			call		tolower_
0193  89 C2				mov		edx,eax
0195  81 E2 FF 00 00 00			and		edx,0x000000ff
019B  83 FA 61				cmp		edx,0x00000061
019E  7C 0A				jl		L$29
01A0  83 FA 69				cmp		edx,0x00000069
01A3  7F 05				jg		L$29
01A5				L$28:
01A5  8D 42 A9				lea		eax,-0x57[edx]
01A8  5A				pop		edx
01A9  C3				ret		
01AA				L$29:
01AA  31 D2				xor		edx,edx
01AC  88 C2				mov		dl,al
01AE  83 FA 6A				cmp		edx,0x0000006a
01B1  7C 05				jl		L$30
01B3  83 FA 72				cmp		edx,0x00000072
01B6  7E ED				jle		L$28
01B8				L$30:
01B8  25 FF 00 00 00			and		eax,0x000000ff
01BD  83 F8 73				cmp		eax,0x00000073
01C0  7C 0A				jl		L$31
01C2  83 F8 7A				cmp		eax,0x0000007a
01C5  7F 05				jg		L$31
01C7  83 E8 57				sub		eax,0x00000057
01CA  5A				pop		edx
01CB  C3				ret		
01CC				L$31:
01CC  B8 25 00 00 00			mov		eax,0x00000025
01D1  5A				pop		edx
01D2  C3				ret		

Routine Size: 102 bytes,    Routine Base: _TEXT + 016D

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 0000008C bytes
0000				_nearly_overflowing:
0000  FF FF FF 7F 55 55 55 55 FF FF FF 3F 33 33 33 33 ....UUUU...?3333
0010  AA AA AA 2A 24 49 92 24 FF FF FF 1F 1C C7 71 1C ...*$I.$......q.
0020  99 99 99 19 74 D1 45 17 55 55 55 15 13 3B B1 13 ....t.E.UUU..;..
0030  92 24 49 12 11 11 11 11 FF FF FF 0F 0F 0F 0F 0F .$I.............
0040  8E E3 38 0E 5E 43 79 0D CC CC CC 0C 0C C3 30 0C ..8.^Cy.......0.
0050  BA E8 A2 0B 2C 64 21 0B AA AA AA 0A A3 70 3D 0A ....,d!......p=.
0060  89 9D D8 09 5E 42 7B 09 49 92 24 09 B0 DC D3 08 ....^B{.I.$.....
0070  88 88 88 08 84 10 42 08 FF FF FF 07 7C F0 C1 07 ......B.....|...
0080  87 87 87 07 07 75 50 07 C7 71 1C 07             .....uP..q..

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

