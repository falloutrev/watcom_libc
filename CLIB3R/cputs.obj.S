Module: cputs
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000015 bytes
0000				cputs_:
0000  52				push		edx
0001  89 C2				mov		edx,eax
0003				L$1:
0003  31 C0				xor		eax,eax
0005  8A 02				mov		al,byte ptr [edx]
0007  42				inc		edx
0008  85 C0				test		eax,eax
000A  74 07				je		L$2
000C  E8 00 00 00 00			call		putch_
0011  EB F0				jmp		L$1
0013				L$2:
0013  5A				pop		edx
0014  C3				ret		

Routine Size: 21 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

