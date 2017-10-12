Module: tcsinc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000023 bytes
0000				_tcsinc_:
0000  52				push		edx
0001  8B 15 00 00 00 00			mov		edx,dword ptr ___IsDBCS
0007  85 D2				test		edx,edx
0009  74 13				je		L$1
000B  31 D2				xor		edx,edx
000D  8A 10				mov		dl,byte ptr [eax]
000F  8A 92 01 00 00 00			mov		dl,byte ptr ___MBCSIsTable+0x1[edx]
0015  80 E2 01				and		dl,0x01
0018  81 E2 FF 00 00 00			and		edx,0x000000ff
001E				L$1:
001E  40				inc		eax
001F  01 D0				add		eax,edx
0021  5A				pop		edx
0022  C3				ret		

Routine Size: 35 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

