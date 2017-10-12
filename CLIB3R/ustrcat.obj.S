Module: ustrcat
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000022 bytes
0000				_ustrcat_:
0000  53				push		ebx
0001  51				push		ecx
0002  89 C3				mov		ebx,eax
0004				L$1:
0004  66 83 38 00			cmp		word ptr [eax],0x0000
0008  74 04				je		L$2
000A  40				inc		eax
000B  40				inc		eax
000C  EB F6				jmp		L$1
000E				L$2:
000E  66 8B 0A				mov		cx,word ptr [edx]
0011  42				inc		edx
0012  42				inc		edx
0013  66 89 08				mov		word ptr [eax],cx
0016  40				inc		eax
0017  40				inc		eax
0018  66 85 C9				test		cx,cx
001B  75 F1				jne		L$2
001D  89 D8				mov		eax,ebx
001F  59				pop		ecx
0020  5B				pop		ebx
0021  C3				ret		

Routine Size: 34 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

