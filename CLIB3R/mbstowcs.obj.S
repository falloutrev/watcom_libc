Module: mbstowcs
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000037 bytes
0000				mbstowcs_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  89 C1				mov		ecx,eax
0006  89 D6				mov		esi,edx
0008  89 DF				mov		edi,ebx
000A  31 ED				xor		ebp,ebp
000C  EB 1E				jmp		L$2
000E				L$1:
000E  BB 02 00 00 00			mov		ebx,0x00000002
0013  89 F2				mov		edx,esi
0015  89 C8				mov		eax,ecx
0017  E8 00 00 00 00			call		mbtowc_
001C  83 F8 FF				cmp		eax,0xffffffff
001F  74 11				je		L$4
0021  85 C0				test		eax,eax
0023  74 0B				je		L$3
0025  83 C1 02				add		ecx,0x00000002
0028  45				inc		ebp
0029  4F				dec		edi
002A  01 C6				add		esi,eax
002C				L$2:
002C  85 FF				test		edi,edi
002E  75 DE				jne		L$1
0030				L$3:
0030  89 E8				mov		eax,ebp
0032				L$4:
0032  5D				pop		ebp
0033  5F				pop		edi
0034  5E				pop		esi
0035  59				pop		ecx
0036  C3				ret		

Routine Size: 55 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

