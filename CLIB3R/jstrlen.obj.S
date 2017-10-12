Module: jstrlen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000020 bytes
0000				jstrlen_:
0000  53				push		ebx
0001  52				push		edx
0002  83 EC 04				sub		esp,0x00000004
0005  31 DB				xor		ebx,ebx
0007				L$1:
0007  89 E2				mov		edx,esp
0009  E8 00 00 00 00			call		jgetmoji_
000E  66 83 3C 24 00			cmp		word ptr [esp],0x0000
0013  74 03				je		L$2
0015  43				inc		ebx
0016  EB EF				jmp		L$1
0018				L$2:
0018  89 D8				mov		eax,ebx
001A  83 C4 04				add		esp,0x00000004
001D  5A				pop		edx
001E  5B				pop		ebx
001F  C3				ret		

Routine Size: 32 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

