Module: setbuf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001D bytes
0000				setbuf_:
0000  53				push		ebx
0001  51				push		ecx
0002  BB 00 01 00 00			mov		ebx,0x00000100
0007  85 D2				test		edx,edx
0009  75 05				jne		L$1
000B  BB 00 04 00 00			mov		ebx,0x00000400
0010				L$1:
0010  B9 00 10 00 00			mov		ecx,0x00001000
0015  E8 00 00 00 00			call		setvbuf_
001A  59				pop		ecx
001B  5B				pop		ebx
001C  C3				ret		

Routine Size: 29 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

