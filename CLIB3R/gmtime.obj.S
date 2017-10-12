Module: gmtime
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000014A bytes
0000				__brktime_:
0000  56				push		esi
0001  57				push		edi
0002  55				push		ebp
0003  89 C7				mov		edi,eax
0005  89 D6				mov		esi,edx
0007  89 D8				mov		eax,ebx
0009  81 FA C0 A8 00 00			cmp		edx,0x0000a8c0
000F  73 1C				jae		L$1
0011  85 DB				test		ebx,ebx
0013  7E 18				jle		L$1
0015  8D B2 80 51 01 00			lea		esi,0x15180[edx]
001B  29 DE				sub		esi,ebx
001D  31 D2				xor		edx,edx
001F  BB 80 51 01 00			mov		ebx,0x00015180
0024  89 F0				mov		eax,esi
0026  F7 F3				div		ebx
0028  01 C7				add		edi,eax
002A  4F				dec		edi
002B  EB 0F				jmp		L$2
002D				L$1:
002D  BB 80 51 01 00			mov		ebx,0x00015180
0032  29 C6				sub		esi,eax
0034  31 D2				xor		edx,edx
0036  89 F0				mov		eax,esi
0038  F7 F3				div		ebx
003A  01 C7				add		edi,eax
003C				L$2:
003C  BB 80 51 01 00			mov		ebx,0x00015180
0041  89 F0				mov		eax,esi
0043  31 D2				xor		edx,edx
0045  F7 F3				div		ebx
0047  89 D3				mov		ebx,edx
0049  BE 10 0E 00 00			mov		esi,0x00000e10
004E  89 D8				mov		eax,ebx
0050  31 D2				xor		edx,edx
0052  F7 F6				div		esi
0054  31 D2				xor		edx,edx
0056  89 41 08				mov		dword ptr 0x8[ecx],eax
0059  89 D8				mov		eax,ebx
005B  F7 F6				div		esi
005D  89 D3				mov		ebx,edx
005F  BE 3C 00 00 00			mov		esi,0x0000003c
0064  89 D8				mov		eax,ebx
0066  31 D2				xor		edx,edx
0068  F7 F6				div		esi
006A  31 D2				xor		edx,edx
006C  89 41 04				mov		dword ptr 0x4[ecx],eax
006F  89 D8				mov		eax,ebx
0071  F7 F6				div		esi
0073  BB 6E 01 00 00			mov		ebx,0x0000016e
0078  89 F8				mov		eax,edi
007A  89 11				mov		dword ptr [ecx],edx
007C  31 D2				xor		edx,edx
007E  F7 F3				div		ebx
0080  89 C2				mov		edx,eax
0082  C1 E0 03				shl		eax,0x03
0085  01 D0				add		eax,edx
0087  C1 E0 03				shl		eax,0x03
008A  01 D0				add		eax,edx
008C  89 C3				mov		ebx,eax
008E  C1 E0 02				shl		eax,0x02
0091  01 D8				add		eax,ebx
0093  89 FB				mov		ebx,edi
0095  29 C3				sub		ebx,eax
0097  85 D2				test		edx,edx
0099  76 08				jbe		L$3
009B  8D 42 FF				lea		eax,-0x1[edx]
009E  C1 E8 02				shr		eax,0x02
00A1  29 C3				sub		ebx,eax
00A3				L$3:
00A3  8D 82 6C 07 00 00			lea		eax,0x76c[edx]
00A9  E8 00 00 00 00			call		__leapyear_
00AE  05 6D 01 00 00			add		eax,0x0000016d
00B3				L$4:
00B3  39 C3				cmp		ebx,eax
00B5  72 05				jb		L$5
00B7  42				inc		edx
00B8  29 C3				sub		ebx,eax
00BA  EB F7				jmp		L$4
00BC				L$5:
00BC  BE 00 00 00 00			mov		esi,offset ___diyr
00C1  89 51 14				mov		dword ptr 0x14[ecx],edx
00C4  8D 82 6C 07 00 00			lea		eax,0x76c[edx]
00CA  89 59 1C				mov		dword ptr 0x1c[ecx],ebx
00CD  E8 00 00 00 00			call		__leapyear_
00D2  85 C0				test		eax,eax
00D4  74 05				je		L$6
00D6  BE 00 00 00 00			mov		esi,offset ___dilyr
00DB				L$6:
00DB  BD 1F 00 00 00			mov		ebp,0x0000001f
00E0  89 D8				mov		eax,ebx
00E2  31 D2				xor		edx,edx
00E4  F7 F5				div		ebp
00E6  89 C2				mov		edx,eax
00E8  8B 14 56				mov		edx,dword ptr [esi+edx*2]
00EB  C1 FA 10				sar		edx,0x10
00EE  39 D3				cmp		ebx,edx
00F0  72 01				jb		L$7
00F2  40				inc		eax
00F3				L$7:
00F3  89 41 10				mov		dword ptr 0x10[ecx],eax
00F6  0F BF 04 46			movsx		eax,word ptr [esi+eax*2]
00FA  29 C3				sub		ebx,eax
00FC  31 D2				xor		edx,edx
00FE  43				inc		ebx
00FF  8D 47 01				lea		eax,0x1[edi]
0102  89 59 0C				mov		dword ptr 0xc[ecx],ebx
0105  BB 07 00 00 00			mov		ebx,0x00000007
010A  F7 F3				div		ebx
010C  89 C8				mov		eax,ecx
010E  89 51 18				mov		dword ptr 0x18[ecx],edx
0111  5D				pop		ebp
0112  5F				pop		edi
0113  5E				pop		esi
0114  C3				ret		

Routine Size: 277 bytes,    Routine Base: _TEXT + 0000

0115				_gmtime_:
0115  53				push		ebx
0116  51				push		ecx
0117  C7 42 20 00 00 00 00		mov		dword ptr 0x20[edx],0x00000000
011E  89 D1				mov		ecx,edx
0120  8B 00				mov		eax,dword ptr [eax]
0122  31 DB				xor		ebx,ebx
0124  89 C2				mov		edx,eax
0126  B8 DF 63 00 00			mov		eax,0x000063df
012B  E8 00 00 00 00			call		__brktime_
0130  59				pop		ecx
0131  5B				pop		ebx
0132  C3				ret		

Routine Size: 30 bytes,    Routine Base: _TEXT + 0115

0133				gmtime_:
0133  53				push		ebx
0134  52				push		edx
0135  89 C3				mov		ebx,eax
0137  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
013D  8D 50 14				lea		edx,0x14[eax]
0140  89 D8				mov		eax,ebx
0142  E8 00 00 00 00			call		_gmtime_
0147  5A				pop		edx
0148  5B				pop		ebx
0149  C3				ret		

Routine Size: 23 bytes,    Routine Base: _TEXT + 0133

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

