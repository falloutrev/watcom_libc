Module: bprintf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000006F bytes
0000				buf_putc_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  89 D1				mov		ecx,edx
0005  8B 10				mov		edx,dword ptr [eax]
0007  8B 58 10				mov		ebx,dword ptr 0x10[eax]
000A  3B 5A 04				cmp		ebx,dword ptr 0x4[edx]
000D  73 0C				jae		L$1
000F  8B 1A				mov		ebx,dword ptr [edx]
0011  8D 73 01				lea		esi,0x1[ebx]
0014  89 32				mov		dword ptr [edx],esi
0016  88 0B				mov		byte ptr [ebx],cl
0018  FF 40 10				inc		dword ptr 0x10[eax]
001B				L$1:
001B  5E				pop		esi
001C  59				pop		ecx
001D  5B				pop		ebx
001E  C3				ret		

Routine Size: 31 bytes,    Routine Base: _TEXT + 0000

001F				_vbprintf_:
001F  56				push		esi
0020  83 EC 08				sub		esp,0x00000008
0023  89 C6				mov		esi,eax
0025  89 D0				mov		eax,edx
0027  89 DA				mov		edx,ebx
0029  89 CB				mov		ebx,ecx
002B  48				dec		eax
002C  B9 00 00 00 00			mov		ecx,offset buf_putc_
0031  89 44 24 04			mov		dword ptr 0x4[esp],eax
0035  89 E0				mov		eax,esp
0037  89 34 24				mov		dword ptr [esp],esi
003A  E8 00 00 00 00			call		__prtf_
003F  C6 04 06 00			mov		byte ptr [esi+eax],0x00
0043  83 C4 08				add		esp,0x00000008
0046  5E				pop		esi
0047  C3				ret		

Routine Size: 41 bytes,    Routine Base: _TEXT + 001F

0048				_bprintf_:
0048  53				push		ebx
0049  51				push		ecx
004A  52				push		edx
004B  83 EC 04				sub		esp,0x00000004
004E  8D 44 24 20			lea		eax,0x20[esp]
0052  89 E1				mov		ecx,esp
0054  8B 5C 24 1C			mov		ebx,dword ptr 0x1c[esp]
0058  8B 54 24 18			mov		edx,dword ptr 0x18[esp]
005C  89 04 24				mov		dword ptr [esp],eax
005F  8B 44 24 14			mov		eax,dword ptr 0x14[esp]
0063  E8 00 00 00 00			call		_vbprintf_
0068  83 C4 04				add		esp,0x00000004
006B  5A				pop		edx
006C  59				pop		ecx
006D  5B				pop		ebx
006E  C3				ret		

Routine Size: 39 bytes,    Routine Base: _TEXT + 0048

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

