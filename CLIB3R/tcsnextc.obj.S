Module: tcsnextc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000039 bytes
0000				_tcsnextc_:
0000  53				push		ebx
0001  52				push		edx
0002  8B 1D 00 00 00 00			mov		ebx,dword ptr ___IsDBCS
0008  31 D2				xor		edx,edx
000A  85 DB				test		ebx,ebx
000C  74 13				je		L$1
000E  31 DB				xor		ebx,ebx
0010  8A 18				mov		bl,byte ptr [eax]
0012  8A 9B 01 00 00 00			mov		bl,byte ptr ___MBCSIsTable+0x1[ebx]
0018  80 E3 01				and		bl,0x01
001B  81 E3 FF 00 00 00			and		ebx,0x000000ff
0021				L$1:
0021  85 DB				test		ebx,ebx
0023  74 08				je		L$2
0025  31 D2				xor		edx,edx
0027  8A 10				mov		dl,byte ptr [eax]
0029  C1 E2 08				shl		edx,0x08
002C  40				inc		eax
002D				L$2:
002D  8A 00				mov		al,byte ptr [eax]
002F  25 FF 00 00 00			and		eax,0x000000ff
0034  01 D0				add		eax,edx
0036  5A				pop		edx
0037  5B				pop		ebx
0038  C3				ret		

Routine Size: 57 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

