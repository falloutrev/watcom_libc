Module: fputc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000C3 bytes
0000				fputc_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  57				push		edi
0004  55				push		ebp
0005  89 C3				mov		ebx,eax
0007  8B 42 10				mov		eax,dword ptr 0x10[edx]
000A  FF 15 00 00 00 00			call		dword ptr __AccessFileH
0010  F6 42 0C 02			test		byte ptr 0xc[edx],0x02
0014  75 21				jne		L$2
0016  B8 04 00 00 00			mov		eax,0x00000004
001B  E8 00 00 00 00			call		__set_errno_
0020  80 4A 0C 20			or		byte ptr 0xc[edx],0x20
0024				L$1:
0024  8B 42 10				mov		eax,dword ptr 0x10[edx]
0027  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
002D  B8 FF FF FF FF			mov		eax,0xffffffff
0032  E9 86 00 00 00			jmp		L$7
0037				L$2:
0037  83 7A 08 00			cmp		dword ptr 0x8[edx],0x00000000
003B  75 07				jne		L$3
003D  89 D0				mov		eax,edx
003F  E8 00 00 00 00			call		__ioalloc_
0044				L$3:
0044  B9 00 04 00 00			mov		ecx,0x00000400
0049  83 FB 0A				cmp		ebx,0x0000000a
004C  75 33				jne		L$4
004E  8A 42 0C				mov		al,byte ptr 0xc[edx]
0051  B9 00 06 00 00			mov		ecx,0x00000600
0056  A8 40				test		al,0x40
0058  75 27				jne		L$4
005A  80 4A 0D 10			or		byte ptr 0xd[edx],0x10
005E  8B 02				mov		eax,dword ptr [edx]
0060  C6 00 0D				mov		byte ptr [eax],0x0d
0063  8B 32				mov		esi,dword ptr [edx]
0065  46				inc		esi
0066  8B 7A 04				mov		edi,dword ptr 0x4[edx]
0069  89 32				mov		dword ptr [edx],esi
006B  47				inc		edi
006C  8B 6A 14				mov		ebp,dword ptr 0x14[edx]
006F  89 7A 04				mov		dword ptr 0x4[edx],edi
0072  39 EF				cmp		edi,ebp
0074  75 0B				jne		L$4
0076  89 D0				mov		eax,edx
0078  E8 00 00 00 00			call		__flush_
007D  85 C0				test		eax,eax
007F  75 A3				jne		L$1
0081				L$4:
0081  80 4A 0D 10			or		byte ptr 0xd[edx],0x10
0085  8B 02				mov		eax,dword ptr [edx]
0087  88 18				mov		byte ptr [eax],bl
0089  8B 02				mov		eax,dword ptr [edx]
008B  40				inc		eax
008C  8B 72 04				mov		esi,dword ptr 0x4[edx]
008F  89 02				mov		dword ptr [edx],eax
0091  46				inc		esi
0092  8B 7A 0C				mov		edi,dword ptr 0xc[edx]
0095  89 72 04				mov		dword ptr 0x4[edx],esi
0098  85 F9				test		ecx,edi
009A  75 05				jne		L$5
009C  3B 72 14				cmp		esi,dword ptr 0x14[edx]
009F  75 0F				jne		L$6
00A1				L$5:
00A1  89 D0				mov		eax,edx
00A3  E8 00 00 00 00			call		__flush_
00A8  85 C0				test		eax,eax
00AA  0F 85 74 FF FF FF			jne		L$1
00B0				L$6:
00B0  8B 42 10				mov		eax,dword ptr 0x10[edx]
00B3  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
00B9  31 C0				xor		eax,eax
00BB  88 D8				mov		al,bl
00BD				L$7:
00BD  5D				pop		ebp
00BE  5F				pop		edi
00BF  5E				pop		esi
00C0  59				pop		ecx
00C1  5B				pop		ebx
00C2  C3				ret		

Routine Size: 195 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

