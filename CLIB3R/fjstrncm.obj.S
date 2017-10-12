Module: fjstrncm
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000007A bytes
0000				_fjstrncmp_:
0000  56				push		esi
0001  57				push		edi
0002  55				push		ebp
0003  83 EC 10				sub		esp,0x00000010
0006  8B 6C 24 24			mov		ebp,dword ptr 0x24[esp]
000A  89 54 24 0C			mov		dword ptr 0xc[esp],edx
000E  89 C6				mov		esi,eax
0010  89 4C 24 08			mov		dword ptr 0x8[esp],ecx
0014  89 DF				mov		edi,ebx
0016				L$1:
0016  4D				dec		ebp
0017  83 FD FF				cmp		ebp,0xffffffff
001A  74 53				je		L$4
001C  89 E3				mov		ebx,esp
001E  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
0022  8C D9				mov		ecx,ds
0024  89 F0				mov		eax,esi
0026  9A 00 00 00 00 00 00		call		_fjgetmoji_
002D  8D 5C 24 04			lea		ebx,0x4[esp]
0031  89 C6				mov		esi,eax
0033  89 54 24 0C			mov		dword ptr 0xc[esp],edx
0037  8C D9				mov		ecx,ds
0039  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
003D  89 F8				mov		eax,edi
003F  9A 00 00 00 00 00 00		call		_fjgetmoji_
0046  89 C7				mov		edi,eax
0048  89 54 24 08			mov		dword ptr 0x8[esp],edx
004C  8B 04 24				mov		eax,dword ptr [esp]
004F  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0053  66 39 D0				cmp		ax,dx
0056  74 10				je		L$3
0058  73 07				jae		L$2
005A  B8 FF FF FF FF			mov		eax,0xffffffff
005F  EB 10				jmp		L$5
0061				L$2:
0061  B8 01 00 00 00			mov		eax,0x00000001
0066  EB 09				jmp		L$5
0068				L$3:
0068  66 83 3C 24 00			cmp		word ptr [esp],0x0000
006D  75 A7				jne		L$1
006F				L$4:
006F  31 C0				xor		eax,eax
0071				L$5:
0071  83 C4 10				add		esp,0x00000010
0074  5D				pop		ebp
0075  5F				pop		edi
0076  5E				pop		esi
0077  CA 04 00				retf		0x0004

Routine Size: 122 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

