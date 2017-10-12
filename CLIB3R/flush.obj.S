Module: flush
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000EA bytes
0000				__flush_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  57				push		edi
0005  55				push		ebp
0006  89 C1				mov		ecx,eax
0008  8B 40 10				mov		eax,dword ptr 0x10[eax]
000B  FF 15 00 00 00 00			call		dword ptr __AccessFileH
0011  8A 61 0D				mov		ah,byte ptr 0xd[ecx]
0014  31 ED				xor		ebp,ebp
0016  F6 C4 10				test		ah,0x10
0019  0F 84 75 00 00 00			je		L$4
001F  88 E7				mov		bh,ah
0021  80 E7 EF				and		bh,0xef
0024  8A 41 0C				mov		al,byte ptr 0xc[ecx]
0027  88 79 0D				mov		byte ptr 0xd[ecx],bh
002A  A8 02				test		al,0x02
002C  0F 84 9A 00 00 00			je		L$6
0032  8B 59 08				mov		ebx,dword ptr 0x8[ecx]
0035  85 DB				test		ebx,ebx
0037  0F 84 8F 00 00 00			je		L$6
003D  89 DF				mov		edi,ebx
003F  8B 71 04				mov		esi,dword ptr 0x4[ecx]
0042				L$1:
0042  85 F6				test		esi,esi
0044  0F 84 82 00 00 00			je		L$6
004A  85 ED				test		ebp,ebp
004C  0F 85 7A 00 00 00			jne		L$6
0052  89 F3				mov		ebx,esi
0054  89 FA				mov		edx,edi
0056  8B 41 10				mov		eax,dword ptr 0x10[ecx]
0059  E8 00 00 00 00			call		__qwrite_
005E  89 C2				mov		edx,eax
0060  83 F8 FF				cmp		eax,0xffffffff
0063  75 0D				jne		L$2
0065  8A 59 0C				mov		bl,byte ptr 0xc[ecx]
0068  80 CB 20				or		bl,0x20
006B  89 C5				mov		ebp,eax
006D  88 59 0C				mov		byte ptr 0xc[ecx],bl
0070  EB 1C				jmp		L$3
0072				L$2:
0072  85 C0				test		eax,eax
0074  75 18				jne		L$3
0076  B8 0C 00 00 00			mov		eax,0x0000000c
007B  E8 00 00 00 00			call		__set_errno_
0080  8A 61 0C				mov		ah,byte ptr 0xc[ecx]
0083  80 CC 20				or		ah,0x20
0086  BD FF FF FF FF			mov		ebp,0xffffffff
008B  88 61 0C				mov		byte ptr 0xc[ecx],ah
008E				L$3:
008E  01 D7				add		edi,edx
0090  29 D6				sub		esi,edx
0092  EB AE				jmp		L$1
0094				L$4:
0094  83 79 08 00			cmp		dword ptr 0x8[ecx],0x00000000
0098  74 32				je		L$6
009A  80 61 0C EF			and		byte ptr 0xc[ecx],0xef
009E  F6 41 0D 20			test		byte ptr 0xd[ecx],0x20
00A2  75 28				jne		L$6
00A4  8B 41 04				mov		eax,dword ptr 0x4[ecx]
00A7  85 C0				test		eax,eax
00A9  74 11				je		L$5
00AB  89 C2				mov		edx,eax
00AD  BB 01 00 00 00			mov		ebx,0x00000001
00B2  F7 DA				neg		edx
00B4  8B 41 10				mov		eax,dword ptr 0x10[ecx]
00B7  E8 00 00 00 00			call		lseek_
00BC				L$5:
00BC  83 F8 FF				cmp		eax,0xffffffff
00BF  75 0B				jne		L$6
00C1  8A 59 0C				mov		bl,byte ptr 0xc[ecx]
00C4  80 CB 20				or		bl,0x20
00C7  89 C5				mov		ebp,eax
00C9  88 59 0C				mov		byte ptr 0xc[ecx],bl
00CC				L$6:
00CC  8B 41 08				mov		eax,dword ptr 0x8[ecx]
00CF  89 01				mov		dword ptr [ecx],eax
00D1  8B 41 10				mov		eax,dword ptr 0x10[ecx]
00D4  C7 41 04 00 00 00 00		mov		dword ptr 0x4[ecx],0x00000000
00DB  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
00E1  89 E8				mov		eax,ebp
00E3  5D				pop		ebp
00E4  5F				pop		edi
00E5  5E				pop		esi
00E6  5A				pop		edx
00E7  59				pop		ecx
00E8  5B				pop		ebx
00E9  C3				ret		

Routine Size: 234 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

