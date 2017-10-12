Module: splpe
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002B bytes
0000				spawnlpe_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  8D 44 24 18			lea		eax,0x18[esp]
0007				L$1:
0007  8B 10				mov		edx,dword ptr [eax]
0009  83 C0 04				add		eax,0x00000004
000C  85 D2				test		edx,edx
000E  75 F7				jne		L$1
0010  83 C0 04				add		eax,0x00000004
0013  8D 5C 24 18			lea		ebx,0x18[esp]
0017  8B 54 24 14			mov		edx,dword ptr 0x14[esp]
001B  8B 48 FC				mov		ecx,dword ptr -0x4[eax]
001E  8B 44 24 10			mov		eax,dword ptr 0x10[esp]
0022  E8 00 00 00 00			call		spawnvpe_
0027  5A				pop		edx
0028  59				pop		ecx
0029  5B				pop		ebx
002A  C3				ret		

Routine Size: 43 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

