Module: spl
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001E bytes
0000				spawnl_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  8D 5C 24 18			lea		ebx,0x18[esp]
0007  8B 54 24 14			mov		edx,dword ptr 0x14[esp]
000B  8B 44 24 10			mov		eax,dword ptr 0x10[esp]
000F  8B 0D 00 00 00 00			mov		ecx,dword ptr _environ
0015  E8 00 00 00 00			call		spawnve_
001A  5A				pop		edx
001B  59				pop		ecx
001C  5B				pop		ebx
001D  C3				ret		

Routine Size: 30 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

