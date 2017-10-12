Module: ustrset
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000014 bytes
0000				_ustrset_:
0000  53				push		ebx
0001  89 C3				mov		ebx,eax
0003  EB 05				jmp		L$2
0005				L$1:
0005  66 89 10				mov		word ptr [eax],dx
0008  40				inc		eax
0009  40				inc		eax
000A				L$2:
000A  66 83 38 00			cmp		word ptr [eax],0x0000
000E  75 F5				jne		L$1
0010  89 D8				mov		eax,ebx
0012  5B				pop		ebx
0013  C3				ret		

Routine Size: 20 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

