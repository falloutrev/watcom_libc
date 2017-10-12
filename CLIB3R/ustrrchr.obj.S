Module: ustrrchr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001C bytes
0000				_ustrrchr_:
0000  53				push		ebx
0001  51				push		ecx
0002  89 D1				mov		ecx,edx
0004  31 D2				xor		edx,edx
0006				L$1:
0006  66 3B 08				cmp		cx,word ptr [eax]
0009  75 02				jne		L$2
000B  89 C2				mov		edx,eax
000D				L$2:
000D  89 C3				mov		ebx,eax
000F  40				inc		eax
0010  40				inc		eax
0011  66 83 3B 00			cmp		word ptr [ebx],0x0000
0015  75 EF				jne		L$1
0017  89 D0				mov		eax,edx
0019  59				pop		ecx
001A  5B				pop		ebx
001B  C3				ret		

Routine Size: 28 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

