Module: makepath
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001FF bytes
0000				pickup_:
0000  83 F8 5C				cmp		eax,0x0000005c
0003  74 05				je		L$1
0005  83 F8 2F				cmp		eax,0x0000002f
0008  75 09				jne		L$3
000A				L$1:
000A  83 3A 00				cmp		dword ptr [edx],0x00000000
000D  75 02				jne		L$2
000F  89 02				mov		dword ptr [edx],eax
0011				L$2:
0011  8B 02				mov		eax,dword ptr [edx]
0013				L$3:
0013  C3				ret		

Routine Size: 20 bytes,    Routine Base: _TEXT + 0000

0014				_makepath_:
0014  56				push		esi
0015  57				push		edi
0016  55				push		ebp
0017  83 EC 08				sub		esp,0x00000008
001A  89 C5				mov		ebp,eax
001C  31 F6				xor		esi,esi
001E  89 04 24				mov		dword ptr [esp],eax
0021  89 74 24 04			mov		dword ptr 0x4[esp],esi
0025  85 D2				test		edx,edx
0027  74 0F				je		L$4
0029  8A 22				mov		ah,byte ptr [edx]
002B  84 E4				test		ah,ah
002D  74 09				je		L$4
002F  88 65 00				mov		byte ptr [ebp],ah
0032  45				inc		ebp
0033  C6 45 00 3A			mov		byte ptr [ebp],0x3a
0037  45				inc		ebp
0038				L$4:
0038  C6 45 00 00			mov		byte ptr [ebp],0x00
003C  85 DB				test		ebx,ebx
003E  0F 84 B2 00 00 00			je		L$13
0044  80 3B 00				cmp		byte ptr [ebx],0x00
0047  0F 84 A9 00 00 00			je		L$13
004D				L$5:
004D  89 D8				mov		eax,ebx
004F  8D 54 24 04			lea		edx,0x4[esp]
0053  E8 00 00 00 00			call		_mbptov_
0058  E8 00 00 00 00			call		pickup_
005D  E8 00 00 00 00			call		__mbvtop_
0062  89 EF				mov		edi,ebp
0064  89 C6				mov		esi,eax
0066  57				push		edi
0067				L$6:
0067  8A 06				mov		al,byte ptr [esi]
0069  88 07				mov		byte ptr [edi],al
006B  3C 00				cmp		al,0x00
006D  74 10				je		L$7
006F  8A 46 01				mov		al,byte ptr 0x1[esi]
0072  83 C6 02				add		esi,0x00000002
0075  88 47 01				mov		byte ptr 0x1[edi],al
0078  83 C7 02				add		edi,0x00000002
007B  3C 00				cmp		al,0x00
007D  75 E8				jne		L$6
007F				L$7:
007F  5F				pop		edi
0080  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
0087  74 14				je		L$8
0089  31 C0				xor		eax,eax
008B  8A 45 00				mov		al,byte ptr [ebp]
008E  8A 80 01 00 00 00			mov		al,byte ptr ___MBCSIsTable+0x1[eax]
0094  24 01				and		al,0x01
0096  25 FF 00 00 00			and		eax,0x000000ff
009B  EB 02				jmp		L$9
009D				L$8:
009D  31 C0				xor		eax,eax
009F				L$9:
009F  45				inc		ebp
00A0  01 C5				add		ebp,eax
00A2  A1 00 00 00 00			mov		eax,dword ptr ___IsDBCS
00A7  85 C0				test		eax,eax
00A9  74 11				je		L$10
00AB  31 C0				xor		eax,eax
00AD  8A 03				mov		al,byte ptr [ebx]
00AF  8A 80 01 00 00 00			mov		al,byte ptr ___MBCSIsTable+0x1[eax]
00B5  24 01				and		al,0x01
00B7  25 FF 00 00 00			and		eax,0x000000ff
00BC				L$10:
00BC  43				inc		ebx
00BD  01 C3				add		ebx,eax
00BF  80 3B 00				cmp		byte ptr [ebx],0x00
00C2  75 89				jne		L$5
00C4  83 7C 24 04 00			cmp		dword ptr 0x4[esp],0x00000000
00C9  75 08				jne		L$11
00CB  C7 44 24 04 5C 00 00 00		mov		dword ptr 0x4[esp],0x0000005c
00D3				L$11:
00D3  8B 04 24				mov		eax,dword ptr [esp]
00D6  89 EA				mov		edx,ebp
00D8  E8 00 00 00 00			call		_mbsdec_
00DD  8A 00				mov		al,byte ptr [eax]
00DF  8B 74 24 04			mov		esi,dword ptr 0x4[esp]
00E3  25 FF 00 00 00			and		eax,0x000000ff
00E8  39 F0				cmp		eax,esi
00EA  75 03				jne		L$12
00EC  4D				dec		ebp
00ED  EB 07				jmp		L$13
00EF				L$12:
00EF  8A 44 24 04			mov		al,byte ptr 0x4[esp]
00F3  88 45 00				mov		byte ptr [ebp],al
00F6				L$13:
00F6  83 7C 24 04 00			cmp		dword ptr 0x4[esp],0x00000000
00FB  75 08				jne		L$14
00FD  C7 44 24 04 5C 00 00 00		mov		dword ptr 0x4[esp],0x0000005c
0105				L$14:
0105  8D 5D 01				lea		ebx,0x1[ebp]
0108  85 C9				test		ecx,ecx
010A  0F 84 9D 00 00 00			je		L$21
0110  89 C8				mov		eax,ecx
0112  8D 54 24 04			lea		edx,0x4[esp]
0116  E8 00 00 00 00			call		_mbptov_
011B  E8 00 00 00 00			call		pickup_
0120  8B 74 24 04			mov		esi,dword ptr 0x4[esp]
0124  39 F0				cmp		eax,esi
0126  74 0B				je		L$15
0128  31 C0				xor		eax,eax
012A  8A 45 00				mov		al,byte ptr [ebp]
012D  39 F0				cmp		eax,esi
012F  75 02				jne		L$15
0131  89 DD				mov		ebp,ebx
0133				L$15:
0133  89 C8				mov		eax,ecx
0135  8D 54 24 04			lea		edx,0x4[esp]
0139  E8 00 00 00 00			call		_mbptov_
013E  E8 00 00 00 00			call		pickup_
0143  E8 00 00 00 00			call		__mbvtop_
0148  89 EF				mov		edi,ebp
014A  89 C6				mov		esi,eax
014C  57				push		edi
014D				L$16:
014D  8A 06				mov		al,byte ptr [esi]
014F  88 07				mov		byte ptr [edi],al
0151  3C 00				cmp		al,0x00
0153  74 10				je		L$17
0155  8A 46 01				mov		al,byte ptr 0x1[esi]
0158  83 C6 02				add		esi,0x00000002
015B  88 47 01				mov		byte ptr 0x1[edi],al
015E  83 C7 02				add		edi,0x00000002
0161  3C 00				cmp		al,0x00
0163  75 E8				jne		L$16
0165				L$17:
0165  5F				pop		edi
0166  A1 00 00 00 00			mov		eax,dword ptr ___IsDBCS
016B  85 C0				test		eax,eax
016D  74 12				je		L$18
016F  31 C0				xor		eax,eax
0171  8A 45 00				mov		al,byte ptr [ebp]
0174  8A 80 01 00 00 00			mov		al,byte ptr ___MBCSIsTable+0x1[eax]
017A  24 01				and		al,0x01
017C  25 FF 00 00 00			and		eax,0x000000ff
0181				L$18:
0181  45				inc		ebp
0182  8B 15 00 00 00 00			mov		edx,dword ptr ___IsDBCS
0188  01 C5				add		ebp,eax
018A  85 D2				test		edx,edx
018C  74 13				je		L$19
018E  31 C0				xor		eax,eax
0190  8A 01				mov		al,byte ptr [ecx]
0192  8A 80 01 00 00 00			mov		al,byte ptr ___MBCSIsTable+0x1[eax]
0198  24 01				and		al,0x01
019A  25 FF 00 00 00			and		eax,0x000000ff
019F  EB 02				jmp		L$20
01A1				L$19:
01A1  31 C0				xor		eax,eax
01A3				L$20:
01A3  41				inc		ecx
01A4  01 C1				add		ecx,eax
01A6  80 39 00				cmp		byte ptr [ecx],0x00
01A9  75 88				jne		L$15
01AB  EB 0F				jmp		L$22
01AD				L$21:
01AD  31 C0				xor		eax,eax
01AF  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
01B3  8A 45 00				mov		al,byte ptr [ebp]
01B6  39 D0				cmp		eax,edx
01B8  75 02				jne		L$22
01BA  89 DD				mov		ebp,ebx
01BC				L$22:
01BC  8B 5C 24 18			mov		ebx,dword ptr 0x18[esp]
01C0  85 DB				test		ebx,ebx
01C2  74 2E				je		L$24
01C4  80 3B 00				cmp		byte ptr [ebx],0x00
01C7  74 29				je		L$24
01C9  8B 54 24 18			mov		edx,dword ptr 0x18[esp]
01CD  31 C0				xor		eax,eax
01CF  8A 02				mov		al,byte ptr [edx]
01D1  83 F8 2E				cmp		eax,0x0000002e
01D4  74 05				je		L$23
01D6  C6 45 00 2E			mov		byte ptr [ebp],0x2e
01DA  45				inc		ebp
01DB				L$23:
01DB  8B 44 24 18			mov		eax,dword ptr 0x18[esp]
01DF  8A 08				mov		cl,byte ptr [eax]
01E1  84 C9				test		cl,cl
01E3  74 0D				je		L$24
01E5  88 4D 00				mov		byte ptr [ebp],cl
01E8  8D 48 01				lea		ecx,0x1[eax]
01EB  45				inc		ebp
01EC  89 4C 24 18			mov		dword ptr 0x18[esp],ecx
01F0  EB E9				jmp		L$23
01F2				L$24:
01F2  C6 45 00 00			mov		byte ptr [ebp],0x00
01F6  83 C4 08				add		esp,0x00000008
01F9  5D				pop		ebp
01FA  5F				pop		edi
01FB  5E				pop		esi
01FC  C2 04 00				ret		0x0004

Routine Size: 491 bytes,    Routine Base: _TEXT + 0014

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

