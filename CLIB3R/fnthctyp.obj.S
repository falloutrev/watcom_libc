Module: fnthctyp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000033 bytes
0000				_fnthctype_:
0000  51				push		ecx
0001  56				push		esi
0002  06				push		es
0003  8E C2				mov		es,edx
0005  89 C1				mov		ecx,eax
0007  B8 FF FF FF FF			mov		eax,0xffffffff
000C				L$1:
000C  26 8A 11				mov		dl,byte ptr es:[ecx]
000F  84 D2				test		dl,dl
0011  75 09				jne		L$2
0013  B8 FF FF FF FF			mov		eax,0xffffffff
0018  07				pop		es
0019  5E				pop		esi
001A  59				pop		ecx
001B  CB				retf		
001C				L$2:
001C  0F B6 F2				movzx		esi,dl
001F  41				inc		ecx
0020  89 C2				mov		edx,eax
0022  89 F0				mov		eax,esi
0024  4B				dec		ebx
0025  E8 00 00 00 00			call		chkctype_
002A  83 FB FF				cmp		ebx,0xffffffff
002D  75 DD				jne		L$1
002F  07				pop		es
0030  5E				pop		esi
0031  59				pop		ecx
0032  CB				retf		

Routine Size: 51 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

