Module: nheapwal
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000C1 bytes
0000				_heapwalk_:
0000				_nheapwalk_:
0000  53				push		ebx
0001  52				push		edx
0002  89 C3				mov		ebx,eax
0004  FF 15 00 00 00 00			call		dword ptr __AccessNHeap
000A  8B 15 00 00 00 00			mov		edx,dword ptr ___nheapbeg
0010  89 D8				mov		eax,ebx
0012  E8 00 00 00 00			call		__NHeapWalk_
0017  89 C3				mov		ebx,eax
0019  FF 15 00 00 00 00			call		dword ptr __ReleaseNHeap
001F  89 D8				mov		eax,ebx
0021  5A				pop		edx
0022  5B				pop		ebx
0023  C3				ret		

Routine Size: 36 bytes,    Routine Base: _TEXT + 0000

0024				__NHeapWalk_:
0024  53				push		ebx
0025  51				push		ecx
0026  55				push		ebp
0027  89 C3				mov		ebx,eax
0029  85 D2				test		edx,edx
002B  75 09				jne		L$1
002D  B8 01 00 00 00			mov		eax,0x00000001
0032  5D				pop		ebp
0033  59				pop		ecx
0034  5B				pop		ebx
0035  C3				ret		
0036				L$1:
0036  8B 00				mov		eax,dword ptr [eax]
0038  85 C0				test		eax,eax
003A  75 05				jne		L$2
003C  8D 42 2C				lea		eax,0x2c[edx]
003F  EB 30				jmp		L$7
0041				L$2:
0041  8B 15 00 00 00 00			mov		edx,dword ptr ___nheapbeg
0047				L$3:
0047  8B 4A 08				mov		ecx,dword ptr 0x8[edx]
004A  85 C9				test		ecx,ecx
004C  74 0D				je		L$5
004E  39 C2				cmp		edx,eax
0050  77 04				ja		L$4
0052  39 C8				cmp		eax,ecx
0054  72 05				jb		L$5
0056				L$4:
0056  8B 52 08				mov		edx,dword ptr 0x8[edx]
0059  EB EC				jmp		L$3
005B				L$5:
005B  8B 08				mov		ecx,dword ptr [eax]
005D  80 E1 FE				and		cl,0xfe
0060  01 C1				add		ecx,eax
0062  39 C1				cmp		ecx,eax
0064  77 09				ja		L$6
0066  B8 03 00 00 00			mov		eax,0x00000003
006B  5D				pop		ebp
006C  59				pop		ecx
006D  5B				pop		ebx
006E  C3				ret		
006F				L$6:
006F  89 C8				mov		eax,ecx
0071				L$7:
0071  83 38 FF				cmp		dword ptr [eax],0xffffffff
0074  75 25				jne		L$9
0076  8B 6A 08				mov		ebp,dword ptr 0x8[edx]
0079  85 ED				test		ebp,ebp
007B  75 17				jne		L$8
007D  66 C7 43 04 00 00			mov		word ptr 0x4[ebx],0x0000
0083  89 6B 0A				mov		dword ptr 0xa[ebx],ebp
0086  89 6B 06				mov		dword ptr 0x6[ebx],ebp
0089  B8 04 00 00 00			mov		eax,0x00000004
008E  89 2B				mov		dword ptr [ebx],ebp
0090  5D				pop		ebp
0091  59				pop		ecx
0092  5B				pop		ebx
0093  C3				ret		
0094				L$8:
0094  89 EA				mov		edx,ebp
0096  8D 45 2C				lea		eax,0x2c[ebp]
0099  EB D6				jmp		L$7
009B				L$9:
009B  C7 43 0A 01 00 00 00		mov		dword ptr 0xa[ebx],0x00000001
00A2  8C 5B 04				mov		dword ptr 0x4[ebx],ds
00A5  89 03				mov		dword ptr [ebx],eax
00A7  8B 10				mov		edx,dword ptr [eax]
00A9  80 E2 FE				and		dl,0xfe
00AC  89 53 06				mov		dword ptr 0x6[ebx],edx
00AF  F6 00 01				test		byte ptr [eax],0x01
00B2  74 07				je		L$10
00B4  C7 43 0A 00 00 00 00		mov		dword ptr 0xa[ebx],0x00000000
00BB				L$10:
00BB  31 C0				xor		eax,eax
00BD  5D				pop		ebp
00BE  59				pop		ecx
00BF  5B				pop		ebx
00C0  C3				ret		

Routine Size: 157 bytes,    Routine Base: _TEXT + 0024

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

