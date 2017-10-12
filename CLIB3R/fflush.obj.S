Module: fflush
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000010 bytes
0000				fflush_:
0000  85 C0				test		eax,eax
0002  0F 85 00 00 00 00			jne		__flush_
0008  E8 00 00 00 00			call		flushall_
000D  31 C0				xor		eax,eax
000F  C3				ret		

Routine Size: 16 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

