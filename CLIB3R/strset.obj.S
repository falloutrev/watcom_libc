Module: strset
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000011 bytes
0000				strset_:
0000  53				push		ebx
0001  89 C3				mov		ebx,eax
0003  EB 03				jmp		L$2
0005				L$1:
0005  88 10				mov		byte ptr [eax],dl
0007  40				inc		eax
0008				L$2:
0008  80 38 00				cmp		byte ptr [eax],0x00
000B  75 F8				jne		L$1
000D  89 D8				mov		eax,ebx
000F  5B				pop		ebx
0010  C3				ret		

Routine Size: 17 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

