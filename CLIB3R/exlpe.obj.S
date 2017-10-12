Module: exlpe
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000025 bytes
0000				execlpe_:
0000  53				push		ebx
0001  52				push		edx
0002  8D 44 24 10			lea		eax,0x10[esp]
0006				L$1:
0006  8B 10				mov		edx,dword ptr [eax]
0008  83 C0 04				add		eax,0x00000004
000B  85 D2				test		edx,edx
000D  75 F7				jne		L$1
000F  83 C0 04				add		eax,0x00000004
0012  8D 54 24 10			lea		edx,0x10[esp]
0016  8B 58 FC				mov		ebx,dword ptr -0x4[eax]
0019  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
001D  E8 00 00 00 00			call		execvpe_
0022  5A				pop		edx
0023  5B				pop		ebx
0024  C3				ret		

Routine Size: 37 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

