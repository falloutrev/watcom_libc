Module: fseek
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000136 bytes
0000				__update_buffer_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  57				push		edi
0004  80 62 0C EF			and		byte ptr 0xc[edx],0xef
0008  3B 42 04				cmp		eax,dword ptr 0x4[edx]
000B  7F 1F				jg		L$1
000D  8B 5A 08				mov		ebx,dword ptr 0x8[edx]
0010  8B 0A				mov		ecx,dword ptr [edx]
0012  29 CB				sub		ebx,ecx
0014  39 D8				cmp		eax,ebx
0016  7C 14				jl		L$1
0018  8B 7A 04				mov		edi,dword ptr 0x4[edx]
001B  8D 34 01				lea		esi,[ecx+eax]
001E  29 C7				sub		edi,eax
0020  89 32				mov		dword ptr [edx],esi
0022  31 C0				xor		eax,eax
0024  89 7A 04				mov		dword ptr 0x4[edx],edi
0027  5F				pop		edi
0028  5E				pop		esi
0029  59				pop		ecx
002A  5B				pop		ebx
002B  C3				ret		
002C				L$1:
002C  8B 42 08				mov		eax,dword ptr 0x8[edx]
002F  C7 42 04 00 00 00 00		mov		dword ptr 0x4[edx],0x00000000
0036  89 02				mov		dword ptr [edx],eax
0038  B8 01 00 00 00			mov		eax,0x00000001
003D  5F				pop		edi
003E  5E				pop		esi
003F  59				pop		ecx
0040  5B				pop		ebx
0041  C3				ret		

Routine Size: 66 bytes,    Routine Base: _TEXT + 0000

0042				fseek_:
0042  51				push		ecx
0043  56				push		esi
0044  57				push		edi
0045  89 C1				mov		ecx,eax
0047  89 D6				mov		esi,edx
0049  8B 40 10				mov		eax,dword ptr 0x10[eax]
004C  FF 15 00 00 00 00			call		dword ptr __AccessFileH
0052  8A 61 0C				mov		ah,byte ptr 0xc[ecx]
0055  F6 C4 06				test		ah,0x06
0058  74 62				je		L$9
005A  F6 41 0D 10			test		byte ptr 0xd[ecx],0x10
005E  74 1F				je		L$3
0060  89 C8				mov		eax,ecx
0062  E8 00 00 00 00			call		__flush_
0067  85 C0				test		eax,eax
0069  74 28				je		L$5
006B  85 DB				test		ebx,ebx
006D  75 3B				jne		L$8
006F  85 F6				test		esi,esi
0071  7D 37				jge		L$8
0073				L$2:
0073  B8 09 00 00 00			mov		eax,0x00000009
0078  E8 00 00 00 00			call		__set_errno_
007D  EB 2B				jmp		L$8
007F				L$3:
007F  83 FB 01				cmp		ebx,0x00000001
0082  75 03				jne		L$4
0084  2B 71 04				sub		esi,dword ptr 0x4[ecx]
0087				L$4:
0087  8B 41 08				mov		eax,dword ptr 0x8[ecx]
008A  C7 41 04 00 00 00 00		mov		dword ptr 0x4[ecx],0x00000000
0091  89 01				mov		dword ptr [ecx],eax
0093				L$5:
0093  80 61 0C EB			and		byte ptr 0xc[ecx],0xeb
0097				L$6:
0097  89 F2				mov		edx,esi
0099  8B 41 10				mov		eax,dword ptr 0x10[ecx]
009C				L$7:
009C  E8 00 00 00 00			call		lseek_
00A1  83 F8 FF				cmp		eax,0xffffffff
00A4  0F 85 7D 00 00 00			jne		L$14
00AA				L$8:
00AA  8B 41 10				mov		eax,dword ptr 0x10[ecx]
00AD  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
00B3  B8 FF FF FF FF			mov		eax,0xffffffff
00B8  5F				pop		edi
00B9  5E				pop		esi
00BA  59				pop		ecx
00BB  C3				ret		
00BC				L$9:
00BC  83 FB 01				cmp		ebx,0x00000001
00BF  72 09				jb		L$10
00C1  76 0D				jbe		L$11
00C3  83 FB 02				cmp		ebx,0x00000002
00C6  74 41				je		L$13
00C8  EB A9				jmp		L$2
00CA				L$10:
00CA  85 DB				test		ebx,ebx
00CC  74 1B				je		L$12
00CE  EB A3				jmp		L$2
00D0				L$11:
00D0  89 CA				mov		edx,ecx
00D2  89 F0				mov		eax,esi
00D4  8B 79 04				mov		edi,dword ptr 0x4[ecx]
00D7  E8 00 00 00 00			call		__update_buffer_
00DC  85 C0				test		eax,eax
00DE  74 47				je		L$14
00E0  89 F2				mov		edx,esi
00E2  8B 41 10				mov		eax,dword ptr 0x10[ecx]
00E5  29 FA				sub		edx,edi
00E7  EB B3				jmp		L$7
00E9				L$12:
00E9  8B 41 10				mov		eax,dword ptr 0x10[ecx]
00EC  E8 00 00 00 00			call		tell_
00F1  8B 51 04				mov		edx,dword ptr 0x4[ecx]
00F4  89 F7				mov		edi,esi
00F6  29 D0				sub		eax,edx
00F8  29 C7				sub		edi,eax
00FA  89 CA				mov		edx,ecx
00FC  89 F8				mov		eax,edi
00FE  E8 00 00 00 00			call		__update_buffer_
0103  85 C0				test		eax,eax
0105  74 20				je		L$14
0107  EB 8E				jmp		L$6
0109				L$13:
0109  88 E2				mov		dl,ah
010B  80 E2 EF				and		dl,0xef
010E  8B 41 08				mov		eax,dword ptr 0x8[ecx]
0111  88 51 0C				mov		byte ptr 0xc[ecx],dl
0114  89 01				mov		dword ptr [ecx],eax
0116  89 F2				mov		edx,esi
0118  8B 41 10				mov		eax,dword ptr 0x10[ecx]
011B  C7 41 04 00 00 00 00		mov		dword ptr 0x4[ecx],0x00000000
0122  E9 75 FF FF FF			jmp		L$7
0127				L$14:
0127  8B 41 10				mov		eax,dword ptr 0x10[ecx]
012A  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
0130  31 C0				xor		eax,eax
0132  5F				pop		edi
0133  5E				pop		esi
0134  59				pop		ecx
0135  C3				ret		

Routine Size: 244 bytes,    Routine Base: _TEXT + 0042

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

