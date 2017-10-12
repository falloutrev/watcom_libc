Module: clockwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002C bytes
0000				curr_tick_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  E8 00 00 00 00			call		_GetTickCount
0008  BB 0A 00 00 00			mov		ebx,0x0000000a
000D  31 D2				xor		edx,edx
000F  F7 F3				div		ebx
0011  5A				pop		edx
0012  59				pop		ecx
0013  5B				pop		ebx
0014  C3				ret		

Routine Size: 21 bytes,    Routine Base: _TEXT + 0000

0015				__clock_init_:
0015  E8 00 00 00 00			call		curr_tick_
001A  A3 00 00 00 00			mov		dword ptr _clock_start,eax
001F  C3				ret		

Routine Size: 11 bytes,    Routine Base: _TEXT + 0015

0020				__clock_:
0020  E8 00 00 00 00			call		curr_tick_
0025  2B 05 00 00 00 00			sub		eax,dword ptr _clock_start
002B  C3				ret		

Routine Size: 12 bytes,    Routine Base: _TEXT + 0020

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000004 bytes
0000				_clock_start:

BSS Size: 4 bytes

