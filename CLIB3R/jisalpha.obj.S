Module: jisalpha
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000023 bytes
0000				jisalpha_:
0000  52				push		edx
0001  31 D2				xor		edx,edx
0003  66 89 C2				mov		dx,ax
0006  89 D0				mov		eax,edx
0008  E8 00 00 00 00			call		jisupper_
000D  85 C0				test		eax,eax
000F  75 0B				jne		L$1
0011  89 D0				mov		eax,edx
0013  E8 00 00 00 00			call		jislower_
0018  85 C0				test		eax,eax
001A  74 05				je		L$2
001C				L$1:
001C  B8 01 00 00 00			mov		eax,0x00000001
0021				L$2:
0021  5A				pop		edx
0022  C3				ret		

Routine Size: 35 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

