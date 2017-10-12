Module: ustrncmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000029 bytes
0000				_ustrncmp_:
0000  51				push		ecx
0001				L$1:
0001  85 DB				test		ebx,ebx
0003  75 04				jne		L$3
0005				L$2:
0005  31 C0				xor		eax,eax
0007  59				pop		ecx
0008  C3				ret		
0009				L$3:
0009  66 8B 08				mov		cx,word ptr [eax]
000C  66 3B 0A				cmp		cx,word ptr [edx]
000F  74 0C				je		L$4
0011  0F B7 D9				movzx		ebx,cx
0014  0F B7 02				movzx		eax,word ptr [edx]
0017  29 C3				sub		ebx,eax
0019  89 D8				mov		eax,ebx
001B  59				pop		ecx
001C  C3				ret		
001D				L$4:
001D  66 85 C9				test		cx,cx
0020  74 E3				je		L$2
0022  40				inc		eax
0023  40				inc		eax
0024  42				inc		edx
0025  42				inc		edx
0026  4B				dec		ebx
0027  EB D8				jmp		L$1

Routine Size: 41 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

