Module: cprintf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000004A bytes
0000				con_putc_:
0000  53				push		ebx
0001  89 C3				mov		ebx,eax
0003  89 D0				mov		eax,edx
0005  E8 00 00 00 00			call		putch_
000A  FF 43 10				inc		dword ptr 0x10[ebx]
000D  5B				pop		ebx
000E  C3				ret		

Routine Size: 15 bytes,    Routine Base: _TEXT + 0000

000F				vcprintf_:
000F  53				push		ebx
0010  51				push		ecx
0011  B9 00 00 00 00			mov		ecx,offset con_putc_
0016  89 D3				mov		ebx,edx
0018  89 C2				mov		edx,eax
001A  31 C0				xor		eax,eax
001C  E8 00 00 00 00			call		__prtf_
0021  59				pop		ecx
0022  5B				pop		ebx
0023  C3				ret		

Routine Size: 21 bytes,    Routine Base: _TEXT + 000F

0024				cprintf_:
0024  53				push		ebx
0025  51				push		ecx
0026  52				push		edx
0027  83 EC 04				sub		esp,0x00000004
002A  8D 44 24 18			lea		eax,0x18[esp]
002E  B9 00 00 00 00			mov		ecx,offset con_putc_
0033  89 E3				mov		ebx,esp
0035  8B 54 24 14			mov		edx,dword ptr 0x14[esp]
0039  89 04 24				mov		dword ptr [esp],eax
003C  31 C0				xor		eax,eax
003E  E8 00 00 00 00			call		__prtf_
0043  83 C4 04				add		esp,0x00000004
0046  5A				pop		edx
0047  59				pop		ecx
0048  5B				pop		ebx
0049  C3				ret		

Routine Size: 38 bytes,    Routine Base: _TEXT + 0024

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

