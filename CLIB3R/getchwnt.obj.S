Module: getchwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000181 bytes
0000				do_getch_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  83 EC 18				sub		esp,0x00000018
0007  89 C3				mov		ebx,eax
0009  A1 00 00 00 00			mov		eax,dword ptr DGROUP:L$14
000E  83 F8 01				cmp		eax,0x00000001
0011  72 5E				jb		L$5
0013  76 07				jbe		L$1
0015  83 F8 02				cmp		eax,0x00000002
0018  74 39				je		L$4
001A  EB 55				jmp		L$5
001C				L$1:
001C  8B 1D 08 00 00 00			mov		ebx,dword ptr DGROUP:L$17
0022  4B				dec		ebx
0023  8B 0D 04 00 00 00			mov		ecx,dword ptr DGROUP:L$16
0029  89 1D 08 00 00 00			mov		dword ptr DGROUP:L$17,ebx
002F  85 C9				test		ecx,ecx
0031  74 0C				je		L$2
0033  85 DB				test		ebx,ebx
0035  75 12				jne		L$3
0037  89 1D 00 00 00 00			mov		dword ptr DGROUP:L$14,ebx
003D  EB 0A				jmp		L$3
003F				L$2:
003F  C7 05 00 00 00 00 02 00 00 00
					mov		dword ptr DGROUP:L$14,0x00000002
0049				L$3:
0049  A1 04 00 00 00			mov		eax,dword ptr DGROUP:L$16
004E  E9 B0 00 00 00			jmp		L$9
0053				L$4:
0053  83 3D 08 00 00 00 00		cmp		dword ptr DGROUP:L$17,0x00000000
005A  0F 95 C0				setne		al
005D  25 FF 00 00 00			and		eax,0x000000ff
0062  A3 00 00 00 00			mov		dword ptr DGROUP:L$14,eax
0067  A1 00 00 00 00			mov		eax,dword ptr DGROUP:L$15
006C  E9 92 00 00 00			jmp		L$9
0071				L$5:
0071  8D 44 24 14			lea		eax,0x14[esp]
0075  50				push		eax
0076  6A 01				push		0x00000001
0078  8D 44 24 08			lea		eax,0x8[esp]
007C  50				push		eax
007D  53				push		ebx
007E  E8 00 00 00 00			call		_ReadConsoleInputA
0083  85 C0				test		eax,eax
0085  0F 84 73 00 00 00			je		L$8
008B  89 E0				mov		eax,esp
008D  E8 00 00 00 00			call		__NTRealKey_
0092  85 C0				test		eax,eax
0094  74 DB				je		L$5
0096  31 C0				xor		eax,eax
0098  66 8B 44 24 08			mov		ax,word ptr 0x8[esp]
009D  48				dec		eax
009E  A3 08 00 00 00			mov		dword ptr DGROUP:L$17,eax
00A3  31 C0				xor		eax,eax
00A5  8A 44 24 0E			mov		al,byte ptr 0xe[esp]
00A9  A3 04 00 00 00			mov		dword ptr DGROUP:L$16,eax
00AE  F6 44 24 11 01			test		byte ptr 0x11[esp],0x01
00B3  75 09				jne		L$6
00B5  83 3D 04 00 00 00 00		cmp		dword ptr DGROUP:L$16,0x00000000
00BC  75 24				jne		L$7
00BE				L$6:
00BE  BE 02 00 00 00			mov		esi,0x00000002
00C3  31 C0				xor		eax,eax
00C5  31 C9				xor		ecx,ecx
00C7  66 8B 44 24 0C			mov		ax,word ptr 0xc[esp]
00CC  89 0D 04 00 00 00			mov		dword ptr DGROUP:L$16,ecx
00D2  89 35 00 00 00 00			mov		dword ptr DGROUP:L$14,esi
00D8  A3 00 00 00 00			mov		dword ptr DGROUP:L$15,eax
00DD  E9 67 FF FF FF			jmp		L$3
00E2				L$7:
00E2  83 3D 08 00 00 00 00		cmp		dword ptr DGROUP:L$17,0x00000000
00E9  0F 84 5A FF FF FF			je		L$3
00EF  C7 05 00 00 00 00 01 00 00 00
					mov		dword ptr DGROUP:L$14,0x00000001
00F9  E9 4B FF FF FF			jmp		L$3
00FE				L$8:
00FE  B8 FF FF FF FF			mov		eax,0xffffffff
0103				L$9:
0103  83 C4 18				add		esp,0x00000018
0106  5E				pop		esi
0107  5A				pop		edx
0108  59				pop		ecx
0109  5B				pop		ebx
010A  C3				ret		

Routine Size: 267 bytes,    Routine Base: _TEXT + 0000

010B				getch_:
010B  53				push		ebx
010C  51				push		ecx
010D  52				push		edx
010E  56				push		esi
010F  83 EC 04				sub		esp,0x00000004
0112  A1 00 00 00 00			mov		eax,dword ptr __cbyte
0117  85 C0				test		eax,eax
0119  74 0A				je		L$10
011B  31 F6				xor		esi,esi
011D  89 35 00 00 00 00			mov		dword ptr __cbyte,esi
0123  EB 54				jmp		L$13
0125				L$10:
0125  83 3D 00 00 00 00 00		cmp		dword ptr __WindowsGetch,0x00000000
012C  74 10				je		L$11
012E  FF 15 00 00 00 00			call		dword ptr __WindowsIsWindowedHandle
0134  FF 15 00 00 00 00			call		dword ptr __WindowsGetch
013A  89 C6				mov		esi,eax
013C  EB 39				jmp		L$12
013E				L$11:
013E  FF 15 00 00 00 00			call		dword ptr __AccessFileH
0144  E8 00 00 00 00			call		__NTConsoleInput_
0149  89 C3				mov		ebx,eax
014B  89 E0				mov		eax,esp
014D  50				push		eax
014E  53				push		ebx
014F  E8 00 00 00 00			call		_GetConsoleMode
0154  6A 00				push		0x00000000
0156  53				push		ebx
0157  E8 00 00 00 00			call		_SetConsoleMode
015C  89 D8				mov		eax,ebx
015E  E8 00 00 00 00			call		do_getch_
0163  8B 0C 24				mov		ecx,dword ptr [esp]
0166  51				push		ecx
0167  53				push		ebx
0168  89 C6				mov		esi,eax
016A  E8 00 00 00 00			call		_SetConsoleMode
016F  31 C0				xor		eax,eax
0171  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
0177				L$12:
0177  89 F0				mov		eax,esi
0179				L$13:
0179  83 C4 04				add		esp,0x00000004
017C  5E				pop		esi
017D  5A				pop		edx
017E  59				pop		ecx
017F  5B				pop		ebx
0180  C3				ret		

Routine Size: 118 bytes,    Routine Base: _TEXT + 010B

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000004 bytes
0000				L$14:
0000  00 00 00 00                                     ....

Segment: _BSS DWORD USE32 0000000C bytes
0000				L$15:
0004				L$16:
0008				L$17:

BSS Size: 12 bytes

