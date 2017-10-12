Module: heapgrow
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000000F bytes
0000				_heapgrow_:
0000				_nheapgrow_:
0000  B8 01 00 00 00			mov		eax,0x00000001
0005  E8 00 00 00 00			call		_nmalloc_
000A  E9 00 00 00 00			jmp		_nfree_

Routine Size: 15 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

