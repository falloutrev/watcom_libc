Module: strtok
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000A4 bytes
0000				strtok_:
0000  53				push		ebx
0001  51				push		ecx
0002  83 EC 20				sub		esp,0x00000020
0005  89 C3				mov		ebx,eax
0007  85 C0				test		eax,eax
0009  75 14				jne		L$2
000B  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0011  8B 58 10				mov		ebx,dword ptr 0x10[eax]
0014  85 DB				test		ebx,ebx
0016  75 07				jne		L$2
0018				L$1:
0018  31 C0				xor		eax,eax
001A  E9 7F 00 00 00			jmp		L$10
001F				L$2:
001F  89 E0				mov		eax,esp
0021  E8 00 00 00 00			call		__setbits_
0026  EB 1F				jmp		L$4
0028				L$3:
0028  89 D0				mov		eax,edx
002A  C1 E8 03				shr		eax,0x03
002D  31 C9				xor		ecx,ecx
002F  8A 0C 04				mov		cl,byte ptr [esp+eax]
0032  89 D0				mov		eax,edx
0034  83 E0 07				and		eax,0x00000007
0037  8A 80 00 00 00 00			mov		al,byte ptr __Bits[eax]
003D  25 FF 00 00 00			and		eax,0x000000ff
0042  85 C1				test		ecx,eax
0044  74 09				je		L$5
0046  43				inc		ebx
0047				L$4:
0047  31 D2				xor		edx,edx
0049  8A 13				mov		dl,byte ptr [ebx]
004B  85 D2				test		edx,edx
004D  75 D9				jne		L$3
004F				L$5:
004F  85 D2				test		edx,edx
0051  74 C5				je		L$1
0053  89 DA				mov		edx,ebx
0055  EB 30				jmp		L$8
0057				L$6:
0057  89 C1				mov		ecx,eax
0059  C1 E9 03				shr		ecx,0x03
005C  8A 0C 0C				mov		cl,byte ptr [esp+ecx]
005F  83 E0 07				and		eax,0x00000007
0062  81 E1 FF 00 00 00			and		ecx,0x000000ff
0068  8A 80 00 00 00 00			mov		al,byte ptr __Bits[eax]
006E  25 FF 00 00 00			and		eax,0x000000ff
0073  85 C1				test		ecx,eax
0075  74 0F				je		L$7
0077  C6 02 00				mov		byte ptr [edx],0x00
007A  42				inc		edx
007B  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0081  89 50 10				mov		dword ptr 0x10[eax],edx
0084  EB 16				jmp		L$9
0086				L$7:
0086  42				inc		edx
0087				L$8:
0087  31 C0				xor		eax,eax
0089  8A 02				mov		al,byte ptr [edx]
008B  85 C0				test		eax,eax
008D  75 C8				jne		L$6
008F  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0095  C7 40 10 00 00 00 00		mov		dword ptr 0x10[eax],0x00000000
009C				L$9:
009C  89 D8				mov		eax,ebx
009E				L$10:
009E  83 C4 20				add		esp,0x00000020
00A1  59				pop		ecx
00A2  5B				pop		ebx
00A3  C3				ret		

Routine Size: 164 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

