Module: scanf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000006A bytes
0000				cget_stdin_:
0000  53				push		ebx
0001  52				push		edx
0002  89 C2				mov		edx,eax
0004  B8 00 00 00 00			mov		eax,offset ___iob
0009  E8 00 00 00 00			call		fgetc_
000E  89 C3				mov		ebx,eax
0010  83 F8 FF				cmp		eax,0xffffffff
0013  75 04				jne		L$1
0015  80 4A 10 02			or		byte ptr 0x10[edx],0x02
0019				L$1:
0019  89 D8				mov		eax,ebx
001B  5A				pop		edx
001C  5B				pop		ebx
001D  C3				ret		
001E				uncget_stdin_:
001E  BA 00 00 00 00			mov		edx,offset ___iob
0023  E9 00 00 00 00			jmp		ungetc_

Routine Size: 40 bytes,    Routine Base: _TEXT + 0000

0028				vscanf_:
0028  53				push		ebx
0029  51				push		ecx
002A  83 EC 14				sub		esp,0x00000014
002D  BB 00 00 00 00			mov		ebx,offset cget_stdin_
0032  B9 00 00 00 00			mov		ecx,offset uncget_stdin_
0037  89 1C 24				mov		dword ptr [esp],ebx
003A  89 D3				mov		ebx,edx
003C  89 C2				mov		edx,eax
003E  89 E0				mov		eax,esp
0040  89 4C 24 04			mov		dword ptr 0x4[esp],ecx
0044  E8 00 00 00 00			call		__scnf_
0049  83 C4 14				add		esp,0x00000014
004C  59				pop		ecx
004D  5B				pop		ebx
004E  C3				ret		

Routine Size: 39 bytes,    Routine Base: _TEXT + 0028

004F				scanf_:
004F  52				push		edx
0050  83 EC 04				sub		esp,0x00000004
0053  8D 44 24 10			lea		eax,0x10[esp]
0057  89 E2				mov		edx,esp
0059  89 04 24				mov		dword ptr [esp],eax
005C  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
0060  E8 00 00 00 00			call		vscanf_
0065  83 C4 04				add		esp,0x00000004
0068  5A				pop		edx
0069  C3				ret		

Routine Size: 27 bytes,    Routine Base: _TEXT + 004F

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

