Module: write
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000002B8 bytes
0000				write_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  89 E5				mov		ebp,esp
0006  83 EC 10				sub		esp,0x00000010
0009  50				push		eax
000A  52				push		edx
000B  53				push		ebx
000C  8B 15 00 00 00 00			mov		edx,dword ptr ___FileHandleIDs
0012  8B 04 82				mov		eax,dword ptr [edx+eax*4]
0015  89 45 FC				mov		dword ptr -0x4[ebp],eax
0018  8B 45 EC				mov		eax,dword ptr -0x14[ebp]
001B  E8 00 00 00 00			call		__IOMode_
0020  89 C2				mov		edx,eax
0022  89 C3				mov		ebx,eax
0024  85 C0				test		eax,eax
0026  75 14				jne		L$2
0028  B8 04 00 00 00			mov		eax,0x00000004
002D				L$1:
002D  E8 00 00 00 00			call		__set_errno_
0032  B8 FF FF FF FF			mov		eax,0xffffffff
0037  E9 75 02 00 00			jmp		L$23
003C				L$2:
003C  A8 02				test		al,0x02
003E  75 07				jne		L$3
0040  B8 06 00 00 00			mov		eax,0x00000006
0045  EB E6				jmp		L$1
0047				L$3:
0047  8B 45 EC				mov		eax,dword ptr -0x14[ebp]
004A  FF 15 00 00 00 00			call		dword ptr __AccessFileH
0050  F6 C2 80				test		dl,0x80
0053  74 27				je		L$5
0055  6A 02				push		0x00000002
0057  6A 00				push		0x00000000
0059  6A 00				push		0x00000000
005B  8B 55 FC				mov		edx,dword ptr -0x4[ebp]
005E  52				push		edx
005F  E8 00 00 00 00			call		_SetFilePointer
0064  83 F8 FF				cmp		eax,0xffffffff
0067  75 13				jne		L$5
0069				L$4:
0069  8B 45 EC				mov		eax,dword ptr -0x14[ebp]
006C  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
0072  E8 00 00 00 00			call		__set_errno_nt_
0077  E9 35 02 00 00			jmp		L$23
007C				L$5:
007C  F6 C3 40				test		bl,0x40
007F  74 63				je		L$8
0081  83 3D 00 00 00 00 00		cmp		dword ptr __WindowsStdout,0x00000000
0088  74 1E				je		L$6
008A  8B 45 EC				mov		eax,dword ptr -0x14[ebp]
008D  FF 15 00 00 00 00			call		dword ptr __WindowsIsWindowedHandle
0093  85 C0				test		eax,eax
0095  74 11				je		L$6
0097  8B 5D E4				mov		ebx,dword ptr -0x1c[ebp]
009A  8B 55 E8				mov		edx,dword ptr -0x18[ebp]
009D  FF 15 00 00 00 00			call		dword ptr __WindowsStdout
00A3  89 45 F8				mov		dword ptr -0x8[ebp],eax
00A6  EB 1B				jmp		L$7
00A8				L$6:
00A8  6A 00				push		0x00000000
00AA  8D 45 F8				lea		eax,-0x8[ebp]
00AD  50				push		eax
00AE  8B 4D E4				mov		ecx,dword ptr -0x1c[ebp]
00B1  51				push		ecx
00B2  8B 75 E8				mov		esi,dword ptr -0x18[ebp]
00B5  56				push		esi
00B6  8B 7D FC				mov		edi,dword ptr -0x4[ebp]
00B9  57				push		edi
00BA  E8 00 00 00 00			call		_WriteFile
00BF  85 C0				test		eax,eax
00C1  74 A6				je		L$4
00C3				L$7:
00C3  8B 45 F8				mov		eax,dword ptr -0x8[ebp]
00C6  3B 45 E4				cmp		eax,dword ptr -0x1c[ebp]
00C9  0F 84 D6 01 00 00			je		L$22
00CF  B8 0C 00 00 00			mov		eax,0x0000000c
00D4  E8 00 00 00 00			call		__set_errno_
00D9  8B 45 F8				mov		eax,dword ptr -0x8[ebp]
00DC  89 45 E4				mov		dword ptr -0x1c[ebp],eax
00DF  E9 C1 01 00 00			jmp		L$22
00E4				L$8:
00E4  E8 00 00 00 00			call		stackavail_
00E9  89 45 F4				mov		dword ptr -0xc[ebp],eax
00EC  3D B0 00 00 00			cmp		eax,0x000000b0
00F1  73 05				jae		L$9
00F3  E8 00 00 00 00			call		__STKOVERFLOW_
00F8				L$9:
00F8  8B 5D F4				mov		ebx,dword ptr -0xc[ebp]
00FB  BE 00 02 00 00			mov		esi,0x00000200
0100  81 FB 30 02 00 00			cmp		ebx,0x00000230
0106  73 05				jae		L$10
0108  BE 80 00 00 00			mov		esi,0x00000080
010D				L$10:
010D  8D 46 03				lea		eax,0x3[esi]
0110  24 FC				and		al,0xfc
0112  31 C9				xor		ecx,ecx
0114  29 C4				sub		esp,eax
0116  89 E7				mov		edi,esp
0118  89 4D F4				mov		dword ptr -0xc[ebp],ecx
011B  89 4D F0				mov		dword ptr -0x10[ebp],ecx
011E  89 4D F8				mov		dword ptr -0x8[ebp],ecx
0121				L$11:
0121  8B 45 F4				mov		eax,dword ptr -0xc[ebp]
0124  3B 45 E4				cmp		eax,dword ptr -0x1c[ebp]
0127  0F 83 0D 01 00 00			jae		L$19
012D  8B 45 E8				mov		eax,dword ptr -0x18[ebp]
0130  03 45 F4				add		eax,dword ptr -0xc[ebp]
0133  8A 00				mov		al,byte ptr [eax]
0135  25 FF 00 00 00			and		eax,0x000000ff
013A  83 F8 0A				cmp		eax,0x0000000a
013D  0F 85 7C 00 00 00			jne		L$16
0143  8B 45 F0				mov		eax,dword ptr -0x10[ebp]
0146  C6 04 07 0D			mov		byte ptr [edi+eax],0x0d
014A  8B 5D F0				mov		ebx,dword ptr -0x10[ebp]
014D  43				inc		ebx
014E  89 5D F0				mov		dword ptr -0x10[ebp],ebx
0151  39 DE				cmp		esi,ebx
0153  75 6A				jne		L$16
0155  83 3D 00 00 00 00 00		cmp		dword ptr __WindowsStdout,0x00000000
015C  74 1A				je		L$12
015E  8B 45 EC				mov		eax,dword ptr -0x14[ebp]
0161  FF 15 00 00 00 00			call		dword ptr __WindowsIsWindowedHandle
0167  85 C0				test		eax,eax
0169  74 0D				je		L$12
016B  89 FA				mov		edx,edi
016D  FF 15 00 00 00 00			call		dword ptr __WindowsStdout
0173  89 45 F0				mov		dword ptr -0x10[ebp],eax
0176  EB 19				jmp		L$13
0178				L$12:
0178  6A 00				push		0x00000000
017A  8D 45 F0				lea		eax,-0x10[ebp]
017D  50				push		eax
017E  56				push		esi
017F  57				push		edi
0180  8B 55 FC				mov		edx,dword ptr -0x4[ebp]
0183  52				push		edx
0184  E8 00 00 00 00			call		_WriteFile
0189  85 C0				test		eax,eax
018B  0F 84 D8 FE FF FF			je		L$4
0191				L$13:
0191  3B 75 F0				cmp		esi,dword ptr -0x10[ebp]
0194  74 1E				je		L$15
0196				L$14:
0196  B8 0C 00 00 00			mov		eax,0x0000000c
019B  E8 00 00 00 00			call		__set_errno_
01A0  8B 45 EC				mov		eax,dword ptr -0x14[ebp]
01A3  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
01A9  8B 45 F8				mov		eax,dword ptr -0x8[ebp]
01AC  03 45 F0				add		eax,dword ptr -0x10[ebp]
01AF  E9 FD 00 00 00			jmp		L$23
01B4				L$15:
01B4  8B 45 F4				mov		eax,dword ptr -0xc[ebp]
01B7  31 C9				xor		ecx,ecx
01B9  89 45 F8				mov		dword ptr -0x8[ebp],eax
01BC  89 4D F0				mov		dword ptr -0x10[ebp],ecx
01BF				L$16:
01BF  8B 45 E8				mov		eax,dword ptr -0x18[ebp]
01C2  03 45 F4				add		eax,dword ptr -0xc[ebp]
01C5  8B 55 F0				mov		edx,dword ptr -0x10[ebp]
01C8  8A 00				mov		al,byte ptr [eax]
01CA  88 04 3A				mov		byte ptr [edx+edi],al
01CD  8B 5D F4				mov		ebx,dword ptr -0xc[ebp]
01D0  8B 4D F0				mov		ecx,dword ptr -0x10[ebp]
01D3  43				inc		ebx
01D4  41				inc		ecx
01D5  89 5D F4				mov		dword ptr -0xc[ebp],ebx
01D8  89 4D F0				mov		dword ptr -0x10[ebp],ecx
01DB  39 CE				cmp		esi,ecx
01DD  0F 85 3E FF FF FF			jne		L$11
01E3  83 3D 00 00 00 00 00		cmp		dword ptr __WindowsStdout,0x00000000
01EA  74 1C				je		L$17
01EC  8B 45 EC				mov		eax,dword ptr -0x14[ebp]
01EF  FF 15 00 00 00 00			call		dword ptr __WindowsIsWindowedHandle
01F5  85 C0				test		eax,eax
01F7  74 0F				je		L$17
01F9  89 CB				mov		ebx,ecx
01FB  89 FA				mov		edx,edi
01FD  FF 15 00 00 00 00			call		dword ptr __WindowsStdout
0203  89 45 F0				mov		dword ptr -0x10[ebp],eax
0206  EB 19				jmp		L$18
0208				L$17:
0208  6A 00				push		0x00000000
020A  8D 45 F0				lea		eax,-0x10[ebp]
020D  50				push		eax
020E  56				push		esi
020F  57				push		edi
0210  8B 5D FC				mov		ebx,dword ptr -0x4[ebp]
0213  53				push		ebx
0214  E8 00 00 00 00			call		_WriteFile
0219  85 C0				test		eax,eax
021B  0F 84 48 FE FF FF			je		L$4
0221				L$18:
0221  3B 75 F0				cmp		esi,dword ptr -0x10[ebp]
0224  0F 85 6C FF FF FF			jne		L$14
022A  8B 45 F4				mov		eax,dword ptr -0xc[ebp]
022D  89 45 F8				mov		dword ptr -0x8[ebp],eax
0230  31 C0				xor		eax,eax
0232  89 45 F0				mov		dword ptr -0x10[ebp],eax
0235  E9 E7 FE FF FF			jmp		L$11
023A				L$19:
023A  83 7D F0 00			cmp		dword ptr -0x10[ebp],0x00000000
023E  74 65				je		L$22
0240  83 3D 00 00 00 00 00		cmp		dword ptr __WindowsStdout,0x00000000
0247  74 1D				je		L$20
0249  8B 45 EC				mov		eax,dword ptr -0x14[ebp]
024C  FF 15 00 00 00 00			call		dword ptr __WindowsIsWindowedHandle
0252  85 C0				test		eax,eax
0254  74 10				je		L$20
0256  8B 5D F0				mov		ebx,dword ptr -0x10[ebp]
0259  89 FA				mov		edx,edi
025B  FF 15 00 00 00 00			call		dword ptr __WindowsStdout
0261  89 45 F4				mov		dword ptr -0xc[ebp],eax
0264  EB 1C				jmp		L$21
0266				L$20:
0266  6A 00				push		0x00000000
0268  8D 45 F4				lea		eax,-0xc[ebp]
026B  50				push		eax
026C  8B 45 F0				mov		eax,dword ptr -0x10[ebp]
026F  50				push		eax
0270  57				push		edi
0271  8B 55 FC				mov		edx,dword ptr -0x4[ebp]
0274  52				push		edx
0275  E8 00 00 00 00			call		_WriteFile
027A  85 C0				test		eax,eax
027C  0F 84 E7 FD FF FF			je		L$4
0282				L$21:
0282  8B 45 F4				mov		eax,dword ptr -0xc[ebp]
0285  3B 45 F0				cmp		eax,dword ptr -0x10[ebp]
0288  74 1B				je		L$22
028A  B8 0C 00 00 00			mov		eax,0x0000000c
028F  E8 00 00 00 00			call		__set_errno_
0294  8B 45 EC				mov		eax,dword ptr -0x14[ebp]
0297  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
029D  8B 45 F8				mov		eax,dword ptr -0x8[ebp]
02A0  03 45 F4				add		eax,dword ptr -0xc[ebp]
02A3  EB 0C				jmp		L$23
02A5				L$22:
02A5  8B 45 EC				mov		eax,dword ptr -0x14[ebp]
02A8  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
02AE  8B 45 E4				mov		eax,dword ptr -0x1c[ebp]
02B1				L$23:
02B1  89 EC				mov		esp,ebp
02B3  5D				pop		ebp
02B4  5F				pop		edi
02B5  5E				pop		esi
02B6  59				pop		ecx
02B7  C3				ret		

Routine Size: 696 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

