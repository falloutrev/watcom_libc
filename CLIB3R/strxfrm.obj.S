Module: strxfrm
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001D bytes
0000				strxfrm_:
0000  51				push		ecx
0001  56				push		esi
0002  89 DE				mov		esi,ebx
0004  31 DB				xor		ebx,ebx
0006				L$1:
0006  39 F3				cmp		ebx,esi
0008  73 04				jae		L$2
000A  8A 0A				mov		cl,byte ptr [edx]
000C  88 08				mov		byte ptr [eax],cl
000E				L$2:
000E  80 3A 00				cmp		byte ptr [edx],0x00
0011  74 05				je		L$3
0013  42				inc		edx
0014  40				inc		eax
0015  43				inc		ebx
0016  EB EE				jmp		L$1
0018				L$3:
0018  89 D8				mov		eax,ebx
001A  5E				pop		esi
001B  59				pop		ecx
001C  C3				ret		

Routine Size: 29 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

