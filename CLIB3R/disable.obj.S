Module: disable
GROUP: 'DGROUP' CONST,CONST2,_DATA

Segment: _TEXT BYTE USE32 00000002 bytes
0000				_disable_:
0000  FA				cli		
0001  C3				ret		

Routine Size: 2 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

