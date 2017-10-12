Module: strupr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000025 bytes
0000				_strupr_:
0000				strupr_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  89 C1				mov		ecx,eax
0005  89 C2				mov		edx,eax
0007				L$1:
0007  8A 02				mov		al,byte ptr [edx]
0009  84 C0				test		al,al
000B  74 12				je		L$3
000D  2C 61				sub		al,0x61
000F  31 DB				xor		ebx,ebx
0011  88 C3				mov		bl,al
0013  83 FB 19				cmp		ebx,0x00000019
0016  7F 04				jg		L$2
0018  04 41				add		al,0x41
001A  88 02				mov		byte ptr [edx],al
001C				L$2:
001C  42				inc		edx
001D  EB E8				jmp		L$1
001F				L$3:
001F  89 C8				mov		eax,ecx
0021  5A				pop		edx
0022  59				pop		ecx
0023  5B				pop		ebx
0024  C3				ret		

Routine Size: 37 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

