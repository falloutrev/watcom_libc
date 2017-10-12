Module: crtnwwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000008B bytes
0000				_dos_creatnew_:
0000  51				push		ecx
0001  56				push		esi
0002  83 EC 0C				sub		esp,0x0000000c
0005  89 C1				mov		ecx,eax
0007  89 54 24 08			mov		dword ptr 0x8[esp],edx
000B  89 DE				mov		esi,ebx
000D  E8 00 00 00 00			call		__NTAtMaxFiles_
0012  85 C0				test		eax,eax
0014  74 11				je		L$1
0016  B8 0B 00 00 00			mov		eax,0x0000000b
001B  E8 00 00 00 00			call		__set_errno_dos_
0020  B8 FF FF FF FF			mov		eax,0xffffffff
0025  EB 5E				jmp		L$4
0027				L$1:
0027  89 E3				mov		ebx,esp
0029  8D 54 24 04			lea		edx,0x4[esp]
002D  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
0031  E8 00 00 00 00			call		__GetNTCreateAttr_
0036  6A 00				push		0x00000000
0038  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
003C  52				push		edx
003D  6A 01				push		0x00000001
003F  6A 00				push		0x00000000
0041  6A 00				push		0x00000000
0043  8B 5C 24 18			mov		ebx,dword ptr 0x18[esp]
0047  53				push		ebx
0048  51				push		ecx
0049  E8 00 00 00 00			call		_CreateFileA
004E  83 F8 FF				cmp		eax,0xffffffff
0051  75 0C				jne		L$2
0053  E8 00 00 00 00			call		__set_errno_nt_
0058  E8 00 00 00 00			call		_GetLastError
005D  EB 26				jmp		L$4
005F				L$2:
005F  FF 15 00 00 00 00			call		dword ptr __InitAccessH
0065  89 C3				mov		ebx,eax
0067  89 06				mov		dword ptr [esi],eax
0069  8A 64 24 08			mov		ah,byte ptr 0x8[esp]
006D  BA 01 00 00 00			mov		edx,0x00000001
0072  F6 C4 01				test		ah,0x01
0075  75 05				jne		L$3
0077  BA 03 00 00 00			mov		edx,0x00000003
007C				L$3:
007C  89 D8				mov		eax,ebx
007E  E8 00 00 00 00			call		__SetIOMode_
0083  31 C0				xor		eax,eax
0085				L$4:
0085  83 C4 0C				add		esp,0x0000000c
0088  5E				pop		esi
0089  59				pop		ecx
008A  C3				ret		

Routine Size: 139 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

