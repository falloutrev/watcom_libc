Module: uaccswnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000032 bytes
0000				_uaccess_:
0000  53				push		ebx
0001  51				push		ecx
0002  89 D3				mov		ebx,edx
0004  50				push		eax
0005  E8 00 00 00 00			call		_GetFileAttributesW
000A  83 F8 FF				cmp		eax,0xffffffff
000D  75 08				jne		L$1
000F  E8 00 00 00 00			call		__set_errno_nt_
0014  59				pop		ecx
0015  5B				pop		ebx
0016  C3				ret		
0017				L$1:
0017  F6 C3 02				test		bl,0x02
001A  74 11				je		L$2
001C  A8 01				test		al,0x01
001E  74 0D				je		L$2
0020  B8 05 00 00 00			mov		eax,0x00000005
0025  E8 00 00 00 00			call		__set_errno_dos_
002A  59				pop		ecx
002B  5B				pop		ebx
002C  C3				ret		
002D				L$2:
002D  31 C0				xor		eax,eax
002F  59				pop		ecx
0030  5B				pop		ebx
0031  C3				ret		

Routine Size: 50 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

