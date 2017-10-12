Module: mbconv
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000008C bytes
0000				_mbptov_:
0000  52				push		edx
0001  8B 15 00 00 00 00			mov		edx,dword ptr ___IsDBCS
0007  85 D2				test		edx,edx
0009  74 13				je		L$1
000B  31 D2				xor		edx,edx
000D  8A 10				mov		dl,byte ptr [eax]
000F  8A 92 01 00 00 00			mov		dl,byte ptr ___MBCSIsTable+0x1[edx]
0015  80 E2 01				and		dl,0x01
0018  81 E2 FF 00 00 00			and		edx,0x000000ff
001E				L$1:
001E  85 D2				test		edx,edx
0020  74 13				je		L$2
0022  31 D2				xor		edx,edx
0024  8A 10				mov		dl,byte ptr [eax]
0026  C1 E2 08				shl		edx,0x08
0029  8A 40 01				mov		al,byte ptr 0x1[eax]
002C  25 FF 00 00 00			and		eax,0x000000ff
0031  09 D0				or		eax,edx
0033  5A				pop		edx
0034  C3				ret		
0035				L$2:
0035  8A 00				mov		al,byte ptr [eax]
0037  25 FF 00 00 00			and		eax,0x000000ff
003C  5A				pop		edx
003D  C3				ret		

Routine Size: 62 bytes,    Routine Base: _TEXT + 0000

003E				_mbvtop_:
003E  53				push		ebx
003F  89 C3				mov		ebx,eax
0041  89 D0				mov		eax,edx
0043  F6 C7 FF				test		bh,0xff
0046  74 0C				je		L$3
0048  89 DA				mov		edx,ebx
004A  88 58 01				mov		byte ptr 0x1[eax],bl
004D  C1 EA 08				shr		edx,0x08
0050  88 10				mov		byte ptr [eax],dl
0052  5B				pop		ebx
0053  C3				ret		
0054				L$3:
0054  88 1A				mov		byte ptr [edx],bl
0056  5B				pop		ebx
0057  C3				ret		

Routine Size: 26 bytes,    Routine Base: _TEXT + 003E

0058				__mbvtop_:
0058  52				push		edx
0059  F6 C4 FF				test		ah,0xff
005C  74 1A				je		L$4
005E  89 C2				mov		edx,eax
0060  C1 EA 08				shr		edx,0x08
0063  88 15 00 00 00 00			mov		byte ptr DGROUP:L$6,dl
0069  30 D2				xor		dl,dl
006B  A2 01 00 00 00			mov		byte ptr DGROUP:L$7,al
0070  88 15 02 00 00 00			mov		byte ptr DGROUP:L$8,dl
0076  EB 0D				jmp		L$5
0078				L$4:
0078  A2 00 00 00 00			mov		byte ptr DGROUP:L$6,al
007D  30 E4				xor		ah,ah
007F  88 25 01 00 00 00			mov		byte ptr DGROUP:L$7,ah
0085				L$5:
0085  B8 00 00 00 00			mov		eax,offset DGROUP:L$6
008A  5A				pop		edx
008B  C3				ret		

Routine Size: 52 bytes,    Routine Base: _TEXT + 0058

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000003 bytes
0000				L$6:
0001				L$7:
0002				L$8:

BSS Size: 3 bytes

