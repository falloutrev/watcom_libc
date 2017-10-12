Module: exit
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000003E bytes
0000				_null_exit_rtn_:
0000				__null_int23_exit_:
0000  C3				ret		

Routine Size: 1 bytes,    Routine Base: _TEXT + 0000

0001				exit_:
0001  52				push		edx
0002  89 C2				mov		edx,eax
0004  FF 15 00 00 00 00			call		dword ptr ___atexit
000A  FF 15 00 00 00 00			call		dword ptr ___int23_exit
0010  89 D0				mov		eax,edx
0012  E8 00 00 00 00			call		_exit_
0017  5A				pop		edx
0018  C3				ret		

Routine Size: 24 bytes,    Routine Base: _TEXT + 0001

0019				_exit_:
0019  52				push		edx
001A  89 C2				mov		edx,eax
001C  FF 15 00 00 00 00			call		dword ptr ___int23_exit
0022  FF 15 00 00 00 00			call		dword ptr ___FPE_handler_exit
0028  83 3D 00 00 00 00 00		cmp		dword ptr __WindowExitRtn,0x00000000
002F  74 06				je		L$1
0031  FF 15 00 00 00 00			call		dword ptr __WindowExitRtn
0037				L$1:
0037  89 D0				mov		eax,edx
0039  E9 00 00 00 00			jmp		__exit_

Routine Size: 37 bytes,    Routine Base: _TEXT + 0019

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 0000000C bytes
0000				___atexit:
0000  00 00 00 00                                     DD	offset _null_exit_rtn_
0004				___int23_exit:
0004  00 00 00 00                                     DD	offset __null_int23_exit_
0008				___FPE_handler_exit:
0008  00 00 00 00                                     DD	offset _null_exit_rtn_

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

