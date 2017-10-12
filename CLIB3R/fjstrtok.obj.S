Module: fjstrtok
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000E7 bytes
0000				_fjstrtok_:
0000  56				push		esi
0001  57				push		edi
0002  06				push		es
0003  0F A0				push		fs
0005  55				push		ebp
0006  83 EC 04				sub		esp,0x00000004
0009  89 CE				mov		esi,ecx
000B  89 DF				mov		edi,ebx
000D  85 C0				test		eax,eax
000F  75 11				jne		L$1
0011  66 85 D2				test		dx,dx
0014  75 0C				jne		L$1
0016  66 8B 15 04 00 00 00		mov		dx,word ptr DGROUP:L$13
001D  A1 00 00 00 00			mov		eax,dword ptr DGROUP:L$12
0022				L$1:
0022  85 C0				test		eax,eax
0024  75 0E				jne		L$4
0026  66 85 D2				test		dx,dx
0029  75 09				jne		L$4
002B				L$2:
002B  31 D2				xor		edx,edx
002D				L$3:
002D  31 C0				xor		eax,eax
002F  E9 A9 00 00 00			jmp		L$11
0034				L$4:
0034  89 F1				mov		ecx,esi
0036  89 FB				mov		ebx,edi
0038  9A 00 00 00 00 00 00		call		_fjstrskip_
003F  89 D3				mov		ebx,edx
0041  89 14 24				mov		dword ptr [esp],edx
0044  89 C5				mov		ebp,eax
0046  85 C0				test		eax,eax
0048  75 05				jne		L$5
004A  66 85 D2				test		dx,dx
004D  74 DC				je		L$2
004F				L$5:
004F  8E C2				mov		es,edx
0051  26 80 38 00			cmp		byte ptr es:[eax],0x00
0055  74 D4				je		L$2
0057  31 D2				xor		edx,edx
0059  26 8A 10				mov		dl,byte ptr es:[eax]
005C  8A 92 01 00 00 00			mov		dl,byte ptr __IsKTable+0x1[edx]
0062  80 E2 04				and		dl,0x04
0065  81 E2 FF 00 00 00			and		edx,0x000000ff
006B  74 07				je		L$6
006D  26 80 78 01 00			cmp		byte ptr es:0x1[eax],0x00
0072  74 B7				je		L$2
0074				L$6:
0074  8B 14 24				mov		edx,dword ptr [esp]
0077  89 F1				mov		ecx,esi
0079  89 FB				mov		ebx,edi
007B  89 E8				mov		eax,ebp
007D  9A 00 00 00 00 00 00		call		_fjstrmatch_
0084  89 D6				mov		esi,edx
0086  8E C2				mov		es,edx
0088  89 C2				mov		edx,eax
008A  85 C0				test		eax,eax
008C  75 09				jne		L$7
008E  66 85 F6				test		si,si
0091  75 04				jne		L$7
0093  31 C2				xor		edx,eax
0095  EB 96				jmp		L$3
0097				L$7:
0097  8E E6				mov		fs,esi
0099  64 8A 18				mov		bl,byte ptr fs:[eax]
009C  84 DB				test		bl,bl
009E  75 0D				jne		L$8
00A0  31 C2				xor		edx,eax
00A2  66 89 15 04 00 00 00		mov		word ptr DGROUP:L$13,dx
00A9  31 D2				xor		edx,edx
00AB  EB 25				jmp		L$10
00AD				L$8:
00AD  0F B6 FB				movzx		edi,bl
00B0  8A 9F 01 00 00 00			mov		bl,byte ptr __IsKTable+0x1[edi]
00B6  80 E3 04				and		bl,0x04
00B9  0F B6 FB				movzx		edi,bl
00BC  85 FF				test		edi,edi
00BE  74 07				je		L$9
00C0  8D 50 01				lea		edx,0x1[eax]
00C3  26 C6 00 00			mov		byte ptr es:[eax],0x00
00C7				L$9:
00C7  26 C6 02 00			mov		byte ptr es:[edx],0x00
00CB  42				inc		edx
00CC  8C 05 04 00 00 00			mov		dword ptr DGROUP:L$13,es
00D2				L$10:
00D2  89 15 00 00 00 00			mov		dword ptr DGROUP:L$12,edx
00D8  8B 14 24				mov		edx,dword ptr [esp]
00DB  89 E8				mov		eax,ebp
00DD				L$11:
00DD  83 C4 04				add		esp,0x00000004
00E0  5D				pop		ebp
00E1  0F A1				pop		fs
00E3  07				pop		es
00E4  5F				pop		edi
00E5  5E				pop		esi
00E6  CB				retf		

Routine Size: 231 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000006 bytes
0000				L$12:
0004				L$13:

BSS Size: 6 bytes

