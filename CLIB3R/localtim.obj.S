Module: localtim
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000068 bytes
0000				_localtime_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  57				push		edi
0004  89 C7				mov		edi,eax
0006  89 D6				mov		esi,edx
0008  E8 00 00 00 00			call		tzset_
000D  B8 DF 63 00 00			mov		eax,0x000063df
0012  8B 1D 00 00 00 00			mov		ebx,dword ptr _timezone
0018  8B 3F				mov		edi,dword ptr [edi]
001A  89 D1				mov		ecx,edx
001C  89 FA				mov		edx,edi
001E  E8 00 00 00 00			call		__brktime_
0023  89 F0				mov		eax,esi
0025  E8 00 00 00 00			call		__isindst_
002A  85 C0				test		eax,eax
002C  74 1C				je		L$1
002E  B8 DF 63 00 00			mov		eax,0x000063df
0033  8B 1D 00 00 00 00			mov		ebx,dword ptr _timezone
0039  8B 15 00 00 00 00			mov		edx,dword ptr ___dst_adjust
003F  89 F1				mov		ecx,esi
0041  29 D3				sub		ebx,edx
0043  89 FA				mov		edx,edi
0045  E8 00 00 00 00			call		__brktime_
004A				L$1:
004A  89 F0				mov		eax,esi
004C  5F				pop		edi
004D  5E				pop		esi
004E  59				pop		ecx
004F  5B				pop		ebx
0050  C3				ret		

Routine Size: 81 bytes,    Routine Base: _TEXT + 0000

0051				localtime_:
0051  53				push		ebx
0052  52				push		edx
0053  89 C3				mov		ebx,eax
0055  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
005B  8D 50 14				lea		edx,0x14[eax]
005E  89 D8				mov		eax,ebx
0060  E8 00 00 00 00			call		_localtime_
0065  5A				pop		edx
0066  5B				pop		ebx
0067  C3				ret		

Routine Size: 23 bytes,    Routine Base: _TEXT + 0051

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

