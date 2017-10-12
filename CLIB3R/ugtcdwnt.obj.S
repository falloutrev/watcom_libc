Module: ugtcdwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000006F bytes
0000				_ugetcwd_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  81 EC 08 02 00 00			sub		esp,0x00000208
0009  89 C6				mov		esi,eax
000B  89 D3				mov		ebx,edx
000D  89 E0				mov		eax,esp
000F  50				push		eax
0010  68 04 01 00 00			push		0x00000104
0015  E8 00 00 00 00			call		_GetCurrentDirectoryW
001A  89 C2				mov		edx,eax
001C  85 C0				test		eax,eax
001E  75 07				jne		L$1
0020  E8 00 00 00 00			call		__set_errno_nt_
0025  EB 1E				jmp		L$3
0027				L$1:
0027  85 F6				test		esi,esi
0029  75 1E				jne		L$4
002B  01 C0				add		eax,eax
002D  83 C0 02				add		eax,0x00000002
0030  E8 00 00 00 00			call		malloc_
0035  89 C6				mov		esi,eax
0037  85 C0				test		eax,eax
0039  75 19				jne		L$5
003B  B8 05 00 00 00			mov		eax,0x00000005
0040				L$2:
0040  E8 00 00 00 00			call		__set_errno_
0045				L$3:
0045  31 C0				xor		eax,eax
0047  EB 1C				jmp		L$6
0049				L$4:
0049  39 D8				cmp		eax,ebx
004B  76 07				jbe		L$5
004D  B8 0E 00 00 00			mov		eax,0x0000000e
0052  EB EC				jmp		L$2
0054				L$5:
0054  8D 1C 12				lea		ebx,[edx+edx]
0057  89 F0				mov		eax,esi
0059  89 E2				mov		edx,esp
005B  83 C3 02				add		ebx,0x00000002
005E  E8 00 00 00 00			call		memcpy_
0063  89 F0				mov		eax,esi
0065				L$6:
0065  81 C4 08 02 00 00			add		esp,0x00000208
006B  5E				pop		esi
006C  59				pop		ecx
006D  5B				pop		ebx
006E  C3				ret		

Routine Size: 111 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

