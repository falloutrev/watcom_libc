Module: ustrncat
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000036 bytes
0000				_ustrncat_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  89 C6				mov		esi,eax
0005  89 D1				mov		ecx,edx
0007  89 DF				mov		edi,ebx
0009  BB FF FF FF FF			mov		ebx,0xffffffff
000E  31 D2				xor		edx,edx
0010  E8 00 00 00 00			call		__umemchr_
0015				L$1:
0015  85 FF				test		edi,edi
0017  74 12				je		L$2
0019  66 8B 11				mov		dx,word ptr [ecx]
001C  66 89 10				mov		word ptr [eax],dx
001F  66 85 D2				test		dx,dx
0022  74 07				je		L$2
0024  40				inc		eax
0025  40				inc		eax
0026  41				inc		ecx
0027  41				inc		ecx
0028  4F				dec		edi
0029  EB EA				jmp		L$1
002B				L$2:
002B  66 C7 00 00 00			mov		word ptr [eax],0x0000
0030  89 F0				mov		eax,esi
0032  5F				pop		edi
0033  5E				pop		esi
0034  59				pop		ecx
0035  C3				ret		

Routine Size: 54 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

