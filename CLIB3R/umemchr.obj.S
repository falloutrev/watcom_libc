Module: umemchr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000015 bytes
0000				__umemchr_:
0000  51				push		ecx
0001				L$1:
0001  85 DB				test		ebx,ebx
0003  74 0C				je		L$2
0005  0F B7 08				movzx		ecx,word ptr [eax]
0008  39 D1				cmp		ecx,edx
000A  74 07				je		L$3
000C  40				inc		eax
000D  40				inc		eax
000E  4B				dec		ebx
000F  EB F0				jmp		L$1
0011				L$2:
0011  31 C0				xor		eax,eax
0013				L$3:
0013  59				pop		ecx
0014  C3				ret		

Routine Size: 21 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

