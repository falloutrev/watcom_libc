Module: gtchewnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000022 bytes
0000				getche_:
0000  53				push		ebx
0001  52				push		edx
0002  8B 1D 00 00 00 00			mov		ebx,dword ptr __cbyte
0008  E8 00 00 00 00			call		getch_
000D  89 C2				mov		edx,eax
000F  83 F8 FF				cmp		eax,0xffffffff
0012  74 09				je		L$1
0014  85 DB				test		ebx,ebx
0016  75 05				jne		L$1
0018  E8 00 00 00 00			call		putch_
001D				L$1:
001D  89 D0				mov		eax,edx
001F  5A				pop		edx
0020  5B				pop		ebx
0021  C3				ret		

Routine Size: 34 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

