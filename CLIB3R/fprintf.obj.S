Module: fprintf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000021 bytes
0000				fprintf_:
0000  53				push		ebx
0001  52				push		edx
0002  83 EC 04				sub		esp,0x00000004
0005  8D 44 24 18			lea		eax,0x18[esp]
0009  89 E3				mov		ebx,esp
000B  8B 54 24 14			mov		edx,dword ptr 0x14[esp]
000F  89 04 24				mov		dword ptr [esp],eax
0012  8B 44 24 10			mov		eax,dword ptr 0x10[esp]
0016  E8 00 00 00 00			call		__fprtf_
001B  83 C4 04				add		esp,0x00000004
001E  5A				pop		edx
001F  5B				pop		ebx
0020  C3				ret		

Routine Size: 33 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

