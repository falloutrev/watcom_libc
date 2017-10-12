Module: fclose
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000170 bytes
0000				fclose_:
0000  53				push		ebx
0001  52				push		edx
0002  89 C3				mov		ebx,eax
0004  FF 15 00 00 00 00			call		dword ptr __AccessIOB
000A  A1 00 00 00 00			mov		eax,dword ptr ___OpenStreams
000F				L$1:
000F  85 C0				test		eax,eax
0011  75 0E				jne		L$2
0013  FF 15 00 00 00 00			call		dword ptr __ReleaseIOB
0019  B8 FF FF FF FF			mov		eax,0xffffffff
001E  5A				pop		edx
001F  5B				pop		ebx
0020  C3				ret		
0021				L$2:
0021  3B 58 04				cmp		ebx,dword ptr 0x4[eax]
0024  74 04				je		L$3
0026  8B 00				mov		eax,dword ptr [eax]
0028  EB E5				jmp		L$1
002A				L$3:
002A  FF 15 00 00 00 00			call		dword ptr __ReleaseIOB
0030  BA 01 00 00 00			mov		edx,0x00000001
0035  89 D8				mov		eax,ebx
0037  E8 00 00 00 00			call		__shutdown_stream_
003C  5A				pop		edx
003D  5B				pop		ebx
003E  C3				ret		

Routine Size: 63 bytes,    Routine Base: _TEXT + 0000

003F				__shutdown_stream_:
003F  53				push		ebx
0040  89 C3				mov		ebx,eax
0042  E8 00 00 00 00			call		__doclose_
0047  89 C2				mov		edx,eax
0049  89 D8				mov		eax,ebx
004B  E8 00 00 00 00			call		__freefp_
0050  89 D0				mov		eax,edx
0052  5B				pop		ebx
0053  C3				ret		
0054				__hex_:
0054  83 C0 30				add		eax,0x00000030
0057  83 F8 39				cmp		eax,0x00000039
005A  7E 03				jle		L$4
005C  83 C0 27				add		eax,0x00000027
005F				L$4:
005F  C3				ret		

Routine Size: 33 bytes,    Routine Base: _TEXT + 003F

0060				__MkTmpFile_:
0060  53				push		ebx
0061  51				push		ecx
0062  56				push		esi
0063  57				push		edi
0064  89 C1				mov		ecx,eax
0066  89 D7				mov		edi,edx
0068  E8 00 00 00 00			call		getpid_
006D  89 C3				mov		ebx,eax
006F  8D 51 04				lea		edx,0x4[ecx]
0072  C6 01 74				mov		byte ptr [ecx],0x74
0075  89 CE				mov		esi,ecx
0077				L$5:
0077  89 D8				mov		eax,ebx
0079  83 E0 0F				and		eax,0x0000000f
007C  E8 00 00 00 00			call		__hex_
0081  88 02				mov		byte ptr [edx],al
0083  4A				dec		edx
0084  C1 EB 04				shr		ebx,0x04
0087  39 F2				cmp		edx,esi
0089  75 EC				jne		L$5
008B  89 F8				mov		eax,edi
008D  C1 F8 04				sar		eax,0x04
0090  83 E0 0F				and		eax,0x0000000f
0093  C6 41 05 5F			mov		byte ptr 0x5[ecx],0x5f
0097  E8 00 00 00 00			call		__hex_
009C  88 41 06				mov		byte ptr 0x6[ecx],al
009F  89 F8				mov		eax,edi
00A1  83 E0 0F				and		eax,0x0000000f
00A4  E8 00 00 00 00			call		__hex_
00A9  C6 41 08 2E			mov		byte ptr 0x8[ecx],0x2e
00AD  C6 41 09 74			mov		byte ptr 0x9[ecx],0x74
00B1  C6 41 0A 6D			mov		byte ptr 0xa[ecx],0x6d
00B5  C6 41 0B 70			mov		byte ptr 0xb[ecx],0x70
00B9  C6 41 0C 00			mov		byte ptr 0xc[ecx],0x00
00BD  88 41 07				mov		byte ptr 0x7[ecx],al
00C0  5F				pop		edi
00C1  5E				pop		esi
00C2  59				pop		ecx
00C3  5B				pop		ebx
00C4  C3				ret		

Routine Size: 101 bytes,    Routine Base: _TEXT + 0060

00C5				__doclose_:
00C5  53				push		ebx
00C6  51				push		ecx
00C7  56				push		esi
00C8  57				push		edi
00C9  55				push		ebp
00CA  83 EC 10				sub		esp,0x00000010
00CD  89 C1				mov		ecx,eax
00CF  89 D5				mov		ebp,edx
00D1  83 78 0C 00			cmp		dword ptr 0xc[eax],0x00000000
00D5  75 0A				jne		L$6
00D7  B8 FF FF FF FF			mov		eax,0xffffffff
00DC  E9 86 00 00 00			jmp		L$12
00E1				L$6:
00E1  8A 60 0D				mov		ah,byte ptr 0xd[eax]
00E4  31 F6				xor		esi,esi
00E6  F6 C4 10				test		ah,0x10
00E9  74 09				je		L$7
00EB  89 C8				mov		eax,ecx
00ED  E8 00 00 00 00			call		__flush_
00F2  89 C6				mov		esi,eax
00F4				L$7:
00F4  8B 41 10				mov		eax,dword ptr 0x10[ecx]
00F7  FF 15 00 00 00 00			call		dword ptr __AccessFileH
00FD  89 C8				mov		eax,ecx
00FF  E8 00 00 00 00			call		ftell_
0104  83 F8 FF				cmp		eax,0xffffffff
0107  74 0E				je		L$8
0109  89 C2				mov		edx,eax
010B  8B 79 10				mov		edi,dword ptr 0x10[ecx]
010E  31 DB				xor		ebx,ebx
0110  89 F8				mov		eax,edi
0112  E8 00 00 00 00			call		lseek_
0117				L$8:
0117  85 ED				test		ebp,ebp
0119  74 0A				je		L$9
011B  8B 41 10				mov		eax,dword ptr 0x10[ecx]
011E  E8 00 00 00 00			call		__close_
0123  09 C6				or		esi,eax
0125				L$9:
0125  F6 41 0C 08			test		byte ptr 0xc[ecx],0x08
0129  74 0F				je		L$10
012B  8B 41 08				mov		eax,dword ptr 0x8[ecx]
012E  E8 00 00 00 00			call		free_
0133  C7 41 08 00 00 00 00		mov		dword ptr 0x8[ecx],0x00000000
013A				L$10:
013A  F6 41 0D 08			test		byte ptr 0xd[ecx],0x08
013E  74 13				je		L$11
0140  31 D2				xor		edx,edx
0142  89 E0				mov		eax,esp
0144  8A 51 19				mov		dl,byte ptr 0x19[ecx]
0147  E8 00 00 00 00			call		__MkTmpFile_
014C  89 E0				mov		eax,esp
014E  E8 00 00 00 00			call		remove_
0153				L$11:
0153  8B 41 10				mov		eax,dword ptr 0x10[ecx]
0156  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
015C  8B 41 10				mov		eax,dword ptr 0x10[ecx]
015F  FF 15 00 00 00 00			call		dword ptr __FiniAccessH
0165  89 F0				mov		eax,esi
0167				L$12:
0167  83 C4 10				add		esp,0x00000010
016A  5D				pop		ebp
016B  5F				pop		edi
016C  5E				pop		esi
016D  59				pop		ecx
016E  5B				pop		ebx
016F  C3				ret		

Routine Size: 171 bytes,    Routine Base: _TEXT + 00C5

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

