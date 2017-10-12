Module: ustrupr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000033 bytes
0000				_ustrupr_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  89 C3				mov		ebx,eax
0005				L$1:
0005  66 8B 10				mov		dx,word ptr [eax]
0008  66 85 D2				test		dx,dx
000B  74 20				je		L$3
000D  89 D1				mov		ecx,edx
000F  30 D1				xor		cl,dl
0011  0F B7 C9				movzx		ecx,cx
0014  85 C9				test		ecx,ecx
0016  75 11				jne		L$2
0018  83 EA 61				sub		edx,0x00000061
001B  0F B7 CA				movzx		ecx,dx
001E  83 F9 19				cmp		ecx,0x00000019
0021  7F 06				jg		L$2
0023  83 C2 41				add		edx,0x00000041
0026  66 89 10				mov		word ptr [eax],dx
0029				L$2:
0029  40				inc		eax
002A  40				inc		eax
002B  EB D8				jmp		L$1
002D				L$3:
002D  89 D8				mov		eax,ebx
002F  5A				pop		edx
0030  59				pop		ecx
0031  5B				pop		ebx
0032  C3				ret		

Routine Size: 51 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

