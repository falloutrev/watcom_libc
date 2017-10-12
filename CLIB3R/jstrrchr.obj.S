Module: jstrrchr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000031 bytes
0000				jstrrchr_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  83 EC 04				sub		esp,0x00000004
0006  89 C3				mov		ebx,eax
0008  89 D6				mov		esi,edx
000A  31 C9				xor		ecx,ecx
000C				L$1:
000C  89 E2				mov		edx,esp
000E  89 D8				mov		eax,ebx
0010  E8 00 00 00 00			call		jgetmoji_
0015  8B 14 24				mov		edx,dword ptr [esp]
0018  66 85 D2				test		dx,dx
001B  74 0B				je		L$3
001D  66 39 D6				cmp		si,dx
0020  75 02				jne		L$2
0022  89 D9				mov		ecx,ebx
0024				L$2:
0024  89 C3				mov		ebx,eax
0026  EB E4				jmp		L$1
0028				L$3:
0028  89 C8				mov		eax,ecx
002A  83 C4 04				add		esp,0x00000004
002D  5E				pop		esi
002E  59				pop		ecx
002F  5B				pop		ebx
0030  C3				ret		

Routine Size: 49 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

