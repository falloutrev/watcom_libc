Module: isattwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000041 bytes
0000				isatty_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  89 C3				mov		ebx,eax
0005  89 C2				mov		edx,eax
0007  A1 00 00 00 00			mov		eax,dword ptr ___FileHandleIDs
000C  8B 14 90				mov		edx,dword ptr [eax+edx*4]
000F  89 D8				mov		eax,ebx
0011  FF 15 00 00 00 00			call		dword ptr __AccessFileH
0017  52				push		edx
0018  E8 00 00 00 00			call		_GetFileType
001D  83 F8 02				cmp		eax,0x00000002
0020  75 11				jne		L$1
0022  89 D8				mov		eax,ebx
0024  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
002A  B8 01 00 00 00			mov		eax,0x00000001
002F  5A				pop		edx
0030  59				pop		ecx
0031  5B				pop		ebx
0032  C3				ret		
0033				L$1:
0033  89 D8				mov		eax,ebx
0035  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
003B  31 C0				xor		eax,eax
003D  5A				pop		edx
003E  59				pop		ecx
003F  5B				pop		ebx
0040  C3				ret		

Routine Size: 65 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

