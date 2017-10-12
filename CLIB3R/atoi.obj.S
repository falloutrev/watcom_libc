Module: atoi
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000006D bytes
0000				atoi_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003				L$1:
0003  8A 10				mov		dl,byte ptr [eax]
0005  FE C2				inc		dl
0007  81 E2 FF 00 00 00			and		edx,0x000000ff
000D  8A 92 00 00 00 00			mov		dl,byte ptr __IsTable[edx]
0013  80 E2 02				and		dl,0x02
0016  81 E2 FF 00 00 00			and		edx,0x000000ff
001C  74 03				je		L$2
001E  40				inc		eax
001F  EB E2				jmp		L$1
0021				L$2:
0021  8A 08				mov		cl,byte ptr [eax]
0023  88 CA				mov		dl,cl
0025  83 FA 2B				cmp		edx,0x0000002b
0028  74 05				je		L$3
002A  83 FA 2D				cmp		edx,0x0000002d
002D  75 01				jne		L$4
002F				L$3:
002F  40				inc		eax
0030				L$4:
0030  31 DB				xor		ebx,ebx
0032				L$5:
0032  8A 10				mov		dl,byte ptr [eax]
0034  FE C2				inc		dl
0036  81 E2 FF 00 00 00			and		edx,0x000000ff
003C  8A 92 00 00 00 00			mov		dl,byte ptr __IsTable[edx]
0042  80 E2 20				and		dl,0x20
0045  81 E2 FF 00 00 00			and		edx,0x000000ff
004B  74 0F				je		L$6
004D  6B DB 0A				imul		ebx,0x0000000a
0050  31 D2				xor		edx,edx
0052  8A 10				mov		dl,byte ptr [eax]
0054  01 D3				add		ebx,edx
0056  40				inc		eax
0057  83 EB 30				sub		ebx,0x00000030
005A  EB D6				jmp		L$5
005C				L$6:
005C  31 C0				xor		eax,eax
005E  88 C8				mov		al,cl
0060  83 F8 2D				cmp		eax,0x0000002d
0063  75 02				jne		L$7
0065  F7 DB				neg		ebx
0067				L$7:
0067  89 D8				mov		eax,ebx
0069  5A				pop		edx
006A  59				pop		ecx
006B  5B				pop		ebx
006C  C3				ret		

Routine Size: 109 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

