Module: rewind
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000017 bytes
0000				rewind_:
0000  53				push		ebx
0001  52				push		edx
0002  8A 50 0C				mov		dl,byte ptr 0xc[eax]
0005  80 E2 CF				and		dl,0xcf
0008  31 DB				xor		ebx,ebx
000A  88 50 0C				mov		byte ptr 0xc[eax],dl
000D  31 D2				xor		edx,edx
000F  E8 00 00 00 00			call		fseek_
0014  5A				pop		edx
0015  5B				pop		ebx
0016  C3				ret		

Routine Size: 23 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

