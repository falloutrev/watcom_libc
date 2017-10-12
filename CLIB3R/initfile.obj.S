Module: initfile
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000077 bytes
0000				__InitFiles_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  8A 25 41 00 00 00			mov		ah,byte ptr ___iob+0x41
0009  80 E4 F8				and		ah,0xf8
000C  88 E2				mov		dl,ah
000E  88 25 41 00 00 00			mov		byte ptr ___iob+0x41,ah
0014  80 CA 04				or		dl,0x04
0017  B9 00 00 00 00			mov		ecx,offset ___iob
001C  88 15 41 00 00 00			mov		byte ptr ___iob+0x41,dl
0022  EB 42				jmp		L$3
0024				L$1:
0024  B8 08 00 00 00			mov		eax,0x00000008
0029  E8 00 00 00 00			call		_nmalloc_
002E  89 C3				mov		ebx,eax
0030  85 C0				test		eax,eax
0032  75 1F				jne		L$2
0034  B8 08 00 00 00			mov		eax,0x00000008
0039  E8 00 00 00 00			call		malloc_
003E  89 C3				mov		ebx,eax
0040  85 C0				test		eax,eax
0042  75 0F				jne		L$2
0044  BA 01 00 00 00			mov		edx,0x00000001
0049  B8 00 00 00 00			mov		eax,offset DGROUP:L$4
004E  E8 00 00 00 00			call		__fatal_runtime_error_
0053				L$2:
0053  A1 00 00 00 00			mov		eax,dword ptr ___OpenStreams
0058  89 4B 04				mov		dword ptr 0x4[ebx],ecx
005B  89 1D 00 00 00 00			mov		dword ptr ___OpenStreams,ebx
0061  83 C1 1A				add		ecx,0x0000001a
0064  89 03				mov		dword ptr [ebx],eax
0066				L$3:
0066  8B 51 0C				mov		edx,dword ptr 0xc[ecx]
0069  85 D2				test		edx,edx
006B  75 B7				jne		L$1
006D  89 15 00 00 00 00			mov		dword ptr ___ClosedStreams,edx
0073  5A				pop		edx
0074  59				pop		ecx
0075  5B				pop		ebx
0076  C3				ret		

Routine Size: 119 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000030 bytes
0000				L$4:
0000  4E 6F 74 20 65 6E 6F 75 67 68 20 6D 65 6D 6F 72 Not enough memor
0010  79 20 74 6F 20 61 6C 6C 6F 63 61 74 65 20 66 69 y to allocate fi
0020  6C 65 20 73 74 72 75 63 74 75 72 65 73 0D 0A 00 le structures...

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

