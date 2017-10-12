Module: mbsnset
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000017B bytes
0000				_mbsnset_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 08				sub		esp,0x00000008
0007  50				push		eax
0008  89 D5				mov		ebp,edx
000A  8B 15 00 00 00 00			mov		edx,dword ptr ___IsDBCS
0010  89 C6				mov		esi,eax
0012  85 D2				test		edx,edx
0014  0F 84 9F 00 00 00			je		L$10
001A  85 DB				test		ebx,ebx
001C  0F 84 82 00 00 00			je		L$8
0022  89 E8				mov		eax,ebp
0024  E8 00 00 00 00			call		_ismbclegal_
0029  89 C2				mov		edx,eax
002B  85 C0				test		eax,eax
002D  0F 95 C0				setne		al
0030  25 FF 00 00 00			and		eax,0x000000ff
0035  40				inc		eax
0036  0F AF D8				imul		ebx,eax
0039  89 F7				mov		edi,esi
003B  06				push		es
003C  8C D8				mov		eax,ds
003E  8E C0				mov		es,eax
0040  29 C9				sub		ecx,ecx
0042  49				dec		ecx
0043  31 C0				xor		eax,eax
0045  F2 AE				repne scasb	
0047  F7 D1				not		ecx
0049  49				dec		ecx
004A  07				pop		es
004B  89 5C 24 08			mov		dword ptr 0x8[esp],ebx
004F  39 D9				cmp		ecx,ebx
0051  76 06				jbe		L$1
0053  89 D9				mov		ecx,ebx
0055  31 FF				xor		edi,edi
0057  EB 05				jmp		L$2
0059				L$1:
0059  BF 01 00 00 00			mov		edi,0x00000001
005E				L$2:
005E  85 D2				test		edx,edx
0060  74 4A				je		L$9
0062  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
0066  8B 04 24				mov		eax,dword ptr [esp]
0069  E8 00 00 00 00			call		_mbsbtype_
006E  89 44 24 04			mov		dword ptr 0x4[esp],eax
0072  89 C8				mov		eax,ecx
0074  31 DB				xor		ebx,ebx
0076  83 E0 01				and		eax,0x00000001
0079  D1 E9				shr		ecx,0x01
007B  89 44 24 08			mov		dword ptr 0x8[esp],eax
007F  EB 0C				jmp		L$4
0081				L$3:
0081  89 EA				mov		edx,ebp
0083  89 F0				mov		eax,esi
0085  E8 00 00 00 00			call		_mbputchar_
008A  43				inc		ebx
008B  89 C6				mov		esi,eax
008D				L$4:
008D  39 CB				cmp		ebx,ecx
008F  72 F0				jb		L$3
0091				L$5:
0091  83 7C 24 04 01			cmp		dword ptr 0x4[esp],0x00000001
0096  74 06				je		L$6
0098  85 7C 24 08			test		dword ptr 0x8[esp],edi
009C  74 03				je		L$7
009E				L$6:
009E  C6 06 20				mov		byte ptr [esi],0x20
00A1				L$7:
00A1  8B 04 24				mov		eax,dword ptr [esp]
00A4				L$8:
00A4  83 C4 0C				add		esp,0x0000000c
00A7  5D				pop		ebp
00A8  5F				pop		edi
00A9  5E				pop		esi
00AA  59				pop		ecx
00AB  C3				ret		
00AC				L$9:
00AC  89 CB				mov		ebx,ecx
00AE  89 EA				mov		edx,ebp
00B0  89 F0				mov		eax,esi
00B2  E8 00 00 00 00			call		memset_
00B7  EB E8				jmp		L$7
00B9				L$10:
00B9  89 EA				mov		edx,ebp
00BB  E8 00 00 00 00			call		strnset_
00C0  EB E2				jmp		L$8

Routine Size: 194 bytes,    Routine Base: _TEXT + 0000

00C2				_mbsnbset_:
00C2  51				push		ecx
00C3  56				push		esi
00C4  57				push		edi
00C5  55				push		ebp
00C6  83 EC 08				sub		esp,0x00000008
00C9  50				push		eax
00CA  89 D5				mov		ebp,edx
00CC  8B 15 00 00 00 00			mov		edx,dword ptr ___IsDBCS
00D2  89 C6				mov		esi,eax
00D4  85 D2				test		edx,edx
00D6  74 E1				je		L$10
00D8  85 DB				test		ebx,ebx
00DA  74 C8				je		L$8
00DC  89 E8				mov		eax,ebp
00DE  E8 00 00 00 00			call		_ismbclegal_
00E3  89 5C 24 08			mov		dword ptr 0x8[esp],ebx
00E7  89 F7				mov		edi,esi
00E9  89 C2				mov		edx,eax
00EB  06				push		es
00EC  8C D8				mov		eax,ds
00EE  8E C0				mov		es,eax
00F0  29 C9				sub		ecx,ecx
00F2  49				dec		ecx
00F3  31 C0				xor		eax,eax
00F5  F2 AE				repne scasb	
00F7  F7 D1				not		ecx
00F9  49				dec		ecx
00FA  07				pop		es
00FB  39 D9				cmp		ecx,ebx
00FD  76 06				jbe		L$11
00FF  89 D9				mov		ecx,ebx
0101  31 FF				xor		edi,edi
0103  EB 05				jmp		L$12
0105				L$11:
0105  BF 01 00 00 00			mov		edi,0x00000001
010A				L$12:
010A  85 D2				test		edx,edx
010C  74 9E				je		L$9
010E  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
0112  8B 04 24				mov		eax,dword ptr [esp]
0115  E8 00 00 00 00			call		_mbsbtype_
011A  89 44 24 04			mov		dword ptr 0x4[esp],eax
011E  89 C8				mov		eax,ecx
0120  31 DB				xor		ebx,ebx
0122  83 E0 01				and		eax,0x00000001
0125  D1 E9				shr		ecx,0x01
0127  89 44 24 08			mov		dword ptr 0x8[esp],eax
012B  EB 0C				jmp		L$14
012D				L$13:
012D  89 EA				mov		edx,ebp
012F  89 F0				mov		eax,esi
0131  E8 00 00 00 00			call		_mbputchar_
0136  43				inc		ebx
0137  89 C6				mov		esi,eax
0139				L$14:
0139  39 CB				cmp		ebx,ecx
013B  72 F0				jb		L$13
013D  E9 4F FF FF FF			jmp		L$5

Routine Size: 128 bytes,    Routine Base: _TEXT + 00C2

0142				_mbsset_:
0142  53				push		ebx
0143  51				push		ecx
0144  56				push		esi
0145  57				push		edi
0146  89 C6				mov		esi,eax
0148  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
014F  74 20				je		L$15
0151  89 C7				mov		edi,eax
0153  06				push		es
0154  8C D8				mov		eax,ds
0156  8E C0				mov		es,eax
0158  29 C9				sub		ecx,ecx
015A  49				dec		ecx
015B  31 C0				xor		eax,eax
015D  F2 AE				repne scasb	
015F  F7 D1				not		ecx
0161  49				dec		ecx
0162  07				pop		es
0163  89 CB				mov		ebx,ecx
0165  89 F0				mov		eax,esi
0167  E8 00 00 00 00			call		_mbsnset_
016C  5F				pop		edi
016D  5E				pop		esi
016E  59				pop		ecx
016F  5B				pop		ebx
0170  C3				ret		
0171				L$15:
0171  E8 00 00 00 00			call		strset_
0176  5F				pop		edi
0177  5E				pop		esi
0178  59				pop		ecx
0179  5B				pop		ebx
017A  C3				ret		

Routine Size: 57 bytes,    Routine Base: _TEXT + 0142

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

