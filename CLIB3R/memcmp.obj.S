Module: memcmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001E bytes
0000				memcmp_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  89 D9				mov		ecx,ebx
0005  89 D7				mov		edi,edx
0007  89 C6				mov		esi,eax
0009  06				push		es
000A  8C D8				mov		eax,ds
000C  8E C0				mov		es,eax
000E  31 C0				xor		eax,eax
0010  F3 A6				repe cmpsb	
0012  74 05				je		L$1
0014  19 C0				sbb		eax,eax
0016  83 D8 FF				sbb		eax,0xffffffff
0019				L$1:
0019  07				pop		es
001A  5F				pop		edi
001B  5E				pop		esi
001C  59				pop		ecx
001D  C3				ret		

Routine Size: 30 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

