Module: ioalloc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000077 bytes
0000				__ioalloc_:
0000  51				push		ecx
0001  52				push		edx
0002  89 C2				mov		edx,eax
0004  E8 00 00 00 00			call		__chktty_
0009  83 7A 14 00			cmp		dword ptr 0x14[edx],0x00000000
000D  75 26				jne		L$3
000F  8A 62 0D				mov		ah,byte ptr 0xd[edx]
0012  F6 C4 02				test		ah,0x02
0015  74 09				je		L$1
0017  C7 42 14 86 00 00 00		mov		dword ptr 0x14[edx],0x00000086
001E  EB 15				jmp		L$3
0020				L$1:
0020  F6 C4 04				test		ah,0x04
0023  74 09				je		L$2
0025  C7 42 14 01 00 00 00		mov		dword ptr 0x14[edx],0x00000001
002C  EB 07				jmp		L$3
002E				L$2:
002E  C7 42 14 00 10 00 00		mov		dword ptr 0x14[edx],0x00001000
0035				L$3:
0035  8B 42 14				mov		eax,dword ptr 0x14[edx]
0038  E8 00 00 00 00			call		malloc_
003D  89 42 08				mov		dword ptr 0x8[edx],eax
0040  85 C0				test		eax,eax
0042  75 20				jne		L$4
0044  8A 4A 0D				mov		cl,byte ptr 0xd[edx]
0047  C7 42 14 01 00 00 00		mov		dword ptr 0x14[edx],0x00000001
004E  80 E1 F8				and		cl,0xf8
0051  8D 42 18				lea		eax,0x18[edx]
0054  88 4A 0D				mov		byte ptr 0xd[edx],cl
0057  88 CD				mov		ch,cl
0059  89 42 08				mov		dword ptr 0x8[edx],eax
005C  80 CD 04				or		ch,0x04
005F  88 6A 0D				mov		byte ptr 0xd[edx],ch
0062  EB 04				jmp		L$5
0064				L$4:
0064  80 4A 0C 08			or		byte ptr 0xc[edx],0x08
0068				L$5:
0068  8B 42 08				mov		eax,dword ptr 0x8[edx]
006B  C7 42 04 00 00 00 00		mov		dword ptr 0x4[edx],0x00000000
0072  89 02				mov		dword ptr [edx],eax
0074  5A				pop		edx
0075  59				pop		ecx
0076  C3				ret		

Routine Size: 119 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

