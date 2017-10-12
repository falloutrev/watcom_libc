Module: getw
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002E bytes
0000				_getw_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  83 EC 04				sub		esp,0x00000004
0006  BB 01 00 00 00			mov		ebx,0x00000001
000B  BA 04 00 00 00			mov		edx,0x00000004
0010  89 C1				mov		ecx,eax
0012  89 E0				mov		eax,esp
0014  E8 00 00 00 00			call		fread_
0019  85 C0				test		eax,eax
001B  76 05				jbe		L$1
001D  8B 04 24				mov		eax,dword ptr [esp]
0020  EB 05				jmp		L$2
0022				L$1:
0022  B8 FF FF FF FF			mov		eax,0xffffffff
0027				L$2:
0027  83 C4 04				add		esp,0x00000004
002A  5A				pop		edx
002B  59				pop		ecx
002C  5B				pop		ebx
002D  C3				ret		

Routine Size: 46 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

