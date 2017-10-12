Module: strncmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000029 bytes
0000				strncmp_:
0000  51				push		ecx
0001				L$1:
0001  85 DB				test		ebx,ebx
0003  75 04				jne		L$3
0005				L$2:
0005  31 C0				xor		eax,eax
0007  59				pop		ecx
0008  C3				ret		
0009				L$3:
0009  8A 08				mov		cl,byte ptr [eax]
000B  8A 2A				mov		ch,byte ptr [edx]
000D  38 E9				cmp		cl,ch
000F  74 0E				je		L$4
0011  31 DB				xor		ebx,ebx
0013  31 C0				xor		eax,eax
0015  88 CB				mov		bl,cl
0017  88 E8				mov		al,ch
0019  29 C3				sub		ebx,eax
001B  89 D8				mov		eax,ebx
001D  59				pop		ecx
001E  C3				ret		
001F				L$4:
001F  80 38 00				cmp		byte ptr [eax],0x00
0022  74 E1				je		L$2
0024  40				inc		eax
0025  42				inc		edx
0026  4B				dec		ebx
0027  EB D8				jmp		L$1

Routine Size: 41 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

