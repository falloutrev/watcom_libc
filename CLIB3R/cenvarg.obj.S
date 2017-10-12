Module: cenvarg
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000162 bytes
0000				stpcpy_:
0000  53				push		ebx
0001				L$1:
0001  8A 1A				mov		bl,byte ptr [edx]
0003  88 18				mov		byte ptr [eax],bl
0005  84 DB				test		bl,bl
0007  74 04				je		L$2
0009  40				inc		eax
000A  42				inc		edx
000B  EB F4				jmp		L$1
000D				L$2:
000D  5B				pop		ebx
000E  C3				ret		

Routine Size: 15 bytes,    Routine Base: _TEXT + 0000

000F				__cenvarg_:
000F  56				push		esi
0010  57				push		edi
0011  C8 08 00 00			enter		0x0008,0x00
0015  89 C6				mov		esi,eax
0017  89 D7				mov		edi,edx
0019  89 5D F8				mov		dword ptr -0x8[ebp],ebx
001C  85 D2				test		edx,edx
001E  75 06				jne		L$3
0020  8B 3D 00 00 00 00			mov		edi,dword ptr _environ
0026				L$3:
0026  31 DB				xor		ebx,ebx
0028  85 FF				test		edi,edi
002A  74 16				je		L$6
002C  89 FA				mov		edx,edi
002E  EB 0D				jmp		L$5
0030				L$4:
0030  8B 02				mov		eax,dword ptr [edx]
0032  E8 00 00 00 00			call		strlen_
0037  40				inc		eax
0038  83 C2 04				add		edx,0x00000004
003B  01 C3				add		ebx,eax
003D				L$5:
003D  83 3A 00				cmp		dword ptr [edx],0x00000000
0040  75 EE				jne		L$4
0042				L$6:
0042  43				inc		ebx
0043  83 7D 18 00			cmp		dword ptr 0x18[ebp],0x00000000
0047  74 0C				je		L$7
0049  8B 06				mov		eax,dword ptr [esi]
004B  E8 00 00 00 00			call		strlen_
0050  83 C0 03				add		eax,0x00000003
0053  01 C3				add		ebx,eax
0055				L$7:
0055  A1 00 00 00 00			mov		eax,dword ptr __amblksiz
005A  83 C3 0F				add		ebx,0x0000000f
005D  89 45 FC				mov		dword ptr -0x4[ebp],eax
0060  89 D8				mov		eax,ebx
0062  C7 05 00 00 00 00 10 00 00 00
					mov		dword ptr __amblksiz,0x00000010
006C  E8 00 00 00 00			call		_nmalloc_
0071  85 C0				test		eax,eax
0073  75 31				jne		L$8
0075  89 D8				mov		eax,ebx
0077  E8 00 00 00 00			call		malloc_
007C  85 C0				test		eax,eax
007E  75 26				jne		L$8
0080  B8 05 00 00 00			mov		eax,0x00000005
0085  E8 00 00 00 00			call		__set_errno_
008A  B8 08 00 00 00			mov		eax,0x00000008
008F  E8 00 00 00 00			call		__set_doserrno_
0094  8B 45 FC				mov		eax,dword ptr -0x4[ebp]
0097  A3 00 00 00 00			mov		dword ptr __amblksiz,eax
009C  B8 FF FF FF FF			mov		eax,0xffffffff
00A1  E9 75 00 00 00			jmp		L$17
00A6				L$8:
00A6  8B 55 FC				mov		edx,dword ptr -0x4[ebp]
00A9  89 15 00 00 00 00			mov		dword ptr __amblksiz,edx
00AF  8B 55 F8				mov		edx,dword ptr -0x8[ebp]
00B2  89 02				mov		dword ptr [edx],eax
00B4  8B 55 10				mov		edx,dword ptr 0x10[ebp]
00B7  C7 02 00 00 00 00			mov		dword ptr [edx],0x00000000
00BD  89 01				mov		dword ptr [ecx],eax
00BF  85 FF				test		edi,edi
00C1  74 14				je		L$11
00C3  89 F9				mov		ecx,edi
00C5  EB 0B				jmp		L$10
00C7				L$9:
00C7  8B 11				mov		edx,dword ptr [ecx]
00C9  E8 00 00 00 00			call		stpcpy_
00CE  40				inc		eax
00CF  83 C1 04				add		ecx,0x00000004
00D2				L$10:
00D2  83 39 00				cmp		dword ptr [ecx],0x00000000
00D5  75 F0				jne		L$9
00D7				L$11:
00D7  C6 00 00				mov		byte ptr [eax],0x00
00DA  40				inc		eax
00DB  83 7D 18 00			cmp		dword ptr 0x18[ebp],0x00000000
00DF  74 09				je		L$12
00E1  40				inc		eax
00E2  40				inc		eax
00E3  8B 16				mov		edx,dword ptr [esi]
00E5  E8 00 00 00 00			call		strcpy_
00EA				L$12:
00EA  31 D2				xor		edx,edx
00EC  83 3E 00				cmp		dword ptr [esi],0x00000000
00EF  74 1A				je		L$16
00F1  83 C6 04				add		esi,0x00000004
00F4  EB 0F				jmp		L$15
00F6				L$13:
00F6  85 D2				test		edx,edx
00F8  74 01				je		L$14
00FA  42				inc		edx
00FB				L$14:
00FB  E8 00 00 00 00			call		strlen_
0100  83 C6 04				add		esi,0x00000004
0103  01 C2				add		edx,eax
0105				L$15:
0105  8B 06				mov		eax,dword ptr [esi]
0107  85 C0				test		eax,eax
0109  75 EB				jne		L$13
010B				L$16:
010B  8B 45 14				mov		eax,dword ptr 0x14[ebp]
010E  81 C2 08 01 00 00			add		edx,0x00000108
0114  89 10				mov		dword ptr [eax],edx
0116  89 D8				mov		eax,ebx
0118  C1 E8 04				shr		eax,0x04
011B				L$17:
011B  C9				leave		
011C  5F				pop		edi
011D  5E				pop		esi
011E  C2 0C 00				ret		0x000c

Routine Size: 274 bytes,    Routine Base: _TEXT + 000F

0121				__ccmdline_:
0121  56				push		esi
0122  57				push		edi
0123  89 C7				mov		edi,eax
0125  89 D6				mov		esi,edx
0127  89 D8				mov		eax,ebx
0129  85 C9				test		ecx,ecx
012B  75 0B				jne		L$18
012D  89 FA				mov		edx,edi
012F  E8 00 00 00 00			call		stpcpy_
0134  C6 00 20				mov		byte ptr [eax],0x20
0137  40				inc		eax
0138				L$18:
0138  83 3E 00				cmp		dword ptr [esi],0x00000000
013B  74 1F				je		L$20
013D  83 C6 04				add		esi,0x00000004
0140  83 3E 00				cmp		dword ptr [esi],0x00000000
0143  74 17				je		L$20
0145				L$19:
0145  8B 16				mov		edx,dword ptr [esi]
0147  83 C6 04				add		esi,0x00000004
014A  E8 00 00 00 00			call		stpcpy_
014F  89 C2				mov		edx,eax
0151  83 3E 00				cmp		dword ptr [esi],0x00000000
0154  74 06				je		L$20
0156  C6 00 20				mov		byte ptr [eax],0x20
0159  40				inc		eax
015A  EB E9				jmp		L$19
015C				L$20:
015C  C6 00 00				mov		byte ptr [eax],0x00
015F  5F				pop		edi
0160  5E				pop		esi
0161  C3				ret		

Routine Size: 65 bytes,    Routine Base: _TEXT + 0121

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

