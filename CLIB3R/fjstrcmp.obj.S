Module: fjstrcmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000006B bytes
0000				_fjstrcmp_:
0000  56				push		esi
0001  57				push		edi
0002  83 EC 0C				sub		esp,0x0000000c
0005  52				push		edx
0006  89 C6				mov		esi,eax
0008  89 4C 24 0C			mov		dword ptr 0xc[esp],ecx
000C  89 DF				mov		edi,ebx
000E				L$1:
000E  8D 5C 24 08			lea		ebx,0x8[esp]
0012  8B 14 24				mov		edx,dword ptr [esp]
0015  8C D9				mov		ecx,ds
0017  89 F0				mov		eax,esi
0019  9A 00 00 00 00 00 00		call		_fjgetmoji_
0020  8D 5C 24 04			lea		ebx,0x4[esp]
0024  89 C6				mov		esi,eax
0026  89 14 24				mov		dword ptr [esp],edx
0029  8C D9				mov		ecx,ds
002B  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
002F  89 F8				mov		eax,edi
0031  9A 00 00 00 00 00 00		call		_fjgetmoji_
0038  89 C7				mov		edi,eax
003A  89 54 24 0C			mov		dword ptr 0xc[esp],edx
003E  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
0042  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0046  66 39 D0				cmp		ax,dx
0049  74 10				je		L$3
004B  73 07				jae		L$2
004D  B8 FF FF FF FF			mov		eax,0xffffffff
0052  EB 11				jmp		L$4
0054				L$2:
0054  B8 01 00 00 00			mov		eax,0x00000001
0059  EB 0A				jmp		L$4
005B				L$3:
005B  66 83 7C 24 08 00			cmp		word ptr 0x8[esp],0x0000
0061  75 AB				jne		L$1
0063  31 C0				xor		eax,eax
0065				L$4:
0065  83 C4 10				add		esp,0x00000010
0068  5F				pop		edi
0069  5E				pop		esi
006A  CB				retf		

Routine Size: 107 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

