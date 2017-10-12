Module: sfattwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000020 bytes
0000				_dos_setfileattr_:
0000  51				push		ecx
0001  85 D2				test		edx,edx
0003  75 05				jne		L$1
0005  BA 80 00 00 00			mov		edx,0x00000080
000A				L$1:
000A  52				push		edx
000B  50				push		eax
000C  E8 00 00 00 00			call		_SetFileAttributesA
0011  85 C0				test		eax,eax
0013  75 07				jne		L$2
0015  E8 00 00 00 00			call		__set_errno_nt_
001A  59				pop		ecx
001B  C3				ret		
001C				L$2:
001C  31 C0				xor		eax,eax
001E  59				pop		ecx
001F  C3				ret		

Routine Size: 32 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

