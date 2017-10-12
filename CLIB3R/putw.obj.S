Module: putw
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002A bytes
0000				_putw_:
0000  53				push		ebx
0001  51				push		ecx
0002  50				push		eax
0003  BB 01 00 00 00			mov		ebx,0x00000001
0008  89 E0				mov		eax,esp
000A  89 D1				mov		ecx,edx
000C  BA 04 00 00 00			mov		edx,0x00000004
0011  E8 00 00 00 00			call		fwrite_
0016  85 C0				test		eax,eax
0018  76 05				jbe		L$1
001A  8B 04 24				mov		eax,dword ptr [esp]
001D  EB 05				jmp		L$2
001F				L$1:
001F  B8 FF FF FF FF			mov		eax,0xffffffff
0024				L$2:
0024  83 C4 04				add		esp,0x00000004
0027  59				pop		ecx
0028  5B				pop		ebx
0029  C3				ret		

Routine Size: 42 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

