Module: isdbcs
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS,XIB,XI,XIE

Segment: _TEXT BYTE USE32 00000031 bytes
0000				__checkIsDBCS_:
0000  51				push		ecx
0001  52				push		edx
0002  83 EC 14				sub		esp,0x00000014
0005  89 E0				mov		eax,esp
0007  50				push		eax
0008  6A 01				push		0x00000001
000A  E8 00 00 00 00			call		_GetCPInfo
000F  85 C0				test		eax,eax
0011  74 18				je		L$2
0013  80 7C 24 06 00			cmp		byte ptr 0x6[esp],0x00
0018  75 07				jne		L$1
001A  80 7C 24 07 00			cmp		byte ptr 0x7[esp],0x00
001F  74 0A				je		L$2
0021				L$1:
0021  C7 05 00 00 00 00 01 00 00 00
					mov		dword ptr ___IsDBCS,0x00000001
002B				L$2:
002B  83 C4 14				add		esp,0x00000014
002E  5A				pop		edx
002F  59				pop		ecx
0030  C3				ret		

Routine Size: 49 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000004 bytes
0000				___IsDBCS:
0000  00 00 00 00                                     ....

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

Segment: XIB BYTE USE32 00000000 bytes

Segment: XI BYTE USE32 00000006 bytes
0000				___anon163:
0000  00 20                                           . 
0002  00 00 00 00                                     DD	offset __checkIsDBCS_

Segment: XIE BYTE USE32 00000000 bytes

