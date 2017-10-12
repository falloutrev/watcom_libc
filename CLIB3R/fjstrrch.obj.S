Module: fjstrrch
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000004F bytes
0000				_fjstrrchr_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 0C				sub		esp,0x0000000c
0007  89 D6				mov		esi,edx
0009  89 C7				mov		edi,eax
000B  89 5C 24 08			mov		dword ptr 0x8[esp],ebx
000F  31 D2				xor		edx,edx
0011  31 ED				xor		ebp,ebp
0013  89 54 24 04			mov		dword ptr 0x4[esp],edx
0017				L$1:
0017  89 E3				mov		ebx,esp
0019  8C D9				mov		ecx,ds
001B  89 F2				mov		edx,esi
001D  89 F8				mov		eax,edi
001F  9A 00 00 00 00 00 00		call		_fjgetmoji_
0026  8B 1C 24				mov		ebx,dword ptr [esp]
0029  66 85 DB				test		bx,bx
002C  74 13				je		L$3
002E  66 3B 5C 24 08			cmp		bx,word ptr 0x8[esp]
0033  75 06				jne		L$2
0035  89 74 24 04			mov		dword ptr 0x4[esp],esi
0039  89 FD				mov		ebp,edi
003B				L$2:
003B  89 D6				mov		esi,edx
003D  89 C7				mov		edi,eax
003F  EB D6				jmp		L$1
0041				L$3:
0041  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0045  89 E8				mov		eax,ebp
0047  83 C4 0C				add		esp,0x0000000c
004A  5D				pop		ebp
004B  5F				pop		edi
004C  5E				pop		esi
004D  59				pop		ecx
004E  CB				retf		

Routine Size: 79 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

