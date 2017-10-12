Module: strcoll
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000022 bytes
0000				strcoll_:
0000  53				push		ebx
0001  EB 0B				jmp		L$3
0003				L$1:
0003  80 38 00				cmp		byte ptr [eax],0x00
0006  75 04				jne		L$2
0008  31 C0				xor		eax,eax
000A  5B				pop		ebx
000B  C3				ret		
000C				L$2:
000C  40				inc		eax
000D  42				inc		edx
000E				L$3:
000E  8A 18				mov		bl,byte ptr [eax]
0010  3A 1A				cmp		bl,byte ptr [edx]
0012  74 EF				je		L$1
0014  31 DB				xor		ebx,ebx
0016  8A 18				mov		bl,byte ptr [eax]
0018  31 C0				xor		eax,eax
001A  8A 02				mov		al,byte ptr [edx]
001C  29 C3				sub		ebx,eax
001E  89 D8				mov		eax,ebx
0020  5B				pop		ebx
0021  C3				ret		

Routine Size: 34 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

