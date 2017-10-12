Module: freect
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000005C bytes
0000				_freect_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  57				push		edi
0005  55				push		ebp
0006  8D 78 07				lea		edi,0x7[eax]
0009  66 83 E7 FC			and		di,0xfffc
000D  31 C9				xor		ecx,ecx
000F  39 C7				cmp		edi,eax
0011  73 04				jae		L$1
0013  31 C0				xor		eax,eax
0015  EB 3E				jmp		L$7
0017				L$1:
0017  83 FF 0C				cmp		edi,0x0000000c
001A  73 05				jae		L$2
001C  BF 0C 00 00 00			mov		edi,0x0000000c
0021				L$2:
0021  FF 15 00 00 00 00			call		dword ptr __AccessNHeap
0027  8B 2D 00 00 00 00			mov		ebp,dword ptr ___nheapbeg
002D  EB 1A				jmp		L$6
002F				L$3:
002F  8D 75 20				lea		esi,0x20[ebp]
0032  8B 5D 28				mov		ebx,dword ptr 0x28[ebp]
0035				L$4:
0035  39 F3				cmp		ebx,esi
0037  74 0D				je		L$5
0039  8B 03				mov		eax,dword ptr [ebx]
003B  31 D2				xor		edx,edx
003D  F7 F7				div		edi
003F  8B 5B 08				mov		ebx,dword ptr 0x8[ebx]
0042  01 C1				add		ecx,eax
0044  EB EF				jmp		L$4
0046				L$5:
0046  8B 6D 08				mov		ebp,dword ptr 0x8[ebp]
0049				L$6:
0049  85 ED				test		ebp,ebp
004B  75 E2				jne		L$3
004D  FF 15 00 00 00 00			call		dword ptr __ReleaseNHeap
0053  89 C8				mov		eax,ecx
0055				L$7:
0055  5D				pop		ebp
0056  5F				pop		edi
0057  5E				pop		esi
0058  5A				pop		edx
0059  59				pop		ecx
005A  5B				pop		ebx
005B  C3				ret		

Routine Size: 92 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

