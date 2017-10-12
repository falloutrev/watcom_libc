Module: segread
GROUP: 'DGROUP' CONST,CONST2,_DATA

Segment: _TEXT BYTE USE32 00000028 bytes
0000				segread_:
0000  52				push		edx
0001  89 C2				mov		edx,eax
0003  8C C8				mov		eax,cs
0005  66 89 42 02			mov		word ptr 0x2[edx],ax
0009  8C D8				mov		eax,ds
000B  66 89 42 06			mov		word ptr 0x6[edx],ax
000F  8C C0				mov		eax,es
0011  66 89 02				mov		word ptr [edx],ax
0014  8C D0				mov		eax,ss
0016  66 89 42 04			mov		word ptr 0x4[edx],ax
001A  8C E0				mov		eax,fs
001C  66 89 42 08			mov		word ptr 0x8[edx],ax
0020  8C E8				mov		eax,gs
0022  66 89 42 0A			mov		word ptr 0xa[edx],ax
0026  5A				pop		edx
0027  C3				ret		

Routine Size: 40 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

