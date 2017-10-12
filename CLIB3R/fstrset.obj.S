Module: fstrset
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001D bytes
0000				_fstrset_:
0000  51				push		ecx
0001  56				push		esi
0002  06				push		es
0003  89 D6				mov		esi,edx
0005  89 C1				mov		ecx,eax
0007  8E C2				mov		es,edx
0009  EB 04				jmp		L$2
000B				L$1:
000B  26 88 18				mov		byte ptr es:[eax],bl
000E  40				inc		eax
000F				L$2:
000F  26 80 38 00			cmp		byte ptr es:[eax],0x00
0013  75 F6				jne		L$1
0015  89 F2				mov		edx,esi
0017  89 C8				mov		eax,ecx
0019  07				pop		es
001A  5E				pop		esi
001B  59				pop		ecx
001C  C3				ret		

Routine Size: 29 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

