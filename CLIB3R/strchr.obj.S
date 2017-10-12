Module: strchr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000014 bytes
0000				strchr_:
0000  53				push		ebx
0001  88 D3				mov		bl,dl
0003				L$1:
0003  3A 18				cmp		bl,byte ptr [eax]
0005  74 0B				je		L$2
0007  89 C2				mov		edx,eax
0009  8A 3A				mov		bh,byte ptr [edx]
000B  40				inc		eax
000C  84 FF				test		bh,bh
000E  75 F3				jne		L$1
0010  31 C0				xor		eax,eax
0012				L$2:
0012  5B				pop		ebx
0013  C3				ret		

Routine Size: 20 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

