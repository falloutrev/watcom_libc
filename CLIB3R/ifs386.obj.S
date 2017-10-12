Module: ifs386
GROUP: 'DGROUP' _DATA

Segment: _TEXT WORD USE32 0000003C bytes
0000				__U4FS:
0000  09 C0				or		eax,eax
0002  74 26				je		L$1
0004  51				push		ecx
0005  0F BD C8				bsr		ecx,eax
0008  88 CD				mov		ch,cl
000A  F6 D9				neg		cl
000C  80 C1 17				add		cl,0x17
000F  80 E1 1F				and		cl,0x1f
0012  D3 C0				rol		eax,cl
0014  25 FF FF 7F 00			and		eax,0x007fffff
0019  88 E9				mov		cl,ch
001B  80 C1 7F				add		cl,0x7f
001E  81 E1 FF 00 00 00			and		ecx,0x000000ff
0024  C1 E1 17				shl		ecx,0x17
0027  09 C8				or		eax,ecx
0029  59				pop		ecx
002A				L$1:
002A  C3				ret		

Routine Size: 43 bytes,    Routine Base: _TEXT + 0000

002B				__I4FS:
002B  09 C0				or		eax,eax
002D  79 D1				jns		__U4FS
002F  F7 D8				neg		eax
0031  E8 CA FF FF FF			call		__U4FS
0036  0D 00 00 00 80			or		eax,0x80000000
003B  C3				ret		

Routine Size: 17 bytes,    Routine Base: _TEXT + 002B

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes

