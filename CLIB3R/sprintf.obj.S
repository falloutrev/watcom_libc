Module: sprintf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000043 bytes
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

0013				sprintf_:
0013  53				push		ebx
0014  51				push		ecx
0015  52				push		edx
0016  83 EC 04				sub		esp,0x00000004
0019  8D 44 24 1C			lea		eax,0x1c[esp]
001D  B9 00 00 00 00			mov		ecx,offset mem_putc_
0022  89 E3				mov		ebx,esp
0024  8B 54 24 18			mov		edx,dword ptr 0x18[esp]
0028  89 04 24				mov		dword ptr [esp],eax
002B  8B 44 24 14			mov		eax,dword ptr 0x14[esp]
002F  E8 00 00 00 00			call		__prtf_
0034  8B 54 24 14			mov		edx,dword ptr 0x14[esp]
0038  C6 04 02 00			mov		byte ptr [edx+eax],0x00
003C  83 C4 04				add		esp,0x00000004
003F  5A				pop		edx
0040  59				pop		ecx
0041  5B				pop		ebx
0042  C3				ret		

Routine Size: 48 bytes,    Routine Base: _TEXT + 0013

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

