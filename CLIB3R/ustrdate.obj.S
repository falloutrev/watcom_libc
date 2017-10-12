Module: ustrdate
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000003C bytes
0000				_ustrdate_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  83 EC 28				sub		esp,0x00000028
0007  89 C6				mov		esi,eax
0009  89 E2				mov		edx,esp
000B  31 C0				xor		eax,eax
000D  89 E1				mov		ecx,esp
000F  E8 00 00 00 00			call		time_
0014  89 44 24 24			mov		dword ptr 0x24[esp],eax
0018  8D 44 24 24			lea		eax,0x24[esp]
001C  BB 00 00 00 00			mov		ebx,offset DGROUP:L$1
0021  E8 00 00 00 00			call		_localtime_
0026  BA 09 00 00 00			mov		edx,0x00000009
002B  89 F0				mov		eax,esi
002D  E8 00 00 00 00			call		_ustrftime_ms_
0032  89 F0				mov		eax,esi
0034  83 C4 28				add		esp,0x00000028
0037  5E				pop		esi
0038  5A				pop		edx
0039  59				pop		ecx
003A  5B				pop		ebx
003B  C3				ret		

Routine Size: 60 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000003 bytes
0000				L$1:
0000  25 44 00                                        %D.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

