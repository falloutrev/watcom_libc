Module: fjstrski
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000074 bytes
0000				_fjstrskip_:
0000  56				push		esi
0001  57				push		edi
0002  55				push		ebp
0003  83 EC 18				sub		esp,0x00000018
0006  89 D7				mov		edi,edx
0008  89 C5				mov		ebp,eax
000A  89 4C 24 0C			mov		dword ptr 0xc[esp],ecx
000E  89 1C 24				mov		dword ptr [esp],ebx
0011  EB 36				jmp		L$4
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
002F  66 3B 5C 24 14			cmp		bx,word ptr 0x14[esp]
0034  74 0B				je		L$3
0036  66 85 DB				test		bx,bx
0039  75 DF				jne		L$2
003B  89 FA				mov		edx,edi
003D  89 E8				mov		eax,ebp
003F  EB 2C				jmp		L$5
0041				L$3:
0041  8B 7C 24 10			mov		edi,dword ptr 0x10[esp]
0045  8B 6C 24 04			mov		ebp,dword ptr 0x4[esp]
0049				L$4:
0049  8D 5C 24 14			lea		ebx,0x14[esp]
004D  8C D9				mov		ecx,ds
004F  89 FA				mov		edx,edi
0051  89 E8				mov		eax,ebp
0053  9A 00 00 00 00 00 00		call		_fjgetmoji_
005A  89 54 24 10			mov		dword ptr 0x10[esp],edx
005E  8B 54 24 14			mov		edx,dword ptr 0x14[esp]
0062  89 44 24 04			mov		dword ptr 0x4[esp],eax
0066  66 85 D2				test		dx,dx
0069  75 A8				jne		L$1
006B  31 C0				xor		eax,eax
006D				L$5:
006D  83 C4 18				add		esp,0x00000018
0070  5D				pop		ebp
0071  5F				pop		edi
0072  5E				pop		esi
0073  CB				retf		

Routine Size: 116 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

