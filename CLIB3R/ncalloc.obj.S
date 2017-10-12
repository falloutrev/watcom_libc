Module: ncalloc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001E bytes
0000				_ncalloc_:
0000  53				push		ebx
0001  51				push		ecx
0002  0F AF C2				imul		eax,edx
0005  89 C3				mov		ebx,eax
0007  E8 00 00 00 00			call		_nmalloc_
000C  89 C1				mov		ecx,eax
000E  85 C0				test		eax,eax
0010  74 07				je		L$1
0012  31 D2				xor		edx,edx
0014  E8 00 00 00 00			call		memset_
0019				L$1:
0019  89 C8				mov		eax,ecx
001B  59				pop		ecx
001C  5B				pop		ebx
001D  C3				ret		

Routine Size: 30 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

