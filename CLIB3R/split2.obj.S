Module: split2
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000012D bytes
0000				pcopy_:
0000  56				push		esi
0001  57				push		edi
0002  89 D6				mov		esi,edx
0004  89 DF				mov		edi,ebx
0006  85 C0				test		eax,eax
0008  75 05				jne		L$1
000A  89 D0				mov		eax,edx
000C  5F				pop		edi
000D  5E				pop		esi
000E  C3				ret		
000F				L$1:
000F  89 10				mov		dword ptr [eax],edx
0011  89 CA				mov		edx,ecx
0013  29 DA				sub		edx,ebx
0015  81 FA 07 01 00 00			cmp		edx,0x00000107
001B  72 05				jb		L$2
001D  BA 06 01 00 00			mov		edx,0x00000106
0022				L$2:
0022  89 F8				mov		eax,edi
0024  E8 00 00 00 00			call		_mbsnccnt_
0029  89 C1				mov		ecx,eax
002B  89 C3				mov		ebx,eax
002D  89 FA				mov		edx,edi
002F  89 F0				mov		eax,esi
0031  E8 00 00 00 00			call		_mbsncpy_
0036  89 CA				mov		edx,ecx
0038  89 F0				mov		eax,esi
003A  E8 00 00 00 00			call		_mbsnbcnt_
003F  89 CA				mov		edx,ecx
0041  C6 04 06 00			mov		byte ptr [esi+eax],0x00
0045  89 F0				mov		eax,esi
0047  E8 00 00 00 00			call		_mbsnbcnt_
004C  01 F0				add		eax,esi
004E  40				inc		eax
004F  5F				pop		edi
0050  5E				pop		esi
0051  C3				ret		

Routine Size: 82 bytes,    Routine Base: _TEXT + 0000

0052				_splitpath2_:
0052  56				push		esi
0053  57				push		edi
0054  55				push		ebp
0055  83 EC 08				sub		esp,0x00000008
0058  89 C6				mov		esi,eax
005A  89 D5				mov		ebp,edx
005C  89 0C 24				mov		dword ptr [esp],ecx
005F  80 38 00				cmp		byte ptr [eax],0x00
0062  74 2F				je		L$4
0064  31 C0				xor		eax,eax
0066  8A 46 01				mov		al,byte ptr 0x1[esi]
0069  83 F8 3A				cmp		eax,0x0000003a
006C  75 25				jne		L$4
006E  85 DB				test		ebx,ebx
0070  74 11				je		L$3
0072  89 13				mov		dword ptr [ebx],edx
0074  8A 06				mov		al,byte ptr [esi]
0076  C6 42 01 3A			mov		byte ptr 0x1[edx],0x3a
007A  C6 42 02 00			mov		byte ptr 0x2[edx],0x00
007E  8D 6A 03				lea		ebp,0x3[edx]
0081  88 02				mov		byte ptr [edx],al
0083				L$3:
0083  BA 02 00 00 00			mov		edx,0x00000002
0088  89 F0				mov		eax,esi
008A  E8 00 00 00 00			call		_mbsninc_
008F  89 C6				mov		esi,eax
0091  EB 0B				jmp		L$5
0093				L$4:
0093  85 DB				test		ebx,ebx
0095  74 07				je		L$5
0097  89 2B				mov		dword ptr [ebx],ebp
0099  C6 45 00 00			mov		byte ptr [ebp],0x00
009D  45				inc		ebp
009E				L$5:
009E  89 74 24 04			mov		dword ptr 0x4[esp],esi
00A2  89 F3				mov		ebx,esi
00A4				L$6:
00A4  31 FF				xor		edi,edi
00A6				L$7:
00A6  89 F0				mov		eax,esi
00A8  E8 00 00 00 00			call		_mbptov_
00AD  89 C2				mov		edx,eax
00AF  85 C0				test		eax,eax
00B1  74 3B				je		L$12
00B3  83 F8 2E				cmp		eax,0x0000002e
00B6  75 05				jne		L$8
00B8  89 F7				mov		edi,esi
00BA  46				inc		esi
00BB  EB E9				jmp		L$7
00BD				L$8:
00BD  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
00C4  74 13				je		L$9
00C6  31 C0				xor		eax,eax
00C8  8A 06				mov		al,byte ptr [esi]
00CA  8A 80 01 00 00 00			mov		al,byte ptr ___MBCSIsTable+0x1[eax]
00D0  24 01				and		al,0x01
00D2  25 FF 00 00 00			and		eax,0x000000ff
00D7  EB 02				jmp		L$10
00D9				L$9:
00D9  31 C0				xor		eax,eax
00DB				L$10:
00DB  46				inc		esi
00DC  01 C6				add		esi,eax
00DE  83 FA 5C				cmp		edx,0x0000005c
00E1  74 05				je		L$11
00E3  83 FA 2F				cmp		edx,0x0000002f
00E6  75 BE				jne		L$7
00E8				L$11:
00E8  89 74 24 04			mov		dword ptr 0x4[esp],esi
00EC  EB B6				jmp		L$6
00EE				L$12:
00EE  8B 4C 24 04			mov		ecx,dword ptr 0x4[esp]
00F2  8B 04 24				mov		eax,dword ptr [esp]
00F5  89 EA				mov		edx,ebp
00F7  E8 00 00 00 00			call		pcopy_
00FC  89 C5				mov		ebp,eax
00FE  85 FF				test		edi,edi
0100  75 02				jne		L$13
0102  89 F7				mov		edi,esi
0104				L$13:
0104  8B 5C 24 04			mov		ebx,dword ptr 0x4[esp]
0108  8B 44 24 18			mov		eax,dword ptr 0x18[esp]
010C  89 F9				mov		ecx,edi
010E  89 EA				mov		edx,ebp
0110  E8 00 00 00 00			call		pcopy_
0115  89 F1				mov		ecx,esi
0117  89 FB				mov		ebx,edi
0119  89 C2				mov		edx,eax
011B  8B 44 24 1C			mov		eax,dword ptr 0x1c[esp]
011F  E8 00 00 00 00			call		pcopy_
0124  83 C4 08				add		esp,0x00000008
0127  5D				pop		ebp
0128  5F				pop		edi
0129  5E				pop		esi
012A  C2 08 00				ret		0x0008

Routine Size: 219 bytes,    Routine Base: _TEXT + 0052

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

