Module: heapen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000021 bytes
0000				_heapenable_:
0000  53				push		ebx
0001  52				push		edx
0002  89 C3				mov		ebx,eax
0004  FF 15 00 00 00 00			call		dword ptr __AccessNHeap
000A  8B 15 00 00 00 00			mov		edx,dword ptr ___heap_enabled
0010  89 1D 00 00 00 00			mov		dword ptr ___heap_enabled,ebx
0016  FF 15 00 00 00 00			call		dword ptr __ReleaseNHeap
001C  89 D0				mov		eax,edx
001E  5A				pop		edx
001F  5B				pop		ebx
0020  C3				ret		

Routine Size: 33 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000004 bytes
0000				___heap_enabled:
0000  01 00 00 00                                     ....

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

