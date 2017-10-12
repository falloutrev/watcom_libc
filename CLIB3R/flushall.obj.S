Module: flushall
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000040 bytes
0000				flushall_:
0000  B8 FF FF FF FF			mov		eax,0xffffffff

Routine Size: 5 bytes,    Routine Base: _TEXT + 0000

0005				__flushall_:
0005  53				push		ebx
0006  51				push		ecx
0007  52				push		edx
0008  89 C1				mov		ecx,eax
000A  FF 15 00 00 00 00			call		dword ptr __AccessIOB
0010  8B 15 00 00 00 00			mov		edx,dword ptr ___OpenStreams
0016  31 DB				xor		ebx,ebx
0018  EB 16				jmp		L$3
001A				L$1:
001A  8B 42 04				mov		eax,dword ptr 0x4[edx]
001D  85 48 0C				test		dword ptr 0xc[eax],ecx
0020  74 0C				je		L$2
0022  43				inc		ebx
0023  F6 40 0D 10			test		byte ptr 0xd[eax],0x10
0027  74 05				je		L$2
0029  E8 00 00 00 00			call		__flush_
002E				L$2:
002E  8B 12				mov		edx,dword ptr [edx]
0030				L$3:
0030  85 D2				test		edx,edx
0032  75 E6				jne		L$1
0034  FF 15 00 00 00 00			call		dword ptr __ReleaseIOB
003A  89 D8				mov		eax,ebx
003C  5A				pop		edx
003D  59				pop		ecx
003E  5B				pop		ebx
003F  C3				ret		

Routine Size: 59 bytes,    Routine Base: _TEXT + 0005

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

