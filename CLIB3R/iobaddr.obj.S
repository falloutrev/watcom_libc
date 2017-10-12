Module: iobaddr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001F bytes
0000				__get_std_stream_:
0000  52				push		edx
0001  83 F8 03				cmp		eax,0x00000003
0004  76 04				jbe		L$1
0006  31 C0				xor		eax,eax
0008  5A				pop		edx
0009  C3				ret		
000A				L$1:
000A  89 C2				mov		edx,eax
000C  C1 E0 02				shl		eax,0x02
000F  29 D0				sub		eax,edx
0011  C1 E0 02				shl		eax,0x02
0014  01 D0				add		eax,edx
0016  01 C0				add		eax,eax
0018  05 00 00 00 00			add		eax,offset ___iob
001D  5A				pop		edx
001E  C3				ret		

Routine Size: 31 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

