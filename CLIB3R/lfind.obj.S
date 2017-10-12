Module: lfind
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002B bytes
0000				lfind_:
0000  56				push		esi
0001  57				push		edi
0002  55				push		ebp
0003  89 E5				mov		ebp,esp
0005  89 C7				mov		edi,eax
0007  89 D6				mov		esi,edx
0009  8B 1B				mov		ebx,dword ptr [ebx]
000B  EB 12				jmp		L$3
000D				L$1:
000D  89 F2				mov		edx,esi
000F  89 F8				mov		eax,edi
0011  FF 55 10				call		dword ptr 0x10[ebp]
0014  85 C0				test		eax,eax
0016  75 04				jne		L$2
0018  89 F0				mov		eax,esi
001A  EB 09				jmp		L$4
001C				L$2:
001C  4B				dec		ebx
001D  01 CE				add		esi,ecx
001F				L$3:
001F  85 DB				test		ebx,ebx
0021  75 EA				jne		L$1
0023  31 C0				xor		eax,eax
0025				L$4:
0025  5D				pop		ebp
0026  5F				pop		edi
0027  5E				pop		esi
0028  C2 04 00				ret		0x0004

Routine Size: 43 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

