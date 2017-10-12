Module: ustrcspn
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000038 bytes
0000				_ustrcspn_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  55				push		ebp
0004  89 E5				mov		ebp,esp
0006  52				push		edx
0007  89 C2				mov		edx,eax
0009  31 DB				xor		ebx,ebx
000B  EB 1C				jmp		L$5
000D				L$1:
000D  8B 45 FC				mov		eax,dword ptr -0x4[ebp]
0010  EB 07				jmp		L$3
0012				L$2:
0012  66 39 CE				cmp		si,cx
0015  74 0A				je		L$4
0017  40				inc		eax
0018  40				inc		eax
0019				L$3:
0019  66 8B 08				mov		cx,word ptr [eax]
001C  66 85 C9				test		cx,cx
001F  75 F1				jne		L$2
0021				L$4:
0021  66 85 C9				test		cx,cx
0024  75 0B				jne		L$6
0026  42				inc		edx
0027  42				inc		edx
0028  43				inc		ebx
0029				L$5:
0029  66 8B 32				mov		si,word ptr [edx]
002C  66 85 F6				test		si,si
002F  75 DC				jne		L$1
0031				L$6:
0031  89 D8				mov		eax,ebx
0033  C9				leave		
0034  5E				pop		esi
0035  59				pop		ecx
0036  5B				pop		ebx
0037  C3				ret		

Routine Size: 56 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

