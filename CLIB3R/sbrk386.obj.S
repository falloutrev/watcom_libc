Module: sbrk386
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000042 bytes
0000				sbrk_:
0000  51				push		ecx
0001  52				push		edx
0002  85 C0				test		eax,eax
0004  7E 29				jle		L$1
0006  6A 40				push		0x00000040
0008  05 FF 0F 00 00			add		eax,0x00000fff
000D  68 00 10 00 00			push		0x00001000
0012  66 25 00 F0			and		ax,0xf000
0016  50				push		eax
0017  6A 00				push		0x00000000
0019  E8 00 00 00 00			call		_VirtualAlloc
001E  85 C0				test		eax,eax
0020  75 1D				jne		L$3
0022  E8 00 00 00 00			call		__get_errno_ptr_
0027  C7 00 05 00 00 00			mov		dword ptr [eax],0x00000005
002D  EB 0B				jmp		L$2
002F				L$1:
002F  E8 00 00 00 00			call		__get_errno_ptr_
0034  C7 00 09 00 00 00			mov		dword ptr [eax],0x00000009
003A				L$2:
003A  B8 FF FF FF FF			mov		eax,0xffffffff
003F				L$3:
003F  5A				pop		edx
0040  59				pop		ecx
0041  C3				ret		

Routine Size: 66 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

