Module: vsprintf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000028 bytes
0000				mem_putc_:
0000  53				push		ebx
0001  51				push		ecx
0002  89 D3				mov		ebx,edx
0004  8B 10				mov		edx,dword ptr [eax]
0006  8D 4A 01				lea		ecx,0x1[edx]
0009  89 08				mov		dword ptr [eax],ecx
000B  88 1A				mov		byte ptr [edx],bl
000D  FF 40 10				inc		dword ptr 0x10[eax]
0010  59				pop		ecx
0011  5B				pop		ebx
0012  C3				ret		

Routine Size: 19 bytes,    Routine Base: _TEXT + 0000

0013				vsprintf_:
0013  51				push		ecx
0014  56				push		esi
0015  89 C6				mov		esi,eax
0017  B9 00 00 00 00			mov		ecx,offset mem_putc_
001C  E8 00 00 00 00			call		__prtf_
0021  C6 04 06 00			mov		byte ptr [esi+eax],0x00
0025  5E				pop		esi
0026  59				pop		ecx
0027  C3				ret		

Routine Size: 21 bytes,    Routine Base: _TEXT + 0013

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

