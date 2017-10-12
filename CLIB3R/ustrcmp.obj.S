Module: ustrcmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000024 bytes
0000				_ustrcmp_:
0000  53				push		ebx
0001  EB 0D				jmp		L$3
0003				L$1:
0003  66 85 DB				test		bx,bx
0006  75 04				jne		L$2
0008  31 C0				xor		eax,eax
000A  5B				pop		ebx
000B  C3				ret		
000C				L$2:
000C  40				inc		eax
000D  40				inc		eax
000E  42				inc		edx
000F  42				inc		edx
0010				L$3:
0010  66 8B 18				mov		bx,word ptr [eax]
0013  66 3B 1A				cmp		bx,word ptr [edx]
0016  74 EB				je		L$1
0018  0F B7 DB				movzx		ebx,bx
001B  0F B7 02				movzx		eax,word ptr [edx]
001E  29 C3				sub		ebx,eax
0020  89 D8				mov		eax,ebx
0022  5B				pop		ebx
0023  C3				ret		

Routine Size: 36 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

