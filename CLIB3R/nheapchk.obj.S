Module: nheapchk
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000014B bytes
0000				checkFreeList_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  57				push		edi
0005  55				push		ebp
0006  89 C7				mov		edi,eax
0008  8B 35 00 00 00 00			mov		esi,dword ptr ___nheapbeg
000E  31 DB				xor		ebx,ebx
0010  EB 42				jmp		L$5
0012				L$1:
0012  8B 46 28				mov		eax,dword ptr 0x28[esi]
0015  8B 50 04				mov		edx,dword ptr 0x4[eax]
0018  85 D2				test		edx,edx
001A  75 07				jne		L$3
001C				L$2:
001C  B8 03 00 00 00			mov		eax,0x00000003
0021  EB 39				jmp		L$6
0023				L$3:
0023  8B 4A 08				mov		ecx,dword ptr 0x8[edx]
0026  39 C8				cmp		eax,ecx
0028  75 F2				jne		L$2
002A				L$4:
002A  8B 68 08				mov		ebp,dword ptr 0x8[eax]
002D  85 ED				test		ebp,ebp
002F  74 EB				je		L$2
0031  89 EA				mov		edx,ebp
0033  8B 6D 04				mov		ebp,dword ptr 0x4[ebp]
0036  39 E8				cmp		eax,ebp
0038  75 E2				jne		L$2
003A  F6 45 00 01			test		byte ptr [ebp],0x01
003E  75 DC				jne		L$2
0040  8B 45 00				mov		eax,dword ptr [ebp]
0043  01 D8				add		eax,ebx
0045  39 D8				cmp		eax,ebx
0047  72 D3				jb		L$2
0049  89 C3				mov		ebx,eax
004B  89 D0				mov		eax,edx
004D  39 CA				cmp		edx,ecx
004F  75 D9				jne		L$4
0051  8B 76 08				mov		esi,dword ptr 0x8[esi]
0054				L$5:
0054  85 F6				test		esi,esi
0056  75 BA				jne		L$1
0058  31 C0				xor		eax,eax
005A  89 1F				mov		dword ptr [edi],ebx
005C				L$6:
005C  5D				pop		ebp
005D  5F				pop		edi
005E  5E				pop		esi
005F  5A				pop		edx
0060  59				pop		ecx
0061  5B				pop		ebx
0062  C3				ret		
0063				checkFree_:
0063  53				push		ebx
0064  51				push		ecx
0065  52				push		edx
0066  57				push		edi
0067  55				push		ebp
0068  F6 00 01				test		byte ptr [eax],0x01
006B  74 07				je		L$8
006D				L$7:
006D  B8 03 00 00 00			mov		eax,0x00000003
0072  EB 30				jmp		L$9
0074				L$8:
0074  8B 50 08				mov		edx,dword ptr 0x8[eax]
0077  8B 4A 04				mov		ecx,dword ptr 0x4[edx]
007A  8B 58 04				mov		ebx,dword ptr 0x4[eax]
007D  39 C8				cmp		eax,ecx
007F  75 EC				jne		L$7
0081  3B 4B 08				cmp		ecx,dword ptr 0x8[ebx]
0084  75 E7				jne		L$7
0086  8B 4A 08				mov		ecx,dword ptr 0x8[edx]
0089  8B 79 04				mov		edi,dword ptr 0x4[ecx]
008C  8B 43 04				mov		eax,dword ptr 0x4[ebx]
008F  39 FA				cmp		edx,edi
0091  75 DA				jne		L$7
0093  8B 68 08				mov		ebp,dword ptr 0x8[eax]
0096  39 EB				cmp		ebx,ebp
0098  75 D3				jne		L$7
009A  39 FF				cmp		edi,edi
009C  75 CF				jne		L$7
009E  39 ED				cmp		ebp,ebp
00A0  75 CB				jne		L$7
00A2  31 C0				xor		eax,eax
00A4				L$9:
00A4  5D				pop		ebp
00A5  5F				pop		edi
00A6  5A				pop		edx
00A7  59				pop		ecx
00A8  5B				pop		ebx
00A9  C3				ret		

Routine Size: 170 bytes,    Routine Base: _TEXT + 0000

00AA				_heapchk_:

Routine Size: 0 bytes,    Routine Base: _TEXT + 00AA

00AA				_nheapchk_:
00AA  52				push		edx
00AB  83 EC 14				sub		esp,0x00000014
00AE  FF 15 00 00 00 00			call		dword ptr __AccessNHeap
00B4  80 3D 00 00 00 00 00		cmp		byte ptr ___nheap_clean,0x00
00BB  74 0D				je		L$10
00BD  FF 15 00 00 00 00			call		dword ptr __ReleaseNHeap
00C3  31 C0				xor		eax,eax
00C5  83 C4 14				add		esp,0x00000014
00C8  5A				pop		edx
00C9  C3				ret		
00CA				L$10:
00CA  8D 44 24 10			lea		eax,0x10[esp]
00CE  E8 00 00 00 00			call		checkFreeList_
00D3  89 C2				mov		edx,eax
00D5  85 C0				test		eax,eax
00D7  0F 85 61 00 00 00			jne		L$16
00DD  31 C2				xor		edx,eax
00DF  89 04 24				mov		dword ptr [esp],eax
00E2  66 89 54 24 04			mov		word ptr 0x4[esp],dx
00E7				L$11:
00E7  89 E0				mov		eax,esp
00E9  8B 15 00 00 00 00			mov		edx,dword ptr ___nheapbeg
00EF  E8 00 00 00 00			call		__NHeapWalk_
00F4  89 C2				mov		edx,eax
00F6  85 C0				test		eax,eax
00F8  75 1F				jne		L$12
00FA  83 7C 24 0A 01			cmp		dword ptr 0xa[esp],0x00000001
00FF  75 E6				jne		L$11
0101  8B 04 24				mov		eax,dword ptr [esp]
0104  E8 00 00 00 00			call		checkFree_
0109  89 C2				mov		edx,eax
010B  85 C0				test		eax,eax
010D  75 0A				jne		L$12
010F  8B 44 24 06			mov		eax,dword ptr 0x6[esp]
0113  29 44 24 10			sub		dword ptr 0x10[esp],eax
0117  EB CE				jmp		L$11
0119				L$12:
0119  83 7C 24 10 00			cmp		dword ptr 0x10[esp],0x00000000
011E  74 07				je		L$14
0120				L$13:
0120  BA 03 00 00 00			mov		edx,0x00000003
0125  EB 17				jmp		L$16
0127				L$14:
0127  83 FA 05				cmp		edx,0x00000005
012A  74 F4				je		L$13
012C  83 FA 04				cmp		edx,0x00000004
012F  75 02				jne		L$15
0131  31 D2				xor		edx,edx
0133				L$15:
0133  85 D2				test		edx,edx
0135  75 07				jne		L$16
0137  C6 05 00 00 00 00 01		mov		byte ptr ___nheap_clean,0x01
013E				L$16:
013E  FF 15 00 00 00 00			call		dword ptr __ReleaseNHeap
0144  89 D0				mov		eax,edx
0146  83 C4 14				add		esp,0x00000014
0149  5A				pop		edx
014A  C3				ret		

Routine Size: 161 bytes,    Routine Base: _TEXT + 00AA

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

