Module: fjstrcsp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000006A bytes
0000				_fjstrcspn_:
0000  56				push		esi
0001  57				push		edi
0002  55				push		ebp
0003  83 EC 10				sub		esp,0x00000010
0006  52				push		edx
0007  89 C7				mov		edi,eax
0009  89 4C 24 10			mov		dword ptr 0x10[esp],ecx
000D  89 5C 24 04			mov		dword ptr 0x4[esp],ebx
0011  31 ED				xor		ebp,ebp
0013  EB 2C				jmp		L$4
0015				L$1:
0015  8B 54 24 10			mov		edx,dword ptr 0x10[esp]
0019  8B 74 24 04			mov		esi,dword ptr 0x4[esp]
001D  EB 07				jmp		L$3
001F				L$2:
001F  66 3B 5C 24 08			cmp		bx,word ptr 0x8[esp]
0024  74 3B				je		L$5
0026				L$3:
0026  8D 5C 24 0C			lea		ebx,0xc[esp]
002A  8C D9				mov		ecx,ds
002C  89 F0				mov		eax,esi
002E  9A 00 00 00 00 00 00		call		_fjgetmoji_
0035  8B 5C 24 0C			mov		ebx,dword ptr 0xc[esp]
0039  89 C6				mov		esi,eax
003B  66 85 DB				test		bx,bx
003E  75 DF				jne		L$2
0040  45				inc		ebp
0041				L$4:
0041  8D 5C 24 08			lea		ebx,0x8[esp]
0045  8B 14 24				mov		edx,dword ptr [esp]
0048  8C D9				mov		ecx,ds
004A  89 F8				mov		eax,edi
004C  9A 00 00 00 00 00 00		call		_fjgetmoji_
0053  89 14 24				mov		dword ptr [esp],edx
0056  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
005A  89 C7				mov		edi,eax
005C  66 85 D2				test		dx,dx
005F  75 B4				jne		L$1
0061				L$5:
0061  89 E8				mov		eax,ebp
0063  83 C4 14				add		esp,0x00000014
0066  5D				pop		ebp
0067  5F				pop		edi
0068  5E				pop		esi
0069  CB				retf		

Routine Size: 106 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

