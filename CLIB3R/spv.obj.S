Module: spv
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000000E bytes
0000				spawnv_:
0000  51				push		ecx
0001  8B 0D 00 00 00 00			mov		ecx,dword ptr _environ
0007  E8 00 00 00 00			call		spawnve_
000C  59				pop		ecx
000D  C3				ret		

Routine Size: 14 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

