Module: memmax
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000048 bytes
0000				_memmax_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  57				push		edi
0005  FF 15 00 00 00 00			call		dword ptr __AccessNHeap
000B  BF FC FF FF FF			mov		edi,0xfffffffc
0010  8B 35 00 00 00 00			mov		esi,dword ptr ___nheapbeg
0016  31 DB				xor		ebx,ebx
0018  EB 1C				jmp		L$5
001A				L$1:
001A  8D 4E 20				lea		ecx,0x20[esi]
001D  8B 46 28				mov		eax,dword ptr 0x28[esi]
0020				L$2:
0020  39 C8				cmp		eax,ecx
0022  74 0F				je		L$4
0024  8B 10				mov		edx,dword ptr [eax]
0026  01 FA				add		edx,edi
0028  39 DA				cmp		edx,ebx
002A  76 02				jbe		L$3
002C  89 D3				mov		ebx,edx
002E				L$3:
002E  8B 40 08				mov		eax,dword ptr 0x8[eax]
0031  EB ED				jmp		L$2
0033				L$4:
0033  8B 76 08				mov		esi,dword ptr 0x8[esi]
0036				L$5:
0036  85 F6				test		esi,esi
0038  75 E0				jne		L$1
003A  FF 15 00 00 00 00			call		dword ptr __ReleaseNHeap
0040  89 D8				mov		eax,ebx
0042  5F				pop		edi
0043  5E				pop		esi
0044  5A				pop		edx
0045  59				pop		ecx
0046  5B				pop		ebx
0047  C3				ret		

Routine Size: 72 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

