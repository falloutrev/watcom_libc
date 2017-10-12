Module: fstrncpy
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000003C bytes
0000				_fstrncpy_:
0000  56				push		esi
0001  57				push		edi
0002  06				push		es
0003  0F A0				push		fs
0005  8E C2				mov		es,edx
0007  8E E1				mov		fs,ecx
0009  8B 54 24 14			mov		edx,dword ptr 0x14[esp]
000D  8C C7				mov		edi,es
000F  89 C6				mov		esi,eax
0011  EB 0D				jmp		L$2
0013				L$1:
0013  64 8A 0B				mov		cl,byte ptr fs:[ebx]
0016  84 C9				test		cl,cl
0018  74 0A				je		L$3
001A  43				inc		ebx
001B  4A				dec		edx
001C  26 88 08				mov		byte ptr es:[eax],cl
001F  40				inc		eax
0020				L$2:
0020  85 D2				test		edx,edx
0022  75 EF				jne		L$1
0024				L$3:
0024  85 D2				test		edx,edx
0026  74 08				je		L$4
0028  4A				dec		edx
0029  26 C6 00 00			mov		byte ptr es:[eax],0x00
002D  40				inc		eax
002E  EB F4				jmp		L$3
0030				L$4:
0030  89 FA				mov		edx,edi
0032  89 F0				mov		eax,esi
0034  0F A1				pop		fs
0036  07				pop		es
0037  5F				pop		edi
0038  5E				pop		esi
0039  C2 04 00				ret		0x0004

Routine Size: 60 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

