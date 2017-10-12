Module: dmainwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000015F bytes
0000				L$1:
0000  12 01 00 00                                     DD	offset L$8
0004  51 00 00 00                                     DD	offset L$3
0008  33 00 00 00                                     DD	offset L$2
000C  FF 00 00 00                                     DD	offset L$7

Routine Size: 16 bytes,    Routine Base: _TEXT + 0000

0010				__LibMain:
0010  53				push		ebx
0011  56				push		esi
0012  57				push		edi
0013  55				push		ebp
0014  8B 74 24 14			mov		esi,dword ptr 0x14[esp]
0018  8B 7C 24 18			mov		edi,dword ptr 0x18[esp]
001C  8B 6C 24 1C			mov		ebp,dword ptr 0x1c[esp]
0020  83 FF 03				cmp		edi,0x00000003
0023  0F 87 2D 01 00 00			ja		L$10
0029  89 F8				mov		eax,edi
002B  2E FF 24 85 00 00 00 00		jmp		dword ptr cs:L$1[eax*4]
0033				L$2:
0033  31 F8				xor		eax,edi
0035  E8 00 00 00 00			call		__NTAddThread_
003A  85 C0				test		eax,eax
003C  0F 84 16 01 00 00			je		L$11
0042  55				push		ebp
0043  57				push		edi
0044  56				push		esi
0045  E8 00 00 00 00			call		_LibMain
004A  89 C3				mov		ebx,eax
004C  E9 05 01 00 00			jmp		L$10
0051				L$3:
0051  8B 15 00 00 00 00			mov		edx,dword ptr DGROUP:L$12
0057  42				inc		edx
0058  89 15 00 00 00 00			mov		dword ptr DGROUP:L$12,edx
005E  83 FA 01				cmp		edx,0x00000001
0061  7E 12				jle		L$5
0063  89 F0				mov		eax,esi
0065  E8 00 00 00 00			call		__disallow_single_dgroup_
006A  85 C0				test		eax,eax
006C  74 07				je		L$5
006E				L$4:
006E  31 DB				xor		ebx,ebx
0070  E9 E1 00 00 00			jmp		L$10
0075				L$5:
0075  B8 01 00 00 00			mov		eax,0x00000001
007A  E8 00 00 00 00			call		__InitRtns
007F  89 F3				mov		ebx,esi
0081  31 D2				xor		edx,edx
0083  B8 01 00 00 00			mov		eax,0x00000001
0088  E8 00 00 00 00			call		__NTInit_
008D  85 C0				test		eax,eax
008F  74 DD				je		L$4
0091  E8 00 00 00 00			call		__NTThreadInit_
0096  85 C0				test		eax,eax
0098  74 D4				je		L$4
009A  31 C0				xor		eax,eax
009C  E8 00 00 00 00			call		__NTAddThread_
00A1  85 C0				test		eax,eax
00A3  74 C9				je		L$4
00A5  B8 0F 00 00 00			mov		eax,0x0000000f
00AA  E8 00 00 00 00			call		__InitRtns
00AF  E8 00 00 00 00			call		__InitMultipleThread_
00B4  83 3D 00 00 00 00 00		cmp		dword ptr __pRawDllMain,0x00000000
00BB  74 19				je		L$6
00BD  55				push		ebp
00BE  57				push		edi
00BF  56				push		esi
00C0  FF 15 00 00 00 00			call		dword ptr __pRawDllMain
00C6  85 C0				test		eax,eax
00C8  75 0C				jne		L$6
00CA  BA 0F 00 00 00			mov		edx,0x0000000f
00CF  E8 00 00 00 00			call		__FiniRtns
00D4  EB 98				jmp		L$4
00D6				L$6:
00D6  B8 FF 00 00 00			mov		eax,0x000000ff
00DB  E8 00 00 00 00			call		__InitRtns
00E0  E8 00 00 00 00			call		__CommonInit_
00E5  55				push		ebp
00E6  57				push		edi
00E7  56				push		esi
00E8  E8 00 00 00 00			call		_LibMain
00ED  89 C3				mov		ebx,eax
00EF  85 C0				test		eax,eax
00F1  75 63				jne		L$10
00F3  BA FF 00 00 00			mov		edx,0x000000ff
00F8  E8 00 00 00 00			call		__FiniRtns
00FD  EB 57				jmp		L$10
00FF				L$7:
00FF  55				push		ebp
0100  57				push		edi
0101  56				push		esi
0102  E8 00 00 00 00			call		_LibMain
0107  89 C3				mov		ebx,eax
0109  31 C0				xor		eax,eax
010B  E8 00 00 00 00			call		__NTRemoveThread_
0110  EB 44				jmp		L$10
0112				L$8:
0112  55				push		ebp
0113  57				push		edi
0114  56				push		esi
0115  E8 00 00 00 00			call		_LibMain
011A  BA FF 00 00 00			mov		edx,0x000000ff
011F  89 C3				mov		ebx,eax
0121  B8 10 00 00 00			mov		eax,0x00000010
0126  E8 00 00 00 00			call		__FiniRtns
012B  83 3D 00 00 00 00 00		cmp		dword ptr __pRawDllMain,0x00000000
0132  74 09				je		L$9
0134  55				push		ebp
0135  57				push		edi
0136  56				push		esi
0137  FF 15 00 00 00 00			call		dword ptr __pRawDllMain
013D				L$9:
013D  BA 0F 00 00 00			mov		edx,0x0000000f
0142  31 C0				xor		eax,eax
0144  E8 00 00 00 00			call		__FiniRtns
0149  31 C0				xor		eax,eax
014B  E8 00 00 00 00			call		__NTRemoveThread_
0150  FF 0D 00 00 00 00			dec		dword ptr DGROUP:L$12
0156				L$10:
0156  89 D8				mov		eax,ebx
0158				L$11:
0158  5D				pop		ebp
0159  5F				pop		edi
015A  5E				pop		esi
015B  5B				pop		ebx
015C  C2 0C 00				ret		0x000c

Routine Size: 335 bytes,    Routine Base: _TEXT + 0010

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000004 bytes
0000				L$12:

BSS Size: 4 bytes

