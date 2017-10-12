Module: ugetchar
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000000A bytes
0000				_ugetchar_:
0000  B8 00 00 00 00			mov		eax,offset ___iob
0005  E9 00 00 00 00			jmp		_ugetc_

Routine Size: 10 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

