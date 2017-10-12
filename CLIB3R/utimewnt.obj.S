Module: utimewnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000140 bytes
0000				utime_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  57				push		edi
0004  83 EC 48				sub		esp,0x00000048
0007  89 D6				mov		esi,edx
0009  6A 00				push		0x00000000
000B  6A 00				push		0x00000000
000D  6A 03				push		0x00000003
000F  6A 00				push		0x00000000
0011  6A 00				push		0x00000000
0013  68 00 00 00 C0			push		0xc0000000
0018  50				push		eax
0019  E8 00 00 00 00			call		_CreateFileA
001E  89 C3				mov		ebx,eax
0020  89 C7				mov		edi,eax
0022  83 F8 FF				cmp		eax,0xffffffff
0025  74 1F				je		L$2
0027  8D 44 24 28			lea		eax,0x28[esp]
002B  50				push		eax
002C  8D 44 24 34			lea		eax,0x34[esp]
0030  50				push		eax
0031  8D 44 24 48			lea		eax,0x48[esp]
0035  50				push		eax
0036  53				push		ebx
0037  E8 00 00 00 00			call		_GetFileTime
003C  85 C0				test		eax,eax
003E  75 10				jne		L$3
0040  53				push		ebx
0041				L$1:
0041  E8 00 00 00 00			call		_CloseHandle
0046				L$2:
0046  E8 00 00 00 00			call		__set_errno_nt_
004B  E9 E8 00 00 00			jmp		L$6
0050				L$3:
0050  85 F6				test		esi,esi
0052  75 13				jne		L$4
0054  31 C0				xor		eax,eax
0056  8D 74 24 38			lea		esi,0x38[esp]
005A  E8 00 00 00 00			call		time_
005F  89 44 24 3C			mov		dword ptr 0x3c[esp],eax
0063  89 44 24 38			mov		dword ptr 0x38[esp],eax
0067				L$4:
0067  8D 46 04				lea		eax,0x4[esi]
006A  E8 00 00 00 00			call		localtime_
006F  89 C2				mov		edx,eax
0071  66 8B 40 14			mov		ax,word ptr 0x14[eax]
0075  05 6C 07 00 00			add		eax,0x0000076c
007A  66 89 04 24			mov		word ptr [esp],ax
007E  66 89 44 24 10			mov		word ptr 0x10[esp],ax
0083  66 8B 42 10			mov		ax,word ptr 0x10[edx]
0087  40				inc		eax
0088  66 89 44 24 02			mov		word ptr 0x2[esp],ax
008D  66 89 44 24 12			mov		word ptr 0x12[esp],ax
0092  66 8B 42 0C			mov		ax,word ptr 0xc[edx]
0096  66 89 44 24 06			mov		word ptr 0x6[esp],ax
009B  66 89 44 24 16			mov		word ptr 0x16[esp],ax
00A0  66 8B 42 08			mov		ax,word ptr 0x8[edx]
00A4  66 89 44 24 08			mov		word ptr 0x8[esp],ax
00A9  66 89 44 24 18			mov		word ptr 0x18[esp],ax
00AE  66 8B 42 04			mov		ax,word ptr 0x4[edx]
00B2  66 89 44 24 0A			mov		word ptr 0xa[esp],ax
00B7  66 89 44 24 1A			mov		word ptr 0x1a[esp],ax
00BC  66 8B 02				mov		ax,word ptr [edx]
00BF  66 89 44 24 0C			mov		word ptr 0xc[esp],ax
00C4  66 89 44 24 1C			mov		word ptr 0x1c[esp],ax
00C9  8D 44 24 20			lea		eax,0x20[esp]
00CD  50				push		eax
00CE  8D 44 24 14			lea		eax,0x14[esp]
00D2  31 D2				xor		edx,edx
00D4  50				push		eax
00D5  66 89 54 24 16			mov		word ptr 0x16[esp],dx
00DA  66 89 54 24 26			mov		word ptr 0x26[esp],dx
00DF  E8 00 00 00 00			call		_SystemTimeToFileTime
00E4  8D 44 24 28			lea		eax,0x28[esp]
00E8  50				push		eax
00E9  8D 44 24 24			lea		eax,0x24[esp]
00ED  50				push		eax
00EE  E8 00 00 00 00			call		_LocalFileTimeToFileTime
00F3  8D 44 24 20			lea		eax,0x20[esp]
00F7  50				push		eax
00F8  8D 44 24 04			lea		eax,0x4[esp]
00FC  50				push		eax
00FD  E8 00 00 00 00			call		_SystemTimeToFileTime
0102  8D 44 24 30			lea		eax,0x30[esp]
0106  50				push		eax
0107  8D 44 24 24			lea		eax,0x24[esp]
010B  50				push		eax
010C  E8 00 00 00 00			call		_LocalFileTimeToFileTime
0111  8D 44 24 28			lea		eax,0x28[esp]
0115  50				push		eax
0116  8D 44 24 34			lea		eax,0x34[esp]
011A  50				push		eax
011B  8D 44 24 48			lea		eax,0x48[esp]
011F  50				push		eax
0120  57				push		edi
0121  E8 00 00 00 00			call		_SetFileTime
0126  85 C0				test		eax,eax
0128  75 06				jne		L$5
012A  57				push		edi
012B  E9 11 FF FF FF			jmp		L$1
0130				L$5:
0130  57				push		edi
0131  E8 00 00 00 00			call		_CloseHandle
0136  31 C0				xor		eax,eax
0138				L$6:
0138  83 C4 48				add		esp,0x00000048
013B  5F				pop		edi
013C  5E				pop		esi
013D  59				pop		ecx
013E  5B				pop		ebx
013F  C3				ret		

Routine Size: 320 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

