Module: splp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000016 bytes
0000				spawnlp_:
0000  53				push		ebx
0001  52				push		edx
0002  8D 5C 24 14			lea		ebx,0x14[esp]
0006  8B 54 24 10			mov		edx,dword ptr 0x10[esp]
000A  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
000E  E8 00 00 00 00			call		spawnvp_
0013  5A				pop		edx
0014  5B				pop		ebx
0015  C3				ret		

Routine Size: 22 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

