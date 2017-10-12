Module: sleepwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001A bytes
0000				sleep_:
0000  51				push		ecx
0001  52				push		edx
0002  89 C2				mov		edx,eax
0004  C1 E0 05				shl		eax,0x05
0007  29 D0				sub		eax,edx
0009  C1 E0 02				shl		eax,0x02
000C  01 D0				add		eax,edx
000E  C1 E0 03				shl		eax,0x03
0011  50				push		eax
0012  E8 00 00 00 00			call		_Sleep
0017  5A				pop		edx
0018  59				pop		ecx
0019  C3				ret		

Routine Size: 26 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

