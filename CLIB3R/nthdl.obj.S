Module: nthdl
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001CF bytes
0000				__NTAtMaxFiles_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  8B 0D 00 00 00 00			mov		ecx,dword ptr ___FileHandleIDs
0009  A1 00 00 00 00			mov		eax,dword ptr _topFileID
000E  3B 05 00 00 00 00			cmp		eax,dword ptr ___NFiles
0014  73 04				jae		L$2
0016				L$1:
0016  31 C0				xor		eax,eax
0018  EB 21				jmp		L$5
001A				L$2:
001A  8B 1D 00 00 00 00			mov		ebx,dword ptr _topFileID
0020  89 CA				mov		edx,ecx
0022  31 C0				xor		eax,eax
0024  C1 E3 02				shl		ebx,0x02
0027  EB 09				jmp		L$4
0029				L$3:
0029  83 3C 02 00			cmp		dword ptr [edx+eax],0x00000000
002D  74 E7				je		L$1
002F  83 C0 04				add		eax,0x00000004
0032				L$4:
0032  39 D8				cmp		eax,ebx
0034  7C F3				jl		L$3
0036  B8 01 00 00 00			mov		eax,0x00000001
003B				L$5:
003B  89 0D 00 00 00 00			mov		dword ptr ___FileHandleIDs,ecx
0041  5A				pop		edx
0042  59				pop		ecx
0043  5B				pop		ebx
0044  C3				ret		

Routine Size: 69 bytes,    Routine Base: _TEXT + 0000

0045				__NTAddFileHandle_:
0045  53				push		ebx
0046  51				push		ecx
0047  52				push		edx
0048  56				push		esi
0049  89 C6				mov		esi,eax
004B  FF 15 00 00 00 00			call		dword ptr __AccessFList
0051  8B 0D 00 00 00 00			mov		ecx,dword ptr _topFileID
0057  31 DB				xor		ebx,ebx
0059  31 C0				xor		eax,eax
005B  C1 E1 02				shl		ecx,0x02
005E  EB 20				jmp		L$8
0060				L$6:
0060  8B 15 00 00 00 00			mov		edx,dword ptr ___FileHandleIDs
0066  01 C2				add		edx,eax
0068  83 3A 00				cmp		dword ptr [edx],0x00000000
006B  75 0F				jne		L$7
006D  89 32				mov		dword ptr [edx],esi
006F  FF 15 00 00 00 00			call		dword ptr __ReleaseFList
0075  89 D8				mov		eax,ebx
0077  5E				pop		esi
0078  5A				pop		edx
0079  59				pop		ecx
007A  5B				pop		ebx
007B  C3				ret		
007C				L$7:
007C  83 C0 04				add		eax,0x00000004
007F  43				inc		ebx
0080				L$8:
0080  39 C8				cmp		eax,ecx
0082  7C DC				jl		L$6
0084  8B 15 00 00 00 00			mov		edx,dword ptr _topFileID
008A  42				inc		edx
008B  A1 00 00 00 00			mov		eax,dword ptr ___FileHandleIDs
0090  C1 E2 02				shl		edx,0x02
0093  E8 00 00 00 00			call		realloc_
0098  8B 15 00 00 00 00			mov		edx,dword ptr _topFileID
009E  A3 00 00 00 00			mov		dword ptr ___FileHandleIDs,eax
00A3  89 34 90				mov		dword ptr [eax+edx*4],esi
00A6  42				inc		edx
00A7  89 15 00 00 00 00			mov		dword ptr _topFileID,edx
00AD  FF 15 00 00 00 00			call		dword ptr __ReleaseFList
00B3  A1 00 00 00 00			mov		eax,dword ptr _topFileID
00B8  48				dec		eax
00B9  5E				pop		esi
00BA  5A				pop		edx
00BB  59				pop		ecx
00BC  5B				pop		ebx
00BD  C3				ret		

Routine Size: 121 bytes,    Routine Base: _TEXT + 0045

00BE				__NTAddSpecificFileHandle_:
00BE  53				push		ebx
00BF  51				push		ecx
00C0  56				push		esi
00C1  57				push		edi
00C2  89 C7				mov		edi,eax
00C4  89 D6				mov		esi,edx
00C6  FF 15 00 00 00 00			call		dword ptr __AccessFList
00CC  83 FA 01				cmp		edx,0x00000001
00CF  72 09				jb		L$9
00D1  76 10				jbe		L$10
00D3  83 FA 02				cmp		edx,0x00000002
00D6  74 10				je		L$11
00D8  EB 16				jmp		L$13
00DA				L$9:
00DA  85 D2				test		edx,edx
00DC  75 12				jne		L$13
00DE  57				push		edi
00DF  6A F6				push		0xfffffff6
00E1  EB 08				jmp		L$12
00E3				L$10:
00E3  57				push		edi
00E4  6A F5				push		0xfffffff5
00E6  EB 03				jmp		L$12
00E8				L$11:
00E8  57				push		edi
00E9  6A F4				push		0xfffffff4
00EB				L$12:
00EB  E8 00 00 00 00			call		_SetStdHandle
00F0				L$13:
00F0  89 F1				mov		ecx,esi
00F2  8B 15 00 00 00 00			mov		edx,dword ptr _topFileID
00F8  C1 E1 02				shl		ecx,0x02
00FB  39 D6				cmp		esi,edx
00FD  7D 0A				jge		L$14
00FF  A1 00 00 00 00			mov		eax,dword ptr ___FileHandleIDs
0104  89 3C 01				mov		dword ptr [ecx+eax],edi
0107  EB 46				jmp		L$17
0109				L$14:
0109  A1 00 00 00 00			mov		eax,dword ptr ___FileHandleIDs
010E  8D 51 04				lea		edx,0x4[ecx]
0111  E8 00 00 00 00			call		realloc_
0116  8B 1D 00 00 00 00			mov		ebx,dword ptr _topFileID
011C  A3 00 00 00 00			mov		dword ptr ___FileHandleIDs,eax
0121  89 D8				mov		eax,ebx
0123  C1 E0 02				shl		eax,0x02
0126  EB 11				jmp		L$16
0128				L$15:
0128  8B 15 00 00 00 00			mov		edx,dword ptr ___FileHandleIDs
012E  43				inc		ebx
012F  C7 04 02 00 00 00 00		mov		dword ptr [edx+eax],0x00000000
0136  83 C0 04				add		eax,0x00000004
0139				L$16:
0139  39 C8				cmp		eax,ecx
013B  7C EB				jl		L$15
013D  8B 15 00 00 00 00			mov		edx,dword ptr ___FileHandleIDs
0143  89 F0				mov		eax,esi
0145  46				inc		esi
0146  89 3C 82				mov		dword ptr [edx+eax*4],edi
0149  89 35 00 00 00 00			mov		dword ptr _topFileID,esi
014F				L$17:
014F  FF 15 00 00 00 00			call		dword ptr __ReleaseFList
0155  5F				pop		edi
0156  5E				pop		esi
0157  59				pop		ecx
0158  5B				pop		ebx
0159  C3				ret		

Routine Size: 156 bytes,    Routine Base: _TEXT + 00BE

015A				__NTRemoveFileHandle_:
015A  52				push		edx
015B  89 C2				mov		edx,eax
015D  FF 15 00 00 00 00			call		dword ptr __AccessFList
0163  85 D2				test		edx,edx
0165  7E 17				jle		L$18
0167  3B 15 00 00 00 00			cmp		edx,dword ptr _topFileID
016D  7D 0F				jge		L$18
016F  89 D0				mov		eax,edx
0171  8B 15 00 00 00 00			mov		edx,dword ptr ___FileHandleIDs
0177  C7 04 82 00 00 00 00		mov		dword ptr [edx+eax*4],0x00000000
017E				L$18:
017E  FF 15 00 00 00 00			call		dword ptr __ReleaseFList
0184  5A				pop		edx
0185  C3				ret		

Routine Size: 44 bytes,    Routine Base: _TEXT + 015A

0186				__NTInitFileHandles_:
0186  51				push		ecx
0187  52				push		edx
0188  31 D2				xor		edx,edx
018A  6A F6				push		0xfffffff6
018C  89 15 00 00 00 00			mov		dword ptr _topFileID,edx
0192  89 15 00 00 00 00			mov		dword ptr ___FileHandleIDs,edx
0198  E8 00 00 00 00			call		_GetStdHandle
019D  E8 00 00 00 00			call		__NTAddFileHandle_
01A2  6A F5				push		0xfffffff5
01A4  E8 00 00 00 00			call		_GetStdHandle
01A9  E8 00 00 00 00			call		__NTAddFileHandle_
01AE  6A F4				push		0xfffffff4
01B0  E8 00 00 00 00			call		_GetStdHandle
01B5  E8 00 00 00 00			call		__NTAddFileHandle_
01BA  5A				pop		edx
01BB  59				pop		ecx
01BC  C3				ret		

Routine Size: 55 bytes,    Routine Base: _TEXT + 0186

01BD				__NTGetFakeHandle_:
01BD  52				push		edx
01BE  8B 15 00 00 00 00			mov		edx,dword ptr _fakeHandle
01C4  42				inc		edx
01C5  89 15 00 00 00 00			mov		dword ptr _fakeHandle,edx
01CB  89 D0				mov		eax,edx
01CD  5A				pop		edx
01CE  C3				ret		

Routine Size: 18 bytes,    Routine Base: _TEXT + 01BD

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000004 bytes
0000				_fakeHandle:
0000  00 00 00 80                                     ....

Segment: _BSS DWORD USE32 00000008 bytes
0000				_topFileID:
0004				___FileHandleIDs:

BSS Size: 8 bytes

