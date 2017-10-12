Module: gftimwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000060 bytes
0000				_dos_getftime_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  83 EC 18				sub		esp,0x00000018
0006  89 C6				mov		esi,eax
0008  89 D7				mov		edi,edx
000A  89 C2				mov		edx,eax
000C  A1 00 00 00 00			mov		eax,dword ptr ___FileHandleIDs
0011  8B 14 90				mov		edx,dword ptr [eax+edx*4]
0014  89 F0				mov		eax,esi
0016  FF 15 00 00 00 00			call		dword ptr __AccessFileH
001C  8D 44 24 08			lea		eax,0x8[esp]
0020  50				push		eax
0021  8D 44 24 04			lea		eax,0x4[esp]
0025  50				push		eax
0026  8D 44 24 18			lea		eax,0x18[esp]
002A  50				push		eax
002B  52				push		edx
002C  E8 00 00 00 00			call		_GetFileTime
0031  85 C0				test		eax,eax
0033  75 0F				jne		L$1
0035  89 F0				mov		eax,esi
0037  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
003D  E8 00 00 00 00			call		__set_errno_nt_
0042  EB 15				jmp		L$2
0044				L$1:
0044  89 F0				mov		eax,esi
0046  89 FA				mov		edx,edi
0048  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
004E  8D 44 24 08			lea		eax,0x8[esp]
0052  E8 00 00 00 00			call		__MakeDOSDT_
0057  31 C0				xor		eax,eax
0059				L$2:
0059  83 C4 18				add		esp,0x00000018
005C  5F				pop		edi
005D  5E				pop		esi
005E  59				pop		ecx
005F  C3				ret		

Routine Size: 96 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

