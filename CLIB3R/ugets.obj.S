Module: ugets
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000005D bytes
0000				_ugets_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  89 C3				mov		ebx,eax
0006  8B 35 0C 00 00 00			mov		esi,dword ptr ___iob+0xc
000C  89 C2				mov		edx,eax
000E  80 25 0C 00 00 00 CF		and		byte ptr ___iob+0xc,0xcf
0015  83 E6 30				and		esi,0x00000030
0018				L$1:
0018  B8 00 00 00 00			mov		eax,offset ___iob
001D  E8 00 00 00 00			call		_ugetc_
0022  89 C1				mov		ecx,eax
0024  83 F8 FF				cmp		eax,0xffffffff
0027  74 0C				je		L$2
0029  83 F8 0A				cmp		eax,0x0000000a
002C  74 07				je		L$2
002E  66 89 02				mov		word ptr [edx],ax
0031  42				inc		edx
0032  42				inc		edx
0033  EB E3				jmp		L$1
0035				L$2:
0035  83 F9 FF				cmp		ecx,0xffffffff
0038  75 11				jne		L$4
003A  39 DA				cmp		edx,ebx
003C  74 09				je		L$3
003E  F6 05 0C 00 00 00 20		test		byte ptr ___iob+0xc,0x20
0045  74 04				je		L$4
0047				L$3:
0047  31 DB				xor		ebx,ebx
0049  EB 05				jmp		L$5
004B				L$4:
004B  66 C7 02 00 00			mov		word ptr [edx],0x0000
0050				L$5:
0050  89 D8				mov		eax,ebx
0052  09 35 0C 00 00 00			or		dword ptr ___iob+0xc,esi
0058  5E				pop		esi
0059  5A				pop		edx
005A  59				pop		ecx
005B  5B				pop		ebx
005C  C3				ret		

Routine Size: 93 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

