Module: ustrlen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000013 bytes
0000				_ustrlen_:
0000  52				push		edx
0001  89 C2				mov		edx,eax
0003				L$1:
0003  66 83 38 00			cmp		word ptr [eax],0x0000
0007  74 04				je		L$2
0009  40				inc		eax
000A  40				inc		eax
000B  EB F6				jmp		L$1
000D				L$2:
000D  29 D0				sub		eax,edx
000F  D1 F8				sar		eax,0x01
0011  5A				pop		edx
0012  C3				ret		

Routine Size: 19 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

