Module: spve
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000331 bytes
0000				__Slash_C_:
0000  C6 00 2F				mov		byte ptr [eax],0x2f
0003  C6 40 01 63			mov		byte ptr 0x1[eax],0x63
0007  C6 40 02 00			mov		byte ptr 0x2[eax],0x00
000B  C3				ret		
000C				file_exists_:
000C  52				push		edx
000D  31 D2				xor		edx,edx
000F  E8 00 00 00 00			call		access_
0014  85 C0				test		eax,eax
0016  0F 94 C0				sete		al
0019  0F B6 C0				movzx		eax,al
001C  5A				pop		edx
001D  C3				ret		

Routine Size: 30 bytes,    Routine Base: _TEXT + 0000

001E				spawnve_:
001E  68 E0 00 00 00			push		0x000000e0
0023  E8 00 00 00 00			call		__CHK
0028  56				push		esi
0029  57				push		edi
002A  06				push		es
002B  C8 AC 00 00			enter		0x00ac,0x00
002F  50				push		eax
0030  81 ED 82 00 00 00			sub		ebp,0x00000082
0036  89 D6				mov		esi,edx
0038  89 5D 6E				mov		dword ptr 0x6e[ebp],ebx
003B  89 CA				mov		edx,ecx
003D  C6 45 7E 00			mov		byte ptr 0x7e[ebp],0x00
0041  83 F8 02				cmp		eax,0x00000002
0044  72 14				jb		L$2
0046  B8 09 00 00 00			mov		eax,0x00000009
004B  E8 00 00 00 00			call		__set_errno_
0050				L$1:
0050  B8 FF FF FF FF			mov		eax,0xffffffff
0055  E9 CC 02 00 00			jmp		L$22
005A				L$2:
005A  6A 00				push		0x00000000
005C  8D 45 56				lea		eax,0x56[ebp]
005F  50				push		eax
0060  8D 45 5A				lea		eax,0x5a[ebp]
0063  8D 4D 5E				lea		ecx,0x5e[ebp]
0066  50				push		eax
0067  8D 5D 62				lea		ebx,0x62[ebp]
006A  8B 45 6E				mov		eax,dword ptr 0x6e[ebp]
006D  E8 00 00 00 00			call		__cenvarg_
0072  89 45 76				mov		dword ptr 0x76[ebp],eax
0075  83 F8 FF				cmp		eax,0xffffffff
0078  0F 84 A8 02 00 00			je		L$22
007E  89 F0				mov		eax,esi
0080  E8 00 00 00 00			call		strlen_
0085  8D 90 0E 01 00 00			lea		edx,0x10e[eax]
008B  89 D0				mov		eax,edx
008D  E8 00 00 00 00			call		_nmalloc_
0092  89 45 66				mov		dword ptr 0x66[ebp],eax
0095  85 C0				test		eax,eax
0097  75 2A				jne		L$5
0099  8D 5A 03				lea		ebx,0x3[edx]
009C  80 E3 FC				and		bl,0xfc
009F  E8 00 00 00 00			call		stackavail_
00A4  39 C3				cmp		ebx,eax
00A6  73 08				jae		L$3
00A8  89 D8				mov		eax,ebx
00AA  29 C4				sub		esp,eax
00AC  89 E0				mov		eax,esp
00AE  EB 02				jmp		L$4
00B0				L$3:
00B0  31 C0				xor		eax,eax
00B2				L$4:
00B2  89 45 7A				mov		dword ptr 0x7a[ebp],eax
00B5  85 C0				test		eax,eax
00B7  75 0D				jne		L$6
00B9  8B 45 62				mov		eax,dword ptr 0x62[ebp]
00BC  E8 00 00 00 00			call		free_
00C1  EB 8D				jmp		L$1
00C3				L$5:
00C3  89 45 7A				mov		dword ptr 0x7a[ebp],eax
00C6				L$6:
00C6  8D 45 46				lea		eax,0x46[ebp]
00C9  8D 4D 4E				lea		ecx,0x4e[ebp]
00CC  8D 5D 4A				lea		ebx,0x4a[ebp]
00CF  50				push		eax
00D0  8D 45 42				lea		eax,0x42[ebp]
00D3  81 EA 07 01 00 00			sub		edx,0x00000107
00D9  50				push		eax
00DA  03 55 7A				add		edx,dword ptr 0x7a[ebp]
00DD  89 F0				mov		eax,esi
00DF  E8 00 00 00 00			call		_splitpath2_
00E4  8D 45 D6				lea		eax,-0x2a[ebp]
00E7  FF 15 00 00 00 00			call		dword ptr ___Save8087
00ED  8B 45 56				mov		eax,dword ptr 0x56[ebp]
00F0  E8 00 00 00 00			call		_nmalloc_
00F5  89 45 6A				mov		dword ptr 0x6a[ebp],eax
00F8  85 C0				test		eax,eax
00FA  75 49				jne		L$9
00FC  8B 55 56				mov		edx,dword ptr 0x56[ebp]
00FF  83 C2 03				add		edx,0x00000003
0102  80 E2 FC				and		dl,0xfc
0105  E8 00 00 00 00			call		stackavail_
010A  39 C2				cmp		edx,eax
010C  73 0E				jae		L$7
010E  8B 45 56				mov		eax,dword ptr 0x56[ebp]
0111  83 C0 03				add		eax,0x00000003
0114  24 FC				and		al,0xfc
0116  29 C4				sub		esp,eax
0118  89 E0				mov		eax,esp
011A  EB 02				jmp		L$8
011C				L$7:
011C  31 C0				xor		eax,eax
011E				L$8:
011E  89 45 72				mov		dword ptr 0x72[ebp],eax
0121  85 C0				test		eax,eax
0123  75 23				jne		L$10
0125  B8 02 00 00 00			mov		eax,0x00000002
012A  E8 00 00 00 00			call		__set_errno_
012F  B8 0A 00 00 00			mov		eax,0x0000000a
0134  C7 45 76 FF FF FF FF		mov		dword ptr 0x76[ebp],0xffffffff
013B  E8 00 00 00 00			call		__set_doserrno_
0140  E9 BD 01 00 00			jmp		L$21
0145				L$9:
0145  89 45 72				mov		dword ptr 0x72[ebp],eax
0148				L$10:
0148  FF 75 46				push		dword ptr 0x46[ebp]
014B  8B 4D 42				mov		ecx,dword ptr 0x42[ebp]
014E  8B 5D 4E				mov		ebx,dword ptr 0x4e[ebp]
0151  8B 55 4A				mov		edx,dword ptr 0x4a[ebp]
0154  8B 45 7A				mov		eax,dword ptr 0x7a[ebp]
0157  E8 00 00 00 00			call		_makepath_
015C  B8 01 00 00 00			mov		eax,0x00000001
0161  E8 00 00 00 00			call		__set_errno_
0166  8B 45 46				mov		eax,dword ptr 0x46[ebp]
0169  80 38 00				cmp		byte ptr [eax],0x00
016C  74 48				je		L$12
016E  BA 00 00 00 00			mov		edx,offset DGROUP:L$23
0173  E8 00 00 00 00			call		stricmp_
0178  85 C0				test		eax,eax
017A  75 19				jne		L$11
017C  8B 45 7A				mov		eax,dword ptr 0x7a[ebp]
017F  C7 45 76 FF FF FF FF		mov		dword ptr 0x76[ebp],0xffffffff
0186  E8 00 00 00 00			call		file_exists_
018B  85 C0				test		eax,eax
018D  0F 85 0C 01 00 00			jne		L$18
0193  EB 21				jmp		L$12
0195				L$11:
0195  31 C0				xor		eax,eax
0197  E8 00 00 00 00			call		__set_errno_
019C  FF 75 6E				push		dword ptr 0x6e[ebp]
019F  FF 75 62				push		dword ptr 0x62[ebp]
01A2  FF 75 72				push		dword ptr 0x72[ebp]
01A5  FF 75 7A				push		dword ptr 0x7a[ebp]
01A8  FF 75 D2				push		dword ptr -0x2e[ebp]
01AB  E8 00 00 00 00			call		__dospawn
01B0  83 C4 14				add		esp,0x00000014
01B3  89 45 76				mov		dword ptr 0x76[ebp],eax
01B6				L$12:
01B6  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
01BC  83 78 04 01			cmp		dword ptr 0x4[eax],0x00000001
01C0  74 10				je		L$13
01C2  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
01C8  83 78 04 09			cmp		dword ptr 0x4[eax],0x00000009
01CC  0F 85 30 01 00 00			jne		L$21
01D2				L$13:
01D2  8B 45 7A				mov		eax,dword ptr 0x7a[ebp]
01D5  8B 55 7A				mov		edx,dword ptr 0x7a[ebp]
01D8  E8 00 00 00 00			call		strlen_
01DD  01 C2				add		edx,eax
01DF  80 7D 7E 00			cmp		byte ptr 0x7e[ebp],0x00
01E3  74 0C				je		L$14
01E5  B8 01 00 00 00			mov		eax,0x00000001
01EA  E8 00 00 00 00			call		__set_errno_
01EF  EB 2C				jmp		L$15
01F1				L$14:
01F1  1E				push		ds
01F2  07				pop		es
01F3  89 D7				mov		edi,edx
01F5  BE 05 00 00 00			mov		esi,offset DGROUP:L$24
01FA  31 C0				xor		eax,eax
01FC  A5				movsd		
01FD  A4				movsb		
01FE  E8 00 00 00 00			call		__set_errno_
0203  FF 75 6E				push		dword ptr 0x6e[ebp]
0206  FF 75 62				push		dword ptr 0x62[ebp]
0209  FF 75 72				push		dword ptr 0x72[ebp]
020C  FF 75 7A				push		dword ptr 0x7a[ebp]
020F  FF 75 D2				push		dword ptr -0x2e[ebp]
0212  E8 00 00 00 00			call		__dospawn
0217  83 C4 14				add		esp,0x00000014
021A  89 45 76				mov		dword ptr 0x76[ebp],eax
021D				L$15:
021D  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0223  83 78 04 01			cmp		dword ptr 0x4[eax],0x00000001
0227  74 10				je		L$16
0229  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
022F  83 78 04 09			cmp		dword ptr 0x4[eax],0x00000009
0233  0F 85 C9 00 00 00			jne		L$21
0239				L$16:
0239  31 C0				xor		eax,eax
023B  E8 00 00 00 00			call		__set_errno_
0240  89 D7				mov		edi,edx
0242  1E				push		ds
0243  07				pop		es
0244  BE 0A 00 00 00			mov		esi,offset DGROUP:L$25
0249  FF 75 6E				push		dword ptr 0x6e[ebp]
024C  A5				movsd		
024D  A4				movsb		
024E  FF 75 62				push		dword ptr 0x62[ebp]
0251  FF 75 72				push		dword ptr 0x72[ebp]
0254  FF 75 7A				push		dword ptr 0x7a[ebp]
0257  FF 75 D2				push		dword ptr -0x2e[ebp]
025A  E8 00 00 00 00			call		__dospawn
025F  83 C4 14				add		esp,0x00000014
0262  89 45 76				mov		dword ptr 0x76[ebp],eax
0265  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
026B  83 78 04 01			cmp		dword ptr 0x4[eax],0x00000001
026F  74 10				je		L$17
0271  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0277  83 78 04 09			cmp		dword ptr 0x4[eax],0x00000009
027B  0F 85 81 00 00 00			jne		L$21
0281				L$17:
0281  31 C0				xor		eax,eax
0283  E8 00 00 00 00			call		__set_errno_
0288  89 D7				mov		edi,edx
028A  1E				push		ds
028B  07				pop		es
028C  BE 00 00 00 00			mov		esi,offset DGROUP:L$23
0291  8B 45 7A				mov		eax,dword ptr 0x7a[ebp]
0294  A5				movsd		
0295  A4				movsb		
0296  E8 00 00 00 00			call		file_exists_
029B  85 C0				test		eax,eax
029D  74 63				je		L$21
029F				L$18:
029F  8B 45 62				mov		eax,dword ptr 0x62[ebp]
02A2  B9 01 00 00 00			mov		ecx,0x00000001
02A7  8B 5D 72				mov		ebx,dword ptr 0x72[ebp]
02AA  8B 55 6E				mov		edx,dword ptr 0x6e[ebp]
02AD  E8 00 00 00 00			call		free_
02B2  8B 45 7A				mov		eax,dword ptr 0x7a[ebp]
02B5  C7 45 62 00 00 00 00		mov		dword ptr 0x62[ebp],0x00000000
02BC  E8 00 00 00 00			call		__ccmdline_
02C1  6A 00				push		0x00000000
02C3  FF 75 72				push		dword ptr 0x72[ebp]
02C6  0F B6 55 7E			movzx		edx,byte ptr 0x7e[ebp]
02CA  FF 75 7A				push		dword ptr 0x7a[ebp]
02CD  8D 45 52				lea		eax,0x52[ebp]
02D0  E8 00 00 00 00			call		__Slash_C_
02D5  50				push		eax
02D6  80 7D 7E 00			cmp		byte ptr 0x7e[ebp],0x00
02DA  74 07				je		L$19
02DC  B8 17 00 00 00			mov		eax,offset DGROUP:L$27
02E1  EB 05				jmp		L$20
02E3				L$19:
02E3  B8 1B 00 00 00			mov		eax,offset DGROUP:L$28
02E8				L$20:
02E8  50				push		eax
02E9  B8 0F 00 00 00			mov		eax,offset DGROUP:L$26
02EE  E8 00 00 00 00			call		getenv_
02F3  50				push		eax
02F4  FF 75 D2				push		dword ptr -0x2e[ebp]
02F7  E8 00 00 00 00			call		spawnl_
02FC  83 C4 1C				add		esp,0x0000001c
02FF  89 45 76				mov		dword ptr 0x76[ebp],eax
0302				L$21:
0302  8B 45 6A				mov		eax,dword ptr 0x6a[ebp]
0305  E8 00 00 00 00			call		_nfree_
030A  8B 45 66				mov		eax,dword ptr 0x66[ebp]
030D  E8 00 00 00 00			call		_nfree_
0312  8B 45 62				mov		eax,dword ptr 0x62[ebp]
0315  E8 00 00 00 00			call		free_
031A  8D 45 D6				lea		eax,-0x2a[ebp]
031D  FF 15 00 00 00 00			call		dword ptr ___Rest8087
0323  8B 45 76				mov		eax,dword ptr 0x76[ebp]
0326				L$22:
0326  8D A5 82 00 00 00			lea		esp,0x82[ebp]
032C  5D				pop		ebp
032D  07				pop		es
032E  5F				pop		edi
032F  5E				pop		esi
0330  C3				ret		

Routine Size: 787 bytes,    Routine Base: _TEXT + 001E

No disassembly errors

Segment: CONST DWORD USE32 00000023 bytes
0000				L$23:
0000  2E 62 61 74 00                                  .bat.
0005				L$24:
0005  2E 63 6F 6D 00                                  .com.
000A				L$25:
000A  2E 65 78 65 00                                  .exe.
000F				L$26:
000F  43 4F 4D 53 50 45 43 00                         COMSPEC.
0017				L$27:
0017  43 4D 44 00                                     CMD.
001B				L$28:
001B  43 4F 4D 4D 41 4E 44 00                         COMMAND.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

