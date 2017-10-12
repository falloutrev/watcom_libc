Module: ungetc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000009B bytes
0000				ungetc_:
0000  53				push		ebx
0001  56				push		esi
0002  55				push		ebp
0003  89 C3				mov		ebx,eax
0005  83 F8 FF				cmp		eax,0xffffffff
0008  0F 84 89 00 00 00			je		L$7
000E  8B 42 10				mov		eax,dword ptr 0x10[edx]
0011  FF 15 00 00 00 00			call		dword ptr __AccessFileH
0017  F6 42 0D 10			test		byte ptr 0xd[edx],0x10
001B  74 12				je		L$2
001D				L$1:
001D  8B 42 10				mov		eax,dword ptr 0x10[edx]
0020  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
0026  B8 FF FF FF FF			mov		eax,0xffffffff
002B  5D				pop		ebp
002C  5E				pop		esi
002D  5B				pop		ebx
002E  C3				ret		
002F				L$2:
002F  F6 42 0C 01			test		byte ptr 0xc[edx],0x01
0033  74 E8				je		L$1
0035  83 7A 08 00			cmp		dword ptr 0x8[edx],0x00000000
0039  75 07				jne		L$3
003B  89 D0				mov		eax,edx
003D  E8 00 00 00 00			call		__ioalloc_
0042				L$3:
0042  8B 72 04				mov		esi,dword ptr 0x4[edx]
0045  85 F6				test		esi,esi
0047  75 18				jne		L$4
0049  8B 42 08				mov		eax,dword ptr 0x8[edx]
004C  03 42 14				add		eax,dword ptr 0x14[edx]
004F  48				dec		eax
0050  89 02				mov		dword ptr [edx],eax
0052  80 4A 0C 04			or		byte ptr 0xc[edx],0x04
0056  8B 02				mov		eax,dword ptr [edx]
0058  C7 42 04 01 00 00 00		mov		dword ptr 0x4[edx],0x00000001
005F  EB 23				jmp		L$6
0061				L$4:
0061  8B 02				mov		eax,dword ptr [edx]
0063  3B 42 08				cmp		eax,dword ptr 0x8[edx]
0066  74 B5				je		L$1
0068  8B 02				mov		eax,dword ptr [edx]
006A  8D 6E 01				lea		ebp,0x1[esi]
006D  48				dec		eax
006E  89 6A 04				mov		dword ptr 0x4[edx],ebp
0071  89 02				mov		dword ptr [edx],eax
0073  8A 00				mov		al,byte ptr [eax]
0075  25 FF 00 00 00			and		eax,0x000000ff
007A  39 D8				cmp		eax,ebx
007C  74 04				je		L$5
007E  80 4A 0C 04			or		byte ptr 0xc[edx],0x04
0082				L$5:
0082  8B 02				mov		eax,dword ptr [edx]
0084				L$6:
0084  88 18				mov		byte ptr [eax],bl
0086  80 62 0C EF			and		byte ptr 0xc[edx],0xef
008A  8B 42 10				mov		eax,dword ptr 0x10[edx]
008D  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
0093  31 C0				xor		eax,eax
0095  88 D8				mov		al,bl
0097				L$7:
0097  5D				pop		ebp
0098  5E				pop		esi
0099  5B				pop		ebx
009A  C3				ret		

Routine Size: 155 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

