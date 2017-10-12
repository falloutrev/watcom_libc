Module: jperror
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000004C bytes
0000				jperror_:
0000  52				push		edx
0001  85 C0				test		eax,eax
0003  74 1E				je		L$1
0005  80 38 00				cmp		byte ptr [eax],0x00
0008  74 19				je		L$1
000A  BA 34 00 00 00			mov		edx,offset ___iob+0x34
000F  E8 00 00 00 00			call		fputs_
0014  BA 34 00 00 00			mov		edx,offset ___iob+0x34
0019  B8 00 00 00 00			mov		eax,offset DGROUP:L$2
001E  E8 00 00 00 00			call		fputs_
0023				L$1:
0023  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0029  8B 40 04				mov		eax,dword ptr 0x4[eax]
002C  BA 34 00 00 00			mov		edx,offset ___iob+0x34
0031  E8 00 00 00 00			call		jstrerror_
0036  E8 00 00 00 00			call		fputs_
003B  BA 34 00 00 00			mov		edx,offset ___iob+0x34
0040  B8 0A 00 00 00			mov		eax,0x0000000a
0045  E8 00 00 00 00			call		fputc_
004A  5A				pop		edx
004B  C3				ret		

Routine Size: 76 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000003 bytes
0000				L$2:
0000  3A 20 00                                        : .

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

