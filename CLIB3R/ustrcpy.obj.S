Module: ustrcpy
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000018 bytes
0000				_ustrcpy_:
0000  53				push		ebx
0001  51				push		ecx
0002  89 C3				mov		ebx,eax
0004				L$1:
0004  66 8B 0A				mov		cx,word ptr [edx]
0007  42				inc		edx
0008  42				inc		edx
0009  66 89 08				mov		word ptr [eax],cx
000C  40				inc		eax
000D  40				inc		eax
000E  66 85 C9				test		cx,cx
0011  75 F1				jne		L$1
0013  89 D8				mov		eax,ebx
0015  59				pop		ecx
0016  5B				pop		ebx
0017  C3				ret		

Routine Size: 24 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

