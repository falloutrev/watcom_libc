Module: strcpy
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001F bytes
0000				strcpy_:
0000  51				push		ecx
0001  50				push		eax
0002				L$1:
0002  8A 0A				mov		cl,byte ptr [edx]
0004  88 08				mov		byte ptr [eax],cl
0006  80 F9 00				cmp		cl,0x00
0009  74 11				je		L$2
000B  8A 4A 01				mov		cl,byte ptr 0x1[edx]
000E  83 C2 02				add		edx,0x00000002
0011  88 48 01				mov		byte ptr 0x1[eax],cl
0014  83 C0 02				add		eax,0x00000002
0017  80 F9 00				cmp		cl,0x00
001A  75 E6				jne		L$1
001C				L$2:
001C  58				pop		eax
001D  59				pop		ecx
001E  C3				ret		

Routine Size: 31 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

