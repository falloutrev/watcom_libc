Module: mblen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000000E bytes
0000				mblen_:
0000  53				push		ebx
0001  89 D3				mov		ebx,edx
0003  89 C2				mov		edx,eax
0005  31 C0				xor		eax,eax
0007  E8 00 00 00 00			call		mbtowc_
000C  5B				pop		ebx
000D  C3				ret		

Routine Size: 14 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

