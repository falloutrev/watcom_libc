Module: fstatwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001F5 bytes
0000				_fstat_:
0000				fstat_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  57				push		edi
0004  83 EC 2C				sub		esp,0x0000002c
0007  89 C7				mov		edi,eax
0009  89 D6				mov		esi,edx
000B  8B 1D 00 00 00 00			mov		ebx,dword ptr ___FileHandleIDs
0011  8B 1C 83				mov		ebx,dword ptr [ebx+eax*4]
0014  FF 15 00 00 00 00			call		dword ptr __AccessFileH
001A  89 F8				mov		eax,edi
001C  66 C7 42 08 00 00			mov		word ptr 0x8[edx],0x0000
0022  E8 00 00 00 00			call		__IOMode_
0027  89 44 24 18			mov		dword ptr 0x18[esp],eax
002B  A8 01				test		al,0x01
002D  74 0E				je		L$1
002F  66 8B 52 08			mov		dx,word ptr 0x8[edx]
0033  81 CA 24 01 00 00			or		edx,0x00000124
0039  66 89 56 08			mov		word ptr 0x8[esi],dx
003D				L$1:
003D  F6 44 24 18 02			test		byte ptr 0x18[esp],0x02
0042  74 04				je		L$2
0044  80 4E 08 92			or		byte ptr 0x8[esi],0x92
0048				L$2:
0048  53				push		ebx
0049  E8 00 00 00 00			call		_GetFileType
004E  F6 44 24 19 20			test		byte ptr 0x19[esp],0x20
0053  75 0E				jne		L$3
0055  83 F8 02				cmp		eax,0x00000002
0058  74 09				je		L$3
005A  83 F8 03				cmp		eax,0x00000003
005D  74 04				je		L$3
005F  85 C0				test		eax,eax
0061  75 29				jne		L$4
0063				L$3:
0063  C7 46 16 00 00 00 00		mov		dword ptr 0x16[esi],0x00000000
006A  C7 46 1E 00 00 00 00		mov		dword ptr 0x1e[esi],0x00000000
0071  66 C7 46 08 24 21			mov		word ptr 0x8[esi],0x2124
0077  C7 46 12 01 00 00 00		mov		dword ptr 0x12[esi],0x00000001
007E  8B 46 1E				mov		eax,dword ptr 0x1e[esi]
0081  89 46 22				mov		dword ptr 0x22[esi],eax
0084  89 46 1A				mov		dword ptr 0x1a[esi],eax
0087  E9 12 01 00 00			jmp		L$15
008C				L$4:
008C  6A 00				push		0x00000000
008E  53				push		ebx
008F  E8 00 00 00 00			call		_GetFileSize
0094  83 F8 FF				cmp		eax,0xffffffff
0097  75 12				jne		L$6
0099				L$5:
0099  89 F8				mov		eax,edi
009B  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
00A1  E8 00 00 00 00			call		__set_errno_nt_
00A6  E9 42 01 00 00			jmp		L$16
00AB				L$6:
00AB  89 46 16				mov		dword ptr 0x16[esi],eax
00AE  8D 44 24 08			lea		eax,0x8[esp]
00B2  50				push		eax
00B3  8D 44 24 04			lea		eax,0x4[esp]
00B7  50				push		eax
00B8  8D 44 24 18			lea		eax,0x18[esp]
00BC  50				push		eax
00BD  53				push		ebx
00BE  E8 00 00 00 00			call		_GetFileTime
00C3  85 C0				test		eax,eax
00C5  74 D2				je		L$5
00C7  8D 5C 24 24			lea		ebx,0x24[esp]
00CB  8D 54 24 1C			lea		edx,0x1c[esp]
00CF  8D 44 24 08			lea		eax,0x8[esp]
00D3  E8 00 00 00 00			call		__MakeDOSDT_
00D8  31 D2				xor		edx,edx
00DA  31 C0				xor		eax,eax
00DC  66 8B 54 24 24			mov		dx,word ptr 0x24[esp]
00E1  66 8B 44 24 1C			mov		ax,word ptr 0x1c[esp]
00E6  E8 00 00 00 00			call		_d2ttime_
00EB  89 46 1E				mov		dword ptr 0x1e[esi],eax
00EE  8B 44 24 10			mov		eax,dword ptr 0x10[esp]
00F2  3B 44 24 08			cmp		eax,dword ptr 0x8[esp]
00F6  75 0F				jne		L$8
00F8  8B 44 24 14			mov		eax,dword ptr 0x14[esp]
00FC  3B 44 24 0C			cmp		eax,dword ptr 0xc[esp]
0100  75 05				jne		L$8
0102				L$7:
0102  8B 46 1E				mov		eax,dword ptr 0x1e[esi]
0105  EB 3A				jmp		L$10
0107				L$8:
0107  8D 5C 24 20			lea		ebx,0x20[esp]
010B  8D 54 24 28			lea		edx,0x28[esp]
010F  8D 44 24 10			lea		eax,0x10[esp]
0113  E8 00 00 00 00			call		__MakeDOSDT_
0118  8B 44 24 28			mov		eax,dword ptr 0x28[esp]
011C  66 3B 44 24 1C			cmp		ax,word ptr 0x1c[esp]
0121  75 0B				jne		L$9
0123  8B 44 24 20			mov		eax,dword ptr 0x20[esp]
0127  66 3B 44 24 24			cmp		ax,word ptr 0x24[esp]
012C  74 D4				je		L$7
012E				L$9:
012E  31 D2				xor		edx,edx
0130  31 C0				xor		eax,eax
0132  66 8B 54 24 20			mov		dx,word ptr 0x20[esp]
0137  66 8B 44 24 28			mov		ax,word ptr 0x28[esp]
013C  E8 00 00 00 00			call		_d2ttime_
0141				L$10:
0141  89 46 22				mov		dword ptr 0x22[esi],eax
0144  8B 04 24				mov		eax,dword ptr [esp]
0147  3B 44 24 08			cmp		eax,dword ptr 0x8[esp]
014B  75 0F				jne		L$12
014D  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0151  3B 44 24 0C			cmp		eax,dword ptr 0xc[esp]
0155  75 05				jne		L$12
0157				L$11:
0157  8B 46 1E				mov		eax,dword ptr 0x1e[esi]
015A  EB 38				jmp		L$14
015C				L$12:
015C  8D 5C 24 20			lea		ebx,0x20[esp]
0160  8D 54 24 28			lea		edx,0x28[esp]
0164  89 E0				mov		eax,esp
0166  E8 00 00 00 00			call		__MakeDOSDT_
016B  8B 44 24 28			mov		eax,dword ptr 0x28[esp]
016F  66 3B 44 24 1C			cmp		ax,word ptr 0x1c[esp]
0174  75 0B				jne		L$13
0176  8B 44 24 20			mov		eax,dword ptr 0x20[esp]
017A  66 3B 44 24 24			cmp		ax,word ptr 0x24[esp]
017F  74 D6				je		L$11
0181				L$13:
0181  31 D2				xor		edx,edx
0183  31 C0				xor		eax,eax
0185  66 8B 54 24 20			mov		dx,word ptr 0x20[esp]
018A  66 8B 44 24 28			mov		ax,word ptr 0x28[esp]
018F  E8 00 00 00 00			call		_d2ttime_
0194				L$14:
0194  89 46 1A				mov		dword ptr 0x1a[esi],eax
0197  C7 46 12 00 00 00 00		mov		dword ptr 0x12[esi],0x00000000
019E				L$15:
019E  8B 46 12				mov		eax,dword ptr 0x12[esi]
01A1  89 06				mov		dword ptr [esi],eax
01A3  89 F8				mov		eax,edi
01A5  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
01AB  66 C7 46 0A 01 00			mov		word ptr 0xa[esi],0x0001
01B1  66 C7 46 10 00 00			mov		word ptr 0x10[esi],0x0000
01B7  C7 46 2A 00 00 00 00		mov		dword ptr 0x2a[esi],0x00000000
01BE  C7 46 2E 00 00 00 00		mov		dword ptr 0x2e[esi],0x00000000
01C5  C7 46 32 00 00 00 00		mov		dword ptr 0x32[esi],0x00000000
01CC  66 C7 46 36 00 00			mov		word ptr 0x36[esi],0x0000
01D2  C6 46 38 00			mov		byte ptr 0x38[esi],0x00
01D6  C6 46 39 00			mov		byte ptr 0x39[esi],0x00
01DA  66 8B 46 10			mov		ax,word ptr 0x10[esi]
01DE  89 7E 04				mov		dword ptr 0x4[esi],edi
01E1  98				cwde		
01E2  89 46 0C				mov		dword ptr 0xc[esi],eax
01E5  8B 46 1E				mov		eax,dword ptr 0x1e[esi]
01E8  89 46 26				mov		dword ptr 0x26[esi],eax
01EB  31 C0				xor		eax,eax
01ED				L$16:
01ED  83 C4 2C				add		esp,0x0000002c
01F0  5F				pop		edi
01F1  5E				pop		esi
01F2  59				pop		ecx
01F3  5B				pop		ebx
01F4  C3				ret		

Routine Size: 501 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

