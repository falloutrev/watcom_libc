Module: statwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000028A bytes
0000				at2mode_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  57				push		edi
0004  55				push		ebp
0005  89 E5				mov		ebp,esp
0007  50				push		eax
0008  89 D6				mov		esi,edx
000A  31 DB				xor		ebx,ebx
000C  F6 45 FC 20			test		byte ptr -0x4[ebp],0x20
0010  74 4D				je		L$5
0012  BA 00 00 00 00			mov		edx,offset DGROUP:L$24
0017  89 F0				mov		eax,esi
0019  E8 00 00 00 00			call		stricmp_
001E  85 C0				test		eax,eax
0020  75 07				jne		L$1
0022  B8 04 00 00 00			mov		eax,offset DGROUP:L$25
0027  EB 02				jmp		L$2
0029				L$1:
0029  89 F0				mov		eax,esi
002B				L$2:
002B  6A 00				push		0x00000000
002D  6A 00				push		0x00000000
002F  6A 03				push		0x00000003
0031  6A 00				push		0x00000000
0033  6A 00				push		0x00000000
0035  6A 00				push		0x00000000
0037  50				push		eax
0038  E8 00 00 00 00			call		_CreateFileA
003D  89 C7				mov		edi,eax
003F  83 F8 FF				cmp		eax,0xffffffff
0042  74 1B				je		L$5
0044  50				push		eax
0045  E8 00 00 00 00			call		_GetFileType
004A  83 F8 02				cmp		eax,0x00000002
004D  74 05				je		L$3
004F  83 F8 03				cmp		eax,0x00000003
0052  75 05				jne		L$4
0054				L$3:
0054  BB 00 20 00 00			mov		ebx,0x00002000
0059				L$4:
0059  57				push		edi
005A  E8 00 00 00 00			call		_CloseHandle
005F				L$5:
005F  F6 45 FC 10			test		byte ptr -0x4[ebp],0x10
0063  74 07				je		L$6
0065  66 81 CB 49 40			or		bx,0x4049
006A  EB 2A				jmp		L$7
006C				L$6:
006C  F6 C7 20				test		bh,0x20
006F  75 25				jne		L$7
0071  BA 2E 00 00 00			mov		edx,0x0000002e
0076  89 F0				mov		eax,esi
0078  80 CF 80				or		bh,0x80
007B  E8 00 00 00 00			call		strchr_
0080  85 C0				test		eax,eax
0082  74 12				je		L$7
0084  BA 0B 00 00 00			mov		edx,offset DGROUP:L$26
0089  40				inc		eax
008A  E8 00 00 00 00			call		strcmp_
008F  85 C0				test		eax,eax
0091  75 03				jne		L$7
0093  80 CB 49				or		bl,0x49
0096				L$7:
0096  66 81 CB 24 01			or		bx,0x0124
009B  F6 45 FC 01			test		byte ptr -0x4[ebp],0x01
009F  75 03				jne		L$8
00A1  80 CB 92				or		bl,0x92
00A4				L$8:
00A4  89 D8				mov		eax,ebx
00A6				L$9:
00A6  C9				leave		
00A7  5F				pop		edi
00A8  5E				pop		esi
00A9  59				pop		ecx
00AA  5B				pop		ebx
00AB  C3				ret		

Routine Size: 172 bytes,    Routine Base: _TEXT + 0000

00AC				_stat_:

Routine Size: 0 bytes,    Routine Base: _TEXT + 00AC

00AC				stat_:
00AC  53				push		ebx
00AD  51				push		ecx
00AE  56				push		esi
00AF  57				push		edi
00B0  C8 54 02 00			enter		0x0254,0x00
00B4  89 C7				mov		edi,eax
00B6  89 D6				mov		esi,edx
00B8  80 38 00				cmp		byte ptr [eax],0x00
00BB  74 0E				je		L$10
00BD  BA 0F 00 00 00			mov		edx,offset DGROUP:L$27
00C2  E8 00 00 00 00			call		strpbrk_
00C7  85 C0				test		eax,eax
00C9  74 11				je		L$12
00CB				L$10:
00CB  B8 01 00 00 00			mov		eax,0x00000001
00D0  E8 00 00 00 00			call		__set_errno_
00D5				L$11:
00D5  B8 FF FF FF FF			mov		eax,0xffffffff
00DA  EB CA				jmp		L$9
00DC				L$12:
00DC  BA 04 01 00 00			mov		edx,0x00000104
00E1  8D 85 EC FE FF FF			lea		eax,-0x114[ebp]
00E7  E8 00 00 00 00			call		getcwd_
00EC  0F B6 57 01			movzx		edx,byte ptr 0x1[edi]
00F0  89 F8				mov		eax,edi
00F2  83 FA 3A				cmp		edx,0x0000003a
00F5  75 03				jne		L$13
00F7  8D 47 02				lea		eax,0x2[edi]
00FA				L$13:
00FA  0F B6 10				movzx		edx,byte ptr [eax]
00FD  83 FA 5C				cmp		edx,0x0000005c
0100  74 05				je		L$14
0102  83 FA 2F				cmp		edx,0x0000002f
0105  75 3A				jne		L$15
0107				L$14:
0107  80 78 01 00			cmp		byte ptr 0x1[eax],0x00
010B  75 34				jne		L$15
010D  89 F8				mov		eax,edi
010F  E8 00 00 00 00			call		chdir_
0114  85 C0				test		eax,eax
0116  75 BD				jne		L$11
0118  8D 85 EC FE FF FF			lea		eax,-0x114[ebp]
011E  BB 3E 01 00 00			mov		ebx,0x0000013e
0123  E8 00 00 00 00			call		chdir_
0128  31 D2				xor		edx,edx
012A  8D 85 AC FD FF FF			lea		eax,-0x254[ebp]
0130  E8 00 00 00 00			call		memset_
0135  C7 85 AC FD FF FF 10 00 00 00
					mov		dword ptr -0x254[ebp],0x00000010
013F  EB 22				jmp		L$17
0141				L$15:
0141  8D 85 AC FD FF FF			lea		eax,-0x254[ebp]
0147  50				push		eax
0148  57				push		edi
0149  E8 00 00 00 00			call		_FindFirstFileA
014E  83 F8 FF				cmp		eax,0xffffffff
0151  75 0A				jne		L$16
0153  E8 00 00 00 00			call		__set_errno_nt_
0158  E9 49 FF FF FF			jmp		L$9
015D				L$16:
015D  50				push		eax
015E  E8 00 00 00 00			call		_FindClose
0163				L$17:
0163  0F B6 47 01			movzx		eax,byte ptr 0x1[edi]
0167  83 F8 3A				cmp		eax,0x0000003a
016A  75 05				jne		L$18
016C  0F B6 07				movzx		eax,byte ptr [edi]
016F  EB 07				jmp		L$19
0171				L$18:
0171  0F B6 85 EC FE FF FF		movzx		eax,byte ptr -0x114[ebp]
0178				L$19:
0178  E8 00 00 00 00			call		tolower_
017D  83 E8 61				sub		eax,0x00000061
0180  89 06				mov		dword ptr [esi],eax
0182  FF 0E				dec		dword ptr [esi]
0184  8B 06				mov		eax,dword ptr [esi]
0186  89 46 12				mov		dword ptr 0x12[esi],eax
0189  8B 85 CC FD FF FF			mov		eax,dword ptr -0x234[ebp]
018F  89 46 16				mov		dword ptr 0x16[esi],eax
0192  8D 95 D8 FD FF FF			lea		edx,-0x228[ebp]
0198  8B 85 AC FD FF FF			mov		eax,dword ptr -0x254[ebp]
019E  8D 5D FC				lea		ebx,-0x4[ebp]
01A1  E8 00 00 00 00			call		at2mode_
01A6  8D 55 F4				lea		edx,-0xc[ebp]
01A9  66 89 46 08			mov		word ptr 0x8[esi],ax
01AD  8D 85 C0 FD FF FF			lea		eax,-0x240[ebp]
01B3  E8 00 00 00 00			call		__MakeDOSDT_
01B8  0F B7 55 FC			movzx		edx,word ptr -0x4[ebp]
01BC  0F B7 45 F4			movzx		eax,word ptr -0xc[ebp]
01C0  8D 5D F8				lea		ebx,-0x8[ebp]
01C3  E8 00 00 00 00			call		_d2ttime_
01C8  8D 55 F0				lea		edx,-0x10[ebp]
01CB  89 46 1E				mov		dword ptr 0x1e[esi],eax
01CE  8D 85 B0 FD FF FF			lea		eax,-0x250[ebp]
01D4  E8 00 00 00 00			call		__MakeDOSDT_
01D9  8B 45 F0				mov		eax,dword ptr -0x10[ebp]
01DC  66 3B 45 F4			cmp		ax,word ptr -0xc[ebp]
01E0  75 0E				jne		L$20
01E2  8B 45 F8				mov		eax,dword ptr -0x8[ebp]
01E5  66 3B 45 FC			cmp		ax,word ptr -0x4[ebp]
01E9  75 05				jne		L$20
01EB  8B 46 1E				mov		eax,dword ptr 0x1e[esi]
01EE  EB 0D				jmp		L$21
01F0				L$20:
01F0  0F B7 55 F8			movzx		edx,word ptr -0x8[ebp]
01F4  0F B7 45 F0			movzx		eax,word ptr -0x10[ebp]
01F8  E8 00 00 00 00			call		_d2ttime_
01FD				L$21:
01FD  89 46 22				mov		dword ptr 0x22[esi],eax
0200  8D 5D F8				lea		ebx,-0x8[ebp]
0203  8D 55 F0				lea		edx,-0x10[ebp]
0206  8D 85 B8 FD FF FF			lea		eax,-0x248[ebp]
020C  E8 00 00 00 00			call		__MakeDOSDT_
0211  8B 45 F0				mov		eax,dword ptr -0x10[ebp]
0214  66 3B 45 F4			cmp		ax,word ptr -0xc[ebp]
0218  75 0E				jne		L$22
021A  8B 45 F8				mov		eax,dword ptr -0x8[ebp]
021D  66 3B 45 FC			cmp		ax,word ptr -0x4[ebp]
0221  75 05				jne		L$22
0223  8B 46 1E				mov		eax,dword ptr 0x1e[esi]
0226  EB 0D				jmp		L$23
0228				L$22:
0228  0F B7 55 F8			movzx		edx,word ptr -0x8[ebp]
022C  0F B7 45 F0			movzx		eax,word ptr -0x10[ebp]
0230  E8 00 00 00 00			call		_d2ttime_
0235				L$23:
0235  89 46 1A				mov		dword ptr 0x1a[esi],eax
0238  66 C7 46 10 00 00			mov		word ptr 0x10[esi],0x0000
023E  66 8B 46 10			mov		ax,word ptr 0x10[esi]
0242  66 C7 46 0A 01 00			mov		word ptr 0xa[esi],0x0001
0248  98				cwde		
0249  89 46 0C				mov		dword ptr 0xc[esi],eax
024C  89 46 04				mov		dword ptr 0x4[esi],eax
024F  8B 85 AC FD FF FF			mov		eax,dword ptr -0x254[ebp]
0255  C7 46 2E 00 00 00 00		mov		dword ptr 0x2e[esi],0x00000000
025C  C7 46 32 00 00 00 00		mov		dword ptr 0x32[esi],0x00000000
0263  BB 0D 00 00 00			mov		ebx,0x0000000d
0268  66 C7 46 36 00 00			mov		word ptr 0x36[esi],0x0000
026E  8D 95 D8 FD FF FF			lea		edx,-0x228[ebp]
0274  89 46 2A				mov		dword ptr 0x2a[esi],eax
0277  8D 46 39				lea		eax,0x39[esi]
027A  C6 46 38 00			mov		byte ptr 0x38[esi],0x00
027E  E8 00 00 00 00			call		strncpy_
0283  31 C0				xor		eax,eax
0285  E9 1C FE FF FF			jmp		L$9

Routine Size: 478 bytes,    Routine Base: _TEXT + 00AC

No disassembly errors

Segment: CONST DWORD USE32 00000012 bytes
0000				L$24:
0000  63 6F 6E 00                                     con.
0004				L$25:
0004  63 6F 6E 69 6E 24 00                            conin$.
000B				L$26:
000B  45 58 45 00                                     EXE.
000F				L$27:
000F  2A 3F 00                                        *?.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

