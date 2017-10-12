Module: sscanf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000075 bytes
0000				cget_string_:
0000  53				push		ebx
0001  52				push		edx
0002  8B 58 08				mov		ebx,dword ptr 0x8[eax]
0005  31 D2				xor		edx,edx
0007  8A 13				mov		dl,byte ptr [ebx]
0009  85 D2				test		edx,edx
000B  74 09				je		L$1
000D  43				inc		ebx
000E  89 58 08				mov		dword ptr 0x8[eax],ebx
0011  89 D0				mov		eax,edx
0013  5A				pop		edx
0014  5B				pop		ebx
0015  C3				ret		
0016				L$1:
0016  8A 58 10				mov		bl,byte ptr 0x10[eax]
0019  80 CB 02				or		bl,0x02
001C  BA FF FF FF FF			mov		edx,0xffffffff
0021  88 58 10				mov		byte ptr 0x10[eax],bl
0024  89 D0				mov		eax,edx
0026  5A				pop		edx
0027  5B				pop		ebx
0028  C3				ret		
0029				uncget_string_:
0029  FF 4A 08				dec		dword ptr 0x8[edx]
002C  C3				ret		

Routine Size: 45 bytes,    Routine Base: _TEXT + 0000

002D				vsscanf_:
002D  51				push		ecx
002E  56				push		esi
002F  83 EC 14				sub		esp,0x00000014
0032  B9 00 00 00 00			mov		ecx,offset cget_string_
0037  BE 00 00 00 00			mov		esi,offset uncget_string_
003C  89 44 24 08			mov		dword ptr 0x8[esp],eax
0040  89 E0				mov		eax,esp
0042  89 0C 24				mov		dword ptr [esp],ecx
0045  89 74 24 04			mov		dword ptr 0x4[esp],esi
0049  E8 00 00 00 00			call		__scnf_
004E  83 C4 14				add		esp,0x00000014
0051  5E				pop		esi
0052  59				pop		ecx
0053  C3				ret		

Routine Size: 39 bytes,    Routine Base: _TEXT + 002D

0054				sscanf_:
0054  53				push		ebx
0055  52				push		edx
0056  83 EC 04				sub		esp,0x00000004
0059  8D 44 24 18			lea		eax,0x18[esp]
005D  89 E3				mov		ebx,esp
005F  8B 54 24 14			mov		edx,dword ptr 0x14[esp]
0063  89 04 24				mov		dword ptr [esp],eax
0066  8B 44 24 10			mov		eax,dword ptr 0x10[esp]
006A  E8 00 00 00 00			call		vsscanf_
006F  83 C4 04				add		esp,0x00000004
0072  5A				pop		edx
0073  5B				pop		ebx
0074  C3				ret		

Routine Size: 33 bytes,    Routine Base: _TEXT + 0054

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

