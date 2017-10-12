Module: jstrnset
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000011A bytes
0000				jstrnset_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 14				sub		esp,0x00000014
0007  89 C6				mov		esi,eax
0009  89 54 24 0C			mov		dword ptr 0xc[esp],edx
000D  89 DD				mov		ebp,ebx
000F  89 44 24 04			mov		dword ptr 0x4[esp],eax
0013  85 DB				test		ebx,ebx
0015  0F 84 F7 00 00 00			je		L$13
001B  31 D2				xor		edx,edx
001D  66 8B 54 24 0C			mov		dx,word ptr 0xc[esp]
0022  89 D0				mov		eax,edx
0024  E8 00 00 00 00			call		jiszen_
0029  85 C0				test		eax,eax
002B  0F 95 C0				setne		al
002E  25 FF 00 00 00			and		eax,0x000000ff
0033  40				inc		eax
0034  0F AF D8				imul		ebx,eax
0037  89 F7				mov		edi,esi
0039  06				push		es
003A  8C D8				mov		eax,ds
003C  8E C0				mov		es,eax
003E  29 C9				sub		ecx,ecx
0040  49				dec		ecx
0041  31 C0				xor		eax,eax
0043  F2 AE				repne scasb	
0045  F7 D1				not		ecx
0047  49				dec		ecx
0048  07				pop		es
0049  89 5C 24 08			mov		dword ptr 0x8[esp],ebx
004D  89 0C 24				mov		dword ptr [esp],ecx
0050  39 D9				cmp		ecx,ebx
0052  77 3F				ja		L$4
0054  89 D0				mov		eax,edx
0056  E8 00 00 00 00			call		jiszen_
005B  85 C0				test		eax,eax
005D  74 2D				je		L$3
005F  D1 E9				shr		ecx,0x01
0061  31 DB				xor		ebx,ebx
0063  EB 11				jmp		L$2
0065				L$1:
0065  31 D2				xor		edx,edx
0067  89 F0				mov		eax,esi
0069  66 8B 54 24 0C			mov		dx,word ptr 0xc[esp]
006E  43				inc		ebx
006F  E8 00 00 00 00			call		jputmoji_
0074  89 C6				mov		esi,eax
0076				L$2:
0076  39 CB				cmp		ebx,ecx
0078  72 EB				jb		L$1
007A  F6 04 24 01			test		byte ptr [esp],0x01
007E  0F 84 8A 00 00 00			je		L$12
0084  C6 06 20				mov		byte ptr [esi],0x20
0087  E9 82 00 00 00			jmp		L$12
008C				L$3:
008C  89 CB				mov		ebx,ecx
008E  E9 74 00 00 00			jmp		L$11
0093				L$4:
0093  8B 7C 24 08			mov		edi,dword ptr 0x8[esp]
0097  89 F3				mov		ebx,esi
0099  4F				dec		edi
009A  EB 0D				jmp		L$6
009C				L$5:
009C  8D 54 24 10			lea		edx,0x10[esp]
00A0  89 D8				mov		eax,ebx
00A2  E8 00 00 00 00			call		jgetmoji_
00A7  89 C3				mov		ebx,eax
00A9				L$6:
00A9  89 D9				mov		ecx,ebx
00AB  29 F1				sub		ecx,esi
00AD  39 F9				cmp		ecx,edi
00AF  72 EB				jb		L$5
00B1  8D 54 24 10			lea		edx,0x10[esp]
00B5  89 D8				mov		eax,ebx
00B7  8B 7C 24 08			mov		edi,dword ptr 0x8[esp]
00BB  E8 00 00 00 00			call		jgetmoji_
00C0  39 F9				cmp		ecx,edi
00C2  74 14				je		L$7
00C4  31 C0				xor		eax,eax
00C6  66 8B 44 24 10			mov		ax,word ptr 0x10[esp]
00CB  E8 00 00 00 00			call		jiszen_
00D0  85 C0				test		eax,eax
00D2  74 04				je		L$7
00D4  C6 43 01 20			mov		byte ptr 0x1[ebx],0x20
00D8				L$7:
00D8  31 D2				xor		edx,edx
00DA  66 8B 54 24 0C			mov		dx,word ptr 0xc[esp]
00DF  89 D0				mov		eax,edx
00E1  E8 00 00 00 00			call		jiszen_
00E6  85 C0				test		eax,eax
00E8  74 1B				je		L$10
00EA  31 DB				xor		ebx,ebx
00EC  EB 11				jmp		L$9
00EE				L$8:
00EE  31 D2				xor		edx,edx
00F0  89 F0				mov		eax,esi
00F2  66 8B 54 24 0C			mov		dx,word ptr 0xc[esp]
00F7  43				inc		ebx
00F8  E8 00 00 00 00			call		jputmoji_
00FD  89 C6				mov		esi,eax
00FF				L$9:
00FF  39 EB				cmp		ebx,ebp
0101  73 0B				jae		L$12
0103  EB E9				jmp		L$8
0105				L$10:
0105  89 EB				mov		ebx,ebp
0107				L$11:
0107  89 F0				mov		eax,esi
0109  E8 00 00 00 00			call		memset_
010E				L$12:
010E  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0112				L$13:
0112  83 C4 14				add		esp,0x00000014
0115  5D				pop		ebp
0116  5F				pop		edi
0117  5E				pop		esi
0118  59				pop		ecx
0119  C3				ret		

Routine Size: 282 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

