Module: ustrrev
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002E bytes
0000				_ustrrev_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  89 C3				mov		ebx,eax
0006  89 C2				mov		edx,eax
0008  E8 00 00 00 00			call		_ustrlen_
000D  01 C0				add		eax,eax
000F  01 D8				add		eax,ebx
0011				L$1:
0011  48				dec		eax
0012  48				dec		eax
0013  39 C2				cmp		edx,eax
0015  73 10				jae		L$2
0017  66 8B 08				mov		cx,word ptr [eax]
001A  66 8B 32				mov		si,word ptr [edx]
001D  66 89 0A				mov		word ptr [edx],cx
0020  42				inc		edx
0021  42				inc		edx
0022  66 89 30				mov		word ptr [eax],si
0025  EB EA				jmp		L$1
0027				L$2:
0027  89 D8				mov		eax,ebx
0029  5E				pop		esi
002A  5A				pop		edx
002B  59				pop		ecx
002C  5B				pop		ebx
002D  C3				ret		

Routine Size: 46 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

