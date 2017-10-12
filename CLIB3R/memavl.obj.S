Module: memavl
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000044 bytes
0000				_memavl_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  57				push		edi
0005  FF 15 00 00 00 00			call		dword ptr __AccessNHeap
000B  BF FC FF FF FF			mov		edi,0xfffffffc
0010  8B 35 00 00 00 00			mov		esi,dword ptr ___nheapbeg
0016  31 D2				xor		edx,edx
0018  EB 18				jmp		L$4
001A				L$1:
001A  8D 4E 20				lea		ecx,0x20[esi]
001D  8B 46 28				mov		eax,dword ptr 0x28[esi]
0020				L$2:
0020  39 C8				cmp		eax,ecx
0022  74 0B				je		L$3
0024  8B 18				mov		ebx,dword ptr [eax]
0026  01 FB				add		ebx,edi
0028  8B 40 08				mov		eax,dword ptr 0x8[eax]
002B  01 DA				add		edx,ebx
002D  EB F1				jmp		L$2
002F				L$3:
002F  8B 76 08				mov		esi,dword ptr 0x8[esi]
0032				L$4:
0032  85 F6				test		esi,esi
0034  75 E4				jne		L$1
0036  FF 15 00 00 00 00			call		dword ptr __ReleaseNHeap
003C  89 D0				mov		eax,edx
003E  5F				pop		edi
003F  5E				pop		esi
0040  5A				pop		edx
0041  59				pop		ecx
0042  5B				pop		ebx
0043  C3				ret		

Routine Size: 68 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

