Module: strnset
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000016 bytes
0000				strnset_:
0000  56				push		esi
0001  89 C6				mov		esi,eax
0003  EB 09				jmp		L$2
0005				L$1:
0005  80 38 00				cmp		byte ptr [eax],0x00
0008  74 08				je		L$3
000A  4B				dec		ebx
000B  88 10				mov		byte ptr [eax],dl
000D  40				inc		eax
000E				L$2:
000E  85 DB				test		ebx,ebx
0010  75 F3				jne		L$1
0012				L$3:
0012  89 F0				mov		eax,esi
0014  5E				pop		esi
0015  C3				ret		

Routine Size: 22 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

