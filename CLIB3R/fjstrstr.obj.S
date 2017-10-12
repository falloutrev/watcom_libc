Module: fjstrstr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000010E bytes
0000				_fjstrstr_:
0000  56				push		esi
0001  57				push		edi
0002  55				push		ebp
0003  83 EC 1C				sub		esp,0x0000001c
0006  89 D7				mov		edi,edx
0008  89 C6				mov		esi,eax
000A  89 4C 24 10			mov		dword ptr 0x10[esp],ecx
000E  89 5C 24 04			mov		dword ptr 0x4[esp],ebx
0012  8D 5C 24 08			lea		ebx,0x8[esp]
0016  8B 54 24 10			mov		edx,dword ptr 0x10[esp]
001A  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
001E  8C D9				mov		ecx,ds
0020  9A 00 00 00 00 00 00		call		_fjgetmoji_
0027  89 54 24 18			mov		dword ptr 0x18[esp],edx
002B  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
002F  89 C5				mov		ebp,eax
0031  66 85 D2				test		dx,dx
0034  75 09				jne		L$1
0036  89 FA				mov		edx,edi
0038  89 F3				mov		ebx,esi
003A  E9 C6 00 00 00			jmp		L$6
003F				L$1:
003F  8D 5C 24 0C			lea		ebx,0xc[esp]
0043  89 7C 24 14			mov		dword ptr 0x14[esp],edi
0047  8C D9				mov		ecx,ds
0049  89 FA				mov		edx,edi
004B  89 F0				mov		eax,esi
004D  89 34 24				mov		dword ptr [esp],esi
0050  9A 00 00 00 00 00 00		call		_fjgetmoji_
0057  8B 5C 24 0C			mov		ebx,dword ptr 0xc[esp]
005B  89 C6				mov		esi,eax
005D  89 D7				mov		edi,edx
005F  66 85 DB				test		bx,bx
0062  75 09				jne		L$3
0064  31 D2				xor		edx,edx
0066				L$2:
0066  31 DB				xor		ebx,ebx
0068  E9 98 00 00 00			jmp		L$6
006D				L$3:
006D  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
0071  66 3B 44 24 08			cmp		ax,word ptr 0x8[esp]
0076  75 C7				jne		L$1
0078				L$4:
0078  8D 5C 24 0C			lea		ebx,0xc[esp]
007C  8C D9				mov		ecx,ds
007E  89 FA				mov		edx,edi
0080  89 F0				mov		eax,esi
0082  9A 00 00 00 00 00 00		call		_fjgetmoji_
0089  8D 5C 24 08			lea		ebx,0x8[esp]
008D  89 C6				mov		esi,eax
008F  89 D7				mov		edi,edx
0091  8C D9				mov		ecx,ds
0093  8B 54 24 18			mov		edx,dword ptr 0x18[esp]
0097  89 E8				mov		eax,ebp
0099  9A 00 00 00 00 00 00		call		_fjgetmoji_
00A0  89 C5				mov		ebp,eax
00A2  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
00A6  89 54 24 18			mov		dword ptr 0x18[esp],edx
00AA  66 85 C0				test		ax,ax
00AD  75 09				jne		L$5
00AF  8B 54 24 14			mov		edx,dword ptr 0x14[esp]
00B3  8B 1C 24				mov		ebx,dword ptr [esp]
00B6  EB 4D				jmp		L$6
00B8				L$5:
00B8  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
00BC  66 85 D2				test		dx,dx
00BF  74 A5				je		L$2
00C1  66 39 D0				cmp		ax,dx
00C4  74 B2				je		L$4
00C6  8B 14 24				mov		edx,dword ptr [esp]
00C9  8D 5C 24 0C			lea		ebx,0xc[esp]
00CD  42				inc		edx
00CE  8C D9				mov		ecx,ds
00D0  89 14 24				mov		dword ptr [esp],edx
00D3  8B 54 24 14			mov		edx,dword ptr 0x14[esp]
00D7  8B 04 24				mov		eax,dword ptr [esp]
00DA  9A 00 00 00 00 00 00		call		_fjgetmoji_
00E1  8D 5C 24 08			lea		ebx,0x8[esp]
00E5  89 C6				mov		esi,eax
00E7  89 D7				mov		edi,edx
00E9  8C D9				mov		ecx,ds
00EB  8B 54 24 10			mov		edx,dword ptr 0x10[esp]
00EF  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
00F3  9A 00 00 00 00 00 00		call		_fjgetmoji_
00FA  89 C5				mov		ebp,eax
00FC  89 54 24 18			mov		dword ptr 0x18[esp],edx
0100  E9 68 FF FF FF			jmp		L$3
0105				L$6:
0105  89 D8				mov		eax,ebx
0107  83 C4 1C				add		esp,0x0000001c
010A  5D				pop		ebp
010B  5F				pop		edi
010C  5E				pop		esi
010D  CB				retf		

Routine Size: 270 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

