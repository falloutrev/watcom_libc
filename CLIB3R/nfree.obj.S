Module: nfree
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000008E bytes
0000				free_:
0000				_nfree_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  55				push		ebp
0005  89 C6				mov		esi,eax
0007  85 C0				test		eax,eax
0009  0F 84 79 00 00 00			je		L$7
000F  FF 15 00 00 00 00			call		dword ptr __AccessNHeap
0015  8B 0D 00 00 00 00			mov		ecx,dword ptr ___MiniHeapFreeRover
001B  85 C9				test		ecx,ecx
001D  74 09				je		L$1
001F  39 F1				cmp		ecx,esi
0021  77 05				ja		L$1
0023  3B 71 08				cmp		esi,dword ptr 0x8[ecx]
0026  72 1A				jb		L$5
0028				L$1:
0028  8B 0D 00 00 00 00			mov		ecx,dword ptr ___nheapbeg
002E  EB 0B				jmp		L$4
0030				L$2:
0030  39 F1				cmp		ecx,esi
0032  77 04				ja		L$3
0034  39 DE				cmp		esi,ebx
0036  72 0A				jb		L$5
0038				L$3:
0038  8B 49 08				mov		ecx,dword ptr 0x8[ecx]
003B				L$4:
003B  8B 59 08				mov		ebx,dword ptr 0x8[ecx]
003E  85 DB				test		ebx,ebx
0040  75 EE				jne		L$2
0042				L$5:
0042  B8 00 00 00 00			mov		eax,offset ___nheapbeg
0047  8C DA				mov		edx,ds
0049  81 E2 FF FF 00 00			and		edx,0x0000ffff
004F  89 CB				mov		ebx,ecx
0051  89 F0				mov		eax,esi
0053  E8 00 00 00 00			call		__MemFree
0058  8B 2D 00 00 00 00			mov		ebp,dword ptr ___MiniHeapRover
005E  89 0D 00 00 00 00			mov		dword ptr ___MiniHeapFreeRover,ecx
0064  39 E9				cmp		ecx,ebp
0066  73 12				jae		L$6
0068  A1 00 00 00 00			mov		eax,dword ptr ___LargestSizeB4MiniHeapRover
006D  8B 51 14				mov		edx,dword ptr 0x14[ecx]
0070  39 C2				cmp		edx,eax
0072  76 06				jbe		L$6
0074  89 15 00 00 00 00			mov		dword ptr ___LargestSizeB4MiniHeapRover,edx
007A				L$6:
007A  30 E4				xor		ah,ah
007C  88 25 00 00 00 00			mov		byte ptr ___nheap_clean,ah
0082  FF 15 00 00 00 00			call		dword ptr __ReleaseNHeap
0088				L$7:
0088  5D				pop		ebp
0089  5E				pop		esi
008A  5A				pop		edx
008B  59				pop		ecx
008C  5B				pop		ebx
008D  C3				ret		

Routine Size: 142 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000004 bytes
0000				___MiniHeapFreeRover:

BSS Size: 4 bytes

