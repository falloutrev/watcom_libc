Module: ufscanf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000077 bytes
0000				cget_file_:
0000  53				push		ebx
0001  52				push		edx
0002  89 C2				mov		edx,eax
0004  8B 40 08				mov		eax,dword ptr 0x8[eax]
0007  E8 00 00 00 00			call		_ugetc_
000C  89 C3				mov		ebx,eax
000E  83 F8 FF				cmp		eax,0xffffffff
0011  75 04				jne		L$1
0013  80 4A 10 02			or		byte ptr 0x10[edx],0x02
0017				L$1:
0017  89 D8				mov		eax,ebx
0019  5A				pop		edx
001A  5B				pop		ebx
001B  C3				ret		
001C				uncget_file_:
001C  8B 52 08				mov		edx,dword ptr 0x8[edx]
001F  E9 00 00 00 00			jmp		_uungetc_

Routine Size: 36 bytes,    Routine Base: _TEXT + 0000

0024				_uvfscanf_:
0024  51				push		ecx
0025  C8 14 00 00			enter		0x0014,0x00
0029  89 C1				mov		ecx,eax
002B  8B 40 10				mov		eax,dword ptr 0x10[eax]
002E  FF 15 00 00 00 00			call		dword ptr __AccessFileH
0034  C7 45 EC 00 00 00 00		mov		dword ptr -0x14[ebp],offset cget_file_
003B  C7 45 F0 00 00 00 00		mov		dword ptr -0x10[ebp],offset uncget_file_
0042  89 4D F4				mov		dword ptr -0xc[ebp],ecx
0045  8B 41 10				mov		eax,dword ptr 0x10[ecx]
0048  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
004E  8D 45 EC				lea		eax,-0x14[ebp]
0051  E8 00 00 00 00			call		__uscnf_
0056  C9				leave		
0057  59				pop		ecx
0058  C3				ret		

Routine Size: 53 bytes,    Routine Base: _TEXT + 0024

0059				_ufscanf_:
0059  53				push		ebx
005A  52				push		edx
005B  C8 04 00 00			enter		0x0004,0x00
005F  8D 45 18				lea		eax,0x18[ebp]
0062  8D 5D FC				lea		ebx,-0x4[ebp]
0065  8B 55 14				mov		edx,dword ptr 0x14[ebp]
0068  89 45 FC				mov		dword ptr -0x4[ebp],eax
006B  8B 45 10				mov		eax,dword ptr 0x10[ebp]
006E  E8 00 00 00 00			call		_uvfscanf_
0073  C9				leave		
0074  5A				pop		edx
0075  5B				pop		ebx
0076  C3				ret		

Routine Size: 30 bytes,    Routine Base: _TEXT + 0059

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

