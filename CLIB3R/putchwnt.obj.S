Module: putchwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000062 bytes
0000				putch_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  83 EC 08				sub		esp,0x00000008
0006  89 C3				mov		ebx,eax
0008  8B 15 00 00 00 00			mov		edx,dword ptr __WindowsPutch
000E  88 5C 24 04			mov		byte ptr 0x4[esp],bl
0012  85 D2				test		edx,edx
0014  74 15				je		L$1
0016  B8 01 00 00 00			mov		eax,0x00000001
001B  89 DA				mov		edx,ebx
001D  FF 15 00 00 00 00			call		dword ptr __WindowsIsWindowedHandle
0023  FF 15 00 00 00 00			call		dword ptr __WindowsPutch
0029  EB 2E				jmp		L$2
002B				L$1:
002B  B8 01 00 00 00			mov		eax,0x00000001
0030  FF 15 00 00 00 00			call		dword ptr __AccessFileH
0036  E8 00 00 00 00			call		__NTConsoleOutput_
003B  52				push		edx
003C  8D 54 24 04			lea		edx,0x4[esp]
0040  52				push		edx
0041  6A 01				push		0x00000001
0043  8D 54 24 10			lea		edx,0x10[esp]
0047  52				push		edx
0048  50				push		eax
0049  E8 00 00 00 00			call		_WriteConsoleA
004E  B8 01 00 00 00			mov		eax,0x00000001
0053  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
0059				L$2:
0059  89 D8				mov		eax,ebx
005B  83 C4 08				add		esp,0x00000008
005E  5A				pop		edx
005F  59				pop		ecx
0060  5B				pop		ebx
0061  C3				ret		

Routine Size: 98 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

