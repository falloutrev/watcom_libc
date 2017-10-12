Module: grabfp87
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000031 bytes
0000				__GrabFP87_:
0000  53				push		ebx
0001  51				push		ecx
0002  81 3D 00 00 00 00 00 00 00 00
					cmp		dword ptr ___FPE_handler_exit,offset __Fini_FPE_handler_
000C  74 1B				je		L$1
000E  BB 00 00 00 00			mov		ebx,offset __sigfpe_handler_
0013  B9 00 00 00 00			mov		ecx,offset __Fini_FPE_handler_
0018  89 1D 00 00 00 00			mov		dword ptr ___FPE_handler,ebx
001E  E8 00 00 00 00			call		__Init_FPE_handler_
0023  89 0D 00 00 00 00			mov		dword ptr ___FPE_handler_exit,ecx
0029				L$1:
0029  E8 00 00 00 00			call		__Enable_FPE_
002E  59				pop		ecx
002F  5B				pop		ebx
0030  C3				ret		

Routine Size: 49 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

