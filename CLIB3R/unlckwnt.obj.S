Module: unlckwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000043 bytes
0000				unlock_:
0000  51				push		ecx
0001  56				push		esi
0002  89 C6				mov		esi,eax
0004  89 C1				mov		ecx,eax
0006  A1 00 00 00 00			mov		eax,dword ptr ___FileHandleIDs
000B  8B 0C 88				mov		ecx,dword ptr [eax+ecx*4]
000E  89 F0				mov		eax,esi
0010  FF 15 00 00 00 00			call		dword ptr __AccessFileH
0016  6A 00				push		0x00000000
0018  53				push		ebx
0019  6A 00				push		0x00000000
001B  52				push		edx
001C  51				push		ecx
001D  E8 00 00 00 00			call		_UnlockFile
0022  85 C0				test		eax,eax
0024  75 10				jne		L$1
0026  89 F0				mov		eax,esi
0028  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
002E  E8 00 00 00 00			call		__set_errno_nt_
0033  5E				pop		esi
0034  59				pop		ecx
0035  C3				ret		
0036				L$1:
0036  89 F0				mov		eax,esi
0038  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
003E  31 C0				xor		eax,eax
0040  5E				pop		esi
0041  59				pop		ecx
0042  C3				ret		

Routine Size: 67 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

