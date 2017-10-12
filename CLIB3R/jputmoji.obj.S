Module: jputmoji
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000024 bytes
0000				jputmoji_:
0000  53				push		ebx
0001  51				push		ecx
0002  89 C3				mov		ebx,eax
0004  31 C9				xor		ecx,ecx
0006  66 89 D1				mov		cx,dx
0009  89 C8				mov		eax,ecx
000B  E8 00 00 00 00			call		jiszen_
0010  85 C0				test		eax,eax
0012  74 08				je		L$1
0014  89 C8				mov		eax,ecx
0016  C1 F8 08				sar		eax,0x08
0019  88 03				mov		byte ptr [ebx],al
001B  43				inc		ebx
001C				L$1:
001C  8D 43 01				lea		eax,0x1[ebx]
001F  88 13				mov		byte ptr [ebx],dl
0021  59				pop		ecx
0022  5B				pop		ebx
0023  C3				ret		

Routine Size: 36 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

