Module: fmemcmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000025 bytes
0000				_fmemcmp_:
0000  56				push		esi
0001  57				push		edi
0002  89 C6				mov		esi,eax
0004  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
0008  89 DF				mov		edi,ebx
000A  1E				push		ds
000B  06				push		es
000C  91				xchg		eax,ecx
000D  8E DA				mov		ds,edx
000F  8E C0				mov		es,eax
0011  09 C9				or		ecx,ecx
0013  F3 A6				repe cmpsb	
0015  74 05				je		L$1
0017  19 C9				sbb		ecx,ecx
0019  83 D9 FF				sbb		ecx,0xffffffff
001C				L$1:
001C  07				pop		es
001D  1F				pop		ds
001E  89 C8				mov		eax,ecx
0020  5F				pop		edi
0021  5E				pop		esi
0022  C2 04 00				ret		0x0004

Routine Size: 37 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

