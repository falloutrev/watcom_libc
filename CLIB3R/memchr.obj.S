Module: memchr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001E bytes
0000				memchr_:
0000  51				push		ecx
0001  57				push		edi
0002  89 C7				mov		edi,eax
0004  89 D9				mov		ecx,ebx
0006  88 D0				mov		al,dl
0008  06				push		es
0009  E3 0B				jecxz		L$1
000B  8C DA				mov		edx,ds
000D  8E C2				mov		es,edx
000F  F2 AE				repne scasb	
0011  75 03				jne		L$1
0013  4F				dec		edi
0014  66 A9                                           f.
0016				L$1:
0016  89 CF				mov		edi,ecx
0018  07				pop		es
0019  89 F8				mov		eax,edi
001B  5F				pop		edi
001C  59				pop		ecx
001D  C3				ret		

Routine Size: 30 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

