Module: exlp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000010 bytes
0000				execlp_:
0000  52				push		edx
0001  8D 54 24 0C			lea		edx,0xc[esp]
0005  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
0009  E8 00 00 00 00			call		execvp_
000E  5A				pop		edx
000F  C3				ret		

Routine Size: 16 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

