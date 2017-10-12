Module: fjstrspn
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000076 bytes
0000				_fjstrspn_:
0000  56				push		esi
0001  57				push		edi
0002  55				push		ebp
0003  83 EC 14				sub		esp,0x00000014
0006  89 D7				mov		edi,edx
0008  89 C5				mov		ebp,eax
000A  89 4C 24 0C			mov		dword ptr 0xc[esp],ecx
000E  89 1C 24				mov		dword ptr [esp],ebx
0011  31 D2				xor		edx,edx
0013  89 54 24 04			mov		dword ptr 0x4[esp],edx
0017  EB 34				jmp		L$4
0019				L$1:
0019  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
001D  8B 34 24				mov		esi,dword ptr [esp]
0020				L$2:
0020  8D 5C 24 10			lea		ebx,0x10[esp]
0024  8C D9				mov		ecx,ds
0026  89 F0				mov		eax,esi
0028  9A 00 00 00 00 00 00		call		_fjgetmoji_
002F  8B 5C 24 10			mov		ebx,dword ptr 0x10[esp]
0033  89 C6				mov		esi,eax
0035  66 85 DB				test		bx,bx
0038  74 07				je		L$3
003A  66 3B 5C 24 08			cmp		bx,word ptr 0x8[esp]
003F  75 DF				jne		L$2
0041				L$3:
0041  66 83 7C 24 10 00			cmp		word ptr 0x10[esp],0x0000
0047  74 22				je		L$5
0049  FF 44 24 04			inc		dword ptr 0x4[esp]
004D				L$4:
004D  8D 5C 24 08			lea		ebx,0x8[esp]
0051  8C D9				mov		ecx,ds
0053  89 FA				mov		edx,edi
0055  89 E8				mov		eax,ebp
0057  9A 00 00 00 00 00 00		call		_fjgetmoji_
005E  89 D7				mov		edi,edx
0060  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
0064  89 C5				mov		ebp,eax
0066  66 85 D2				test		dx,dx
0069  75 AE				jne		L$1
006B				L$5:
006B  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
006F  83 C4 14				add		esp,0x00000014
0072  5D				pop		ebp
0073  5F				pop		edi
0074  5E				pop		esi
0075  CB				retf		

Routine Size: 118 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

