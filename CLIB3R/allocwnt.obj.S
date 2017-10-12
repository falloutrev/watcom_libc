Module: allocwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000036 bytes
0000				_dos_allocmem_:
0000  53				push		ebx
0001  51				push		ecx
0002  89 D3				mov		ebx,edx
0004  C1 E0 04				shl		eax,0x04
0007  50				push		eax
0008  6A 00				push		0x00000000
000A  E8 00 00 00 00			call		_GlobalAlloc
000F  85 C0				test		eax,eax
0011  75 08				jne		L$1
0013  E8 00 00 00 00			call		__set_errno_nt_
0018  59				pop		ecx
0019  5B				pop		ebx
001A  C3				ret		
001B				L$1:
001B  89 03				mov		dword ptr [ebx],eax
001D  31 C0				xor		eax,eax
001F  59				pop		ecx
0020  5B				pop		ebx
0021  C3				ret		

Routine Size: 34 bytes,    Routine Base: _TEXT + 0000

0022				_dos_freemem_:
0022  51				push		ecx
0023  52				push		edx
0024  50				push		eax
0025  E8 00 00 00 00			call		_GlobalFree
002A  85 C0				test		eax,eax
002C  74 05				je		L$2
002E  E8 00 00 00 00			call		__set_errno_nt_
0033				L$2:
0033  5A				pop		edx
0034  59				pop		ecx
0035  C3				ret		

Routine Size: 20 bytes,    Routine Base: _TEXT + 0022

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

