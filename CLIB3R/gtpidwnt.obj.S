Module: gtpidwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000000A bytes
0000				getpid_:
0000  51				push		ecx
0001  52				push		edx
0002  E8 00 00 00 00			call		_GetCurrentProcessId
0007  5A				pop		edx
0008  59				pop		ecx
0009  C3				ret		

Routine Size: 10 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

