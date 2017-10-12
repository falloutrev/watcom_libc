Module: fgetc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000179 bytes
0000				fgetc_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  89 C2				mov		edx,eax
0006  8B 40 10				mov		eax,dword ptr 0x10[eax]
0009  FF 15 00 00 00 00			call		dword ptr __AccessFileH
000F  F6 42 0C 01			test		byte ptr 0xc[edx],0x01
0013  75 15				jne		L$1
0015  B8 04 00 00 00			mov		eax,0x00000004
001A  E8 00 00 00 00			call		__set_errno_
001F  80 4A 0C 20			or		byte ptr 0xc[edx],0x20
0023  BB FF FF FF FF			mov		ebx,0xffffffff
0028  EB 23				jmp		L$3
002A				L$1:
002A  8B 5A 04				mov		ebx,dword ptr 0x4[edx]
002D  4B				dec		ebx
002E  89 5A 04				mov		dword ptr 0x4[edx],ebx
0031  85 DB				test		ebx,ebx
0033  7D 0B				jge		L$2
0035  89 D0				mov		eax,edx
0037  E8 00 00 00 00			call		__filbuf_
003C  89 C3				mov		ebx,eax
003E  EB 0D				jmp		L$3
0040				L$2:
0040  8B 02				mov		eax,dword ptr [edx]
0042  8A 18				mov		bl,byte ptr [eax]
0044  40				inc		eax
0045  81 E3 FF 00 00 00			and		ebx,0x000000ff
004B  89 02				mov		dword ptr [edx],eax
004D				L$3:
004D  F6 42 0C 40			test		byte ptr 0xc[edx],0x40
0051  75 3B				jne		L$6
0053  83 FB 0D				cmp		ebx,0x0000000d
0056  75 23				jne		L$5
0058  8B 72 04				mov		esi,dword ptr 0x4[edx]
005B  4E				dec		esi
005C  89 72 04				mov		dword ptr 0x4[edx],esi
005F  85 F6				test		esi,esi
0061  7D 0B				jge		L$4
0063  89 D0				mov		eax,edx
0065  E8 00 00 00 00			call		__filbuf_
006A  89 C3				mov		ebx,eax
006C  EB 0D				jmp		L$5
006E				L$4:
006E  8B 02				mov		eax,dword ptr [edx]
0070  8A 18				mov		bl,byte ptr [eax]
0072  40				inc		eax
0073  81 E3 FF 00 00 00			and		ebx,0x000000ff
0079  89 02				mov		dword ptr [edx],eax
007B				L$5:
007B  83 FB 1A				cmp		ebx,0x0000001a
007E  75 0E				jne		L$6
0080  8A 6A 0C				mov		ch,byte ptr 0xc[edx]
0083  80 CD 10				or		ch,0x10
0086  BB FF FF FF FF			mov		ebx,0xffffffff
008B  88 6A 0C				mov		byte ptr 0xc[edx],ch
008E				L$6:
008E  8B 42 10				mov		eax,dword ptr 0x10[edx]
0091  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
0097  89 D8				mov		eax,ebx
0099  5E				pop		esi
009A  5A				pop		edx
009B  59				pop		ecx
009C  5B				pop		ebx
009D  C3				ret		

Routine Size: 158 bytes,    Routine Base: _TEXT + 0000

009E				__filbuf_:
009E  53				push		ebx
009F  51				push		ecx
00A0  52				push		edx
00A1  89 C2				mov		edx,eax
00A3  E8 00 00 00 00			call		__fill_buffer_
00A8  85 C0				test		eax,eax
00AA  75 09				jne		L$7
00AC  B8 FF FF FF FF			mov		eax,0xffffffff
00B1  5A				pop		edx
00B2  59				pop		ecx
00B3  5B				pop		ebx
00B4  C3				ret		
00B5				L$7:
00B5  8B 5A 04				mov		ebx,dword ptr 0x4[edx]
00B8  8B 0A				mov		ecx,dword ptr [edx]
00BA  4B				dec		ebx
00BB  41				inc		ecx
00BC  89 5A 04				mov		dword ptr 0x4[edx],ebx
00BF  89 0A				mov		dword ptr [edx],ecx
00C1  8A 41 FF				mov		al,byte ptr -0x1[ecx]
00C4  25 FF 00 00 00			and		eax,0x000000ff
00C9  5A				pop		edx
00CA  59				pop		ecx
00CB  5B				pop		ebx
00CC  C3				ret		

Routine Size: 47 bytes,    Routine Base: _TEXT + 009E

00CD				__fill_buffer_:
00CD  53				push		ebx
00CE  51				push		ecx
00CF  52				push		edx
00D0  56				push		esi
00D1  89 C1				mov		ecx,eax
00D3  83 78 08 00			cmp		dword ptr 0x8[eax],0x00000000
00D7  75 05				jne		L$8
00D9  E8 00 00 00 00			call		__ioalloc_
00DE				L$8:
00DE  8A 61 0D				mov		ah,byte ptr 0xd[ecx]
00E1  F6 C4 20				test		ah,0x20
00E4  74 0F				je		L$9
00E6  F6 C4 06				test		ah,0x06
00E9  74 0A				je		L$9
00EB  B8 00 20 00 00			mov		eax,0x00002000
00F0  E8 00 00 00 00			call		__flushall_
00F5				L$9:
00F5  8B 51 08				mov		edx,dword ptr 0x8[ecx]
00F8  89 11				mov		dword ptr [ecx],edx
00FA  8A 71 0C				mov		dh,byte ptr 0xc[ecx]
00FD  8B 41 0C				mov		eax,dword ptr 0xc[ecx]
0100  80 E6 FB				and		dh,0xfb
0103  25 00 24 00 00			and		eax,0x00002400
0108  88 71 0C				mov		byte ptr 0xc[ecx],dh
010B  3D 00 24 00 00			cmp		eax,0x00002400
0110  75 23				jne		L$10
0112  8B 59 10				mov		ebx,dword ptr 0x10[ecx]
0115  85 DB				test		ebx,ebx
0117  75 1C				jne		L$10
0119  89 59 04				mov		dword ptr 0x4[ecx],ebx
011C  E8 00 00 00 00			call		getche_
0121  89 C2				mov		edx,eax
0123  83 F8 FF				cmp		eax,0xffffffff
0126  74 2A				je		L$13
0128  8B 01				mov		eax,dword ptr [ecx]
012A  88 10				mov		byte ptr [eax],dl
012C  C7 41 04 01 00 00 00		mov		dword ptr 0x4[ecx],0x00000001
0133  EB 1D				jmp		L$13
0135				L$10:
0135  F6 41 0D 04			test		byte ptr 0xd[ecx],0x04
0139  74 07				je		L$11
013B  BB 01 00 00 00			mov		ebx,0x00000001
0140  EB 03				jmp		L$12
0142				L$11:
0142  8B 59 14				mov		ebx,dword ptr 0x14[ecx]
0145				L$12:
0145  8B 11				mov		edx,dword ptr [ecx]
0147  8B 41 10				mov		eax,dword ptr 0x10[ecx]
014A  E8 00 00 00 00			call		__qread_
014F  89 41 04				mov		dword ptr 0x4[ecx],eax
0152				L$13:
0152  8B 71 04				mov		esi,dword ptr 0x4[ecx]
0155  85 F6				test		esi,esi
0157  7F 18				jg		L$15
0159  75 06				jne		L$14
015B  80 49 0C 10			or		byte ptr 0xc[ecx],0x10
015F  EB 10				jmp		L$15
0161				L$14:
0161  8A 79 0C				mov		bh,byte ptr 0xc[ecx]
0164  C7 41 04 00 00 00 00		mov		dword ptr 0x4[ecx],0x00000000
016B  80 CF 20				or		bh,0x20
016E  88 79 0C				mov		byte ptr 0xc[ecx],bh
0171				L$15:
0171  8B 41 04				mov		eax,dword ptr 0x4[ecx]
0174  5E				pop		esi
0175  5A				pop		edx
0176  59				pop		ecx
0177  5B				pop		ebx
0178  C3				ret		

Routine Size: 172 bytes,    Routine Base: _TEXT + 00CD

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

