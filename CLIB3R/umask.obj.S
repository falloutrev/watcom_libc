Module: umask
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000016 bytes
0000				umask_:
0000  52				push		edx
0001  89 C2				mov		edx,eax
0003  81 E2 80 01 00 00			and		edx,0x00000180
0009  A1 00 00 00 00			mov		eax,dword ptr ___umaskval
000E  89 15 00 00 00 00			mov		dword ptr ___umaskval,edx
0014  5A				pop		edx
0015  C3				ret		

Routine Size: 22 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

