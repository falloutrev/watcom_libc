Module: fstrstr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000E9 bytes
0000				_fstrstr_:
0000  56				push		esi
0001  57				push		edi
0002  06				push		es
0003  55				push		ebp
0004  83 EC 0C				sub		esp,0x0000000c
0007  52				push		edx
0008  89 C6				mov		esi,eax
000A  8E C1				mov		es,ecx
000C  89 DD				mov		ebp,ebx
000E  26 8A 65 00			mov		ah,byte ptr es:[ebp]
0012  84 E4				test		ah,ah
0014  75 07				jne		L$1
0016  89 F1				mov		ecx,esi
0018  E9 C2 00 00 00			jmp		L$10
001D				L$1:
001D  26 80 7D 01 00			cmp		byte ptr es:0x1[ebp],0x00
0022  75 15				jne		L$2
0024  31 DB				xor		ebx,ebx
0026  8B 14 24				mov		edx,dword ptr [esp]
0029  88 E3				mov		bl,ah
002B  89 F0				mov		eax,esi
002D  E8 00 00 00 00			call		_fstrchr_
0032  89 C1				mov		ecx,eax
0034  E9 A6 00 00 00			jmp		L$10
0039				L$2:
0039  B9 FF FF FF FF			mov		ecx,0xffffffff
003E  8B 14 24				mov		edx,dword ptr [esp]
0041  89 F7				mov		edi,esi
0043  30 C0				xor		al,al
0045  06				push		es
0046  E3 0B				jecxz		L$3
0048  8E C2				mov		es,edx
004A  F2 AE				repne scasb	
004C  75 05				jne		L$3
004E  4F				dec		edi
004F  8C C1				mov		ecx,es
0051  66 A9                                           f.
0053				L$3:
0053  89 CF				mov		edi,ecx
0055  07				pop		es
0056  89 7C 24 04			mov		dword ptr 0x4[esp],edi
005A  8C C1				mov		ecx,es
005C  89 DF				mov		edi,ebx
005E  06				push		es
005F  8E C1				mov		es,ecx
0061  31 C0				xor		eax,eax
0063  89 C1				mov		ecx,eax
0065  49				dec		ecx
0066  F2 AE				repne scasb	
0068  F7 D1				not		ecx
006A  49				dec		ecx
006B  07				pop		es
006C  89 4C 24 08			mov		dword ptr 0x8[esp],ecx
0070				L$4:
0070  8B 4C 24 04			mov		ecx,dword ptr 0x4[esp]
0074  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
0078  29 F1				sub		ecx,esi
007A  39 D1				cmp		ecx,edx
007C  72 5D				jb		L$9
007E  8B 14 24				mov		edx,dword ptr [esp]
0081  89 F7				mov		edi,esi
0083  26 8A 45 00			mov		al,byte ptr es:[ebp]
0087  06				push		es
0088  E3 0B				jecxz		L$5
008A  8E C2				mov		es,edx
008C  F2 AE				repne scasb	
008E  75 05				jne		L$5
0090  4F				dec		edi
0091  8C C1				mov		ecx,es
0093  66 A9                                           f.
0095				L$5:
0095  89 CF				mov		edi,ecx
0097  07				pop		es
0098  89 4C 24 0C			mov		dword ptr 0xc[esp],ecx
009C  89 FB				mov		ebx,edi
009E  89 CA				mov		edx,ecx
00A0  85 FF				test		edi,edi
00A2  75 05				jne		L$6
00A4  66 85 D2				test		dx,dx
00A7  74 32				je		L$9
00A9				L$6:
00A9  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
00AD  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
00B1  8C C1				mov		ecx,es
00B3  89 EF				mov		edi,ebp
00B5  89 DE				mov		esi,ebx
00B7  1E				push		ds
00B8  06				push		es
00B9  91				xchg		eax,ecx
00BA  8E DA				mov		ds,edx
00BC  8E C0				mov		es,eax
00BE  09 C9				or		ecx,ecx
00C0  F3 A6				repe cmpsb	
00C2  74 05				je		L$7
00C4  19 C9				sbb		ecx,ecx
00C6  83 D9 FF				sbb		ecx,0xffffffff
00C9				L$7:
00C9  07				pop		es
00CA  1F				pop		ds
00CB  85 C9				test		ecx,ecx
00CD  75 04				jne		L$8
00CF  89 D9				mov		ecx,ebx
00D1  EB 0C				jmp		L$10
00D3				L$8:
00D3  89 14 24				mov		dword ptr [esp],edx
00D6  8D 73 01				lea		esi,0x1[ebx]
00D9  EB 95				jmp		L$4
00DB				L$9:
00DB  31 D2				xor		edx,edx
00DD  31 C9				xor		ecx,ecx
00DF				L$10:
00DF  89 C8				mov		eax,ecx
00E1  83 C4 10				add		esp,0x00000010
00E4  5D				pop		ebp
00E5  07				pop		es
00E6  5F				pop		edi
00E7  5E				pop		esi
00E8  C3				ret		

Routine Size: 233 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

