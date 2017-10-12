Module: gtimewnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000041 bytes
0000				_dos_gettime_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  83 EC 10				sub		esp,0x00000010
0006  89 C3				mov		ebx,eax
0008  89 E0				mov		eax,esp
000A  50				push		eax
000B  E8 00 00 00 00			call		_GetLocalTime
0010  8A 44 24 08			mov		al,byte ptr 0x8[esp]
0014  88 03				mov		byte ptr [ebx],al
0016  8A 44 24 0A			mov		al,byte ptr 0xa[esp]
001A  88 43 01				mov		byte ptr 0x1[ebx],al
001D  8A 44 24 0C			mov		al,byte ptr 0xc[esp]
0021  31 D2				xor		edx,edx
0023  88 43 02				mov		byte ptr 0x2[ebx],al
0026  66 8B 54 24 0E			mov		dx,word ptr 0xe[esp]
002B  B9 0A 00 00 00			mov		ecx,0x0000000a
0030  89 D0				mov		eax,edx
0032  C1 FA 1F				sar		edx,0x1f
0035  F7 F9				idiv		ecx
0037  88 43 03				mov		byte ptr 0x3[ebx],al
003A  83 C4 10				add		esp,0x00000010
003D  5A				pop		edx
003E  59				pop		ecx
003F  5B				pop		ebx
0040  C3				ret		

Routine Size: 65 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

