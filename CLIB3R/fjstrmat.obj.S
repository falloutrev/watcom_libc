Module: fjstrmat
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000074 bytes
0000				_fjstrmatch_:
0000  56				push		esi
0001  57				push		edi
0002  55				push		ebp
0003  83 EC 18				sub		esp,0x00000018
0006  89 D7				mov		edi,edx
0008  89 C5				mov		ebp,eax
000A  89 4C 24 0C			mov		dword ptr 0xc[esp],ecx
000E  89 1C 24				mov		dword ptr [esp],ebx
0011  EB 29				jmp		L$3
0013				L$1:
0013  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
0017  8B 34 24				mov		esi,dword ptr [esp]
001A				L$2:
001A  8D 5C 24 08			lea		ebx,0x8[esp]
001E  8C D9				mov		ecx,ds
0020  89 F0				mov		eax,esi
0022  9A 00 00 00 00 00 00		call		_fjgetmoji_
0029  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
002D  89 C6				mov		esi,eax
002F  66 85 DB				test		bx,bx
0032  75 33				jne		L$5
0034  8B 7C 24 10			mov		edi,dword ptr 0x10[esp]
0038  8B 6C 24 04			mov		ebp,dword ptr 0x4[esp]
003C				L$3:
003C  8D 5C 24 14			lea		ebx,0x14[esp]
0040  8C D9				mov		ecx,ds
0042  89 FA				mov		edx,edi
0044  89 E8				mov		eax,ebp
0046  9A 00 00 00 00 00 00		call		_fjgetmoji_
004D  89 54 24 10			mov		dword ptr 0x10[esp],edx
0051  8B 54 24 14			mov		edx,dword ptr 0x14[esp]
0055  89 44 24 04			mov		dword ptr 0x4[esp],eax
0059  66 85 D2				test		dx,dx
005C  75 B5				jne		L$1
005E  31 C0				xor		eax,eax
0060				L$4:
0060  83 C4 18				add		esp,0x00000018
0063  5D				pop		ebp
0064  5F				pop		edi
0065  5E				pop		esi
0066  CB				retf		
0067				L$5:
0067  66 3B 5C 24 14			cmp		bx,word ptr 0x14[esp]
006C  75 AC				jne		L$2
006E  89 FA				mov		edx,edi
0070  89 E8				mov		eax,ebp
0072  EB EC				jmp		L$4

Routine Size: 116 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

