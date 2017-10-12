Module: memalloc
GROUP: 'DGROUP' _DATA

Segment: _TEXT WORD USE32 000001B3 bytes
0000				__MemAllocator:
0000  56				push		esi
0001  57				push		edi
0002  51				push		ecx
0003  1E				push		ds
0004  8E DA				mov		ds,edx
0006  09 C0				or		eax,eax
0008  74 45				je		L$2
000A  83 C0 0B				add		eax,0x0000000b
000D  72 40				jb		L$2
000F  24 F8				and		al,0xf8
0011  BA 10 00 00 00			mov		edx,0x00000010
0016  29 D0				sub		eax,edx
0018  F5				cmc		
0019  19 C9				sbb		ecx,ecx
001B  21 C8				and		eax,ecx
001D  01 D0				add		eax,edx
001F  3B 43 14				cmp		eax,dword ptr 0x14[ebx]
0022  77 2B				ja		L$2
0024  8B 73 0C				mov		esi,dword ptr 0xc[ebx]
0027  8B 7B 10				mov		edi,dword ptr 0x10[ebx]
002A  39 F8				cmp		eax,edi
002C  77 05				ja		L$1
002E  8B 73 28				mov		esi,dword ptr 0x28[ebx]
0031  29 FF				sub		edi,edi
0033				L$1:
0033  8B 16				mov		edx,dword ptr [esi]
0035  39 D0				cmp		eax,edx
0037  76 1A				jbe		L$3
0039  29 D7				sub		edi,edx
003B  F5				cmc		
003C  19 C9				sbb		ecx,ecx
003E  21 CF				and		edi,ecx
0040  01 D7				add		edi,edx
0042  8D 53 20				lea		edx,0x20[ebx]
0045  8B 76 08				mov		esi,dword ptr 0x8[esi]
0048  39 D6				cmp		esi,edx
004A  75 E7				jne		L$1
004C  89 7B 14				mov		dword ptr 0x14[ebx],edi
004F				L$2:
004F  29 C0				sub		eax,eax
0051  EB 4B				jmp		L$6
0053				L$3:
0053  29 C2				sub		edx,eax
0055  89 7B 10				mov		dword ptr 0x10[ebx],edi
0058  FF 43 18				inc		dword ptr 0x18[ebx]
005B  8B 4E 08				mov		ecx,dword ptr 0x8[esi]
005E  83 FA 10				cmp		edx,0x00000010
0061  72 1E				jb		L$4
0063  89 F7				mov		edi,esi
0065  01 C7				add		edi,eax
0067  89 7B 0C				mov		dword ptr 0xc[ebx],edi
006A  89 17				mov		dword ptr [edi],edx
006C  89 06				mov		dword ptr [esi],eax
006E  8B 5E 04				mov		ebx,dword ptr 0x4[esi]
0071  89 5F 04				mov		dword ptr 0x4[edi],ebx
0074  89 4F 08				mov		dword ptr 0x8[edi],ecx
0077  89 7B 08				mov		dword ptr 0x8[ebx],edi
007A  89 CB				mov		ebx,ecx
007C  89 7B 04				mov		dword ptr 0x4[ebx],edi
007F  EB 15				jmp		L$5
0081				L$4:
0081  FF 4B 1C				dec		dword ptr 0x1c[ebx]
0084  89 F0				mov		eax,esi
0086  89 CF				mov		edi,ecx
0088  8B 76 04				mov		esi,dword ptr 0x4[esi]
008B  89 7E 08				mov		dword ptr 0x8[esi],edi
008E  89 77 04				mov		dword ptr 0x4[edi],esi
0091  89 73 0C				mov		dword ptr 0xc[ebx],esi
0094  89 C6				mov		esi,eax
0096				L$5:
0096  83 0E 01				or		dword ptr [esi],0x00000001
0099  89 F0				mov		eax,esi
009B  83 C0 04				add		eax,0x00000004
009E				L$6:
009E  1F				pop		ds
009F  59				pop		ecx
00A0  5F				pop		edi
00A1  5E				pop		esi
00A2  C3				ret		
00A3				L$7:
00A3  E9 06 01 00 00			jmp		L$21

Routine Size: 168 bytes,    Routine Base: _TEXT + 0000

00A8				__MemFree:
00A8  56				push		esi
00A9  57				push		edi
00AA  51				push		ecx
00AB  1E				push		ds
00AC  8E DA				mov		ds,edx
00AE  09 C0				or		eax,eax
00B0  74 F1				je		L$7
00B2  89 C6				mov		esi,eax
00B4  83 EE 04				sub		esi,0x00000004
00B7  8B 06				mov		eax,dword ptr [esi]
00B9  A8 01				test		al,0x01
00BB  74 E6				je		L$7
00BD  24 FE				and		al,0xfe
00BF  89 F7				mov		edi,esi
00C1  01 C7				add		edi,eax
00C3  F7 07 01 00 00 00			test		dword ptr [edi],0x00000001
00C9  75 1F				jne		L$9
00CB  3B 7B 0C				cmp		edi,dword ptr 0xc[ebx]
00CE  75 03				jne		L$8
00D0  89 73 0C				mov		dword ptr 0xc[ebx],esi
00D3				L$8:
00D3  03 07				add		eax,dword ptr [edi]
00D5  89 06				mov		dword ptr [esi],eax
00D7  53				push		ebx
00D8  8B 5F 04				mov		ebx,dword ptr 0x4[edi]
00DB  8B 7F 08				mov		edi,dword ptr 0x8[edi]
00DE  89 7B 08				mov		dword ptr 0x8[ebx],edi
00E1  89 5F 04				mov		dword ptr 0x4[edi],ebx
00E4  5B				pop		ebx
00E5  FF 4B 1C				dec		dword ptr 0x1c[ebx]
00E8  EB 7C				jmp		L$16
00EA				L$9:
00EA  89 06				mov		dword ptr [esi],eax
00EC  8B 7B 0C				mov		edi,dword ptr 0xc[ebx]
00EF  39 FE				cmp		esi,edi
00F1  73 0E				jae		L$10
00F3  3B 77 04				cmp		esi,dword ptr 0x4[edi]
00F6  77 6E				ja		L$16
00F8  8B 7B 28				mov		edi,dword ptr 0x28[ebx]
00FB  39 FE				cmp		esi,edi
00FD  72 67				jb		L$16
00FF  EB 0F				jmp		L$11
0101				L$10:
0101  8B 7F 08				mov		edi,dword ptr 0x8[edi]
0104  39 FE				cmp		esi,edi
0106  72 5E				jb		L$16
0108  8D 7B 20				lea		edi,0x20[ebx]
010B  3B 73 24				cmp		esi,dword ptr 0x24[ebx]
010E  77 56				ja		L$16
0110				L$11:
0110  29 D2				sub		edx,edx
0112  8B 43 18				mov		eax,dword ptr 0x18[ebx]
0115  8B 4B 1C				mov		ecx,dword ptr 0x1c[ebx]
0118  41				inc		ecx
0119  F7 F1				div		ecx
011B  49				dec		ecx
011C  39 C8				cmp		eax,ecx
011E  73 25				jae		L$14
0120  8B 53 18				mov		edx,dword ptr 0x18[ebx]
0123  29 CA				sub		edx,ecx
0125  01 C0				add		eax,eax
0127  39 CA				cmp		edx,ecx
0129  77 02				ja		L$12
012B  29 C0				sub		eax,eax
012D				L$12:
012D  89 F7				mov		edi,esi
012F  03 3E				add		edi,dword ptr [esi]
0131				L$13:
0131  8B 17				mov		edx,dword ptr [edi]
0133  F6 C2 01				test		dl,0x01
0136  74 2E				je		L$16
0138  83 FA FF				cmp		edx,0xffffffff
013B  74 08				je		L$14
013D  80 E2 FE				and		dl,0xfe
0140  01 D7				add		edi,edx
0142  48				dec		eax
0143  75 EC				jne		L$13
0145				L$14:
0145  8B 7B 0C				mov		edi,dword ptr 0xc[ebx]
0148  39 FE				cmp		esi,edi
014A  73 03				jae		L$15
014C  8B 7B 28				mov		edi,dword ptr 0x28[ebx]
014F				L$15:
014F  39 FE				cmp		esi,edi
0151  72 13				jb		L$16
0153  8B 7F 08				mov		edi,dword ptr 0x8[edi]
0156  39 FE				cmp		esi,edi
0158  72 0C				jb		L$16
015A  8B 7F 08				mov		edi,dword ptr 0x8[edi]
015D  39 FE				cmp		esi,edi
015F  72 05				jb		L$16
0161  8B 7F 08				mov		edi,dword ptr 0x8[edi]
0164  EB E9				jmp		L$15
0166				L$16:
0166  8B 57 04				mov		edx,dword ptr 0x4[edi]
0169  8B 0E				mov		ecx,dword ptr [esi]
016B  87 FA				xchg		edx,edi
016D  89 F8				mov		eax,edi
016F  03 07				add		eax,dword ptr [edi]
0171  39 F0				cmp		eax,esi
0173  75 10				jne		L$18
0175  03 0F				add		ecx,dword ptr [edi]
0177  89 0F				mov		dword ptr [edi],ecx
0179  3B 73 0C				cmp		esi,dword ptr 0xc[ebx]
017C  75 03				jne		L$17
017E  89 7B 0C				mov		dword ptr 0xc[ebx],edi
0181				L$17:
0181  89 FE				mov		esi,edi
0183  EB 11				jmp		L$19
0185				L$18:
0185  FF 43 1C				inc		dword ptr 0x1c[ebx]
0188  89 56 08				mov		dword ptr 0x8[esi],edx
018B  89 7E 04				mov		dword ptr 0x4[esi],edi
018E  89 77 08				mov		dword ptr 0x8[edi],esi
0191  89 D7				mov		edi,edx
0193  89 77 04				mov		dword ptr 0x4[edi],esi
0196				L$19:
0196  FF 4B 18				dec		dword ptr 0x18[ebx]
0199  3B 73 0C				cmp		esi,dword ptr 0xc[ebx]
019C  73 08				jae		L$20
019E  3B 4B 10				cmp		ecx,dword ptr 0x10[ebx]
01A1  76 03				jbe		L$20
01A3  89 4B 10				mov		dword ptr 0x10[ebx],ecx
01A6				L$20:
01A6  3B 4B 14				cmp		ecx,dword ptr 0x14[ebx]
01A9  76 03				jbe		L$21
01AB  89 4B 14				mov		dword ptr 0x14[ebx],ecx
01AE				L$21:
01AE  1F				pop		ds
01AF  59				pop		ecx
01B0  5F				pop		edi
01B1  5E				pop		esi
01B2  C3				ret		

Routine Size: 267 bytes,    Routine Base: _TEXT + 00A8

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes

