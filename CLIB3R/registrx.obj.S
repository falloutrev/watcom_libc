Module: registrx
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001E bytes
0000				_beginthreadex_:
0000  56				push		esi
0001  57				push		edi
0002  8B 74 24 10			mov		esi,dword ptr 0x10[esp]
0006  56				push		esi
0007  8B 7C 24 10			mov		edi,dword ptr 0x10[esp]
000B  57				push		edi
000C  FF 15 00 00 00 00			call		dword ptr ___BeginThreadEx
0012  5F				pop		edi
0013  5E				pop		esi
0014  C2 08 00				ret		0x0008

Routine Size: 23 bytes,    Routine Base: _TEXT + 0000

0017				_endthreadex_:
0017  FF 15 00 00 00 00			call		dword ptr ___EndThreadEx
001D  C3				ret		

Routine Size: 7 bytes,    Routine Base: _TEXT + 0017

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000008 bytes
0000				___BeginThreadEx:
0000  00 00 00 00                                     DD	offset __CBeginThreadEx_
0004				___EndThreadEx:
0004  00 00 00 00                                     DD	offset __CEndThreadEx_

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

