Module: uscanf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000063 bytes
0000				cget_stdin_:
0000  53				push		ebx
0001  52				push		edx
0002  89 C2				mov		edx,eax
0004  B8 00 00 00 00			mov		eax,offset ___iob
0009  E8 00 00 00 00			call		_ugetc_
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
0023  E9 00 00 00 00			jmp		_uungetc_

Routine Size: 40 bytes,    Routine Base: _TEXT + 0000

0028				_uvscanf_:
0028  53				push		ebx
0029  C8 14 00 00			enter		0x0014,0x00
002D  C7 45 EC 00 00 00 00		mov		dword ptr -0x14[ebp],offset cget_stdin_
0034  89 D3				mov		ebx,edx
0036  89 C2				mov		edx,eax
0038  8D 45 EC				lea		eax,-0x14[ebp]
003B  C7 45 F0 00 00 00 00		mov		dword ptr -0x10[ebp],offset uncget_stdin_
0042  E8 00 00 00 00			call		__uscnf_
0047  C9				leave		
0048  5B				pop		ebx
0049  C3				ret		

Routine Size: 34 bytes,    Routine Base: _TEXT + 0028

004A				_uscanf_:
004A  52				push		edx
004B  C8 04 00 00			enter		0x0004,0x00
004F  8D 45 10				lea		eax,0x10[ebp]
0052  8D 55 FC				lea		edx,-0x4[ebp]
0055  89 45 FC				mov		dword ptr -0x4[ebp],eax
0058  8B 45 0C				mov		eax,dword ptr 0xc[ebp]
005B  E8 00 00 00 00			call		_uvscanf_
0060  C9				leave		
0061  5A				pop		edx
0062  C3				ret		

Routine Size: 25 bytes,    Routine Base: _TEXT + 004A

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

