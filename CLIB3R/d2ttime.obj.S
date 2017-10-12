Module: d2ttime
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000066 bytes
0000				_d2ttime_:
0000  53				push		ebx
0001  83 EC 24				sub		esp,0x00000024
0004  89 C3				mov		ebx,eax
0006  81 E3 00 FE 00 00			and		ebx,0x0000fe00
000C  C1 EB 09				shr		ebx,0x09
000F  83 C3 50				add		ebx,0x00000050
0012  89 5C 24 14			mov		dword ptr 0x14[esp],ebx
0016  89 C3				mov		ebx,eax
0018  83 E0 1F				and		eax,0x0000001f
001B  89 44 24 0C			mov		dword ptr 0xc[esp],eax
001F  89 D0				mov		eax,edx
0021  81 E3 E0 01 00 00			and		ebx,0x000001e0
0027  25 00 F8 00 00			and		eax,0x0000f800
002C  C1 EB 05				shr		ebx,0x05
002F  C1 E8 0B				shr		eax,0x0b
0032  4B				dec		ebx
0033  89 44 24 08			mov		dword ptr 0x8[esp],eax
0037  89 D0				mov		eax,edx
0039  89 5C 24 10			mov		dword ptr 0x10[esp],ebx
003D  25 E0 07 00 00			and		eax,0x000007e0
0042  83 E2 1F				and		edx,0x0000001f
0045  C1 E8 05				shr		eax,0x05
0048  01 D2				add		edx,edx
004A  89 44 24 04			mov		dword ptr 0x4[esp],eax
004E  89 14 24				mov		dword ptr [esp],edx
0051  BA FF FF FF FF			mov		edx,0xffffffff
0056  89 E0				mov		eax,esp
0058  89 54 24 20			mov		dword ptr 0x20[esp],edx
005C  E8 00 00 00 00			call		mktime_
0061  83 C4 24				add		esp,0x00000024
0064  5B				pop		ebx
0065  C3				ret		

Routine Size: 102 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

