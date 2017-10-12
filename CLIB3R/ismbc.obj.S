Module: ismbc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000031F bytes
0000				_ismbclegal_:
0000  52				push		edx
0001  8B 15 00 00 00 00			mov		edx,dword ptr ___IsDBCS
0007  85 D2				test		edx,edx
0009  74 4C				je		L$5
000B  74 1A				je		L$1
000D  89 C2				mov		edx,eax
000F  C1 EA 08				shr		edx,0x08
0012  81 E2 FF 00 00 00			and		edx,0x000000ff
0018  8A 92 01 00 00 00			mov		dl,byte ptr ___MBCSIsTable+0x1[edx]
001E  80 E2 01				and		dl,0x01
0021  81 E2 FF 00 00 00			and		edx,0x000000ff
0027				L$1:
0027  85 D2				test		edx,edx
0029  74 28				je		L$4
002B  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
0032  74 14				je		L$2
0034  25 FF 00 00 00			and		eax,0x000000ff
0039  8A 80 01 00 00 00			mov		al,byte ptr ___MBCSIsTable+0x1[eax]
003F  24 02				and		al,0x02
0041  25 FF 00 00 00			and		eax,0x000000ff
0046  EB 02				jmp		L$3
0048				L$2:
0048  31 C0				xor		eax,eax
004A				L$3:
004A  74 07				je		L$4
004C  B8 01 00 00 00			mov		eax,0x00000001
0051  5A				pop		edx
0052  C3				ret		
0053				L$4:
0053  31 C0				xor		eax,eax
0055  5A				pop		edx
0056  C3				ret		
0057				L$5:
0057  F6 C4 FF				test		ah,0xff
005A  0F 94 C0				sete		al
005D  25 FF 00 00 00			and		eax,0x000000ff
0062  5A				pop		edx
0063  C3				ret		

Routine Size: 100 bytes,    Routine Base: _TEXT + 0000

0064				_ismbcl0_:
0064  52				push		edx
0065  89 C2				mov		edx,eax
0067  E8 00 00 00 00			call		_ismbclegal_
006C  85 C0				test		eax,eax
006E  74 0F				je		L$6
0070  81 FA 9E 88 00 00			cmp		edx,0x0000889e
0076  77 07				ja		L$6
0078  B8 01 00 00 00			mov		eax,0x00000001
007D  5A				pop		edx
007E  C3				ret		
007F				L$6:
007F  31 C0				xor		eax,eax
0081  5A				pop		edx
0082  C3				ret		

Routine Size: 31 bytes,    Routine Base: _TEXT + 0064

0083				_ismbcl1_:
0083  52				push		edx
0084  89 C2				mov		edx,eax
0086  E8 00 00 00 00			call		_ismbclegal_
008B  85 C0				test		eax,eax
008D  74 17				je		L$7
008F  81 FA 9F 88 00 00			cmp		edx,0x0000889f
0095  72 0F				jb		L$7
0097  81 FA 72 98 00 00			cmp		edx,0x00009872
009D  77 07				ja		L$7
009F  B8 01 00 00 00			mov		eax,0x00000001
00A4  5A				pop		edx
00A5  C3				ret		
00A6				L$7:
00A6  31 C0				xor		eax,eax
00A8  5A				pop		edx
00A9  C3				ret		

Routine Size: 39 bytes,    Routine Base: _TEXT + 0083

00AA				_ismbcl2_:
00AA  52				push		edx
00AB  89 C2				mov		edx,eax
00AD  E8 00 00 00 00			call		_ismbclegal_
00B2  85 C0				test		eax,eax
00B4  74 17				je		L$8
00B6  81 FA 9F 98 00 00			cmp		edx,0x0000989f
00BC  72 0F				jb		L$8
00BE  81 FA 9E EA 00 00			cmp		edx,0x0000ea9e
00C4  77 07				ja		L$8
00C6  B8 01 00 00 00			mov		eax,0x00000001
00CB  5A				pop		edx
00CC  C3				ret		
00CD				L$8:
00CD  31 C0				xor		eax,eax
00CF  5A				pop		edx
00D0  C3				ret		

Routine Size: 39 bytes,    Routine Base: _TEXT + 00AA

00D1				_ismbcalpha_:
00D1  53				push		ebx
00D2  51				push		ecx
00D3  52				push		edx
00D4  89 C2				mov		edx,eax
00D6  88 C3				mov		bl,al
00D8  8B 0D 00 00 00 00			mov		ecx,dword ptr ___IsDBCS
00DE  FE C3				inc		bl
00E0  85 C9				test		ecx,ecx
00E2  74 28				je		L$10
00E4  E8 00 00 00 00			call		_ismbclegal_
00E9  85 C0				test		eax,eax
00EB  74 21				je		L$11
00ED  89 D0				mov		eax,edx
00EF  E8 00 00 00 00			call		_ismbdupper_
00F4  85 C0				test		eax,eax
00F6  75 0B				jne		L$9
00F8  89 D0				mov		eax,edx
00FA  E8 00 00 00 00			call		_ismbdlower_
00FF  85 C0				test		eax,eax
0101  74 1A				je		L$12
0103				L$9:
0103  B8 01 00 00 00			mov		eax,0x00000001
0108  5A				pop		edx
0109  59				pop		ecx
010A  5B				pop		ebx
010B  C3				ret		
010C				L$10:
010C  31 C0				xor		eax,eax
010E				L$11:
010E  88 D8				mov		al,bl
0110  8A 80 00 00 00 00			mov		al,byte ptr __IsTable[eax]
0116  24 C0				and		al,0xc0
0118  25 FF 00 00 00			and		eax,0x000000ff
011D				L$12:
011D  5A				pop		edx
011E  59				pop		ecx
011F  5B				pop		ebx
0120  C3				ret		

Routine Size: 80 bytes,    Routine Base: _TEXT + 00D1

0121				_ismbcupper_:
0121  53				push		ebx
0122  51				push		ecx
0123  52				push		edx
0124  89 C2				mov		edx,eax
0126  88 C3				mov		bl,al
0128  8B 0D 00 00 00 00			mov		ecx,dword ptr ___IsDBCS
012E  FE C3				inc		bl
0130  85 C9				test		ecx,ecx
0132  74 14				je		L$13
0134  E8 00 00 00 00			call		_ismbclegal_
0139  85 C0				test		eax,eax
013B  74 0D				je		L$14
013D  89 D0				mov		eax,edx
013F  E8 00 00 00 00			call		_ismbdupper_
0144  5A				pop		edx
0145  59				pop		ecx
0146  5B				pop		ebx
0147  C3				ret		
0148				L$13:
0148  31 C0				xor		eax,eax
014A				L$14:
014A  88 D8				mov		al,bl
014C  8A 80 00 00 00 00			mov		al,byte ptr __IsTable[eax]
0152  24 40				and		al,0x40
0154  25 FF 00 00 00			and		eax,0x000000ff
0159  5A				pop		edx
015A  59				pop		ecx
015B  5B				pop		ebx
015C  C3				ret		

Routine Size: 60 bytes,    Routine Base: _TEXT + 0121

015D				_ismbclower_:
015D  53				push		ebx
015E  51				push		ecx
015F  52				push		edx
0160  89 C2				mov		edx,eax
0162  88 C3				mov		bl,al
0164  8B 0D 00 00 00 00			mov		ecx,dword ptr ___IsDBCS
016A  FE C3				inc		bl
016C  85 C9				test		ecx,ecx
016E  74 14				je		L$15
0170  E8 00 00 00 00			call		_ismbclegal_
0175  85 C0				test		eax,eax
0177  74 0D				je		L$16
0179  89 D0				mov		eax,edx
017B  E8 00 00 00 00			call		_ismbdlower_
0180  5A				pop		edx
0181  59				pop		ecx
0182  5B				pop		ebx
0183  C3				ret		
0184				L$15:
0184  31 C0				xor		eax,eax
0186				L$16:
0186  88 D8				mov		al,bl
0188  8A 80 00 00 00 00			mov		al,byte ptr __IsTable[eax]
018E  24 80				and		al,0x80
0190  25 FF 00 00 00			and		eax,0x000000ff
0195  5A				pop		edx
0196  59				pop		ecx
0197  5B				pop		ebx
0198  C3				ret		

Routine Size: 60 bytes,    Routine Base: _TEXT + 015D

0199				_ismbcdigit_:
0199  53				push		ebx
019A  51				push		ecx
019B  52				push		edx
019C  89 C2				mov		edx,eax
019E  88 C3				mov		bl,al
01A0  8B 0D 00 00 00 00			mov		ecx,dword ptr ___IsDBCS
01A6  FE C3				inc		bl
01A8  85 C9				test		ecx,ecx
01AA  74 14				je		L$17
01AC  E8 00 00 00 00			call		_ismbclegal_
01B1  85 C0				test		eax,eax
01B3  74 0D				je		L$18
01B5  89 D0				mov		eax,edx
01B7  E8 00 00 00 00			call		_ismbddigit_
01BC  5A				pop		edx
01BD  59				pop		ecx
01BE  5B				pop		ebx
01BF  C3				ret		
01C0				L$17:
01C0  31 C0				xor		eax,eax
01C2				L$18:
01C2  88 D8				mov		al,bl
01C4  8A 80 00 00 00 00			mov		al,byte ptr __IsTable[eax]
01CA  24 20				and		al,0x20
01CC  25 FF 00 00 00			and		eax,0x000000ff
01D1  5A				pop		edx
01D2  59				pop		ecx
01D3  5B				pop		ebx
01D4  C3				ret		

Routine Size: 60 bytes,    Routine Base: _TEXT + 0199

01D5				_ismbckata_:
01D5  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
01DC  74 1E				je		L$20
01DE  3D 40 83 00 00			cmp		eax,0x00008340
01E3  72 14				jb		L$19
01E5  3D 96 83 00 00			cmp		eax,0x00008396
01EA  77 0D				ja		L$19
01EC  3D 7F 83 00 00			cmp		eax,0x0000837f
01F1  74 06				je		L$19
01F3  B8 01 00 00 00			mov		eax,0x00000001
01F8  C3				ret		
01F9				L$19:
01F9  31 C0				xor		eax,eax
01FB  C3				ret		
01FC				L$20:
01FC  31 C0				xor		eax,eax
01FE  C3				ret		

Routine Size: 42 bytes,    Routine Base: _TEXT + 01D5

01FF				_ismbchira_:
01FF  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
0206  74 17				je		L$22
0208  3D 9F 82 00 00			cmp		eax,0x0000829f
020D  72 0D				jb		L$21
020F  3D F1 82 00 00			cmp		eax,0x000082f1
0214  77 06				ja		L$21
0216  B8 01 00 00 00			mov		eax,0x00000001
021B  C3				ret		
021C				L$21:
021C  31 C0				xor		eax,eax
021E  C3				ret		
021F				L$22:
021F  31 C0				xor		eax,eax
0221  C3				ret		

Routine Size: 35 bytes,    Routine Base: _TEXT + 01FF

0222				_ismbcprint_:
0222  53				push		ebx
0223  52				push		edx
0224  89 C2				mov		edx,eax
0226  8B 1D 00 00 00 00			mov		ebx,dword ptr ___IsDBCS
022C  FE C0				inc		al
022E  85 DB				test		ebx,ebx
0230  0F 84 6E 00 00 00			je		L$27
0236  25 FF 00 00 00			and		eax,0x000000ff
023B  8A 98 00 00 00 00			mov		bl,byte ptr __IsTable[eax]
0241  80 E3 08				and		bl,0x08
0244  81 E3 FF 00 00 00			and		ebx,0x000000ff
024A  75 50				jne		L$26
024C  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
0253  74 13				je		L$23
0255  31 C0				xor		eax,eax
0257  88 D0				mov		al,dl
0259  8A 80 01 00 00 00			mov		al,byte ptr ___MBCSIsTable+0x1[eax]
025F  24 0C				and		al,0x0c
0261  25 FF 00 00 00			and		eax,0x000000ff
0266  EB 25				jmp		L$25
0268				L$23:
0268  8A 98 00 00 00 00			mov		bl,byte ptr __IsTable[eax]
026E  80 E3 C0				and		bl,0xc0
0271  81 E3 FF 00 00 00			and		ebx,0x000000ff
0277  75 0F				jne		L$24
0279  8A 80 00 00 00 00			mov		al,byte ptr __IsTable[eax]
027F  24 04				and		al,0x04
0281  25 FF 00 00 00			and		eax,0x000000ff
0286  74 05				je		L$25
0288				L$24:
0288  B8 01 00 00 00			mov		eax,0x00000001
028D				L$25:
028D  85 C0				test		eax,eax
028F  75 0B				jne		L$26
0291  89 D0				mov		eax,edx
0293  E8 00 00 00 00			call		_ismbclegal_
0298  85 C0				test		eax,eax
029A  74 1A				je		L$28
029C				L$26:
029C  B8 01 00 00 00			mov		eax,0x00000001
02A1  5A				pop		edx
02A2  5B				pop		ebx
02A3  C3				ret		
02A4				L$27:
02A4  25 FF 00 00 00			and		eax,0x000000ff
02A9  8A 80 00 00 00 00			mov		al,byte ptr __IsTable[eax]
02AF  24 08				and		al,0x08
02B1  25 FF 00 00 00			and		eax,0x000000ff
02B6				L$28:
02B6  5A				pop		edx
02B7  5B				pop		ebx
02B8  C3				ret		

Routine Size: 151 bytes,    Routine Base: _TEXT + 0222

02B9				_ismbcsymbol_:
02B9  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
02C0  74 1E				je		L$30
02C2  3D 41 81 00 00			cmp		eax,0x00008141
02C7  72 14				jb		L$29
02C9  3D AC 81 00 00			cmp		eax,0x000081ac
02CE  77 0D				ja		L$29
02D0  3D 7F 81 00 00			cmp		eax,0x0000817f
02D5  74 06				je		L$29
02D7  B8 01 00 00 00			mov		eax,0x00000001
02DC  C3				ret		
02DD				L$29:
02DD  31 C0				xor		eax,eax
02DF  C3				ret		
02E0				L$30:
02E0  31 C0				xor		eax,eax
02E2  C3				ret		

Routine Size: 42 bytes,    Routine Base: _TEXT + 02B9

02E3				_ismbcspace_:
02E3  53				push		ebx
02E4  51				push		ecx
02E5  52				push		edx
02E6  89 C2				mov		edx,eax
02E8  88 C3				mov		bl,al
02EA  8B 0D 00 00 00 00			mov		ecx,dword ptr ___IsDBCS
02F0  FE C3				inc		bl
02F2  85 C9				test		ecx,ecx
02F4  74 14				je		L$31
02F6  E8 00 00 00 00			call		_ismbclegal_
02FB  85 C0				test		eax,eax
02FD  74 0D				je		L$32
02FF  89 D0				mov		eax,edx
0301  E8 00 00 00 00			call		_ismbdspace_
0306  5A				pop		edx
0307  59				pop		ecx
0308  5B				pop		ebx
0309  C3				ret		
030A				L$31:
030A  31 C0				xor		eax,eax
030C				L$32:
030C  88 D8				mov		al,bl
030E  8A 80 00 00 00 00			mov		al,byte ptr __IsTable[eax]
0314  24 02				and		al,0x02
0316  25 FF 00 00 00			and		eax,0x000000ff
031B  5A				pop		edx
031C  59				pop		ecx
031D  5B				pop		ebx
031E  C3				ret		

Routine Size: 60 bytes,    Routine Base: _TEXT + 02E3

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

