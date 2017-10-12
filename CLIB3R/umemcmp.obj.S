Module: umemcmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000024 bytes
0000				__umemcmp_:
0000  51				push		ecx
0001  EB 19				jmp		L$3
0003				L$1:
0003  66 8B 08				mov		cx,word ptr [eax]
0006  66 3B 0A				cmp		cx,word ptr [edx]
0009  74 0C				je		L$2
000B  0F B7 D9				movzx		ebx,cx
000E  0F B7 02				movzx		eax,word ptr [edx]
0011  29 C3				sub		ebx,eax
0013  89 D8				mov		eax,ebx
0015  59				pop		ecx
0016  C3				ret		
0017				L$2:
0017  40				inc		eax
0018  40				inc		eax
0019  42				inc		edx
001A  42				inc		edx
001B  4B				dec		ebx
001C				L$3:
001C  85 DB				test		ebx,ebx
001E  75 E3				jne		L$1
0020  31 C0				xor		eax,eax
0022  59				pop		ecx
0023  C3				ret		

Routine Size: 36 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

