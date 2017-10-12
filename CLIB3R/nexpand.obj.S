Module: nexpand
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001D8 bytes
0000				_expand_:
0000				_nexpand_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  83 EC 04				sub		esp,0x00000004
0006  89 C6				mov		esi,eax
0008  89 D3				mov		ebx,edx
000A  FF 15 00 00 00 00			call		dword ptr __AccessNHeap
0010  B8 00 00 00 00			mov		eax,offset ___nheapbeg
0015  8C DA				mov		edx,ds
0017  31 C0				xor		eax,eax
0019  89 E1				mov		ecx,esp
001B  66 89 D0				mov		ax,dx
001E  89 F2				mov		edx,esi
0020  E8 00 00 00 00			call		__HeapManager_expand_
0025  85 C0				test		eax,eax
0027  0F 85 9C 01 00 00			jne		L$21
002D  FF 15 00 00 00 00			call		dword ptr __ReleaseNHeap
0033  89 F0				mov		eax,esi
0035  E9 97 01 00 00			jmp		L$22

Routine Size: 58 bytes,    Routine Base: _TEXT + 0000

003A				__HeapManager_expand_:
003A  56				push		esi
003B  57				push		edi
003C  55				push		ebp
003D  83 EC 0C				sub		esp,0x0000000c
0040  50				push		eax
0041  89 D7				mov		edi,edx
0043  8D 43 07				lea		eax,0x7[ebx]
0046  24 FC				and		al,0xfc
0048  39 D8				cmp		eax,ebx
004A  73 05				jae		L$1
004C  B8 FF FF FF FF			mov		eax,0xffffffff
0051				L$1:
0051  83 F8 0C				cmp		eax,0x0000000c
0054  73 05				jae		L$2
0056  B8 0C 00 00 00			mov		eax,0x0000000c
005B				L$2:
005B  8D 57 FC				lea		edx,-0x4[edi]
005E  89 54 24 04			mov		dword ptr 0x4[esp],edx
0062  8B 12				mov		edx,dword ptr [edx]
0064  80 E2 FE				and		dl,0xfe
0067  39 D0				cmp		eax,edx
0069  0F 86 F9 00 00 00			jbe		L$14
006F  8B 5C 24 04			mov		ebx,dword ptr 0x4[esp]
0073  29 D0				sub		eax,edx
0075  01 D3				add		ebx,edx
0077				L$3:
0077  89 01				mov		dword ptr [ecx],eax
0079  8B 2B				mov		ebp,dword ptr [ebx]
007B  83 FD FF				cmp		ebp,0xffffffff
007E  75 0A				jne		L$4
0080  BD 02 00 00 00			mov		ebp,0x00000002
0085  E9 36 01 00 00			jmp		L$20
008A				L$4:
008A  F7 C5 01 00 00 00			test		ebp,0x00000001
0090  0F 85 CB 00 00 00			jne		L$13
0096  8B 43 08				mov		eax,dword ptr 0x8[ebx]
0099  89 44 24 08			mov		dword ptr 0x8[esp],eax
009D  8B 43 04				mov		eax,dword ptr 0x4[ebx]
00A0  8C DA				mov		edx,ds
00A2  89 44 24 0C			mov		dword ptr 0xc[esp],eax
00A6  B8 00 00 00 00			mov		eax,offset ___nheapbeg
00AB  66 3B 14 24			cmp		dx,word ptr [esp]
00AF  75 1A				jne		L$8
00B1  8B 35 00 00 00 00			mov		esi,dword ptr ___nheapbeg
00B7  EB 0B				jmp		L$7
00B9				L$5:
00B9  39 FE				cmp		esi,edi
00BB  77 04				ja		L$6
00BD  39 D7				cmp		edi,edx
00BF  72 0A				jb		L$8
00C1				L$6:
00C1  8B 76 08				mov		esi,dword ptr 0x8[esi]
00C4				L$7:
00C4  8B 56 08				mov		edx,dword ptr 0x8[esi]
00C7  85 D2				test		edx,edx
00C9  75 EE				jne		L$5
00CB				L$8:
00CB  8B 56 0C				mov		edx,dword ptr 0xc[esi]
00CE  39 D3				cmp		ebx,edx
00D0  75 06				jne		L$9
00D2  8B 42 04				mov		eax,dword ptr 0x4[edx]
00D5  89 46 0C				mov		dword ptr 0xc[esi],eax
00D8				L$9:
00D8  3B 29				cmp		ebp,dword ptr [ecx]
00DA  72 0B				jb		L$10
00DC  89 E8				mov		eax,ebp
00DE  8B 11				mov		edx,dword ptr [ecx]
00E0  29 D0				sub		eax,edx
00E2  83 F8 0C				cmp		eax,0x0000000c
00E5  73 34				jae		L$11
00E7				L$10:
00E7  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
00EB  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
00EF  89 50 08				mov		dword ptr 0x8[eax],edx
00F2  89 D0				mov		eax,edx
00F4  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
00F8  89 50 04				mov		dword ptr 0x4[eax],edx
00FB  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
00FF  01 28				add		dword ptr [eax],ebp
0101  8B 46 1C				mov		eax,dword ptr 0x1c[esi]
0104  48				dec		eax
0105  30 D2				xor		dl,dl
0107  89 46 1C				mov		dword ptr 0x1c[esi],eax
010A  88 15 00 00 00 00			mov		byte ptr ___fheap_clean,dl
0110  8B 11				mov		edx,dword ptr [ecx]
0112  39 D5				cmp		ebp,edx
0114  72 40				jb		L$12
0116  E9 A3 00 00 00			jmp		L$19
011B				L$11:
011B  01 D3				add		ebx,edx
011D  89 03				mov		dword ptr [ebx],eax
011F  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
0123  89 43 04				mov		dword ptr 0x4[ebx],eax
0126  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
012A  89 43 08				mov		dword ptr 0x8[ebx],eax
012D  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
0131  89 58 08				mov		dword ptr 0x8[eax],ebx
0134  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
0138  89 58 04				mov		dword ptr 0x4[eax],ebx
013B  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
013F  8B 01				mov		eax,dword ptr [ecx]
0141  8B 3A				mov		edi,dword ptr [edx]
0143  31 ED				xor		ebp,ebp
0145  01 C7				add		edi,eax
0147  30 E4				xor		ah,ah
0149  89 3A				mov		dword ptr [edx],edi
014B  88 25 00 00 00 00			mov		byte ptr ___fheap_clean,ah
0151  E9 6A 00 00 00			jmp		L$20
0156				L$12:
0156  89 D0				mov		eax,edx
0158  29 E8				sub		eax,ebp
015A  01 EB				add		ebx,ebp
015C  E9 16 FF FF FF			jmp		L$3
0161				L$13:
0161  BD 01 00 00 00			mov		ebp,0x00000001
0166  EB 58				jmp		L$20
0168				L$14:
0168  29 C2				sub		edx,eax
016A  83 FA 0C				cmp		edx,0x0000000c
016D  72 4F				jb		L$19
016F  89 C3				mov		ebx,eax
0171  8B 4C 24 04			mov		ecx,dword ptr 0x4[esp]
0175  80 CB 01				or		bl,0x01
0178  80 CA 01				or		dl,0x01
017B  89 19				mov		dword ptr [ecx],ebx
017D  8D 1C 01				lea		ebx,[ecx+eax]
0180  B8 00 00 00 00			mov		eax,offset ___nheapbeg
0185  89 5C 24 04			mov		dword ptr 0x4[esp],ebx
0189  89 13				mov		dword ptr [ebx],edx
018B  8C DA				mov		edx,ds
018D  8B 1C 24				mov		ebx,dword ptr [esp]
0190  66 39 DA				cmp		dx,bx
0193  75 1A				jne		L$18
0195  8B 35 00 00 00 00			mov		esi,dword ptr ___nheapbeg
019B  EB 0B				jmp		L$17
019D				L$15:
019D  39 FE				cmp		esi,edi
019F  77 04				ja		L$16
01A1  39 CF				cmp		edi,ecx
01A3  72 0A				jb		L$18
01A5				L$16:
01A5  8B 76 08				mov		esi,dword ptr 0x8[esi]
01A8				L$17:
01A8  8B 4E 08				mov		ecx,dword ptr 0x8[esi]
01AB  85 C9				test		ecx,ecx
01AD  75 EE				jne		L$15
01AF				L$18:
01AF  FF 46 18				inc		dword ptr 0x18[esi]
01B2  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
01B6  83 C0 04				add		eax,0x00000004
01B9  E8 00 00 00 00			call		_nfree_
01BE				L$19:
01BE  31 ED				xor		ebp,ebp
01C0				L$20:
01C0  89 E8				mov		eax,ebp
01C2  83 C4 10				add		esp,0x00000010
01C5  5D				pop		ebp
01C6  5F				pop		edi
01C7  5E				pop		esi
01C8  C3				ret		
01C9				L$21:
01C9  FF 15 00 00 00 00			call		dword ptr __ReleaseNHeap
01CF  31 C0				xor		eax,eax
01D1				L$22:
01D1  83 C4 04				add		esp,0x00000004
01D4  5E				pop		esi
01D5  59				pop		ecx
01D6  5B				pop		ebx
01D7  C3				ret		

Routine Size: 414 bytes,    Routine Base: _TEXT + 003A

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

