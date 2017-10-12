Module: strncpy
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000025 bytes
0000				strncpy_:
0000  51				push		ecx
0001  56				push		esi
0002  89 C6				mov		esi,eax
0004  EB 0B				jmp		L$2
0006				L$1:
0006  8A 0A				mov		cl,byte ptr [edx]
0008  84 C9				test		cl,cl
000A  74 09				je		L$3
000C  42				inc		edx
000D  4B				dec		ebx
000E  88 08				mov		byte ptr [eax],cl
0010  40				inc		eax
0011				L$2:
0011  85 DB				test		ebx,ebx
0013  75 F1				jne		L$1
0015				L$3:
0015  85 DB				test		ebx,ebx
0017  74 07				je		L$4
0019  4B				dec		ebx
001A  C6 00 00				mov		byte ptr [eax],0x00
001D  40				inc		eax
001E  EB F5				jmp		L$3
0020				L$4:
0020  89 F0				mov		eax,esi
0022  5E				pop		esi
0023  59				pop		ecx
0024  C3				ret		

Routine Size: 37 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

