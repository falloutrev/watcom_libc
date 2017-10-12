Module: btom
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000030 bytes
0000				btom_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  83 EC 04				sub		esp,0x00000004
0006  89 C3				mov		ebx,eax
0008  31 C9				xor		ecx,ecx
000A  8D 34 10				lea		esi,[eax+edx]
000D				L$1:
000D  89 E2				mov		edx,esp
000F  89 D8				mov		eax,ebx
0011  E8 00 00 00 00			call		jgetmoji_
0016  8B 14 24				mov		edx,dword ptr [esp]
0019  89 C3				mov		ebx,eax
001B  66 85 D2				test		dx,dx
001E  74 07				je		L$2
0020  39 F0				cmp		eax,esi
0022  77 03				ja		L$2
0024  41				inc		ecx
0025  EB E6				jmp		L$1
0027				L$2:
0027  89 C8				mov		eax,ecx
0029  83 C4 04				add		esp,0x00000004
002C  5E				pop		esi
002D  59				pop		ecx
002E  5B				pop		ebx
002F  C3				ret		

Routine Size: 48 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

