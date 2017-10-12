Module: mbsicmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000020C bytes
0000				_mbsicmp_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  83 EC 08				sub		esp,0x00000008
0006  89 C3				mov		ebx,eax
0008  89 D1				mov		ecx,edx
000A  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
0011  0F 84 6F 00 00 00			je		L$6
0017				L$1:
0017  8D 54 24 04			lea		edx,0x4[esp]
001B  89 D8				mov		eax,ebx
001D  E8 00 00 00 00			call		_mbgetcode_
0022  89 E2				mov		edx,esp
0024  89 C3				mov		ebx,eax
0026  89 C8				mov		eax,ecx
0028  E8 00 00 00 00			call		_mbgetcode_
002D  89 C1				mov		ecx,eax
002F  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0033  E8 00 00 00 00			call		_ismbclegal_
0038  85 C0				test		eax,eax
003A  75 0D				jne		L$2
003C  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0040  E8 00 00 00 00			call		toupper_
0045  89 44 24 04			mov		dword ptr 0x4[esp],eax
0049				L$2:
0049  8B 04 24				mov		eax,dword ptr [esp]
004C  E8 00 00 00 00			call		_ismbclegal_
0051  85 C0				test		eax,eax
0053  75 0B				jne		L$3
0055  8B 04 24				mov		eax,dword ptr [esp]
0058  E8 00 00 00 00			call		toupper_
005D  89 04 24				mov		dword ptr [esp],eax
0060				L$3:
0060  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0064  8B 34 24				mov		esi,dword ptr [esp]
0067  39 F0				cmp		eax,esi
0069  74 10				je		L$5
006B  73 07				jae		L$4
006D  B8 FF FF FF FF			mov		eax,0xffffffff
0072  EB 19				jmp		L$7
0074				L$4:
0074  B8 01 00 00 00			mov		eax,0x00000001
0079  EB 12				jmp		L$7
007B				L$5:
007B  83 7C 24 04 00			cmp		dword ptr 0x4[esp],0x00000000
0080  75 95				jne		L$1
0082  31 F0				xor		eax,esi
0084  EB 07				jmp		L$7
0086				L$6:
0086  89 CA				mov		edx,ecx
0088  E8 00 00 00 00			call		stricmp_
008D				L$7:
008D  83 C4 08				add		esp,0x00000008
0090  5E				pop		esi
0091  59				pop		ecx
0092  5B				pop		ebx
0093  C3				ret		

Routine Size: 148 bytes,    Routine Base: _TEXT + 0000

0094				_mbsnicmp_:
0094  51				push		ecx
0095  56				push		esi
0096  57				push		edi
0097  83 EC 08				sub		esp,0x00000008
009A  89 C1				mov		ecx,eax
009C  89 D6				mov		esi,edx
009E  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
00A5  0F 84 79 00 00 00			je		L$14
00AB				L$8:
00AB  4B				dec		ebx
00AC  83 FB FF				cmp		ebx,0xffffffff
00AF  0F 84 6B 00 00 00			je		L$13
00B5  8D 54 24 04			lea		edx,0x4[esp]
00B9  89 C8				mov		eax,ecx
00BB  E8 00 00 00 00			call		_mbgetcode_
00C0  89 E2				mov		edx,esp
00C2  89 C1				mov		ecx,eax
00C4  89 F0				mov		eax,esi
00C6  E8 00 00 00 00			call		_mbgetcode_
00CB  89 C6				mov		esi,eax
00CD  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
00D1  E8 00 00 00 00			call		_ismbclegal_
00D6  85 C0				test		eax,eax
00D8  75 0D				jne		L$9
00DA  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
00DE  E8 00 00 00 00			call		toupper_
00E3  89 44 24 04			mov		dword ptr 0x4[esp],eax
00E7				L$9:
00E7  8B 04 24				mov		eax,dword ptr [esp]
00EA  E8 00 00 00 00			call		_ismbclegal_
00EF  85 C0				test		eax,eax
00F1  75 0B				jne		L$10
00F3  8B 04 24				mov		eax,dword ptr [esp]
00F6  E8 00 00 00 00			call		toupper_
00FB  89 04 24				mov		dword ptr [esp],eax
00FE				L$10:
00FE  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0102  8B 3C 24				mov		edi,dword ptr [esp]
0105  39 F8				cmp		eax,edi
0107  74 10				je		L$12
0109  73 07				jae		L$11
010B  B8 FF FF FF FF			mov		eax,0xffffffff
0110  EB 19				jmp		L$15
0112				L$11:
0112  B8 01 00 00 00			mov		eax,0x00000001
0117  EB 12				jmp		L$15
0119				L$12:
0119  83 7C 24 04 00			cmp		dword ptr 0x4[esp],0x00000000
011E  75 8B				jne		L$8
0120				L$13:
0120  31 C0				xor		eax,eax
0122  EB 07				jmp		L$15
0124				L$14:
0124  89 F2				mov		edx,esi
0126  E8 00 00 00 00			call		strnicmp_
012B				L$15:
012B  83 C4 08				add		esp,0x00000008
012E  5F				pop		edi
012F  5E				pop		esi
0130  59				pop		ecx
0131  C3				ret		

Routine Size: 158 bytes,    Routine Base: _TEXT + 0094

0132				_mbsnbicmp_:
0132  51				push		ecx
0133  56				push		esi
0134  57				push		edi
0135  55				push		ebp
0136  83 EC 08				sub		esp,0x00000008
0139  89 C1				mov		ecx,eax
013B  89 D6				mov		esi,edx
013D  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
0144  0F 84 B3 00 00 00			je		L$25
014A  85 DB				test		ebx,ebx
014C  7F 07				jg		L$17
014E				L$16:
014E  31 C0				xor		eax,eax
0150  E9 AF 00 00 00			jmp		L$26
0155				L$17:
0155  8B 3D 00 00 00 00			mov		edi,dword ptr ___IsDBCS
015B  4B				dec		ebx
015C  85 FF				test		edi,edi
015E  74 13				je		L$18
0160  31 C0				xor		eax,eax
0162  8A 01				mov		al,byte ptr [ecx]
0164  8A 80 01 00 00 00			mov		al,byte ptr ___MBCSIsTable+0x1[eax]
016A  24 01				and		al,0x01
016C  25 FF 00 00 00			and		eax,0x000000ff
0171  EB 02				jmp		L$19
0173				L$18:
0173  31 C0				xor		eax,eax
0175				L$19:
0175  74 01				je		L$20
0177  4B				dec		ebx
0178				L$20:
0178  8D 54 24 04			lea		edx,0x4[esp]
017C  89 C8				mov		eax,ecx
017E  E8 00 00 00 00			call		_mbgetcode_
0183  89 E2				mov		edx,esp
0185  89 C1				mov		ecx,eax
0187  89 F0				mov		eax,esi
0189  E8 00 00 00 00			call		_mbgetcode_
018E  89 C6				mov		esi,eax
0190  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0194  E8 00 00 00 00			call		_ismbclegal_
0199  85 C0				test		eax,eax
019B  75 0D				jne		L$21
019D  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
01A1  E8 00 00 00 00			call		toupper_
01A6  89 44 24 04			mov		dword ptr 0x4[esp],eax
01AA				L$21:
01AA  8B 04 24				mov		eax,dword ptr [esp]
01AD  E8 00 00 00 00			call		_ismbclegal_
01B2  85 C0				test		eax,eax
01B4  75 0B				jne		L$22
01B6  8B 04 24				mov		eax,dword ptr [esp]
01B9  E8 00 00 00 00			call		toupper_
01BE  89 04 24				mov		dword ptr [esp],eax
01C1				L$22:
01C1  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
01C5  8B 2C 24				mov		ebp,dword ptr [esp]
01C8  39 E8				cmp		eax,ebp
01CA  74 10				je		L$24
01CC  73 07				jae		L$23
01CE  B8 FF FF FF FF			mov		eax,0xffffffff
01D3  EB 2F				jmp		L$26
01D5				L$23:
01D5  B8 01 00 00 00			mov		eax,0x00000001
01DA  EB 28				jmp		L$26
01DC				L$24:
01DC  83 7C 24 04 00			cmp		dword ptr 0x4[esp],0x00000000
01E1  0F 84 67 FF FF FF			je		L$16
01E7  85 ED				test		ebp,ebp
01E9  0F 84 5F FF FF FF			je		L$16
01EF  83 FB 01				cmp		ebx,0x00000001
01F2  0F 8D 5D FF FF FF			jge		L$17
01F8  E9 51 FF FF FF			jmp		L$16
01FD				L$25:
01FD  89 F2				mov		edx,esi
01FF  E8 00 00 00 00			call		strnicmp_
0204				L$26:
0204  83 C4 08				add		esp,0x00000008
0207  5D				pop		ebp
0208  5F				pop		edi
0209  5E				pop		esi
020A  59				pop		ecx
020B  C3				ret		

Routine Size: 218 bytes,    Routine Base: _TEXT + 0132

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

