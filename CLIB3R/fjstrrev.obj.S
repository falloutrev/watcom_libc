Module: fjstrrev
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000B3 bytes
0000				_fjstrrev_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  57				push		edi
0004  06				push		es
0005  0F A0				push		fs
0007  0F A8				push		gs
0009  55				push		ebp
000A  52				push		edx
000B  89 C5				mov		ebp,eax
000D  8E C2				mov		es,edx
000F  89 C7				mov		edi,eax
0011  8C C1				mov		ecx,es
0013  89 C2				mov		edx,eax
0015  06				push		es
0016  8E C1				mov		es,ecx
0018  31 C0				xor		eax,eax
001A  89 C1				mov		ecx,eax
001C  49				dec		ecx
001D  F2 AE				repne scasb	
001F  F7 D1				not		ecx
0021  49				dec		ecx
0022  07				pop		es
0023  8E 24 24				mov		fs,dword ptr [esp]
0026  8D 04 29				lea		eax,[ecx+ebp]
0029				L$1:
0029  39 C2				cmp		edx,eax
002B  73 50				jae		L$3
002D  31 DB				xor		ebx,ebx
002F  26 8A 1A				mov		bl,byte ptr es:[edx]
0032  8A 9B 01 00 00 00			mov		bl,byte ptr __IsKTable+0x1[ebx]
0038  80 E3 04				and		bl,0x04
003B  81 E3 FF 00 00 00			and		ebx,0x000000ff
0041  74 37				je		L$2
0043  8C C3				mov		ebx,es
0045  8E EB				mov		gs,ebx
0047  8D 5A 01				lea		ebx,0x1[edx]
004A  65 0F B6 33			movzx		esi,byte ptr gs:[ebx]
004E  8A 8E 01 00 00 00			mov		cl,byte ptr __IsKTable+0x1[esi]
0054  80 E1 08				and		cl,0x08
0057  0F B6 F1				movzx		esi,cl
005A  85 F6				test		esi,esi
005C  74 1C				je		L$2
005E  65 8A 0B				mov		cl,byte ptr gs:[ebx]
0061  26 8A 2A				mov		ch,byte ptr es:[edx]
0064  30 CD				xor		ch,cl
0066  26 88 2A				mov		byte ptr es:[edx],ch
0069  88 E9				mov		cl,ch
006B  65 8A 2B				mov		ch,byte ptr gs:[ebx]
006E  30 CD				xor		ch,cl
0070  65 88 2B				mov		byte ptr gs:[ebx],ch
0073  88 E9				mov		cl,ch
0075  26 30 0A				xor		byte ptr es:[edx],cl
0078  89 DA				mov		edx,ebx
007A				L$2:
007A  42				inc		edx
007B  EB AC				jmp		L$1
007D				L$3:
007D  8E 04 24				mov		es,dword ptr [esp]
0080  89 EA				mov		edx,ebp
0082				L$4:
0082  48				dec		eax
0083  39 C2				cmp		edx,eax
0085  73 19				jae		L$5
0087  64 8A 18				mov		bl,byte ptr fs:[eax]
008A  26 8A 3A				mov		bh,byte ptr es:[edx]
008D  30 DF				xor		bh,bl
008F  26 88 3A				mov		byte ptr es:[edx],bh
0092  64 8A 08				mov		cl,byte ptr fs:[eax]
0095  30 F9				xor		cl,bh
0097  64 88 08				mov		byte ptr fs:[eax],cl
009A  26 30 0A				xor		byte ptr es:[edx],cl
009D  42				inc		edx
009E  EB E2				jmp		L$4
00A0				L$5:
00A0  8B 14 24				mov		edx,dword ptr [esp]
00A3  89 E8				mov		eax,ebp
00A5  83 C4 04				add		esp,0x00000004
00A8  5D				pop		ebp
00A9  0F A9				pop		gs
00AB  0F A1				pop		fs
00AD  07				pop		es
00AE  5F				pop		edi
00AF  5E				pop		esi
00B0  59				pop		ecx
00B1  5B				pop		ebx
00B2  CB				retf		

Routine Size: 179 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

