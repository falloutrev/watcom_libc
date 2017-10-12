Module: uasctime
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000171 bytes
0000				convDec_:
0000  51				push		ecx
0001  56				push		esi
0002  C8 08 00 00			enter		0x0008,0x00
0006  89 D1				mov		ecx,edx
0008  BA 0A 00 00 00			mov		edx,0x0000000a
000D  8D 75 F8				lea		esi,-0x8[ebp]
0010  E8 00 00 00 00			call		div_
0015  89 C8				mov		eax,ecx
0017  01 C0				add		eax,eax
0019  8B 75 F8				mov		esi,dword ptr -0x8[ebp]
001C  01 D8				add		eax,ebx
001E  83 C6 30				add		esi,0x00000030
0021  66 89 30				mov		word ptr [eax],si
0024  8B 5D FC				mov		ebx,dword ptr -0x4[ebp]
0027  83 C3 30				add		ebx,0x00000030
002A  66 89 58 02			mov		word ptr 0x2[eax],bx
002E  C9				leave		
002F  5E				pop		esi
0030  59				pop		ecx
0031  C3				ret		

Routine Size: 50 bytes,    Routine Base: _TEXT + 0000

0032				_u_asctime_:
0032  53				push		ebx
0033  51				push		ecx
0034  56				push		esi
0035  C8 08 00 00			enter		0x0008,0x00
0039  89 C6				mov		esi,eax
003B  89 D1				mov		ecx,edx
003D  8B 40 18				mov		eax,dword ptr 0x18[eax]
0040  66 0F B6 90 24 00 00 00		movzx		dx,byte ptr DGROUP:L$5[eax]
0048  66 89 11				mov		word ptr [ecx],dx
004B  66 0F B6 90 2B 00 00 00		movzx		dx,byte ptr DGROUP:L$6[eax]
0053  66 89 51 02			mov		word ptr 0x2[ecx],dx
0057  66 0F B6 80 32 00 00 00		movzx		ax,byte ptr DGROUP:L$7[eax]
005F  66 C7 41 06 20 00			mov		word ptr 0x6[ecx],0x0020
0065  66 89 41 04			mov		word ptr 0x4[ecx],ax
0069  8B 46 10				mov		eax,dword ptr 0x10[esi]
006C  66 0F B6 90 00 00 00 00		movzx		dx,byte ptr DGROUP:L$2[eax]
0074  66 89 51 08			mov		word ptr 0x8[ecx],dx
0078  66 0F B6 90 0C 00 00 00		movzx		dx,byte ptr DGROUP:L$3[eax]
0080  66 89 51 0A			mov		word ptr 0xa[ecx],dx
0084  66 0F B6 80 18 00 00 00		movzx		ax,byte ptr DGROUP:L$4[eax]
008C  66 C7 41 0E 20 00			mov		word ptr 0xe[ecx],0x0020
0092  89 CB				mov		ebx,ecx
0094  66 89 41 0C			mov		word ptr 0xc[ecx],ax
0098  BA 08 00 00 00			mov		edx,0x00000008
009D  8B 46 0C				mov		eax,dword ptr 0xc[esi]
00A0  E8 00 00 00 00			call		convDec_
00A5  0F B7 41 10			movzx		eax,word ptr 0x10[ecx]
00A9  83 F8 30				cmp		eax,0x00000030
00AC  75 06				jne		L$1
00AE  66 C7 41 10 20 00			mov		word ptr 0x10[ecx],0x0020
00B4				L$1:
00B4  BA 0B 00 00 00			mov		edx,0x0000000b
00B9  66 C7 41 14 20 00			mov		word ptr 0x14[ecx],0x0020
00BF  89 CB				mov		ebx,ecx
00C1  8B 46 08				mov		eax,dword ptr 0x8[esi]
00C4  E8 00 00 00 00			call		convDec_
00C9  BA 0E 00 00 00			mov		edx,0x0000000e
00CE  66 C7 41 1A 3A 00			mov		word ptr 0x1a[ecx],0x003a
00D4  89 CB				mov		ebx,ecx
00D6  8B 46 04				mov		eax,dword ptr 0x4[esi]
00D9  E8 00 00 00 00			call		convDec_
00DE  BA 11 00 00 00			mov		edx,0x00000011
00E3  66 C7 41 20 3A 00			mov		word ptr 0x20[ecx],0x003a
00E9  89 CB				mov		ebx,ecx
00EB  8B 06				mov		eax,dword ptr [esi]
00ED  E8 00 00 00 00			call		convDec_
00F2  66 C7 41 26 20 00			mov		word ptr 0x26[ecx],0x0020
00F8  BA 64 00 00 00			mov		edx,0x00000064
00FD  8B 46 14				mov		eax,dword ptr 0x14[esi]
0100  8D 75 F8				lea		esi,-0x8[ebp]
0103  89 CB				mov		ebx,ecx
0105  E8 00 00 00 00			call		div_
010A  8B 45 F8				mov		eax,dword ptr -0x8[ebp]
010D  BA 14 00 00 00			mov		edx,0x00000014
0112  83 C0 13				add		eax,0x00000013
0115  E8 00 00 00 00			call		convDec_
011A  BA 16 00 00 00			mov		edx,0x00000016
011F  8B 45 FC				mov		eax,dword ptr -0x4[ebp]
0122  89 CB				mov		ebx,ecx
0124  E8 00 00 00 00			call		convDec_
0129  66 C7 41 30 0A 00			mov		word ptr 0x30[ecx],0x000a
012F  89 C8				mov		eax,ecx
0131  66 C7 41 32 00 00			mov		word ptr 0x32[ecx],0x0000
0137  C9				leave		
0138  5E				pop		esi
0139  59				pop		ecx
013A  5B				pop		ebx
013B  C3				ret		

Routine Size: 266 bytes,    Routine Base: _TEXT + 0032

013C				_u_ctime_:
013C  53				push		ebx
013D  C8 24 00 00			enter		0x0024,0x00
0141  89 D3				mov		ebx,edx
0143  8D 55 DC				lea		edx,-0x24[ebp]
0146  E8 00 00 00 00			call		_localtime_
014B  89 DA				mov		edx,ebx
014D  E8 00 00 00 00			call		_u_asctime_
0152  C9				leave		
0153  5B				pop		ebx
0154  C3				ret		

Routine Size: 25 bytes,    Routine Base: _TEXT + 013C

0155				_uctime_:
0155  E8 00 00 00 00			call		localtime_

Routine Size: 5 bytes,    Routine Base: _TEXT + 0155

015A				_uasctime_:
015A  53				push		ebx
015B  52				push		edx
015C  89 C3				mov		ebx,eax
015E  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0164  8D 50 38				lea		edx,0x38[eax]
0167  89 D8				mov		eax,ebx
0169  E8 00 00 00 00			call		_u_asctime_
016E  5A				pop		edx
016F  5B				pop		ebx
0170  C3				ret		

Routine Size: 23 bytes,    Routine Base: _TEXT + 015A

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000039 bytes
0000				L$2:
0000  4A 46 4D 41 4D 4A 4A 41 53 4F 4E 44             JFMAMJJASOND
000C				L$3:
000C  61 65 61 70 61 75 75 75 65 63 6F 65             aeapauuuecoe
0018				L$4:
0018  6E 62 72 72 79 6E 6C 67 70 74 76 63             nbrrynlgptvc
0024				L$5:
0024  53 4D 54 57 54 46 53                            SMTWTFS
002B				L$6:
002B  75 6F 75 65 68 72 61                            uouehra
0032				L$7:
0032  6E 6E 65 64 75 69 74                            nneduit

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

