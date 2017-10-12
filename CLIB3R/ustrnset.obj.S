Module: ustrnset
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000019 bytes
0000				_ustrnset_:
0000  51				push		ecx
0001  89 C1				mov		ecx,eax
0003  EB 0C				jmp		L$2
0005				L$1:
0005  66 83 38 00			cmp		word ptr [eax],0x0000
0009  74 0A				je		L$3
000B  4B				dec		ebx
000C  66 89 10				mov		word ptr [eax],dx
000F  40				inc		eax
0010  40				inc		eax
0011				L$2:
0011  85 DB				test		ebx,ebx
0013  75 F0				jne		L$1
0015				L$3:
0015  89 C8				mov		eax,ecx
0017  59				pop		ecx
0018  C3				ret		

Routine Size: 25 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

