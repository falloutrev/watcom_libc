Module: chmodwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000003B bytes
0000				chmod_:
0000  53				push		ebx
0001  51				push		ecx
0002  83 EC 04				sub		esp,0x00000004
0005  89 C3				mov		ebx,eax
0007  89 14 24				mov		dword ptr [esp],edx
000A  50				push		eax
000B  E8 00 00 00 00			call		_GetFileAttributesA
0010  83 F8 FF				cmp		eax,0xffffffff
0013  75 07				jne		L$2
0015				L$1:
0015  E8 00 00 00 00			call		__set_errno_nt_
001A  EB 19				jmp		L$4
001C				L$2:
001C  8A 14 24				mov		dl,byte ptr [esp]
001F  24 FE				and		al,0xfe
0021  F6 C2 80				test		dl,0x80
0024  75 02				jne		L$3
0026  0C 01				or		al,0x01
0028				L$3:
0028  50				push		eax
0029  53				push		ebx
002A  E8 00 00 00 00			call		_SetFileAttributesA
002F  85 C0				test		eax,eax
0031  74 E2				je		L$1
0033  31 C0				xor		eax,eax
0035				L$4:
0035  83 C4 04				add		esp,0x00000004
0038  59				pop		ecx
0039  5B				pop		ebx
003A  C3				ret		

Routine Size: 59 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

