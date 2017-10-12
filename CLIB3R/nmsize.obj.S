Module: nmsize
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000009 bytes
0000				_msize_:
0000				_nmsize_:
0000  8B 40 FC				mov		eax,dword ptr -0x4[eax]
0003  24 FE				and		al,0xfe
0005  83 E8 04				sub		eax,0x00000004
0008  C3				ret		

Routine Size: 9 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

