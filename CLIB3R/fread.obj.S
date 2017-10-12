Module: fread
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001FF bytes
0000				fread_:
0000  56				push		esi
0001  57				push		edi
0002  55				push		ebp
0003  83 EC 08				sub		esp,0x00000008
0006  50				push		eax
0007  52				push		edx
0008  89 CD				mov		ebp,ecx
000A  8B 41 10				mov		eax,dword ptr 0x10[ecx]
000D  FF 15 00 00 00 00			call		dword ptr __AccessFileH
0013  F6 41 0C 01			test		byte ptr 0xc[ecx],0x01
0017  75 23				jne		L$1
0019  B8 04 00 00 00			mov		eax,0x00000004
001E  E8 00 00 00 00			call		__set_errno_
0023  8A 71 0C				mov		dh,byte ptr 0xc[ecx]
0026  80 CE 20				or		dh,0x20
0029  8B 41 10				mov		eax,dword ptr 0x10[ecx]
002C  88 71 0C				mov		byte ptr 0xc[ecx],dh
002F  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
0035  31 C0				xor		eax,eax
0037  E9 BC 01 00 00			jmp		L$19
003C				L$1:
003C  0F AF DA				imul		ebx,edx
003F  85 DB				test		ebx,ebx
0041  75 10				jne		L$2
0043  8B 41 10				mov		eax,dword ptr 0x10[ecx]
0046  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
004C  89 D8				mov		eax,ebx
004E  E9 A5 01 00 00			jmp		L$19
0053				L$2:
0053  83 79 08 00			cmp		dword ptr 0x8[ecx],0x00000000
0057  75 07				jne		L$3
0059  89 E8				mov		eax,ebp
005B  E8 00 00 00 00			call		__ioalloc_
0060				L$3:
0060  31 F6				xor		esi,esi
0062  8A 55 0C				mov		dl,byte ptr 0xc[ebp]
0065  89 74 24 08			mov		dword ptr 0x8[esp],esi
0069  F6 C2 40				test		dl,0x40
006C  0F 84 FE 00 00 00			je		L$13
0072  89 5C 24 0C			mov		dword ptr 0xc[esp],ebx
0076				L$4:
0076  8B 55 04				mov		edx,dword ptr 0x4[ebp]
0079  85 D2				test		edx,edx
007B  74 54				je		L$6
007D  8B 5C 24 0C			mov		ebx,dword ptr 0xc[esp]
0081  39 DA				cmp		edx,ebx
0083  76 02				jbe		L$5
0085  89 DA				mov		edx,ebx
0087				L$5:
0087  8B 7C 24 04			mov		edi,dword ptr 0x4[esp]
008B  89 D1				mov		ecx,edx
008D  8B 75 00				mov		esi,dword ptr [ebp]
0090  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
0094  06				push		es
0095  8C D8				mov		eax,ds
0097  8E C0				mov		es,eax
0099  57				push		edi
009A  89 C8				mov		eax,ecx
009C  C1 E9 02				shr		ecx,0x02
009F  F2 A5				repne movsd	
00A1  8A C8				mov		cl,al
00A3  80 E1 03				and		cl,0x03
00A6  F2 A4				repne movsb	
00A8  5F				pop		edi
00A9  07				pop		es
00AA  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
00AE  8B 4D 00				mov		ecx,dword ptr [ebp]
00B1  8D 34 17				lea		esi,[edi+edx]
00B4  01 D3				add		ebx,edx
00B6  89 74 24 04			mov		dword ptr 0x4[esp],esi
00BA  89 5C 24 08			mov		dword ptr 0x8[esp],ebx
00BE  8B 7D 04				mov		edi,dword ptr 0x4[ebp]
00C1  01 D1				add		ecx,edx
00C3  29 D0				sub		eax,edx
00C5  29 D7				sub		edi,edx
00C7  89 4D 00				mov		dword ptr [ebp],ecx
00CA  89 44 24 0C			mov		dword ptr 0xc[esp],eax
00CE  89 7D 04				mov		dword ptr 0x4[ebp],edi
00D1				L$6:
00D1  8B 4C 24 0C			mov		ecx,dword ptr 0xc[esp]
00D5  85 C9				test		ecx,ecx
00D7  0F 84 07 01 00 00			je		L$18
00DD  3B 4D 14				cmp		ecx,dword ptr 0x14[ebp]
00E0  73 0A				jae		L$7
00E2  F6 45 0D 04			test		byte ptr 0xd[ebp],0x04
00E6  0F 84 70 00 00 00			je		L$12
00EC				L$7:
00EC  C7 45 04 00 00 00 00		mov		dword ptr 0x4[ebp],0x00000000
00F3  8B 5C 24 0C			mov		ebx,dword ptr 0xc[esp]
00F7  8B 45 08				mov		eax,dword ptr 0x8[ebp]
00FA  8A 4D 0D				mov		cl,byte ptr 0xd[ebp]
00FD  89 45 00				mov		dword ptr [ebp],eax
0100  F6 C1 04				test		cl,0x04
0103  75 0D				jne		L$8
0105  81 FB 00 02 00 00			cmp		ebx,0x00000200
010B  76 05				jbe		L$8
010D  30 DB				xor		bl,bl
010F  80 E7 FE				and		bh,0xfe
0112				L$8:
0112  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0116  8B 45 10				mov		eax,dword ptr 0x10[ebp]
0119  E8 00 00 00 00			call		__qread_
011E  83 F8 FF				cmp		eax,0xffffffff
0121  75 09				jne		L$9
0123  80 4D 0C 20			or		byte ptr 0xc[ebp],0x20
0127  E9 B8 00 00 00			jmp		L$18
012C				L$9:
012C  85 C0				test		eax,eax
012E  75 09				jne		L$11
0130				L$10:
0130  80 4D 0C 10			or		byte ptr 0xc[ebp],0x10
0134  E9 AB 00 00 00			jmp		L$18
0139				L$11:
0139  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
013D  8B 5C 24 0C			mov		ebx,dword ptr 0xc[esp]
0141  8B 4C 24 08			mov		ecx,dword ptr 0x8[esp]
0145  01 C2				add		edx,eax
0147  29 C3				sub		ebx,eax
0149  01 C1				add		ecx,eax
014B  89 54 24 04			mov		dword ptr 0x4[esp],edx
014F  89 5C 24 0C			mov		dword ptr 0xc[esp],ebx
0153  89 4C 24 08			mov		dword ptr 0x8[esp],ecx
0157  E9 1A FF FF FF			jmp		L$4
015C				L$12:
015C  89 E8				mov		eax,ebp
015E  E8 00 00 00 00			call		__fill_buffer_
0163  85 C0				test		eax,eax
0165  0F 84 79 00 00 00			je		L$18
016B  E9 06 FF FF FF			jmp		L$4
0170				L$13:
0170  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0174  01 D3				add		ebx,edx
0176				L$14:
0176  83 7D 04 00			cmp		dword ptr 0x4[ebp],0x00000000
017A  75 0B				jne		L$15
017C  89 E8				mov		eax,ebp
017E  E8 00 00 00 00			call		__fill_buffer_
0183  85 C0				test		eax,eax
0185  74 5D				je		L$18
0187				L$15:
0187  8B 4D 04				mov		ecx,dword ptr 0x4[ebp]
018A  8B 45 00				mov		eax,dword ptr [ebp]
018D  49				dec		ecx
018E  8D 70 01				lea		esi,0x1[eax]
0191  89 4D 04				mov		dword ptr 0x4[ebp],ecx
0194  89 75 00				mov		dword ptr [ebp],esi
0197  8A 00				mov		al,byte ptr [eax]
0199  25 FF 00 00 00			and		eax,0x000000ff
019E  83 F8 0D				cmp		eax,0x0000000d
01A1  75 28				jne		L$17
01A3  83 7D 04 00			cmp		dword ptr 0x4[ebp],0x00000000
01A7  75 0B				jne		L$16
01A9  89 E8				mov		eax,ebp
01AB  E8 00 00 00 00			call		__fill_buffer_
01B0  85 C0				test		eax,eax
01B2  74 30				je		L$18
01B4				L$16:
01B4  8B 7D 04				mov		edi,dword ptr 0x4[ebp]
01B7  8B 45 00				mov		eax,dword ptr [ebp]
01BA  4F				dec		edi
01BB  8D 70 01				lea		esi,0x1[eax]
01BE  89 7D 04				mov		dword ptr 0x4[ebp],edi
01C1  89 75 00				mov		dword ptr [ebp],esi
01C4  8A 00				mov		al,byte ptr [eax]
01C6  25 FF 00 00 00			and		eax,0x000000ff
01CB				L$17:
01CB  83 F8 1A				cmp		eax,0x0000001a
01CE  0F 84 5C FF FF FF			je		L$10
01D4  88 02				mov		byte ptr [edx],al
01D6  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
01DA  40				inc		eax
01DB  42				inc		edx
01DC  89 44 24 08			mov		dword ptr 0x8[esp],eax
01E0  39 DA				cmp		edx,ebx
01E2  75 92				jne		L$14
01E4				L$18:
01E4  8B 45 10				mov		eax,dword ptr 0x10[ebp]
01E7  8B 34 24				mov		esi,dword ptr [esp]
01EA  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
01F0  31 D2				xor		edx,edx
01F2  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
01F6  F7 F6				div		esi
01F8				L$19:
01F8  83 C4 10				add		esp,0x00000010
01FB  5D				pop		ebp
01FC  5F				pop		edi
01FD  5E				pop		esi
01FE  C3				ret		

Routine Size: 511 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

