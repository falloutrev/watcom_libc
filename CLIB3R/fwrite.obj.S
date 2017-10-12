Module: fwrite
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001E6 bytes
0000				fwrite_:
0000  56				push		esi
0001  57				push		edi
0002  55				push		ebp
0003  83 EC 0C				sub		esp,0x0000000c
0006  50				push		eax
0007  52				push		edx
0008  89 CD				mov		ebp,ecx
000A  8B 41 10				mov		eax,dword ptr 0x10[ecx]
000D  FF 15 00 00 00 00			call		dword ptr __AccessFileH
0013  F6 41 0C 02			test		byte ptr 0xc[ecx],0x02
0017  75 1E				jne		L$1
0019  B8 04 00 00 00			mov		eax,0x00000004
001E  E8 00 00 00 00			call		__set_errno_
0023  80 49 0C 20			or		byte ptr 0xc[ecx],0x20
0027  8B 41 10				mov		eax,dword ptr 0x10[ecx]
002A  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
0030  31 C0				xor		eax,eax
0032  E9 A8 01 00 00			jmp		L$16
0037				L$1:
0037  0F AF DA				imul		ebx,edx
003A  85 DB				test		ebx,ebx
003C  75 10				jne		L$2
003E  8B 41 10				mov		eax,dword ptr 0x10[ecx]
0041  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
0047  89 D8				mov		eax,ebx
0049  E9 91 01 00 00			jmp		L$16
004E				L$2:
004E  83 79 08 00			cmp		dword ptr 0x8[ecx],0x00000000
0052  75 07				jne		L$3
0054  89 E8				mov		eax,ebp
0056  E8 00 00 00 00			call		__ioalloc_
005B				L$3:
005B  8B 45 0C				mov		eax,dword ptr 0xc[ebp]
005E  8A 55 0C				mov		dl,byte ptr 0xc[ebp]
0061  31 F6				xor		esi,esi
0063  83 E0 30				and		eax,0x00000030
0066  80 E2 CF				and		dl,0xcf
0069  89 74 24 0C			mov		dword ptr 0xc[esp],esi
006D  89 44 24 08			mov		dword ptr 0x8[esp],eax
0071  88 55 0C				mov		byte ptr 0xc[ebp],dl
0074  F6 C2 40				test		dl,0x40
0077  0F 84 DB 00 00 00			je		L$11
007D  89 5C 24 10			mov		dword ptr 0x10[esp],ebx
0081				L$4:
0081  83 7D 04 00			cmp		dword ptr 0x4[ebp],0x00000000
0085  75 44				jne		L$7
0087  8B 44 24 10			mov		eax,dword ptr 0x10[esp]
008B  3B 45 14				cmp		eax,dword ptr 0x14[ebp]
008E  72 3B				jb		L$7
0090  89 C3				mov		ebx,eax
0092  30 C3				xor		bl,al
0094  80 E7 FE				and		bh,0xfe
0097  85 DB				test		ebx,ebx
0099  75 02				jne		L$5
009B  89 C3				mov		ebx,eax
009D				L$5:
009D  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
00A1  8B 45 10				mov		eax,dword ptr 0x10[ebp]
00A4  E8 00 00 00 00			call		__qwrite_
00A9  89 C2				mov		edx,eax
00AB  83 F8 FF				cmp		eax,0xffffffff
00AE  74 15				je		L$6
00B0  85 C0				test		eax,eax
00B2  0F 85 74 00 00 00			jne		L$10
00B8  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
00BE  C7 40 04 0C 00 00 00		mov		dword ptr 0x4[eax],0x0000000c
00C5				L$6:
00C5  80 4D 0C 20			or		byte ptr 0xc[ebp],0x20
00C9  EB 61				jmp		L$10
00CB				L$7:
00CB  8B 55 14				mov		edx,dword ptr 0x14[ebp]
00CE  8B 5D 04				mov		ebx,dword ptr 0x4[ebp]
00D1  8B 4C 24 10			mov		ecx,dword ptr 0x10[esp]
00D5  29 DA				sub		edx,ebx
00D7  39 CA				cmp		edx,ecx
00D9  76 02				jbe		L$8
00DB  89 CA				mov		edx,ecx
00DD				L$8:
00DD  8B 74 24 04			mov		esi,dword ptr 0x4[esp]
00E1  89 D1				mov		ecx,edx
00E3  8B 7D 00				mov		edi,dword ptr [ebp]
00E6  06				push		es
00E7  8C D8				mov		eax,ds
00E9  8E C0				mov		es,eax
00EB  57				push		edi
00EC  89 C8				mov		eax,ecx
00EE  C1 E9 02				shr		ecx,0x02
00F1  F2 A5				repne movsd	
00F3  8A C8				mov		cl,al
00F5  80 E1 03				and		cl,0x03
00F8  F2 A4				repne movsb	
00FA  5F				pop		edi
00FB  07				pop		es
00FC  8B 7D 04				mov		edi,dword ptr 0x4[ebp]
00FF  01 D7				add		edi,edx
0101  8A 7D 0D				mov		bh,byte ptr 0xd[ebp]
0104  89 7D 04				mov		dword ptr 0x4[ebp],edi
0107  80 CF 10				or		bh,0x10
010A  8B 75 00				mov		esi,dword ptr [ebp]
010D  88 7D 0D				mov		byte ptr 0xd[ebp],bh
0110  01 D6				add		esi,edx
0112  8B 45 04				mov		eax,dword ptr 0x4[ebp]
0115  8B 5D 14				mov		ebx,dword ptr 0x14[ebp]
0118  89 75 00				mov		dword ptr [ebp],esi
011B  39 D8				cmp		eax,ebx
011D  74 06				je		L$9
011F  F6 45 0D 04			test		byte ptr 0xd[ebp],0x04
0123  74 07				je		L$10
0125				L$9:
0125  89 E8				mov		eax,ebp
0127  E8 00 00 00 00			call		__flush_
012C				L$10:
012C  8B 4C 24 04			mov		ecx,dword ptr 0x4[esp]
0130  8B 74 24 0C			mov		esi,dword ptr 0xc[esp]
0134  8B 7C 24 10			mov		edi,dword ptr 0x10[esp]
0138  01 D1				add		ecx,edx
013A  01 D6				add		esi,edx
013C  89 4C 24 04			mov		dword ptr 0x4[esp],ecx
0140  89 74 24 0C			mov		dword ptr 0xc[esp],esi
0144  29 D7				sub		edi,edx
0146  89 7C 24 10			mov		dword ptr 0x10[esp],edi
014A  74 67				je		L$14
014C  F6 45 0C 20			test		byte ptr 0xc[ebp],0x20
0150  0F 84 2B FF FF FF			je		L$4
0156  EB 5B				jmp		L$14
0158				L$11:
0158  8A 4D 0D				mov		cl,byte ptr 0xd[ebp]
015B  31 FF				xor		edi,edi
015D  F6 C1 04				test		cl,0x04
0160  74 11				je		L$12
0162  88 CD				mov		ch,cl
0164  80 E5 FA				and		ch,0xfa
0167  88 E8				mov		al,ch
0169  0C 01				or		al,0x01
016B  BF 01 00 00 00			mov		edi,0x00000001
0170  88 45 0D				mov		byte ptr 0xd[ebp],al
0173				L$12:
0173  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0177  31 C0				xor		eax,eax
0179  8A 02				mov		al,byte ptr [edx]
017B  42				inc		edx
017C  89 54 24 04			mov		dword ptr 0x4[esp],edx
0180  89 EA				mov		edx,ebp
0182  E8 00 00 00 00			call		fputc_
0187  F6 45 0C 30			test		byte ptr 0xc[ebp],0x30
018B  75 0D				jne		L$13
018D  8B 4C 24 0C			mov		ecx,dword ptr 0xc[esp]
0191  41				inc		ecx
0192  89 4C 24 0C			mov		dword ptr 0xc[esp],ecx
0196  39 CB				cmp		ebx,ecx
0198  75 D9				jne		L$12
019A				L$13:
019A  85 FF				test		edi,edi
019C  74 15				je		L$14
019E  8A 75 0D				mov		dh,byte ptr 0xd[ebp]
01A1  80 E6 FA				and		dh,0xfa
01A4  88 F3				mov		bl,dh
01A6  80 CB 04				or		bl,0x04
01A9  89 E8				mov		eax,ebp
01AB  88 5D 0D				mov		byte ptr 0xd[ebp],bl
01AE  E8 00 00 00 00			call		__flush_
01B3				L$14:
01B3  F6 45 0C 20			test		byte ptr 0xc[ebp],0x20
01B7  74 06				je		L$15
01B9  31 D2				xor		edx,edx
01BB  89 54 24 0C			mov		dword ptr 0xc[esp],edx
01BF				L$15:
01BF  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
01C3  8B 0C 24				mov		ecx,dword ptr [esp]
01C6  8B 5D 0C				mov		ebx,dword ptr 0xc[ebp]
01C9  31 D2				xor		edx,edx
01CB  09 C3				or		ebx,eax
01CD  8B 45 10				mov		eax,dword ptr 0x10[ebp]
01D0  89 5D 0C				mov		dword ptr 0xc[ebp],ebx
01D3  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
01D9  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
01DD  F7 F1				div		ecx
01DF				L$16:
01DF  83 C4 14				add		esp,0x00000014
01E2  5D				pop		ebp
01E3  5F				pop		edi
01E4  5E				pop		esi
01E5  C3				ret		

Routine Size: 486 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

