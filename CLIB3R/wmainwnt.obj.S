Module: wmainwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000F1 bytes
0000				__WinMain:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  55				push		ebp
0004  89 E5				mov		ebp,esp
0006  83 EC 08				sub		esp,0x00000008
0009  B8 01 00 00 00			mov		eax,0x00000001
000E  E8 00 00 00 00			call		__InitRtns
0013  A1 00 00 00 00			mov		eax,dword ptr ___ThreadDataSize
0018  83 C0 03				add		eax,0x00000003
001B  24 FC				and		al,0xfc
001D  31 D2				xor		edx,edx
001F  29 C4				sub		esp,eax
0021  89 E1				mov		ecx,esp
0023  8B 1D 00 00 00 00			mov		ebx,dword ptr ___ThreadDataSize
0029  89 C8				mov		eax,ecx
002B  E8 00 00 00 00			call		memset_
0030  8D 45 F8				lea		eax,-0x8[ebp]
0033  89 CA				mov		edx,ecx
0035  E8 00 00 00 00			call		__NTMainInit_
003A  8B 15 00 00 00 00			mov		edx,dword ptr __ASTACKSIZ
0040  83 C2 03				add		edx,0x00000003
0043  80 E2 FC				and		dl,0xfc
0046  E8 00 00 00 00			call		stackavail_
004B  39 C2				cmp		edx,eax
004D  73 08				jae		L$1
004F  89 D0				mov		eax,edx
0051  29 C4				sub		esp,eax
0053  89 E0				mov		eax,esp
0055  EB 02				jmp		L$2
0057				L$1:
0057  31 C0				xor		eax,eax
0059				L$2:
0059  8B 15 00 00 00 00			mov		edx,dword ptr __ASTACKSIZ
005F  01 D0				add		eax,edx
0061  31 DB				xor		ebx,ebx
0063  A3 00 00 00 00			mov		dword ptr __ASTACKPTR,eax
0068  E8 00 00 00 00			call		__CommonInit_
006D  E8 00 00 00 00			call		_GetCommandLineA
0072  E8 00 00 00 00			call		strdup_
0077  8A 18				mov		bl,byte ptr [eax]
0079  89 C2				mov		edx,eax
007B  83 FB 22				cmp		ebx,0x00000022
007E  75 16				jne		L$6
0080				L$3:
0080  40				inc		eax
0081  31 D2				xor		edx,edx
0083  8A 10				mov		dl,byte ptr [eax]
0085  83 FA 22				cmp		edx,0x00000022
0088  74 04				je		L$4
008A  84 D2				test		dl,dl
008C  75 F2				jne		L$3
008E				L$4:
008E  80 38 00				cmp		byte ptr [eax],0x00
0091  74 26				je		L$7
0093				L$5:
0093  40				inc		eax
0094  EB 23				jmp		L$7
0096				L$6:
0096  8A 10				mov		dl,byte ptr [eax]
0098  FE C2				inc		dl
009A  81 E2 FF 00 00 00			and		edx,0x000000ff
00A0  8A 92 00 00 00 00			mov		dl,byte ptr __IsTable[edx]
00A6  80 E2 02				and		dl,0x02
00A9  81 E2 FF 00 00 00			and		edx,0x000000ff
00AF  75 08				jne		L$7
00B1  80 38 00				cmp		byte ptr [eax],0x00
00B4  74 03				je		L$7
00B6  40				inc		eax
00B7  EB DD				jmp		L$6
00B9				L$7:
00B9  8A 10				mov		dl,byte ptr [eax]
00BB  FE C2				inc		dl
00BD  81 E2 FF 00 00 00			and		edx,0x000000ff
00C3  8A 92 00 00 00 00			mov		dl,byte ptr __IsTable[edx]
00C9  80 E2 02				and		dl,0x02
00CC  81 E2 FF 00 00 00			and		edx,0x000000ff
00D2  75 BF				jne		L$5
00D4  6A 0A				push		0x0000000a
00D6  50				push		eax
00D7  52				push		edx
00D8  52				push		edx
00D9  E8 00 00 00 00			call		_GetModuleHandleA
00DE  50				push		eax
00DF  FF 15 00 00 00 00			call		dword ptr __WinMainProc
00E5  E8 00 00 00 00			call		exit_
00EA  89 EC				mov		esp,ebp
00EC  5D				pop		ebp
00ED  5A				pop		edx
00EE  59				pop		ecx
00EF  5B				pop		ebx
00F0  C3				ret		

Routine Size: 241 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000004 bytes
0000				__WinMainProc:

BSS Size: 4 bytes

