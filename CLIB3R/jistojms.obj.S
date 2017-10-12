Module: jistojms
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000127 bytes
0000				jmstojis_:
0000  53				push		ebx
0001  52				push		edx
0002  89 C2				mov		edx,eax
0004  31 DB				xor		ebx,ebx
0006  66 89 C3				mov		bx,ax
0009  89 D8				mov		eax,ebx
000B  E8 00 00 00 00			call		jiszen_
0010  85 C0				test		eax,eax
0012  75 05				jne		L$1
0014  31 C0				xor		eax,eax
0016  5A				pop		edx
0017  5B				pop		ebx
0018  C3				ret		
0019				L$1:
0019  88 D0				mov		al,dl
001B  C1 FB 08				sar		ebx,0x08
001E  31 D2				xor		edx,edx
0020  88 DA				mov		dl,bl
0022  88 DC				mov		ah,bl
0024  81 FA A0 00 00 00			cmp		edx,0x000000a0
002A  7D 07				jge		L$2
002C  BA 71 00 00 00			mov		edx,0x00000071
0031  EB 05				jmp		L$3
0033				L$2:
0033  BA B1 00 00 00			mov		edx,0x000000b1
0038				L$3:
0038  31 DB				xor		ebx,ebx
003A  88 E3				mov		bl,ah
003C  29 D3				sub		ebx,edx
003E  31 D2				xor		edx,edx
0040  88 C2				mov		dl,al
0042  01 DB				add		ebx,ebx
0044  81 FA 9F 00 00 00			cmp		edx,0x0000009f
004A  0F 9D C4				setge		ah
004D  31 D2				xor		edx,edx
004F  88 E2				mov		dl,ah
0051  42				inc		edx
0052  01 DA				add		edx,ebx
0054  88 D4				mov		ah,dl
0056  31 D2				xor		edx,edx
0058  88 C2				mov		dl,al
005A  83 FA 7F				cmp		edx,0x0000007f
005D  7C 18				jl		L$6
005F  81 FA 9F 00 00 00			cmp		edx,0x0000009f
0065  7D 07				jge		L$4
0067  BA 20 00 00 00			mov		edx,0x00000020
006C  EB 05				jmp		L$5
006E				L$4:
006E  BA 7E 00 00 00			mov		edx,0x0000007e
0073				L$5:
0073  89 D3				mov		ebx,edx
0075  EB 05				jmp		L$7
0077				L$6:
0077  BB 1F 00 00 00			mov		ebx,0x0000001f
007C				L$7:
007C  31 D2				xor		edx,edx
007E  88 C2				mov		dl,al
0080  29 DA				sub		edx,ebx
0082  88 D0				mov		al,dl
0084  30 F6				xor		dh,dh
0086  88 E2				mov		dl,ah
0088  C1 E2 08				shl		edx,0x08
008B  30 E4				xor		ah,ah
008D  01 D0				add		eax,edx
008F  5A				pop		edx
0090  5B				pop		ebx
0091  C3				ret		

Routine Size: 146 bytes,    Routine Base: _TEXT + 0000

0092				jistojms_:
0092  53				push		ebx
0093  51				push		ecx
0094  52				push		edx
0095  56				push		esi
0096  31 D2				xor		edx,edx
0098  66 89 C2				mov		dx,ax
009B  88 C7				mov		bh,al
009D  C1 FA 08				sar		edx,0x08
00A0  88 D3				mov		bl,dl
00A2  31 D2				xor		edx,edx
00A4  88 DA				mov		dl,bl
00A6  83 FA 21				cmp		edx,0x00000021
00A9  7C 13				jl		L$8
00AB  83 FA 7E				cmp		edx,0x0000007e
00AE  7F 0E				jg		L$8
00B0  31 C9				xor		ecx,ecx
00B2  88 C1				mov		cl,al
00B4  83 F9 21				cmp		ecx,0x00000021
00B7  7C 05				jl		L$8
00B9  83 F9 7E				cmp		ecx,0x0000007e
00BC  7E 07				jle		L$9
00BE				L$8:
00BE  31 C0				xor		eax,eax
00C0  5E				pop		esi
00C1  5A				pop		edx
00C2  59				pop		ecx
00C3  5B				pop		ebx
00C4  C3				ret		
00C5				L$9:
00C5  BE 02 00 00 00			mov		esi,0x00000002
00CA  89 D0				mov		eax,edx
00CC  C1 FA 1F				sar		edx,0x1f
00CF  F7 FE				idiv		esi
00D1  85 D2				test		edx,edx
00D3  74 10				je		L$10
00D5  83 F9 60				cmp		ecx,0x00000060
00D8  0F 9D C0				setge		al
00DB  25 FF 00 00 00			and		eax,0x000000ff
00E0  83 C0 1F				add		eax,0x0000001f
00E3  EB 05				jmp		L$11
00E5				L$10:
00E5  B8 7E 00 00 00			mov		eax,0x0000007e
00EA				L$11:
00EA  31 D2				xor		edx,edx
00EC  88 FA				mov		dl,bh
00EE  01 C2				add		edx,eax
00F0  88 D7				mov		bh,dl
00F2  31 C0				xor		eax,eax
00F4  88 D8				mov		al,bl
00F6  83 F8 5F				cmp		eax,0x0000005f
00F9  7D 07				jge		L$12
00FB  B9 71 00 00 00			mov		ecx,0x00000071
0100  EB 05				jmp		L$13
0102				L$12:
0102  B9 B1 00 00 00			mov		ecx,0x000000b1
0107				L$13:
0107  31 D2				xor		edx,edx
0109  88 DA				mov		dl,bl
010B  4A				dec		edx
010C  89 D0				mov		eax,edx
010E  C1 FA 1F				sar		edx,0x1f
0111  2B C2				sub		eax,edx
0113  D1 F8				sar		eax,0x01
0115  01 C8				add		eax,ecx
0117  30 E4				xor		ah,ah
0119  89 C2				mov		edx,eax
011B  C1 E2 08				shl		edx,0x08
011E  88 F8				mov		al,bh
0120  01 D0				add		eax,edx
0122  5E				pop		esi
0123  5A				pop		edx
0124  59				pop		ecx
0125  5B				pop		ebx
0126  C3				ret		

Routine Size: 149 bytes,    Routine Base: _TEXT + 0092

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

