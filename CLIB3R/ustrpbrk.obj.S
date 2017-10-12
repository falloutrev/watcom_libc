Module: ustrpbrk
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002F bytes
0000				_ustrpbrk_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  89 D6				mov		esi,edx
0005  EB 1A				jmp		L$5
0007				L$1:
0007  89 F2				mov		edx,esi
0009  EB 07				jmp		L$3
000B				L$2:
000B  66 39 D9				cmp		cx,bx
000E  74 0A				je		L$4
0010  42				inc		edx
0011  42				inc		edx
0012				L$3:
0012  66 8B 1A				mov		bx,word ptr [edx]
0015  66 85 DB				test		bx,bx
0018  75 F1				jne		L$2
001A				L$4:
001A  66 85 DB				test		bx,bx
001D  75 0C				jne		L$6
001F  40				inc		eax
0020  40				inc		eax
0021				L$5:
0021  66 8B 08				mov		cx,word ptr [eax]
0024  66 85 C9				test		cx,cx
0027  75 DE				jne		L$1
0029  31 C0				xor		eax,eax
002B				L$6:
002B  5E				pop		esi
002C  59				pop		ecx
002D  5B				pop		ebx
002E  C3				ret		

Routine Size: 47 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

