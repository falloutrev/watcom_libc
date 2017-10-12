Module: ustrtol
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001EA bytes
0000				_stol_:
0000  56				push		esi
0001  57				push		edi
0002  55				push		ebp
0003  83 EC 10				sub		esp,0x00000010
0006  50				push		eax
0007  89 D5				mov		ebp,edx
0009  89 DE				mov		esi,ebx
000B  89 4C 24 08			mov		dword ptr 0x8[esp],ecx
000F  85 D2				test		edx,edx
0011  74 02				je		L$1
0013  89 02				mov		dword ptr [edx],eax
0015				L$1:
0015  8B 14 24				mov		edx,dword ptr [esp]
0018				L$2:
0018  31 C0				xor		eax,eax
001A  66 8B 02				mov		ax,word ptr [edx]
001D  E8 00 00 00 00			call		_uisspace_
0022  85 C0				test		eax,eax
0024  74 05				je		L$3
0026  83 C2 02				add		edx,0x00000002
0029  EB ED				jmp		L$2
002B				L$3:
002B  66 8B 02				mov		ax,word ptr [edx]
002E  89 44 24 10			mov		dword ptr 0x10[esp],eax
0032  31 C0				xor		eax,eax
0034  66 8B 44 24 10			mov		ax,word ptr 0x10[esp]
0039  83 F8 2B				cmp		eax,0x0000002b
003C  74 05				je		L$4
003E  83 F8 2D				cmp		eax,0x0000002d
0041  75 03				jne		L$5
0043				L$4:
0043  83 C2 02				add		edx,0x00000002
0046				L$5:
0046  85 F6				test		esi,esi
0048  75 37				jne		L$9
004A  31 C0				xor		eax,eax
004C  66 8B 02				mov		ax,word ptr [edx]
004F  83 F8 30				cmp		eax,0x00000030
0052  75 17				jne		L$7
0054  31 C0				xor		eax,eax
0056  66 8B 42 02			mov		ax,word ptr 0x2[edx]
005A  83 F8 78				cmp		eax,0x00000078
005D  74 05				je		L$6
005F  83 F8 58				cmp		eax,0x00000058
0062  75 07				jne		L$7
0064				L$6:
0064  BE 10 00 00 00			mov		esi,0x00000010
0069  EB 16				jmp		L$9
006B				L$7:
006B  31 C0				xor		eax,eax
006D  66 8B 02				mov		ax,word ptr [edx]
0070  83 F8 30				cmp		eax,0x00000030
0073  75 07				jne		L$8
0075  BE 08 00 00 00			mov		esi,0x00000008
007A  EB 05				jmp		L$9
007C				L$8:
007C  BE 0A 00 00 00			mov		esi,0x0000000a
0081				L$9:
0081  83 FE 02				cmp		esi,0x00000002
0084  7C 05				jl		L$10
0086  83 FE 24				cmp		esi,0x00000024
0089  7E 11				jle		L$11
008B				L$10:
008B  B8 0D 00 00 00			mov		eax,0x0000000d
0090  E8 00 00 00 00			call		__set_errno_
0095  31 C0				xor		eax,eax
0097  E9 D5 00 00 00			jmp		L$26
009C				L$11:
009C  83 FE 10				cmp		esi,0x00000010
009F  75 1D				jne		L$13
00A1  31 C0				xor		eax,eax
00A3  66 8B 02				mov		ax,word ptr [edx]
00A6  83 F8 30				cmp		eax,0x00000030
00A9  75 13				jne		L$13
00AB  31 C0				xor		eax,eax
00AD  66 8B 42 02			mov		ax,word ptr 0x2[edx]
00B1  83 F8 78				cmp		eax,0x00000078
00B4  74 05				je		L$12
00B6  83 F8 58				cmp		eax,0x00000058
00B9  75 03				jne		L$13
00BB				L$12:
00BB  83 C2 04				add		edx,0x00000004
00BE				L$13:
00BE  89 54 24 04			mov		dword ptr 0x4[esp],edx
00C2  89 F7				mov		edi,esi
00C4  30 C9				xor		cl,cl
00C6  31 DB				xor		ebx,ebx
00C8  C1 E7 02				shl		edi,0x02
00CB				L$14:
00CB  31 C0				xor		eax,eax
00CD  66 8B 02				mov		ax,word ptr [edx]
00D0  E8 00 00 00 00			call		radix_value_
00D5  89 44 24 0C			mov		dword ptr 0xc[esp],eax
00D9  39 F0				cmp		eax,esi
00DB  7D 1E				jge		L$17
00DD  3B 9F F8 FF FF FF			cmp		ebx,dword ptr _nearly_overflowing-0x8[edi]
00E3  76 02				jbe		L$15
00E5  B1 01				mov		cl,0x01
00E7				L$15:
00E7  89 D8				mov		eax,ebx
00E9  0F AF DE				imul		ebx,esi
00EC  03 5C 24 0C			add		ebx,dword ptr 0xc[esp]
00F0  39 C3				cmp		ebx,eax
00F2  73 02				jae		L$16
00F4  B1 01				mov		cl,0x01
00F6				L$16:
00F6  83 C2 02				add		edx,0x00000002
00F9  EB D0				jmp		L$14
00FB				L$17:
00FB  3B 54 24 04			cmp		edx,dword ptr 0x4[esp]
00FF  75 03				jne		L$18
0101  8B 14 24				mov		edx,dword ptr [esp]
0104				L$18:
0104  85 ED				test		ebp,ebp
0106  74 03				je		L$19
0108  89 55 00				mov		dword ptr [ebp],edx
010B				L$19:
010B  83 7C 24 08 01			cmp		dword ptr 0x8[esp],0x00000001
0110  75 18				jne		L$21
0112  81 FB 00 00 00 80			cmp		ebx,0x80000000
0118  72 10				jb		L$21
011A  75 0C				jne		L$20
011C  31 C0				xor		eax,eax
011E  66 8B 44 24 10			mov		ax,word ptr 0x10[esp]
0123  83 F8 2D				cmp		eax,0x0000002d
0126  74 02				je		L$21
0128				L$20:
0128  B1 01				mov		cl,0x01
012A				L$21:
012A  84 C9				test		cl,cl
012C  74 33				je		L$24
012E  B8 0E 00 00 00			mov		eax,0x0000000e
0133  8B 6C 24 08			mov		ebp,dword ptr 0x8[esp]
0137  E8 00 00 00 00			call		__set_errno_
013C  85 ED				test		ebp,ebp
013E  75 07				jne		L$22
0140  B8 FF FF FF FF			mov		eax,0xffffffff
0145  EB 2A				jmp		L$26
0147				L$22:
0147  31 C0				xor		eax,eax
0149  66 8B 44 24 10			mov		ax,word ptr 0x10[esp]
014E  83 F8 2D				cmp		eax,0x0000002d
0151  75 07				jne		L$23
0153  B8 00 00 00 80			mov		eax,0x80000000
0158  EB 17				jmp		L$26
015A				L$23:
015A  B8 FF FF FF 7F			mov		eax,0x7fffffff
015F  EB 10				jmp		L$26
0161				L$24:
0161  31 C0				xor		eax,eax
0163  66 8B 44 24 10			mov		ax,word ptr 0x10[esp]
0168  83 F8 2D				cmp		eax,0x0000002d
016B  75 02				jne		L$25
016D  F7 DB				neg		ebx
016F				L$25:
016F  89 D8				mov		eax,ebx
0171				L$26:
0171  83 C4 14				add		esp,0x00000014
0174  5D				pop		ebp
0175  5F				pop		edi
0176  5E				pop		esi
0177  C3				ret		

Routine Size: 376 bytes,    Routine Base: _TEXT + 0000

0178				_ustrtoul_:
0178  51				push		ecx
0179  31 C9				xor		ecx,ecx
017B				L$27:
017B  E8 00 00 00 00			call		_stol_
0180  59				pop		ecx
0181  C3				ret		

Routine Size: 10 bytes,    Routine Base: _TEXT + 0178

0182				_ustrtol_:
0182  51				push		ecx
0183  B9 01 00 00 00			mov		ecx,0x00000001
0188  EB F1				jmp		L$27
018A				radix_value_:
018A  52				push		edx
018B  31 D2				xor		edx,edx
018D  66 89 C2				mov		dx,ax
0190  83 FA 30				cmp		edx,0x00000030
0193  7C 0A				jl		L$28
0195  83 FA 39				cmp		edx,0x00000039
0198  7F 05				jg		L$28
019A  8D 42 D0				lea		eax,-0x30[edx]
019D  5A				pop		edx
019E  C3				ret		
019F				L$28:
019F  25 FF FF 00 00			and		eax,0x0000ffff
01A4  E8 00 00 00 00			call		_utolower_
01A9  89 C2				mov		edx,eax
01AB  81 E2 FF FF 00 00			and		edx,0x0000ffff
01B1  83 FA 61				cmp		edx,0x00000061
01B4  7C 0A				jl		L$30
01B6  83 FA 69				cmp		edx,0x00000069
01B9  7F 05				jg		L$30
01BB				L$29:
01BB  8D 42 A9				lea		eax,-0x57[edx]
01BE  5A				pop		edx
01BF  C3				ret		
01C0				L$30:
01C0  31 D2				xor		edx,edx
01C2  66 89 C2				mov		dx,ax
01C5  83 FA 6A				cmp		edx,0x0000006a
01C8  7C 05				jl		L$31
01CA  83 FA 72				cmp		edx,0x00000072
01CD  7E EC				jle		L$29
01CF				L$31:
01CF  25 FF FF 00 00			and		eax,0x0000ffff
01D4  83 F8 73				cmp		eax,0x00000073
01D7  7C 0A				jl		L$32
01D9  83 F8 7A				cmp		eax,0x0000007a
01DC  7F 05				jg		L$32
01DE  83 E8 57				sub		eax,0x00000057
01E1  5A				pop		edx
01E2  C3				ret		
01E3				L$32:
01E3  B8 25 00 00 00			mov		eax,0x00000025
01E8  5A				pop		edx
01E9  C3				ret		

Routine Size: 104 bytes,    Routine Base: _TEXT + 0182

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 0000008C bytes
0000				_nearly_overflowing:
0000  FF FF FF 7F 55 55 55 55 FF FF FF 3F 33 33 33 33 ....UUUU...?3333
0010  AA AA AA 2A 24 49 92 24 FF FF FF 1F 1C C7 71 1C ...*$I.$......q.
0020  99 99 99 19 74 D1 45 17 55 55 55 15 13 3B B1 13 ....t.E.UUU..;..
0030  92 24 49 12 11 11 11 11 FF FF FF 0F 0F 0F 0F 0F .$I.............
0040  8E E3 38 0E 5E 43 79 0D CC CC CC 0C 0C C3 30 0C ..8.^Cy.......0.
0050  BA E8 A2 0B 2C 64 21 0B AA AA AA 0A A3 70 3D 0A ....,d!......p=.
0060  89 9D D8 09 5E 42 7B 09 49 92 24 09 B0 DC D3 08 ....^B{.I.$.....
0070  88 88 88 08 84 10 42 08 FF FF FF 07 7C F0 C1 07 ......B.....|...
0080  87 87 87 07 07 75 50 07 C7 71 1C 07             .....uP..q..

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

