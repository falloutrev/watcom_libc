Module: creatwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000086 bytes
0000				_dos_creat_:
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
001B  E8 00 00 00 00			call		__set_errno_
0020  B8 FF FF FF FF			mov		eax,0xffffffff
0025  EB 59				jmp		L$4
0027				L$1:
0027  89 E3				mov		ebx,esp
0029  8D 54 24 04			lea		edx,0x4[esp]
002D  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
0031  E8 00 00 00 00			call		__GetNTCreateAttr_
0036  6A 00				push		0x00000000
0038  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
003C  52				push		edx
003D  6A 02				push		0x00000002
003F  6A 00				push		0x00000000
0041  6A 00				push		0x00000000
0043  8B 5C 24 18			mov		ebx,dword ptr 0x18[esp]
0047  53				push		ebx
0048  51				push		ecx
0049  E8 00 00 00 00			call		_CreateFileA
004E  83 F8 FF				cmp		eax,0xffffffff
0051  75 07				jne		L$2
0053  E8 00 00 00 00			call		__set_errno_nt_
0058  EB 26				jmp		L$4
005A				L$2:
005A  FF 15 00 00 00 00			call		dword ptr __InitAccessH
0060  89 C3				mov		ebx,eax
0062  89 06				mov		dword ptr [esi],eax
0064  8A 64 24 08			mov		ah,byte ptr 0x8[esp]
0068  BA 01 00 00 00			mov		edx,0x00000001
006D  F6 C4 01				test		ah,0x01
0070  75 05				jne		L$3
0072  BA 03 00 00 00			mov		edx,0x00000003
0077				L$3:
0077  89 D8				mov		eax,ebx
0079  E8 00 00 00 00			call		__SetIOMode_
007E  31 C0				xor		eax,eax
0080				L$4:
0080  83 C4 0C				add		esp,0x0000000c
0083  5E				pop		esi
0084  59				pop		ecx
0085  C3				ret		

Routine Size: 134 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

