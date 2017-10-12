Module: strrchr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001A bytes
0000				strrchr_:
0000  53				push		ebx
0001  51				push		ecx
0002  88 D1				mov		cl,dl
0004  31 DB				xor		ebx,ebx
0006				L$1:
0006  3A 08				cmp		cl,byte ptr [eax]
0008  75 02				jne		L$2
000A  89 C3				mov		ebx,eax
000C				L$2:
000C  89 C2				mov		edx,eax
000E  8A 2A				mov		ch,byte ptr [edx]
0010  40				inc		eax
0011  84 ED				test		ch,ch
0013  75 F1				jne		L$1
0015  89 D8				mov		eax,ebx
0017  59				pop		ecx
0018  5B				pop		ebx
0019  C3				ret		

Routine Size: 26 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

