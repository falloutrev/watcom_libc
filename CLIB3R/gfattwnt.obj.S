Module: gfattwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000037 bytes
0000				_dos_getfileattr_:
0000  53				push		ebx
0001  51				push		ecx
0002  81 EC 40 01 00 00			sub		esp,0x00000140
0008  89 D3				mov		ebx,edx
000A  89 E2				mov		edx,esp
000C  52				push		edx
000D  50				push		eax
000E  E8 00 00 00 00			call		_FindFirstFileA
0013  89 C2				mov		edx,eax
0015  83 F8 FF				cmp		eax,0xffffffff
0018  75 07				jne		L$1
001A  E8 00 00 00 00			call		__set_errno_nt_
001F  EB 0D				jmp		L$2
0021				L$1:
0021  8B 04 24				mov		eax,dword ptr [esp]
0024  52				push		edx
0025  89 03				mov		dword ptr [ebx],eax
0027  E8 00 00 00 00			call		_FindClose
002C  31 C0				xor		eax,eax
002E				L$2:
002E  81 C4 40 01 00 00			add		esp,0x00000140
0034  59				pop		ecx
0035  5B				pop		ebx
0036  C3				ret		

Routine Size: 55 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

