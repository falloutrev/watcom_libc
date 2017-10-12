Module: mtob
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000025 bytes
0000				mtob_:
0000  53				push		ebx
0001  51				push		ecx
0002  83 EC 04				sub		esp,0x00000004
0005  89 C1				mov		ecx,eax
0007  89 D3				mov		ebx,edx
0009				L$1:
0009  4B				dec		ebx
000A  83 FB FF				cmp		ebx,0xffffffff
000D  74 0E				je		L$2
000F  89 E2				mov		edx,esp
0011  E8 00 00 00 00			call		jgetmoji_
0016  66 83 3C 24 00			cmp		word ptr [esp],0x0000
001B  75 EC				jne		L$1
001D				L$2:
001D  29 C8				sub		eax,ecx
001F  83 C4 04				add		esp,0x00000004
0022  59				pop		ecx
0023  5B				pop		ebx
0024  C3				ret		

Routine Size: 37 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

