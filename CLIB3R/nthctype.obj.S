Module: nthctype
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000032 bytes
0000				nthctype_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  89 C3				mov		ebx,eax
0005  89 D1				mov		ecx,edx
0007  B8 FF FF FF FF			mov		eax,0xffffffff
000C				L$1:
000C  8A 13				mov		dl,byte ptr [ebx]
000E  84 D2				test		dl,dl
0010  75 09				jne		L$2
0012  B8 FF FF FF FF			mov		eax,0xffffffff
0017  5E				pop		esi
0018  59				pop		ecx
0019  5B				pop		ebx
001A  C3				ret		
001B				L$2:
001B  0F B6 F2				movzx		esi,dl
001E  43				inc		ebx
001F  89 C2				mov		edx,eax
0021  89 F0				mov		eax,esi
0023  49				dec		ecx
0024  E8 00 00 00 00			call		chkctype_
0029  83 F9 FF				cmp		ecx,0xffffffff
002C  75 DE				jne		L$1
002E  5E				pop		esi
002F  59				pop		ecx
0030  5B				pop		ebx
0031  C3				ret		

Routine Size: 50 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

