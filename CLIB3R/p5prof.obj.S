Module: p5prof
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS,YIB,YI,YIE

Segment: _TEXT BYTE USE32 00000146 bytes
0000				fini_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  57				push		edi
0005  06				push		es
0006  55				push		ebp
0007  81 EC 40 02 00 00			sub		esp,0x00000240
000D  8C D8				mov		eax,ds
000F  89 E7				mov		edi,esp
0011  8E C0				mov		es,eax
0013  BE 00 00 00 00			mov		esi,offset DGROUP:L$8
0018  BD 00 00 00 00			mov		ebp,offset __start_TI
001D  A1 00 00 00 00			mov		eax,dword ptr __argv
0022  A5				movsd		
0023  A5				movsd		
0024  A5				movsd		
0025  BA 00 00 00 00			mov		edx,offset __end_TI
002A  8B 18				mov		ebx,dword ptr [eax]
002C  89 94 24 3C 02 00 00		mov		dword ptr 0x23c[esp],edx
0033  85 DB				test		ebx,ebx
0035  74 49				je		L$1
0037  6A 00				push		0x00000000
0039  8D 94 24 34 02 00 00		lea		edx,0x234[esp]
0040  8D 8C 24 38 02 00 00		lea		ecx,0x238[esp]
0047  89 D8				mov		eax,ebx
0049  52				push		edx
004A  8D 9C 24 40 02 00 00		lea		ebx,0x240[esp]
0051  8D 94 24 10 01 00 00		lea		edx,0x110[esp]
0058  E8 00 00 00 00			call		_splitpath2_
005D  68 0C 00 00 00			push		offset DGROUP:L$9
0062  8B 8C 24 34 02 00 00		mov		ecx,dword ptr 0x234[esp]
0069  8B 9C 24 38 02 00 00		mov		ebx,dword ptr 0x238[esp]
0070  8B 94 24 3C 02 00 00		mov		edx,dword ptr 0x23c[esp]
0077  8D 44 24 04			lea		eax,0x4[esp]
007B  E8 00 00 00 00			call		_makepath_
0080				L$1:
0080  BA 11 00 00 00			mov		edx,offset DGROUP:L$10
0085  89 E0				mov		eax,esp
0087  E8 00 00 00 00			call		fopen_
008C  89 C6				mov		esi,eax
008E  85 C0				test		eax,eax
0090  0F 84 A2 00 00 00			je		L$7
0096				L$2:
0096  8B 8C 24 3C 02 00 00		mov		ecx,dword ptr 0x23c[esp]
009D  8D 45 10				lea		eax,0x10[ebp]
00A0  39 C8				cmp		eax,ecx
00A2  0F 83 89 00 00 00			jae		L$6
00A8  8B 45 08				mov		eax,dword ptr 0x8[ebp]
00AB  89 84 24 28 02 00 00		mov		dword ptr 0x228[esp],eax
00B2  BB 14 00 00 00			mov		ebx,0x00000014
00B7  8B 45 0C				mov		eax,dword ptr 0xc[ebp]
00BA  8D 94 24 10 02 00 00		lea		edx,0x210[esp]
00C1  89 84 24 2C 02 00 00		mov		dword ptr 0x22c[esp],eax
00C8  8D 84 24 28 02 00 00		lea		eax,0x228[esp]
00CF  E8 00 00 00 00			call		__Bin2String
00D4  31 C0				xor		eax,eax
00D6  EB 17				jmp		L$4
00D8				L$3:
00D8  31 D2				xor		edx,edx
00DA  8A 94 04 10 02 00 00		mov		dl,byte ptr 0x210[esp+eax]
00E1  83 FA 30				cmp		edx,0x00000030
00E4  75 13				jne		L$5
00E6  40				inc		eax
00E7  C6 84 04 0F 02 00 00 20		mov		byte ptr 0x20f[esp+eax],0x20
00EF				L$4:
00EF  80 BC 04 11 02 00 00 00		cmp		byte ptr 0x211[esp+eax],0x00
00F7  75 DF				jne		L$3
00F9				L$5:
00F9  8D 7D 10				lea		edi,0x10[ebp]
00FC  57				push		edi
00FD  8B 45 00				mov		eax,dword ptr [ebp]
0100  50				push		eax
0101  8D 84 24 18 02 00 00		lea		eax,0x218[esp]
0108  50				push		eax
0109  68 15 00 00 00			push		offset DGROUP:L$11
010E  56				push		esi
010F  E8 00 00 00 00			call		fprintf_
0114  83 C4 14				add		esp,0x00000014
0117  06				push		es
0118  8C D8				mov		eax,ds
011A  8E C0				mov		es,eax
011C  29 C9				sub		ecx,ecx
011E  49				dec		ecx
011F  31 C0				xor		eax,eax
0121  F2 AE				repne scasb	
0123  F7 D1				not		ecx
0125  49				dec		ecx
0126  07				pop		es
0127  83 C1 11				add		ecx,0x00000011
012A  01 CD				add		ebp,ecx
012C  E9 65 FF FF FF			jmp		L$2
0131				L$6:
0131  89 F0				mov		eax,esi
0133  E8 00 00 00 00			call		fclose_
0138				L$7:
0138  81 C4 40 02 00 00			add		esp,0x00000240
013E  5D				pop		ebp
013F  07				pop		es
0140  5F				pop		edi
0141  5E				pop		esi
0142  5A				pop		edx
0143  59				pop		ecx
0144  5B				pop		ebx
0145  C3				ret		

Routine Size: 326 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000022 bytes
0000				L$8:
0000  72 65 73 75 6C 74 73 2E 70 72 66 00             results.prf.
000C				L$9:
000C  2E 70 72 66 00                                  .prf.
0011				L$10:
0011  77 74 2B 00                                     wt+.
0015				L$11:
0015  25 73 25 31 31 6C 75 20 20 25 73 0A 00          %s%11lu  %s..

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

Segment: YIB BYTE USE32 00000000 bytes

Segment: YI BYTE USE32 00000006 bytes
0000				__p5_profile:
0000  00 20                                           . 
0002  00 00 00 00                                     DD	offset fini_

Segment: YIE BYTE USE32 00000000 bytes

