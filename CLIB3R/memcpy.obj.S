Module: memcpy
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000025 bytes
0000				memcpy_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  89 D9				mov		ecx,ebx
0005  89 D6				mov		esi,edx
0007  89 C7				mov		edi,eax
0009  06				push		es
000A  8C D8				mov		eax,ds
000C  8E C0				mov		es,eax
000E  57				push		edi
000F  89 C8				mov		eax,ecx
0011  C1 E9 02				shr		ecx,0x02
0014  F2 A5				repne movsd	
0016  8A C8				mov		cl,al
0018  80 E1 03				and		cl,0x03
001B  F2 A4				repne movsb	
001D  5F				pop		edi
001E  07				pop		es
001F  89 F8				mov		eax,edi
0021  5F				pop		edi
0022  5E				pop		esi
0023  59				pop		ecx
0024  C3				ret		

Routine Size: 37 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

