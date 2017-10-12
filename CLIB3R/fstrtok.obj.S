Module: fstrtok
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000D3 bytes
0000				_fstrtok_:
0000  56				push		esi
0001  57				push		edi
0002  06				push		es
0003  83 EC 20				sub		esp,0x00000020
0006  89 D7				mov		edi,edx
0008  89 C6				mov		esi,eax
000A  85 C0				test		eax,eax
000C  75 24				jne		L$1
000E  66 85 D2				test		dx,dx
0011  75 1F				jne		L$1
0013  8B 35 00 00 00 00			mov		esi,dword ptr _nextftok
0019  66 8B 3D 04 00 00 00		mov		di,word ptr _nextftok+0x4
0020  85 F6				test		esi,esi
0022  75 0E				jne		L$1
0024  66 85 FF				test		di,di
0027  75 09				jne		L$1
0029  31 D2				xor		edx,edx
002B  31 C0				xor		eax,eax
002D  E9 9A 00 00 00			jmp		L$9
0032				L$1:
0032  89 E0				mov		eax,esp
0034  8C DA				mov		edx,ds
0036  E8 00 00 00 00			call		__fsetbits_
003B  8E C7				mov		es,edi
003D  EB 20				jmp		L$3
003F				L$2:
003F  89 C2				mov		edx,eax
0041  C1 EA 03				shr		edx,0x03
0044  31 DB				xor		ebx,ebx
0046  8A 1C 14				mov		bl,byte ptr [esp+edx]
0049  89 C2				mov		edx,eax
004B  83 E2 07				and		edx,0x00000007
004E  8A 92 00 00 00 00			mov		dl,byte ptr __Bits[edx]
0054  81 E2 FF 00 00 00			and		edx,0x000000ff
005A  85 D3				test		ebx,edx
005C  74 0A				je		L$4
005E  46				inc		esi
005F				L$3:
005F  31 C0				xor		eax,eax
0061  26 8A 06				mov		al,byte ptr es:[esi]
0064  85 C0				test		eax,eax
0066  75 D7				jne		L$2
0068				L$4:
0068  85 C0				test		eax,eax
006A  75 04				jne		L$5
006C  31 D2				xor		edx,edx
006E  EB 5C				jmp		L$9
0070				L$5:
0070  8E C7				mov		es,edi
0072  89 F0				mov		eax,esi
0074  EB 38				jmp		L$8
0076				L$6:
0076  89 D3				mov		ebx,edx
0078  C1 EB 03				shr		ebx,0x03
007B  8A 1C 1C				mov		bl,byte ptr [esp+ebx]
007E  83 E2 07				and		edx,0x00000007
0081  81 E3 FF 00 00 00			and		ebx,0x000000ff
0087  8A 92 00 00 00 00			mov		dl,byte ptr __Bits[edx]
008D  81 E2 FF 00 00 00			and		edx,0x000000ff
0093  85 D3				test		ebx,edx
0095  74 16				je		L$7
0097  8C 05 04 00 00 00			mov		dword ptr _nextftok+0x4,es
009D  26 C6 00 00			mov		byte ptr es:[eax],0x00
00A1  40				inc		eax
00A2  89 FA				mov		edx,edi
00A4  A3 00 00 00 00			mov		dword ptr _nextftok,eax
00A9  89 F0				mov		eax,esi
00AB  EB 1F				jmp		L$9
00AD				L$7:
00AD  40				inc		eax
00AE				L$8:
00AE  31 D2				xor		edx,edx
00B0  26 8A 10				mov		dl,byte ptr es:[eax]
00B3  85 D2				test		edx,edx
00B5  75 BF				jne		L$6
00B7  31 D2				xor		edx,edx
00B9  66 89 15 04 00 00 00		mov		word ptr _nextftok+0x4,dx
00C0  31 D2				xor		edx,edx
00C2  89 F0				mov		eax,esi
00C4  89 15 00 00 00 00			mov		dword ptr _nextftok,edx
00CA  89 FA				mov		edx,edi
00CC				L$9:
00CC  83 C4 20				add		esp,0x00000020
00CF  07				pop		es
00D0  5F				pop		edi
00D1  5E				pop		esi
00D2  C3				ret		

Routine Size: 211 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000006 bytes
0000				_nextftok:
0000  00 00 00 00 00 00                               ......

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

