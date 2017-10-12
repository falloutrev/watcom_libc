Module: vprintf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000011 bytes
0000				vprintf_:
0000  53				push		ebx
0001  89 D3				mov		ebx,edx
0003  89 C2				mov		edx,eax
0005  B8 1A 00 00 00			mov		eax,offset ___iob+0x1a
000A  E8 00 00 00 00			call		__fprtf_
000F  5B				pop		ebx
0010  C3				ret		

Routine Size: 17 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

