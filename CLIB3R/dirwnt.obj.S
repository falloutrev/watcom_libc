Module: dirwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000022D bytes
0000				is_directory_:
0000  80 38 00				cmp		byte ptr [eax],0x00
0003  74 25				je		L$4
0005				L$1:
0005  80 78 01 00			cmp		byte ptr 0x1[eax],0x00
0009  74 03				je		L$2
000B  40				inc		eax
000C  EB F7				jmp		L$1
000E				L$2:
000E  8A 00				mov		al,byte ptr [eax]
0010  25 FF 00 00 00			and		eax,0x000000ff
0015  83 F8 5C				cmp		eax,0x0000005c
0018  74 0A				je		L$3
001A  83 F8 2F				cmp		eax,0x0000002f
001D  74 05				je		L$3
001F  83 F8 2E				cmp		eax,0x0000002e
0022  75 06				jne		L$4
0024				L$3:
0024  B8 01 00 00 00			mov		eax,0x00000001
0029  C3				ret		
002A				L$4:
002A  31 C0				xor		eax,eax
002C  C3				ret		

Routine Size: 45 bytes,    Routine Base: _TEXT + 0000

002D				__opendir_:
002D  51				push		ecx
002E  56				push		esi
002F  57				push		edi
0030  81 EC 40 01 00 00			sub		esp,0x00000140
0036  89 D7				mov		edi,edx
0038  89 DE				mov		esi,ebx
003A  89 E2				mov		edx,esp
003C  52				push		edx
003D  50				push		eax
003E  E8 00 00 00 00			call		_FindFirstFileA
0043  89 C1				mov		ecx,eax
0045  83 F8 FF				cmp		eax,0xffffffff
0048  75 09				jne		L$6
004A  E8 00 00 00 00			call		__set_errno_nt_
004F				L$5:
004F  31 C0				xor		eax,eax
0051  EB 30				jmp		L$8
0053				L$6:
0053  89 E3				mov		ebx,esp
0055  89 FA				mov		edx,edi
0057  E8 00 00 00 00			call		__NTFindNextFileWithAttr_
005C  85 C0				test		eax,eax
005E  75 0C				jne		L$7
0060  B8 02 00 00 00			mov		eax,0x00000002
0065  E8 00 00 00 00			call		__set_errno_dos_
006A  EB E3				jmp		L$5
006C				L$7:
006C  89 E2				mov		edx,esp
006E  89 0E				mov		dword ptr [esi],ecx
0070  89 F0				mov		eax,esi
0072  89 7E 04				mov		dword ptr 0x4[esi],edi
0075  E8 00 00 00 00			call		__GetNTDirInfo_
007A  89 F0				mov		eax,esi
007C  C6 86 20 01 00 00 01		mov		byte ptr 0x120[esi],0x01
0083				L$8:
0083  81 C4 40 01 00 00			add		esp,0x00000140
0089  5F				pop		edi
008A  5E				pop		esi
008B  59				pop		ecx
008C  C3				ret		

Routine Size: 96 bytes,    Routine Base: _TEXT + 002D

008D				_opendir_:
008D  53				push		ebx
008E  51				push		ecx
008F  56				push		esi
0090  57				push		edi
0091  55				push		ebp
0092  81 EC 0C 01 00 00			sub		esp,0x0000010c
0098  89 C1				mov		ecx,eax
009A  89 D5				mov		ebp,edx
009C  B8 21 01 00 00			mov		eax,0x00000121
00A1  E8 00 00 00 00			call		malloc_
00A6  89 C6				mov		esi,eax
00A8  89 C7				mov		edi,eax
00AA  C7 00 00 00 00 00			mov		dword ptr [eax],0x00000000
00B0  C6 40 15 10			mov		byte ptr 0x15[eax],0x10
00B4  89 C8				mov		eax,ecx
00B6  E8 00 00 00 00			call		is_directory_
00BB  85 C0				test		eax,eax
00BD  75 1B				jne		L$10
00BF  89 F3				mov		ebx,esi
00C1  89 C8				mov		eax,ecx
00C3  E8 00 00 00 00			call		__opendir_
00C8  85 C0				test		eax,eax
00CA  75 12				jne		L$11
00CC  89 F0				mov		eax,esi
00CE				L$9:
00CE  E8 00 00 00 00			call		free_
00D3  31 C0				xor		eax,eax
00D5  E9 7A 00 00 00			jmp		L$17
00DA				L$10:
00DA  C6 46 15 10			mov		byte ptr 0x15[esi],0x10
00DE				L$11:
00DE  8A 47 15				mov		al,byte ptr 0x15[edi]
00E1  24 10				and		al,0x10
00E3  25 FF 00 00 00			and		eax,0x000000ff
00E8  0F 84 64 00 00 00			je		L$16
00EE  31 C0				xor		eax,eax
00F0				L$12:
00F0  8A 11				mov		dl,byte ptr [ecx]
00F2  88 14 04				mov		byte ptr [esp+eax],dl
00F5  84 D2				test		dl,dl
00F7  75 42				jne		L$15
00F9  85 C0				test		eax,eax
00FB  74 16				je		L$13
00FD  31 D2				xor		edx,edx
00FF  8A 54 04 FF			mov		dl,byte ptr -0x1[esp+eax]
0103  83 FA 5C				cmp		edx,0x0000005c
0106  74 0B				je		L$13
0108  83 FA 2F				cmp		edx,0x0000002f
010B  74 06				je		L$13
010D  40				inc		eax
010E  C6 44 04 FF 5C			mov		byte ptr -0x1[esp+eax],0x5c
0113				L$13:
0113  8B 15 00 00 00 00			mov		edx,dword ptr DGROUP:L$27
0119  89 14 04				mov		dword ptr [esp+eax],edx
011C  8B 17				mov		edx,dword ptr [edi]
011E  85 D2				test		edx,edx
0120  74 06				je		L$14
0122  52				push		edx
0123  E8 00 00 00 00			call		_FindClose
0128				L$14:
0128  89 E0				mov		eax,esp
012A  89 FB				mov		ebx,edi
012C  89 EA				mov		edx,ebp
012E  E8 00 00 00 00			call		__opendir_
0133  85 C0				test		eax,eax
0135  75 1B				jne		L$16
0137  89 F8				mov		eax,edi
0139  EB 93				jmp		L$9
013B				L$15:
013B  31 D2				xor		edx,edx
013D  8A 11				mov		dl,byte ptr [ecx]
013F  83 FA 2A				cmp		edx,0x0000002a
0142  74 0E				je		L$16
0144  83 FA 3F				cmp		edx,0x0000003f
0147  74 09				je		L$16
0149  40				inc		eax
014A  41				inc		ecx
014B  3D 04 01 00 00			cmp		eax,0x00000104
0150  7C 9E				jl		L$12
0152				L$16:
0152  89 F8				mov		eax,edi
0154				L$17:
0154  81 C4 0C 01 00 00			add		esp,0x0000010c
015A  5D				pop		ebp
015B  5F				pop		edi
015C  5E				pop		esi
015D  59				pop		ecx
015E  5B				pop		ebx
015F  C3				ret		

Routine Size: 211 bytes,    Routine Base: _TEXT + 008D

0160				opendir_:
0160  52				push		edx
0161  BA F7 FF FF FF			mov		edx,0xfffffff7
0166  E8 00 00 00 00			call		_opendir_
016B  5A				pop		edx
016C  C3				ret		

Routine Size: 13 bytes,    Routine Base: _TEXT + 0160

016D				readdir_:
016D  53				push		ebx
016E  51				push		ecx
016F  52				push		edx
0170  56				push		esi
0171  81 EC 40 01 00 00			sub		esp,0x00000140
0177  89 C6				mov		esi,eax
0179  85 C0				test		eax,eax
017B  74 58				je		L$23
017D  80 B8 20 01 00 00 00		cmp		byte ptr 0x120[eax],0x00
0184  74 0B				je		L$18
0186  89 F0				mov		eax,esi
0188  C6 86 20 01 00 00 00		mov		byte ptr 0x120[esi],0x00
018F  EB 44				jmp		L$23
0191				L$18:
0191  89 E0				mov		eax,esp
0193  50				push		eax
0194  8B 16				mov		edx,dword ptr [esi]
0196  52				push		edx
0197  E8 00 00 00 00			call		_FindNextFileA
019C  85 C0				test		eax,eax
019E  75 13				jne		L$21
01A0  E8 00 00 00 00			call		_GetLastError
01A5  83 F8 12				cmp		eax,0x00000012
01A8  74 05				je		L$20
01AA				L$19:
01AA  E8 00 00 00 00			call		__set_errno_dos_
01AF				L$20:
01AF  31 C0				xor		eax,eax
01B1  EB 22				jmp		L$23
01B3				L$21:
01B3  89 E3				mov		ebx,esp
01B5  8B 56 04				mov		edx,dword ptr 0x4[esi]
01B8  8B 06				mov		eax,dword ptr [esi]
01BA  E8 00 00 00 00			call		__NTFindNextFileWithAttr_
01BF  85 C0				test		eax,eax
01C1  75 07				jne		L$22
01C3  B8 12 00 00 00			mov		eax,0x00000012
01C8  EB E0				jmp		L$19
01CA				L$22:
01CA  89 E2				mov		edx,esp
01CC  89 F0				mov		eax,esi
01CE  E8 00 00 00 00			call		__GetNTDirInfo_
01D3  89 F0				mov		eax,esi
01D5				L$23:
01D5  81 C4 40 01 00 00			add		esp,0x00000140
01DB  5E				pop		esi
01DC  5A				pop		edx
01DD  59				pop		ecx
01DE  5B				pop		ebx
01DF  C3				ret		

Routine Size: 115 bytes,    Routine Base: _TEXT + 016D

01E0				closedir_:
01E0  53				push		ebx
01E1  51				push		ecx
01E2  52				push		edx
01E3  89 C3				mov		ebx,eax
01E5  85 C0				test		eax,eax
01E7  74 0D				je		L$24
01E9  31 C0				xor		eax,eax
01EB  8A 83 20 01 00 00			mov		al,byte ptr 0x120[ebx]
01F1  83 F8 01				cmp		eax,0x00000001
01F4  7E 0E				jle		L$25
01F6				L$24:
01F6  B8 06 00 00 00			mov		eax,0x00000006
01FB  E8 00 00 00 00			call		__set_errno_dos_
0200  5A				pop		edx
0201  59				pop		ecx
0202  5B				pop		ebx
0203  C3				ret		
0204				L$25:
0204  8B 13				mov		edx,dword ptr [ebx]
0206  52				push		edx
0207  E8 00 00 00 00			call		_FindClose
020C  85 C0				test		eax,eax
020E  75 09				jne		L$26
0210  E8 00 00 00 00			call		__set_errno_nt_
0215  5A				pop		edx
0216  59				pop		ecx
0217  5B				pop		ebx
0218  C3				ret		
0219				L$26:
0219  89 D8				mov		eax,ebx
021B  C6 83 20 01 00 00 02		mov		byte ptr 0x120[ebx],0x02
0222  E8 00 00 00 00			call		free_
0227  31 C0				xor		eax,eax
0229  5A				pop		edx
022A  59				pop		ecx
022B  5B				pop		ebx
022C  C3				ret		

Routine Size: 77 bytes,    Routine Base: _TEXT + 01E0

No disassembly errors

Segment: CONST DWORD USE32 00000004 bytes
0000				L$27:
0000  2A 2E 2A 00                                     *.*.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

