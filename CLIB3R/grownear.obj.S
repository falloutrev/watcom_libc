Module: grownear
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000015F bytes
0000				__LinkUpNewMHeap_:
0000  53				push		ebx
0001  52				push		edx
0002  89 C2				mov		edx,eax
0004  A1 00 00 00 00			mov		eax,dword ptr ___nheapbeg
0009  31 DB				xor		ebx,ebx
000B  EB 09				jmp		L$2
000D				L$1:
000D  39 C2				cmp		edx,eax
000F  72 09				jb		L$3
0011  89 C3				mov		ebx,eax
0013  8B 40 08				mov		eax,dword ptr 0x8[eax]
0016				L$2:
0016  85 C0				test		eax,eax
0018  75 F3				jne		L$1
001A				L$3:
001A  89 5A 04				mov		dword ptr 0x4[edx],ebx
001D  89 42 08				mov		dword ptr 0x8[edx],eax
0020  85 DB				test		ebx,ebx
0022  74 05				je		L$4
0024  89 53 08				mov		dword ptr 0x8[ebx],edx
0027  EB 06				jmp		L$5
0029				L$4:
0029  89 15 00 00 00 00			mov		dword ptr ___nheapbeg,edx
002F				L$5:
002F  85 C0				test		eax,eax
0031  74 03				je		L$6
0033  89 50 04				mov		dword ptr 0x4[eax],edx
0036				L$6:
0036  8D 5A 20				lea		ebx,0x20[edx]
0039  8B 02				mov		eax,dword ptr [edx]
003B  83 C2 2C				add		edx,0x0000002c
003E  C7 42 F4 00 00 00 00		mov		dword ptr -0xc[edx],0x00000000
0045  C7 42 E4 00 00 00 00		mov		dword ptr -0x1c[edx],0x00000000
004C  C7 42 EC 00 00 00 00		mov		dword ptr -0x14[edx],0x00000000
0053  C7 42 F0 00 00 00 00		mov		dword ptr -0x10[edx],0x00000000
005A  89 5A F8				mov		dword ptr -0x8[edx],ebx
005D  89 5A FC				mov		dword ptr -0x4[edx],ebx
0060  83 E8 2C				sub		eax,0x0000002c
0063  89 5A E0				mov		dword ptr -0x20[edx],ebx
0066  89 02				mov		dword ptr [edx],eax
0068  C7 04 02 FF FF FF FF		mov		dword ptr [edx+eax],0xffffffff
006F  89 D0				mov		eax,edx
0071  5A				pop		edx
0072  5B				pop		ebx
0073  C3				ret		
0074				__CreateNewNHeap_:
0074  53				push		ebx
0075  51				push		ecx
0076  52				push		edx
0077  56				push		esi
0078  57				push		edi
0079  50				push		eax
007A  83 3D 00 00 00 00 00		cmp		dword ptr ___heap_enabled,0x00000000
0081  75 07				jne		L$8
0083				L$7:
0083  31 C0				xor		eax,eax
0085  E9 71 00 00 00			jmp		L$9
008A				L$8:
008A  83 3D 00 00 00 00 FE		cmp		dword ptr __curbrk,0xfffffffe
0091  74 F0				je		L$7
0093  89 E0				mov		eax,esp
0095  E8 00 00 00 00			call		__AdjustAmount_
009A  85 C0				test		eax,eax
009C  74 5D				je		L$9
009E  6A 40				push		0x00000040
00A0  68 00 10 00 00			push		0x00001000
00A5  8B 4C 24 08			mov		ecx,dword ptr 0x8[esp]
00A9  51				push		ecx
00AA  6A 00				push		0x00000000
00AC  E8 00 00 00 00			call		_VirtualAlloc
00B1  89 C2				mov		edx,eax
00B3  85 C0				test		eax,eax
00B5  74 44				je		L$9
00B7  8B 04 24				mov		eax,dword ptr [esp]
00BA  8B 34 24				mov		esi,dword ptr [esp]
00BD  83 E8 04				sub		eax,0x00000004
00C0  39 F0				cmp		eax,esi
00C2  77 BF				ja		L$7
00C4  89 04 24				mov		dword ptr [esp],eax
00C7  83 F8 38				cmp		eax,0x00000038
00CA  72 B7				jb		L$7
00CC  89 02				mov		dword ptr [edx],eax
00CE  89 D0				mov		eax,edx
00D0  E8 00 00 00 00			call		__LinkUpNewMHeap_
00D5  89 C3				mov		ebx,eax
00D7  8B 00				mov		eax,dword ptr [eax]
00D9  89 04 24				mov		dword ptr [esp],eax
00DC  0C 01				or		al,0x01
00DE  89 03				mov		dword ptr [ebx],eax
00E0  8B 7A 18				mov		edi,dword ptr 0x18[edx]
00E3  C7 42 14 FF FF FF FF		mov		dword ptr 0x14[edx],0xffffffff
00EA  47				inc		edi
00EB  8D 43 04				lea		eax,0x4[ebx]
00EE  89 7A 18				mov		dword ptr 0x18[edx],edi
00F1  E8 00 00 00 00			call		_nfree_
00F6  B8 01 00 00 00			mov		eax,0x00000001
00FB				L$9:
00FB  83 C4 04				add		esp,0x00000004
00FE  5F				pop		edi
00FF  5E				pop		esi
0100  5A				pop		edx
0101  59				pop		ecx
0102  5B				pop		ebx
0103  C3				ret		

Routine Size: 260 bytes,    Routine Base: _TEXT + 0000

0104				__ExpandDGROUP_:
0104  52				push		edx
0105  89 C2				mov		edx,eax
0107  E8 00 00 00 00			call		_nheapshrink_
010C  89 D0				mov		eax,edx
010E  E8 00 00 00 00			call		__CreateNewNHeap_
0113  5A				pop		edx
0114  C3				ret		
0115				__AdjustAmount_:
0115  51				push		ecx
0116  52				push		edx
0117  89 C2				mov		edx,eax
0119  8B 00				mov		eax,dword ptr [eax]
011B  83 C0 0B				add		eax,0x0000000b
011E  24 F8				and		al,0xf8
0120  85 C0				test		eax,eax
0122  74 38				je		L$13
0124  89 02				mov		dword ptr [edx],eax
0126  83 C0 3C				add		eax,0x0000003c
0129  3B 02				cmp		eax,dword ptr [edx]
012B  73 05				jae		L$11
012D				L$10:
012D  31 C0				xor		eax,eax
012F  5A				pop		edx
0130  59				pop		ecx
0131  C3				ret		
0132				L$11:
0132  8B 0D 00 00 00 00			mov		ecx,dword ptr __amblksiz
0138  39 C8				cmp		eax,ecx
013A  73 04				jae		L$12
013C  89 C8				mov		eax,ecx
013E  24 FE				and		al,0xfe
0140				L$12:
0140  89 02				mov		dword ptr [edx],eax
0142  05 FF 0F 00 00			add		eax,0x00000fff
0147  3B 02				cmp		eax,dword ptr [edx]
0149  72 E2				jb		L$10
014B  30 C0				xor		al,al
014D  80 E4 F0				and		ah,0xf0
0150  89 02				mov		dword ptr [edx],eax
0152  85 C0				test		eax,eax
0154  0F 95 C0				setne		al
0157  25 FF 00 00 00			and		eax,0x000000ff
015C				L$13:
015C  5A				pop		edx
015D  59				pop		ecx
015E  C3				ret		

Routine Size: 91 bytes,    Routine Base: _TEXT + 0104

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

