Module: cscanf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000060 bytes
0000				cget_console_:
0000  53				push		ebx
0001  52				push		edx
0002  89 C2				mov		edx,eax
0004  E8 00 00 00 00			call		getche_
0009  89 C3				mov		ebx,eax
000B  83 F8 FF				cmp		eax,0xffffffff
000E  75 04				jne		L$1
0010  80 4A 10 02			or		byte ptr 0x10[edx],0x02
0014				L$1:
0014  89 D8				mov		eax,ebx
0016  5A				pop		edx
0017  5B				pop		ebx
0018  C3				ret		
0019				uncget_console_:
0019  E9 00 00 00 00			jmp		ungetch_

Routine Size: 30 bytes,    Routine Base: _TEXT + 0000

001E				vcscanf_:
001E  53				push		ebx
001F  51				push		ecx
0020  83 EC 14				sub		esp,0x00000014
0023  BB 00 00 00 00			mov		ebx,offset cget_console_
0028  B9 00 00 00 00			mov		ecx,offset uncget_console_
002D  89 1C 24				mov		dword ptr [esp],ebx
0030  89 D3				mov		ebx,edx
0032  89 C2				mov		edx,eax
0034  89 E0				mov		eax,esp
0036  89 4C 24 04			mov		dword ptr 0x4[esp],ecx
003A  E8 00 00 00 00			call		__scnf_
003F  83 C4 14				add		esp,0x00000014
0042  59				pop		ecx
0043  5B				pop		ebx
0044  C3				ret		

Routine Size: 39 bytes,    Routine Base: _TEXT + 001E

0045				cscanf_:
0045  52				push		edx
0046  83 EC 04				sub		esp,0x00000004
0049  8D 44 24 10			lea		eax,0x10[esp]
004D  89 E2				mov		edx,esp
004F  89 04 24				mov		dword ptr [esp],eax
0052  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
0056  E8 00 00 00 00			call		vcscanf_
005B  83 C4 04				add		esp,0x00000004
005E  5A				pop		edx
005F  C3				ret		

Routine Size: 27 bytes,    Routine Base: _TEXT + 0045

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

