Module: gtcmdwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000C6 bytes
0000				_bgetcmd_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  89 C6				mov		esi,eax
0005  89 D3				mov		ebx,edx
0007  E8 00 00 00 00			call		_GetCommandLineA
000C  89 C2				mov		edx,eax
000E  85 C0				test		eax,eax
0010  75 12				jne		L$2
0012  85 F6				test		esi,esi
0014  74 07				je		L$1
0016  85 DB				test		ebx,ebx
0018  74 03				je		L$1
001A  C6 06 00				mov		byte ptr [esi],0x00
001D				L$1:
001D  31 D2				xor		edx,edx
001F  E9 89 00 00 00			jmp		L$14
0024				L$2:
0024  31 C9				xor		ecx,ecx
0026  8A 08				mov		cl,byte ptr [eax]
0028  83 F9 22				cmp		ecx,0x00000022
002B  75 16				jne		L$6
002D				L$3:
002D  40				inc		eax
002E  31 D2				xor		edx,edx
0030  8A 10				mov		dl,byte ptr [eax]
0032  83 FA 22				cmp		edx,0x00000022
0035  74 04				je		L$4
0037  84 D2				test		dl,dl
0039  75 F2				jne		L$3
003B				L$4:
003B  80 38 00				cmp		byte ptr [eax],0x00
003E  74 26				je		L$7
0040				L$5:
0040  40				inc		eax
0041  EB 23				jmp		L$7
0043				L$6:
0043  8A 10				mov		dl,byte ptr [eax]
0045  FE C2				inc		dl
0047  81 E2 FF 00 00 00			and		edx,0x000000ff
004D  8A 92 00 00 00 00			mov		dl,byte ptr __IsTable[edx]
0053  80 E2 02				and		dl,0x02
0056  81 E2 FF 00 00 00			and		edx,0x000000ff
005C  75 08				jne		L$7
005E  80 38 00				cmp		byte ptr [eax],0x00
0061  74 03				je		L$7
0063  40				inc		eax
0064  EB DD				jmp		L$6
0066				L$7:
0066  8A 10				mov		dl,byte ptr [eax]
0068  FE C2				inc		dl
006A  81 E2 FF 00 00 00			and		edx,0x000000ff
0070  8A 92 00 00 00 00			mov		dl,byte ptr __IsTable[edx]
0076  80 E2 02				and		dl,0x02
0079  81 E2 FF 00 00 00			and		edx,0x000000ff
007F  75 BF				jne		L$5
0081  85 F6				test		esi,esi
0083  75 0E				jne		L$10
0085  89 C2				mov		edx,eax
0087  EB 01				jmp		L$9
0089				L$8:
0089  42				inc		edx
008A				L$9:
008A  80 3A 00				cmp		byte ptr [edx],0x00
008D  75 FA				jne		L$8
008F  29 C2				sub		edx,eax
0091  EB 1A				jmp		L$14
0093				L$10:
0093  85 DB				test		ebx,ebx
0095  74 16				je		L$14
0097  89 F2				mov		edx,esi
0099  EB 0A				jmp		L$12
009B				L$11:
009B  8A 28				mov		ch,byte ptr [eax]
009D  84 ED				test		ch,ch
009F  74 07				je		L$13
00A1  40				inc		eax
00A2  88 2A				mov		byte ptr [edx],ch
00A4  42				inc		edx
00A5				L$12:
00A5  4B				dec		ebx
00A6  75 F3				jne		L$11
00A8				L$13:
00A8  C6 02 00				mov		byte ptr [edx],0x00
00AB  29 F2				sub		edx,esi
00AD				L$14:
00AD  89 D0				mov		eax,edx
00AF  5E				pop		esi
00B0  59				pop		ecx
00B1  5B				pop		ebx
00B2  C3				ret		

Routine Size: 179 bytes,    Routine Base: _TEXT + 0000

00B3				getcmd_:
00B3  53				push		ebx
00B4  52				push		edx
00B5  89 C3				mov		ebx,eax
00B7  BA FF FF FF 7F			mov		edx,0x7fffffff
00BC  E8 00 00 00 00			call		_bgetcmd_
00C1  89 D8				mov		eax,ebx
00C3  5A				pop		edx
00C4  5B				pop		ebx
00C5  C3				ret		

Routine Size: 19 bytes,    Routine Base: _TEXT + 00B3

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

