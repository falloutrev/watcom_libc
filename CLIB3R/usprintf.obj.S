Module: usprintf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000044 bytes
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

0014				_usprintf_:
0014  53				push		ebx
0015  51				push		ecx
0016  52				push		edx
0017  C8 04 00 00			enter		0x0004,0x00
001B  8D 45 1C				lea		eax,0x1c[ebp]
001E  B9 00 00 00 00			mov		ecx,offset mem_putc_
0023  8D 5D FC				lea		ebx,-0x4[ebp]
0026  8B 55 18				mov		edx,dword ptr 0x18[ebp]
0029  89 45 FC				mov		dword ptr -0x4[ebp],eax
002C  8B 45 14				mov		eax,dword ptr 0x14[ebp]
002F  E8 00 00 00 00			call		__uprtf_
0034  8D 14 00				lea		edx,[eax+eax]
0037  03 55 14				add		edx,dword ptr 0x14[ebp]
003A  66 C7 02 00 00			mov		word ptr [edx],0x0000
003F  C9				leave		
0040  5A				pop		edx
0041  59				pop		ecx
0042  5B				pop		ebx
0043  C3				ret		

Routine Size: 48 bytes,    Routine Base: _TEXT + 0014

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

