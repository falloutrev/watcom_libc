Module: mbscmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000015E bytes
0000				_mbscmp_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  83 EC 08				sub		esp,0x00000008
0006  89 C1				mov		ecx,eax
0008  89 D3				mov		ebx,edx
000A  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
0011  74 3E				je		L$4
0013				L$1:
0013  8D 54 24 04			lea		edx,0x4[esp]
0017  89 C8				mov		eax,ecx
0019  E8 00 00 00 00			call		_mbgetcode_
001E  89 E2				mov		edx,esp
0020  89 C1				mov		ecx,eax
0022  89 D8				mov		eax,ebx
0024  E8 00 00 00 00			call		_mbgetcode_
0029  8B 34 24				mov		esi,dword ptr [esp]
002C  89 C3				mov		ebx,eax
002E  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0032  39 F0				cmp		eax,esi
0034  74 10				je		L$3
0036  73 07				jae		L$2
0038  B8 FF FF FF FF			mov		eax,0xffffffff
003D  EB 19				jmp		L$5
003F				L$2:
003F  B8 01 00 00 00			mov		eax,0x00000001
0044  EB 12				jmp		L$5
0046				L$3:
0046  83 7C 24 04 00			cmp		dword ptr 0x4[esp],0x00000000
004B  75 C6				jne		L$1
004D  31 F0				xor		eax,esi
004F  EB 07				jmp		L$5
0051				L$4:
0051  89 DA				mov		edx,ebx
0053  E8 00 00 00 00			call		strcmp_
0058				L$5:
0058  83 C4 08				add		esp,0x00000008
005B  5E				pop		esi
005C  59				pop		ecx
005D  5B				pop		ebx
005E  C3				ret		

Routine Size: 95 bytes,    Routine Base: _TEXT + 0000

005F				_mbsncmp_:
005F  51				push		ecx
0060  56				push		esi
0061  57				push		edi
0062  83 EC 08				sub		esp,0x00000008
0065  89 C6				mov		esi,eax
0067  89 D1				mov		ecx,edx
0069  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
0070  74 44				je		L$10
0072				L$6:
0072  4B				dec		ebx
0073  83 FB FF				cmp		ebx,0xffffffff
0076  74 3A				je		L$9
0078  8D 54 24 04			lea		edx,0x4[esp]
007C  89 F0				mov		eax,esi
007E  E8 00 00 00 00			call		_mbgetcode_
0083  89 E2				mov		edx,esp
0085  89 C6				mov		esi,eax
0087  89 C8				mov		eax,ecx
0089  E8 00 00 00 00			call		_mbgetcode_
008E  8B 3C 24				mov		edi,dword ptr [esp]
0091  89 C1				mov		ecx,eax
0093  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0097  39 F8				cmp		eax,edi
0099  74 10				je		L$8
009B  73 07				jae		L$7
009D  B8 FF FF FF FF			mov		eax,0xffffffff
00A2  EB 19				jmp		L$11
00A4				L$7:
00A4  B8 01 00 00 00			mov		eax,0x00000001
00A9  EB 12				jmp		L$11
00AB				L$8:
00AB  83 7C 24 04 00			cmp		dword ptr 0x4[esp],0x00000000
00B0  75 C0				jne		L$6
00B2				L$9:
00B2  31 C0				xor		eax,eax
00B4  EB 07				jmp		L$11
00B6				L$10:
00B6  89 CA				mov		edx,ecx
00B8  E8 00 00 00 00			call		strncmp_
00BD				L$11:
00BD  83 C4 08				add		esp,0x00000008
00C0  5F				pop		edi
00C1  5E				pop		esi
00C2  59				pop		ecx
00C3  C3				ret		

Routine Size: 101 bytes,    Routine Base: _TEXT + 005F

00C4				_mbsnbcmp_:
00C4  51				push		ecx
00C5  56				push		esi
00C6  57				push		edi
00C7  55				push		ebp
00C8  83 EC 08				sub		esp,0x00000008
00CB  89 C1				mov		ecx,eax
00CD  89 D6				mov		esi,edx
00CF  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
00D6  0F 84 73 00 00 00			je		L$19
00DC  85 DB				test		ebx,ebx
00DE  7F 07				jg		L$13
00E0				L$12:
00E0  31 C0				xor		eax,eax
00E2  E9 6F 00 00 00			jmp		L$20
00E7				L$13:
00E7  8B 3D 00 00 00 00			mov		edi,dword ptr ___IsDBCS
00ED  4B				dec		ebx
00EE  85 FF				test		edi,edi
00F0  74 13				je		L$14
00F2  31 C0				xor		eax,eax
00F4  8A 01				mov		al,byte ptr [ecx]
00F6  8A 80 01 00 00 00			mov		al,byte ptr ___MBCSIsTable+0x1[eax]
00FC  24 01				and		al,0x01
00FE  25 FF 00 00 00			and		eax,0x000000ff
0103  EB 02				jmp		L$15
0105				L$14:
0105  31 C0				xor		eax,eax
0107				L$15:
0107  74 01				je		L$16
0109  4B				dec		ebx
010A				L$16:
010A  8D 54 24 04			lea		edx,0x4[esp]
010E  89 C8				mov		eax,ecx
0110  E8 00 00 00 00			call		_mbgetcode_
0115  89 E2				mov		edx,esp
0117  89 C1				mov		ecx,eax
0119  89 F0				mov		eax,esi
011B  E8 00 00 00 00			call		_mbgetcode_
0120  8B 2C 24				mov		ebp,dword ptr [esp]
0123  89 C6				mov		esi,eax
0125  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0129  39 E8				cmp		eax,ebp
012B  74 10				je		L$18
012D  73 07				jae		L$17
012F  B8 FF FF FF FF			mov		eax,0xffffffff
0134  EB 20				jmp		L$20
0136				L$17:
0136  B8 01 00 00 00			mov		eax,0x00000001
013B  EB 19				jmp		L$20
013D				L$18:
013D  83 7C 24 04 00			cmp		dword ptr 0x4[esp],0x00000000
0142  74 9C				je		L$12
0144  85 ED				test		ebp,ebp
0146  74 98				je		L$12
0148  83 FB 01				cmp		ebx,0x00000001
014B  7D 9A				jge		L$13
014D  EB 91				jmp		L$12
014F				L$19:
014F  89 F2				mov		edx,esi
0151  E8 00 00 00 00			call		strncmp_
0156				L$20:
0156  83 C4 08				add		esp,0x00000008
0159  5D				pop		ebp
015A  5F				pop		edi
015B  5E				pop		esi
015C  59				pop		ecx
015D  C3				ret		

Routine Size: 154 bytes,    Routine Base: _TEXT + 00C4

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

