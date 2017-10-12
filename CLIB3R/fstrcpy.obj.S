Module: fstrcpy
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002F bytes
0000				_fstrcpy_:
0000  56				push		esi
0001  57				push		edi
0002  1E				push		ds
0003  06				push		es
0004  50				push		eax
0005  66 8E C2				mov		es,dx
0008  66 8E D9				mov		ds,cx
000B  8B F3				mov		esi,ebx
000D  8B F8				mov		edi,eax
000F				L$1:
000F  8A 06				mov		al,byte ptr [esi]
0011  26 88 07				mov		byte ptr es:[edi],al
0014  3C 00				cmp		al,0x00
0016  74 11				je		L$2
0018  8A 46 01				mov		al,byte ptr 0x1[esi]
001B  83 C6 02				add		esi,0x00000002
001E  26 88 47 01			mov		byte ptr es:0x1[edi],al
0022  83 C7 02				add		edi,0x00000002
0025  3C 00				cmp		al,0x00
0027  75 E6				jne		L$1
0029				L$2:
0029  58				pop		eax
002A  07				pop		es
002B  1F				pop		ds
002C  5F				pop		edi
002D  5E				pop		esi
002E  C3				ret		

Routine Size: 47 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

