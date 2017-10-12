Module: dospnwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000013E bytes
0000				__dospawn:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  57				push		edi
0005  55				push		ebp
0006  83 EC 58				sub		esp,0x00000058
0009  8B 5C 24 7C			mov		ebx,dword ptr 0x7c[esp]
000D  8B 94 24 84 00 00 00		mov		edx,dword ptr 0x84[esp]
0014  8B 44 24 78			mov		eax,dword ptr 0x78[esp]
0018  31 C9				xor		ecx,ecx
001A  E8 00 00 00 00			call		__ccmdline_
001F  BB 44 00 00 00			mov		ebx,0x00000044
0024  89 E0				mov		eax,esp
0026  31 D2				xor		edx,edx
0028  E8 00 00 00 00			call		memset_
002D  8D 44 24 44			lea		eax,0x44[esp]
0031  50				push		eax
0032  8D 44 24 04			lea		eax,0x4[esp]
0036  50				push		eax
0037  BA 01 00 00 00			mov		edx,0x00000001
003C  6A 00				push		0x00000000
003E  66 89 54 24 3C			mov		word ptr 0x3c[esp],dx
0043  8B 94 24 8C 00 00 00		mov		edx,dword ptr 0x8c[esp]
004A  52				push		edx
004B  6A 00				push		0x00000000
004D  6A 01				push		0x00000001
004F  6A 00				push		0x00000000
0051  6A 00				push		0x00000000
0053  8B 9C 24 9C 00 00 00		mov		ebx,dword ptr 0x9c[esp]
005A  53				push		ebx
005B  6A 00				push		0x00000000
005D  E8 00 00 00 00			call		_CreateProcessA
0062  85 C0				test		eax,eax
0064  75 2B				jne		L$3
0066  E8 00 00 00 00			call		_GetLastError
006B  89 C2				mov		edx,eax
006D  83 F8 05				cmp		eax,0x00000005
0070  74 0E				je		L$1
0072  3D C1 00 00 00			cmp		eax,0x000000c1
0077  74 07				je		L$1
0079  3D A1 00 00 00			cmp		eax,0x000000a1
007E  75 05				jne		L$2
0080				L$1:
0080  BA 02 00 00 00			mov		edx,0x00000002
0085				L$2:
0085  89 D0				mov		eax,edx
0087  E8 00 00 00 00			call		__set_errno_dos_
008C  E9 A3 00 00 00			jmp		L$10
0091				L$3:
0091  83 7C 24 74 00			cmp		dword ptr 0x74[esp],0x00000000
0096  0F 85 78 00 00 00			jne		L$7
009C  66 A1 00 00 00 00			mov		ax,word ptr __osbuild
00A2  30 C0				xor		al,al
00A4  80 E4 80				and		ah,0x80
00A7  25 FF FF 00 00			and		eax,0x0000ffff
00AC  74 3E				je		L$5
00AE  68 E8 03 00 00			push		0x000003e8
00B3  BD 03 01 00 00			mov		ebp,0x00000103
00B8  E8 00 00 00 00			call		_Sleep
00BD  89 6C 24 54			mov		dword ptr 0x54[esp],ebp
00C1				L$4:
00C1  81 7C 24 54 03 01 00 00		cmp		dword ptr 0x54[esp],0x00000103
00C9  75 51				jne		L$9
00CB  6A 64				push		0x00000064
00CD  E8 00 00 00 00			call		_Sleep
00D2  8D 44 24 54			lea		eax,0x54[esp]
00D6  50				push		eax
00D7  8B 54 24 48			mov		edx,dword ptr 0x48[esp]
00DB  52				push		edx
00DC  E8 00 00 00 00			call		_GetExitCodeProcess
00E1  85 C0				test		eax,eax
00E3  75 DC				jne		L$4
00E5  E8 00 00 00 00			call		__set_errno_nt_
00EA  EB 48				jmp		L$10
00EC				L$5:
00EC  6A FF				push		0xffffffff
00EE  8B 74 24 48			mov		esi,dword ptr 0x48[esp]
00F2  56				push		esi
00F3  E8 00 00 00 00			call		_WaitForSingleObject
00F8  85 C0				test		eax,eax
00FA  75 11				jne		L$6
00FC  8D 44 24 54			lea		eax,0x54[esp]
0100  50				push		eax
0101  8B 7C 24 48			mov		edi,dword ptr 0x48[esp]
0105  57				push		edi
0106  E8 00 00 00 00			call		_GetExitCodeProcess
010B  EB 0F				jmp		L$9
010D				L$6:
010D  E8 00 00 00 00			call		__set_errno_nt_
0112  EB 04				jmp		L$8
0114				L$7:
0114  8B 44 24 4C			mov		eax,dword ptr 0x4c[esp]
0118				L$8:
0118  89 44 24 54			mov		dword ptr 0x54[esp],eax
011C				L$9:
011C  8B 5C 24 44			mov		ebx,dword ptr 0x44[esp]
0120  53				push		ebx
0121  E8 00 00 00 00			call		_CloseHandle
0126  8B 4C 24 48			mov		ecx,dword ptr 0x48[esp]
012A  51				push		ecx
012B  E8 00 00 00 00			call		_CloseHandle
0130  8B 44 24 54			mov		eax,dword ptr 0x54[esp]
0134				L$10:
0134  83 C4 58				add		esp,0x00000058
0137  5D				pop		ebp
0138  5F				pop		edi
0139  5E				pop		esi
013A  5A				pop		edx
013B  59				pop		ecx
013C  5B				pop		ebx
013D  C3				ret		

Routine Size: 318 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

