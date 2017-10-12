Module: ustrcoll
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000031 bytes
0000				_ustrcoll_:
0000  53				push		ebx
0001  51				push		ecx
0002  EB 11				jmp		L$3
0004				L$1:
0004  66 83 38 00			cmp		word ptr [eax],0x0000
0008  75 05				jne		L$2
000A  31 C0				xor		eax,eax
000C  59				pop		ecx
000D  5B				pop		ebx
000E  C3				ret		
000F				L$2:
000F  83 C0 02				add		eax,0x00000002
0012  83 C2 02				add		edx,0x00000002
0015				L$3:
0015  66 8B 18				mov		bx,word ptr [eax]
0018  66 8B 0A				mov		cx,word ptr [edx]
001B  66 39 CB				cmp		bx,cx
001E  74 E4				je		L$1
0020  31 DB				xor		ebx,ebx
0022  66 8B 18				mov		bx,word ptr [eax]
0025  31 C0				xor		eax,eax
0027  66 89 C8				mov		ax,cx
002A  29 C3				sub		ebx,eax
002C  89 D8				mov		eax,ebx
002E  59				pop		ecx
002F  5B				pop		ebx
0030  C3				ret		

Routine Size: 49 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

