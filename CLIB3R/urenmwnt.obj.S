Module: urenmwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000017 bytes
0000				_urename_:
0000  51				push		ecx
0001  52				push		edx
0002  50				push		eax
0003  E8 00 00 00 00			call		_MoveFileW
0008  85 C0				test		eax,eax
000A  75 07				jne		L$1
000C  E8 00 00 00 00			call		__set_errno_nt_
0011  59				pop		ecx
0012  C3				ret		
0013				L$1:
0013  31 C0				xor		eax,eax
0015  59				pop		ecx
0016  C3				ret		

Routine Size: 23 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

