Module: jisprint
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000044 bytes
0000				jisprint_:
0000  52				push		edx
0001  88 C2				mov		dl,al
0003  FE C2				inc		dl
0005  81 E2 FF 00 00 00			and		edx,0x000000ff
000B  8A 92 00 00 00 00			mov		dl,byte ptr __IsTable[edx]
0011  80 E2 08				and		dl,0x08
0014  81 E2 FF 00 00 00			and		edx,0x000000ff
001A  75 21				jne		L$1
001C  88 C2				mov		dl,al
001E  8A 92 01 00 00 00			mov		dl,byte ptr __IsKTable+0x1[edx]
0024  80 E2 03				and		dl,0x03
0027  81 E2 FF 00 00 00			and		edx,0x000000ff
002D  75 0E				jne		L$1
002F  25 FF FF 00 00			and		eax,0x0000ffff
0034  E8 00 00 00 00			call		jiszen_
0039  85 C0				test		eax,eax
003B  74 05				je		L$2
003D				L$1:
003D  B8 01 00 00 00			mov		eax,0x00000001
0042				L$2:
0042  5A				pop		edx
0043  C3				ret		

Routine Size: 68 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

