Module: fmemchr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001C bytes
0000				_fmemchr_:
0000  57				push		edi
0001  89 C7				mov		edi,eax
0003  88 D8				mov		al,bl
0005  06				push		es
0006  E3 0B				jecxz		L$1
0008  8E C2				mov		es,edx
000A  F2 AE				repne scasb	
000C  75 05				jne		L$1
000E  4F				dec		edi
000F  8C C1				mov		ecx,es
0011  66 A9                                           f.
0013				L$1:
0013  89 CF				mov		edi,ecx
0015  07				pop		es
0016  89 CA				mov		edx,ecx
0018  89 F8				mov		eax,edi
001A  5F				pop		edi
001B  C3				ret		

Routine Size: 28 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

