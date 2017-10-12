Module: jstradv
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000000C bytes
0000				jstradv_:
0000  53				push		ebx
0001  89 C3				mov		ebx,eax
0003  E8 00 00 00 00			call		mtob_
0008  01 D8				add		eax,ebx
000A  5B				pop		ebx
000B  C3				ret		

Routine Size: 12 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

