Module: mbccpy
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000034 bytes
0000				_mbccpy_:
0000  53				push		ebx
0001  8B 1D 00 00 00 00			mov		ebx,dword ptr ___IsDBCS
0007  85 DB				test		ebx,ebx
0009  74 13				je		L$1
000B  31 DB				xor		ebx,ebx
000D  8A 1A				mov		bl,byte ptr [edx]
000F  8A 9B 01 00 00 00			mov		bl,byte ptr ___MBCSIsTable+0x1[ebx]
0015  80 E3 01				and		bl,0x01
0018  81 E3 FF 00 00 00			and		ebx,0x000000ff
001E				L$1:
001E  85 DB				test		ebx,ebx
0020  74 0C				je		L$2
0022  8A 1A				mov		bl,byte ptr [edx]
0024  88 18				mov		byte ptr [eax],bl
0026  8A 52 01				mov		dl,byte ptr 0x1[edx]
0029  88 50 01				mov		byte ptr 0x1[eax],dl
002C  5B				pop		ebx
002D  C3				ret		
002E				L$2:
002E  8A 12				mov		dl,byte ptr [edx]
0030  88 10				mov		byte ptr [eax],dl
0032  5B				pop		ebx
0033  C3				ret		

Routine Size: 52 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

