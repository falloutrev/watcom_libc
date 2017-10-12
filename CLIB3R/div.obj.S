Module: div
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000038 bytes
0000				div_:
0000  53				push		ebx
0001  51				push		ecx
0002  57				push		edi
0003  06				push		es
0004  83 EC 08				sub		esp,0x00000008
0007  89 F1				mov		ecx,esi
0009  89 C3				mov		ebx,eax
000B  89 D6				mov		esi,edx
000D  89 C2				mov		edx,eax
000F  C1 FA 1F				sar		edx,0x1f
0012  F7 FE				idiv		esi
0014  89 04 24				mov		dword ptr [esp],eax
0017  89 DA				mov		edx,ebx
0019  89 D8				mov		eax,ebx
001B  C1 FA 1F				sar		edx,0x1f
001E  F7 FE				idiv		esi
0020  89 CF				mov		edi,ecx
0022  8C D8				mov		eax,ds
0024  89 E6				mov		esi,esp
0026  8E C0				mov		es,eax
0028  89 54 24 04			mov		dword ptr 0x4[esp],edx
002C  A5				movsd		
002D  A5				movsd		
002E  89 C8				mov		eax,ecx
0030  83 C4 08				add		esp,0x00000008
0033  07				pop		es
0034  5F				pop		edi
0035  59				pop		ecx
0036  5B				pop		ebx
0037  C3				ret		

Routine Size: 56 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

