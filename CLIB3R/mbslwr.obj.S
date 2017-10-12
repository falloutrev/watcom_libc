Module: mbslwr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000004E bytes
0000				_mbslwr_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  57				push		edi
0005  83 EC 04				sub		esp,0x00000004
0008  89 C6				mov		esi,eax
000A  8B 15 00 00 00 00			mov		edx,dword ptr ___IsDBCS
0010  89 C3				mov		ebx,eax
0012  85 D2				test		edx,edx
0014  74 2A				je		L$3
0016  EB 10				jmp		L$2
0018				L$1:
0018  89 F8				mov		eax,edi
001A  E8 00 00 00 00			call		_mbctolower_
001F  89 C2				mov		edx,eax
0021  89 C8				mov		eax,ecx
0023  E8 00 00 00 00			call		_mbputchar_
0028				L$2:
0028  89 C1				mov		ecx,eax
002A  89 E2				mov		edx,esp
002C  89 D8				mov		eax,ebx
002E  E8 00 00 00 00			call		_mbgetcode_
0033  8B 3C 24				mov		edi,dword ptr [esp]
0036  89 C3				mov		ebx,eax
0038  85 FF				test		edi,edi
003A  75 DC				jne		L$1
003C  89 F0				mov		eax,esi
003E  EB 05				jmp		L$4
0040				L$3:
0040  E8 00 00 00 00			call		strlwr_
0045				L$4:
0045  83 C4 04				add		esp,0x00000004
0048  5F				pop		edi
0049  5E				pop		esi
004A  5A				pop		edx
004B  59				pop		ecx
004C  5B				pop		ebx
004D  C3				ret		

Routine Size: 78 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

