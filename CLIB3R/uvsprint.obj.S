Module: uvsprint
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002D bytes
0000				mem_putc_:
0000  53				push		ebx
0001  51				push		ecx
0002  89 D3				mov		ebx,edx
0004  8B 10				mov		edx,dword ptr [eax]
0006  8D 4A 02				lea		ecx,0x2[edx]
0009  89 08				mov		dword ptr [eax],ecx
000B  66 89 1A				mov		word ptr [edx],bx
000E  FF 40 10				inc		dword ptr 0x10[eax]
0011  59				pop		ecx
0012  5B				pop		ebx
0013  C3				ret		

Routine Size: 20 bytes,    Routine Base: _TEXT + 0000

0014				_uvsprintf_:
0014  51				push		ecx
0015  56				push		esi
0016  89 C6				mov		esi,eax
0018  B9 00 00 00 00			mov		ecx,offset mem_putc_
001D  E8 00 00 00 00			call		__uprtf_
0022  89 C2				mov		edx,eax
0024  66 C7 04 56 00 00			mov		word ptr [esi+edx*2],0x0000
002A  5E				pop		esi
002B  59				pop		ecx
002C  C3				ret		

Routine Size: 25 bytes,    Routine Base: _TEXT + 0014

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

