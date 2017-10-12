Module: abort
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000018 bytes
0000				abort_:
0000  FF 15 00 00 00 00			call		dword ptr ___abort

Routine Size: 6 bytes,    Routine Base: _TEXT + 0000

0006				__terminate_:
0006  52				push		edx
0007  BA FF 00 00 00			mov		edx,0x000000ff
000C  B8 00 00 00 00			mov		eax,offset DGROUP:L$1
0011  E8 00 00 00 00			call		__fatal_runtime_error_
0016  5A				pop		edx
0017  C3				ret		

Routine Size: 18 bytes,    Routine Base: _TEXT + 0006

No disassembly errors

Segment: CONST DWORD USE32 00000017 bytes
0000				L$1:
0000  41 42 4E 4F 52 4D 41 4C 20 54 45 52 4D 49 4E 41 ABNORMAL TERMINA
0010  54 49 4F 4E 0D 0A 00                            TION...

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000004 bytes
0000				___abort:
0000  00 00 00 00                                     DD	offset __terminate_

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

