Module: mkdirwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001B bytes
0000				mkdir_:
0000  51				push		ecx
0001  52				push		edx
0002  6A 00				push		0x00000000
0004  50				push		eax
0005  E8 00 00 00 00			call		_CreateDirectoryA
000A  85 C0				test		eax,eax
000C  75 08				jne		L$1
000E  E8 00 00 00 00			call		__set_errno_nt_
0013  5A				pop		edx
0014  59				pop		ecx
0015  C3				ret		
0016				L$1:
0016  31 C0				xor		eax,eax
0018  5A				pop		edx
0019  59				pop		ecx
001A  C3				ret		

Routine Size: 27 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

