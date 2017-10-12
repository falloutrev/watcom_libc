Module: fjstradv
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000014 bytes
0000				_fjstradv_:
0000  51				push		ecx
0001  56				push		esi
0002  89 D1				mov		ecx,edx
0004  89 C6				mov		esi,eax
0006  9A 00 00 00 00 00 00		call		_fmtob_
000D  89 CA				mov		edx,ecx
000F  01 F0				add		eax,esi
0011  5E				pop		esi
0012  59				pop		ecx
0013  CB				retf		

Routine Size: 20 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

