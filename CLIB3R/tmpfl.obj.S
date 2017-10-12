Module: tmpfl
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000CF bytes
0000				tmpfile_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  55				push		ebp
0005  83 EC 20				sub		esp,0x00000020
0008  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
000E  8B 70 04				mov		esi,dword ptr 0x4[eax]
0011  31 C9				xor		ecx,ecx
0013  BD 02 00 00 00			mov		ebp,0x00000002
0018				L$1:
0018  89 E0				mov		eax,esp
001A  89 CA				mov		edx,ecx
001C  E8 00 00 00 00			call		__MkTmpFile_
0021  89 E0				mov		eax,esp
0023  89 EA				mov		edx,ebp
0025  41				inc		ecx
0026  E8 00 00 00 00			call		access_
002B  85 C0				test		eax,eax
002D  74 E9				je		L$1
002F  BA 00 00 00 00			mov		edx,offset DGROUP:L$8
0034  89 E0				mov		eax,esp
0036  E8 00 00 00 00			call		fopen_
003B  85 C0				test		eax,eax
003D  75 11				jne		L$3
003F  E8 00 00 00 00			call		__get_errno_ptr_
0044  83 38 0B				cmp		dword ptr [eax],0x0000000b
0047  75 CF				jne		L$1
0049				L$2:
0049  31 C0				xor		eax,eax
004B  E9 76 00 00 00			jmp		L$7
0050				L$3:
0050  31 DB				xor		ebx,ebx
0052  E8 00 00 00 00			call		fclose_
0057  8A 1D 00 00 00 00			mov		bl,byte ptr ___tmpfnext
005D				L$4:
005D  8D 44 24 10			lea		eax,0x10[esp]
0061  89 DA				mov		edx,ebx
0063  E8 00 00 00 00			call		__MkTmpFile_
0068  8D 54 24 10			lea		edx,0x10[esp]
006C  89 E0				mov		eax,esp
006E  E8 00 00 00 00			call		rename_
0073  85 C0				test		eax,eax
0075  75 3B				jne		L$6
0077  BA 00 00 00 00			mov		edx,offset DGROUP:L$8
007C  8D 44 24 10			lea		eax,0x10[esp]
0080  E8 00 00 00 00			call		fopen_
0085  89 C2				mov		edx,eax
0087  85 C0				test		eax,eax
0089  74 1D				je		L$5
008B  8A 60 0D				mov		ah,byte ptr 0xd[eax]
008E  80 CC 08				or		ah,0x08
0091  88 1D 00 00 00 00			mov		byte ptr ___tmpfnext,bl
0097  88 62 0D				mov		byte ptr 0xd[edx],ah
009A  89 F0				mov		eax,esi
009C  88 5A 19				mov		byte ptr 0x19[edx],bl
009F  E8 00 00 00 00			call		__set_errno_
00A4  89 D0				mov		eax,edx
00A6  EB 1E				jmp		L$7
00A8				L$5:
00A8  E8 00 00 00 00			call		__get_errno_ptr_
00AD  83 38 0B				cmp		dword ptr [eax],0x0000000b
00B0  74 97				je		L$2
00B2				L$6:
00B2  89 E0				mov		eax,esp
00B4  89 EA				mov		edx,ebp
00B6  43				inc		ebx
00B7  E8 00 00 00 00			call		access_
00BC  85 C0				test		eax,eax
00BE  0F 85 54 FF FF FF			jne		L$1
00C4  EB 97				jmp		L$4
00C6				L$7:
00C6  83 C4 20				add		esp,0x00000020
00C9  5D				pop		ebp
00CA  5E				pop		esi
00CB  5A				pop		edx
00CC  59				pop		ecx
00CD  5B				pop		ebx
00CE  C3				ret		

Routine Size: 207 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000004 bytes
0000				L$8:
0000  77 62 2B 00                                     wb+.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

