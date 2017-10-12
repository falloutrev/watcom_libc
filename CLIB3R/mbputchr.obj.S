Module: mbputchr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000044 bytes
0000				_mbputchar_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  83 EC 04				sub		esp,0x00000004
0006  89 C3				mov		ebx,eax
0008  8B 35 00 00 00 00			mov		esi,dword ptr ___IsDBCS
000E  8D 48 01				lea		ecx,0x1[eax]
0011  85 F6				test		esi,esi
0013  74 1F				je		L$2
0015  89 D0				mov		eax,edx
0017  E8 00 00 00 00			call		_ismbclegal_
001C  85 C0				test		eax,eax
001E  74 0F				je		L$1
0020  89 D0				mov		eax,edx
0022  C1 E8 08				shr		eax,0x08
0025  89 04 24				mov		dword ptr [esp],eax
0028  8A 04 24				mov		al,byte ptr [esp]
002B  88 03				mov		byte ptr [ebx],al
002D  89 CB				mov		ebx,ecx
002F				L$1:
002F  88 13				mov		byte ptr [ebx],dl
0031  43				inc		ebx
0032  EB 04				jmp		L$3
0034				L$2:
0034  89 CB				mov		ebx,ecx
0036  88 10				mov		byte ptr [eax],dl
0038				L$3:
0038  89 D8				mov		eax,ebx
003A  C6 03 00				mov		byte ptr [ebx],0x00
003D  83 C4 04				add		esp,0x00000004
0040  5E				pop		esi
0041  59				pop		ecx
0042  5B				pop		ebx
0043  C3				ret		

Routine Size: 68 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

