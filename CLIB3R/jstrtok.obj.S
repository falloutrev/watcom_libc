Module: jstrtok
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000090 bytes
0000				jstrtok_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  89 D3				mov		ebx,edx
0005  85 C0				test		eax,eax
0007  75 05				jne		L$1
0009  A1 00 00 00 00			mov		eax,dword ptr DGROUP:L$8
000E				L$1:
000E  85 C0				test		eax,eax
0010  0F 84 76 00 00 00			je		L$7
0016  89 DA				mov		edx,ebx
0018  E8 00 00 00 00			call		jstrskip_
001D  89 C1				mov		ecx,eax
001F  85 C0				test		eax,eax
0021  0F 84 65 00 00 00			je		L$7
0027  8A 10				mov		dl,byte ptr [eax]
0029  84 D2				test		dl,dl
002B  74 1A				je		L$2
002D  0F B6 F2				movzx		esi,dl
0030  8A 96 01 00 00 00			mov		dl,byte ptr __IsKTable+0x1[esi]
0036  80 E2 04				and		dl,0x04
0039  81 E2 FF 00 00 00			and		edx,0x000000ff
003F  74 0C				je		L$3
0041  80 78 01 00			cmp		byte ptr 0x1[eax],0x00
0045  75 06				jne		L$3
0047				L$2:
0047  31 C0				xor		eax,eax
0049  5E				pop		esi
004A  59				pop		ecx
004B  5B				pop		ebx
004C  C3				ret		
004D				L$3:
004D  89 DA				mov		edx,ebx
004F  89 C8				mov		eax,ecx
0051  E8 00 00 00 00			call		jstrmatch_
0056  89 C2				mov		edx,eax
0058  85 C0				test		eax,eax
005A  74 30				je		L$7
005C  8A 18				mov		bl,byte ptr [eax]
005E  84 DB				test		bl,bl
0060  75 04				jne		L$4
0062  31 C2				xor		edx,eax
0064  EB 1E				jmp		L$6
0066				L$4:
0066  0F B6 F3				movzx		esi,bl
0069  8A 9E 01 00 00 00			mov		bl,byte ptr __IsKTable+0x1[esi]
006F  80 E3 04				and		bl,0x04
0072  81 E3 FF 00 00 00			and		ebx,0x000000ff
0078  74 06				je		L$5
007A  8D 50 01				lea		edx,0x1[eax]
007D  C6 00 00				mov		byte ptr [eax],0x00
0080				L$5:
0080  C6 02 00				mov		byte ptr [edx],0x00
0083  42				inc		edx
0084				L$6:
0084  89 15 00 00 00 00			mov		dword ptr DGROUP:L$8,edx
008A  89 C8				mov		eax,ecx
008C				L$7:
008C  5E				pop		esi
008D  59				pop		ecx
008E  5B				pop		ebx
008F  C3				ret		

Routine Size: 144 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000004 bytes
0000				L$8:

BSS Size: 4 bytes

