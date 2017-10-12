Module: nmalloc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000EF bytes
0000				malloc_:
0000				_nmalloc_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  57				push		edi
0005  06				push		es
0006  0F A0				push		fs
0008  0F A8				push		gs
000A  55				push		ebp
000B  83 EC 04				sub		esp,0x00000004
000E  89 C6				mov		esi,eax
0010  85 C0				test		eax,eax
0012  74 05				je		L$1
0014  83 F8 D4				cmp		eax,0xffffffd4
0017  76 07				jbe		L$2
0019				L$1:
0019  31 C0				xor		eax,eax
001B  E9 C0 00 00 00			jmp		L$13
0020				L$2:
0020  BD 00 00 00 00			mov		ebp,offset ___nheapbeg
0025  8D 7E 03				lea		edi,0x3[esi]
0028  30 E4				xor		ah,ah
002A  31 D2				xor		edx,edx
002C  88 24 24				mov		byte ptr [esp],ah
002F  66 83 E7 FC			and		di,0xfffc
0033  FF 15 00 00 00 00			call		dword ptr __AccessNHeap
0039				L$3:
0039  89 F8				mov		eax,edi
003B  83 FF 0C				cmp		edi,0x0000000c
003E  73 05				jae		L$4
0040  B8 0C 00 00 00			mov		eax,0x0000000c
0045				L$4:
0045  3B 05 00 00 00 00			cmp		eax,dword ptr ___LargestSizeB4MiniHeapRover
004B  76 18				jbe		L$6
004D  8B 0D 00 00 00 00			mov		ecx,dword ptr ___MiniHeapRover
0053  85 C9				test		ecx,ecx
0055  75 46				jne		L$9
0057				L$5:
0057  89 0D 00 00 00 00			mov		dword ptr ___LargestSizeB4MiniHeapRover,ecx
005D  8B 0D 00 00 00 00			mov		ecx,dword ptr ___nheapbeg
0063  EB 38				jmp		L$9
0065				L$6:
0065  31 C9				xor		ecx,ecx
0067  EB EE				jmp		L$5
0069				L$7:
0069  8C DA				mov		edx,ds
006B  89 E8				mov		eax,ebp
006D  89 0D 00 00 00 00			mov		dword ptr ___MiniHeapRover,ecx
0073  81 E2 FF FF 00 00			and		edx,0x0000ffff
0079  89 CB				mov		ebx,ecx
007B  89 F0				mov		eax,esi
007D  E8 00 00 00 00			call		__MemAllocator
0082  89 C2				mov		edx,eax
0084  85 C0				test		eax,eax
0086  75 48				jne		L$12
0088  8B 1D 00 00 00 00			mov		ebx,dword ptr ___LargestSizeB4MiniHeapRover
008E  8B 41 14				mov		eax,dword ptr 0x14[ecx]
0091  39 D8				cmp		eax,ebx
0093  76 05				jbe		L$8
0095  A3 00 00 00 00			mov		dword ptr ___LargestSizeB4MiniHeapRover,eax
009A				L$8:
009A  8B 49 08				mov		ecx,dword ptr 0x8[ecx]
009D				L$9:
009D  85 C9				test		ecx,ecx
009F  75 C8				jne		L$7
00A1  80 3C 24 00			cmp		byte ptr [esp],0x00
00A5  75 0B				jne		L$10
00A7  89 F0				mov		eax,esi
00A9  E8 00 00 00 00			call		__ExpandDGROUP_
00AE  85 C0				test		eax,eax
00B0  75 15				jne		L$11
00B2				L$10:
00B2  89 F0				mov		eax,esi
00B4  E8 00 00 00 00			call		__nmemneed_
00B9  85 C0				test		eax,eax
00BB  74 13				je		L$12
00BD  30 C9				xor		cl,cl
00BF  88 0C 24				mov		byte ptr [esp],cl
00C2  E9 72 FF FF FF			jmp		L$3
00C7				L$11:
00C7  C6 04 24 01			mov		byte ptr [esp],0x01
00CB  E9 69 FF FF FF			jmp		L$3
00D0				L$12:
00D0  30 ED				xor		ch,ch
00D2  88 2D 00 00 00 00			mov		byte ptr ___nheap_clean,ch
00D8  FF 15 00 00 00 00			call		dword ptr __ReleaseNHeap
00DE  89 D0				mov		eax,edx
00E0				L$13:
00E0  83 C4 04				add		esp,0x00000004
00E3  5D				pop		ebp
00E4  0F A9				pop		gs
00E6  0F A1				pop		fs
00E8  07				pop		es
00E9  5F				pop		edi
00EA  5E				pop		esi
00EB  5A				pop		edx
00EC  59				pop		ecx
00ED  5B				pop		ebx
00EE  C3				ret		

Routine Size: 239 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 0000000C bytes
0000				___nheapbeg:
0000  00 00 00 00                                     ....
0004				___MiniHeapRover:
0004  00 00 00 00                                     ....
0008				___LargestSizeB4MiniHeapRover:
0008  00 00 00 00                                     ....

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

