Module: ustrchr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000016 bytes
0000				_ustrchr_:
0000  53				push		ebx
0001  89 D3				mov		ebx,edx
0003				L$1:
0003  66 3B 18				cmp		bx,word ptr [eax]
0006  74 0C				je		L$2
0008  89 C2				mov		edx,eax
000A  40				inc		eax
000B  40				inc		eax
000C  66 83 3A 00			cmp		word ptr [edx],0x0000
0010  75 F1				jne		L$1
0012  31 C0				xor		eax,eax
0014				L$2:
0014  5B				pop		ebx
0015  C3				ret		

Routine Size: 22 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

