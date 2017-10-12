Module: ustrncpy
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002E bytes
0000				_ustrncpy_:
0000  51				push		ecx
0001  56				push		esi
0002  89 C1				mov		ecx,eax
0004  EB 11				jmp		L$2
0006				L$1:
0006  66 83 3A 00			cmp		word ptr [edx],0x0000
000A  74 0F				je		L$3
000C  4B				dec		ebx
000D  66 8B 32				mov		si,word ptr [edx]
0010  42				inc		edx
0011  42				inc		edx
0012  66 89 30				mov		word ptr [eax],si
0015  40				inc		eax
0016  40				inc		eax
0017				L$2:
0017  85 DB				test		ebx,ebx
0019  75 EB				jne		L$1
001B				L$3:
001B  85 DB				test		ebx,ebx
001D  74 0A				je		L$4
001F  4B				dec		ebx
0020  66 C7 00 00 00			mov		word ptr [eax],0x0000
0025  40				inc		eax
0026  40				inc		eax
0027  EB F2				jmp		L$3
0029				L$4:
0029  89 C8				mov		eax,ecx
002B  5E				pop		esi
002C  59				pop		ecx
002D  C3				ret		

Routine Size: 46 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

