Module: memccpy
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001C bytes
0000				memccpy_:
0000  56				push		esi
0001  89 DE				mov		esi,ebx
0003				L$1:
0003  85 C9				test		ecx,ecx
0005  74 11				je		L$2
0007  8A 1A				mov		bl,byte ptr [edx]
0009  88 18				mov		byte ptr [eax],bl
000B  31 DB				xor		ebx,ebx
000D  8A 1A				mov		bl,byte ptr [edx]
000F  40				inc		eax
0010  39 F3				cmp		ebx,esi
0012  74 06				je		L$3
0014  42				inc		edx
0015  49				dec		ecx
0016  EB EB				jmp		L$1
0018				L$2:
0018  31 C0				xor		eax,eax
001A				L$3:
001A  5E				pop		esi
001B  C3				ret		

Routine Size: 28 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

