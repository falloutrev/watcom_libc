Module: writewnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000003F bytes
0000				_dos_write_:
0000  56				push		esi
0001  57				push		edi
0002  89 C6				mov		esi,eax
0004  8B 3D 00 00 00 00			mov		edi,dword ptr ___FileHandleIDs
000A  8B 3C 87				mov		edi,dword ptr [edi+eax*4]
000D  FF 15 00 00 00 00			call		dword ptr __AccessFileH
0013  6A 00				push		0x00000000
0015  51				push		ecx
0016  53				push		ebx
0017  52				push		edx
0018  57				push		edi
0019  E8 00 00 00 00			call		_WriteFile
001E  85 C0				test		eax,eax
0020  75 10				jne		L$1
0022  89 F0				mov		eax,esi
0024  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
002A  E8 00 00 00 00			call		__set_errno_nt_
002F  5F				pop		edi
0030  5E				pop		esi
0031  C3				ret		
0032				L$1:
0032  89 F0				mov		eax,esi
0034  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
003A  31 C0				xor		eax,eax
003C  5F				pop		edi
003D  5E				pop		esi
003E  C3				ret		

Routine Size: 63 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

