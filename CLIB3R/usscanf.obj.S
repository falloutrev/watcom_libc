Module: usscanf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000066 bytes
0000				cget_string_:
0000  53				push		ebx
0001  52				push		edx
0002  8B 50 08				mov		edx,dword ptr 0x8[eax]
0005  0F B7 1A				movzx		ebx,word ptr [edx]
0008  85 DB				test		ebx,ebx
000A  74 0A				je		L$1
000C  42				inc		edx
000D  42				inc		edx
000E  89 50 08				mov		dword ptr 0x8[eax],edx
0011  89 D8				mov		eax,ebx
0013  5A				pop		edx
0014  5B				pop		ebx
0015  C3				ret		
0016				L$1:
0016  BB FF FF FF FF			mov		ebx,0xffffffff
001B  80 48 10 02			or		byte ptr 0x10[eax],0x02
001F  89 D8				mov		eax,ebx
0021  5A				pop		edx
0022  5B				pop		ebx
0023  C3				ret		
0024				uncget_string_:
0024  83 6A 08 02			sub		dword ptr 0x8[edx],0x00000002
0028  C3				ret		

Routine Size: 41 bytes,    Routine Base: _TEXT + 0000

0029				_uvsscanf_:
0029  C8 14 00 00			enter		0x0014,0x00
002D  C7 45 EC 00 00 00 00		mov		dword ptr -0x14[ebp],offset cget_string_
0034  89 45 F4				mov		dword ptr -0xc[ebp],eax
0037  8D 45 EC				lea		eax,-0x14[ebp]
003A  C7 45 F0 00 00 00 00		mov		dword ptr -0x10[ebp],offset uncget_string_
0041  E8 00 00 00 00			call		__uscnf_
0046  C9				leave		
0047  C3				ret		

Routine Size: 31 bytes,    Routine Base: _TEXT + 0029

0048				_usscanf_:
0048  53				push		ebx
0049  52				push		edx
004A  C8 04 00 00			enter		0x0004,0x00
004E  8D 45 18				lea		eax,0x18[ebp]
0051  8D 5D FC				lea		ebx,-0x4[ebp]
0054  8B 55 14				mov		edx,dword ptr 0x14[ebp]
0057  89 45 FC				mov		dword ptr -0x4[ebp],eax
005A  8B 45 10				mov		eax,dword ptr 0x10[ebp]
005D  E8 00 00 00 00			call		_uvsscanf_
0062  C9				leave		
0063  5A				pop		edx
0064  5B				pop		ebx
0065  C3				ret		

Routine Size: 30 bytes,    Routine Base: _TEXT + 0048

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

