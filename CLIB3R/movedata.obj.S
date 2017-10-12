Module: movedata
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000027 bytes
0000				movedata_:
0000  56				push		esi
0001  57				push		edi
0002  89 D6				mov		esi,edx
0004  89 CF				mov		edi,ecx
0006  89 DA				mov		edx,ebx
0008  8B 4C 24 0C			mov		ecx,dword ptr 0xc[esp]
000C  1E				push		ds
000D  06				push		es
000E  8E D8				mov		ds,eax
0010  8E C2				mov		es,edx
0012  89 C8				mov		eax,ecx
0014  C1 E9 02				shr		ecx,0x02
0017  F2 A5				repne movsd	
0019  8A C8				mov		cl,al
001B  80 E1 03				and		cl,0x03
001E  F2 A4				repne movsb	
0020  07				pop		es
0021  1F				pop		ds
0022  5F				pop		edi
0023  5E				pop		esi
0024  C2 04 00				ret		0x0004

Routine Size: 39 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

