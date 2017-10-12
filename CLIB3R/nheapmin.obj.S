Module: nheapmin
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000C5 bytes
0000				_heapshrink_:
0000				_heapmin_:
0000				_nheapmin_:
0000				_nheapshrink_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  FF 15 00 00 00 00			call		dword ptr __AccessNHeap
000A  A1 00 00 00 00			mov		eax,dword ptr ___nheapbeg
000F  E9 A0 00 00 00			jmp		L$11
0014				__ReturnMemToSystem_:
0014  53				push		ebx
0015  51				push		ecx
0016  52				push		edx
0017  56				push		esi
0018  57				push		edi
0019  89 C3				mov		ebx,eax
001B  68 00 80 00 00			push		0x00008000
0020  6A 00				push		0x00000000
0022  50				push		eax
0023  8B 70 08				mov		esi,dword ptr 0x8[eax]
0026  E8 00 00 00 00			call		_VirtualFree
002B  85 C0				test		eax,eax
002D  75 07				jne		L$1
002F  B8 FF FF FF FF			mov		eax,0xffffffff
0034  EB 36				jmp		L$5
0036				L$1:
0036  3B 1D 00 00 00 00			cmp		ebx,dword ptr ___MiniHeapRover
003C  75 1C				jne		L$3
003E  85 F6				test		esi,esi
0040  74 08				je		L$2
0042  89 35 00 00 00 00			mov		dword ptr ___MiniHeapRover,esi
0048  EB 10				jmp		L$3
004A				L$2:
004A  A1 00 00 00 00			mov		eax,dword ptr ___nheapbeg
004F  89 35 00 00 00 00			mov		dword ptr ___LargestSizeB4MiniHeapRover,esi
0055  A3 00 00 00 00			mov		dword ptr ___MiniHeapRover,eax
005A				L$3:
005A  3B 1D 00 00 00 00			cmp		ebx,dword ptr ___MiniHeapFreeRover
0060  75 08				jne		L$4
0062  31 FF				xor		edi,edi
0064  89 3D 00 00 00 00			mov		dword ptr ___MiniHeapFreeRover,edi
006A				L$4:
006A  31 C0				xor		eax,eax
006C				L$5:
006C  5F				pop		edi
006D  5E				pop		esi
006E  5A				pop		edx
006F  59				pop		ecx
0070  5B				pop		ebx
0071  C3				ret		
0072				__ReleaseMiniHeap_:
0072  53				push		ebx
0073  52				push		edx
0074  8B 58 04				mov		ebx,dword ptr 0x4[eax]
0077  8B 50 08				mov		edx,dword ptr 0x8[eax]
007A  E8 00 00 00 00			call		__ReturnMemToSystem_
007F  85 C0				test		eax,eax
0081  75 16				jne		L$8
0083  85 DB				test		ebx,ebx
0085  75 08				jne		L$6
0087  89 15 00 00 00 00			mov		dword ptr ___nheapbeg,edx
008D  EB 03				jmp		L$7
008F				L$6:
008F  89 53 08				mov		dword ptr 0x8[ebx],edx
0092				L$7:
0092  85 D2				test		edx,edx
0094  74 03				je		L$8
0096  89 5A 04				mov		dword ptr 0x4[edx],ebx
0099				L$8:
0099  5A				pop		edx
009A  5B				pop		ebx
009B  C3				ret		
009C				L$9:
009C  8B 08				mov		ecx,dword ptr [eax]
009E  8B 50 24				mov		edx,dword ptr 0x24[eax]
00A1  83 E9 2C				sub		ecx,0x0000002c
00A4  8B 32				mov		esi,dword ptr [edx]
00A6  8B 58 08				mov		ebx,dword ptr 0x8[eax]
00A9  39 F1				cmp		ecx,esi
00AB  75 05				jne		L$10
00AD  E8 00 00 00 00			call		__ReleaseMiniHeap_
00B2				L$10:
00B2  89 D8				mov		eax,ebx
00B4				L$11:
00B4  85 C0				test		eax,eax
00B6  75 E4				jne		L$9
00B8  FF 15 00 00 00 00			call		dword ptr __ReleaseNHeap
00BE  31 C0				xor		eax,eax
00C0  5E				pop		esi
00C1  5A				pop		edx
00C2  59				pop		ecx
00C3  5B				pop		ebx
00C4  C3				ret		

Routine Size: 197 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

