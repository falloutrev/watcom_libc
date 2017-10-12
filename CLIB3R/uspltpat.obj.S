Module: uspltpat
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000E0 bytes
0000				copypart_:
0000  56				push		esi
0001  89 C6				mov		esi,eax
0003  85 C0				test		eax,eax
0005  74 17				je		L$2
0007  39 CB				cmp		ebx,ecx
0009  7E 02				jle		L$1
000B  89 CB				mov		ebx,ecx
000D				L$1:
000D  01 DB				add		ebx,ebx
000F  89 F0				mov		eax,esi
0011  89 D9				mov		ecx,ebx
0013  E8 00 00 00 00			call		memcpy_
0018  66 C7 04 31 00 00			mov		word ptr [ecx+esi],0x0000
001E				L$2:
001E  5E				pop		esi
001F  C3				ret		

Routine Size: 32 bytes,    Routine Base: _TEXT + 0000

0020				_u_splitpath_:
0020  56				push		esi
0021  57				push		edi
0022  C8 0C 00 00			enter		0x000c,0x00
0026  89 C6				mov		esi,eax
0028  89 4D F8				mov		dword ptr -0x8[ebp],ecx
002B  89 D8				mov		eax,ebx
002D  66 83 3E 00			cmp		word ptr [esi],0x0000
0031  74 24				je		L$4
0033  0F B7 5E 02			movzx		ebx,word ptr 0x2[esi]
0037  83 FB 3A				cmp		ebx,0x0000003a
003A  75 1B				jne		L$4
003C  85 D2				test		edx,edx
003E  74 12				je		L$3
0040  66 8B 1E				mov		bx,word ptr [esi]
0043  66 C7 42 02 3A 00			mov		word ptr 0x2[edx],0x003a
0049  66 C7 42 04 00 00			mov		word ptr 0x4[edx],0x0000
004F  66 89 1A				mov		word ptr [edx],bx
0052				L$3:
0052  83 C6 04				add		esi,0x00000004
0055  EB 09				jmp		L$5
0057				L$4:
0057  85 D2				test		edx,edx
0059  74 05				je		L$5
005B  66 C7 02 00 00			mov		word ptr [edx],0x0000
0060				L$5:
0060  89 75 FC				mov		dword ptr -0x4[ebp],esi
0063  89 75 F4				mov		dword ptr -0xc[ebp],esi
0066				L$6:
0066  31 FF				xor		edi,edi
0068				L$7:
0068  66 83 3E 00			cmp		word ptr [esi],0x0000
006C  74 25				je		L$10
006E  66 8B 16				mov		dx,word ptr [esi]
0071  0F B7 D2				movzx		edx,dx
0074  8D 5E 02				lea		ebx,0x2[esi]
0077  83 FA 2E				cmp		edx,0x0000002e
007A  75 06				jne		L$8
007C  89 F7				mov		edi,esi
007E  89 DE				mov		esi,ebx
0080  EB E6				jmp		L$7
0082				L$8:
0082  89 DE				mov		esi,ebx
0084  83 FA 5C				cmp		edx,0x0000005c
0087  74 05				je		L$9
0089  83 FA 2F				cmp		edx,0x0000002f
008C  75 DA				jne		L$7
008E				L$9:
008E  89 75 FC				mov		dword ptr -0x4[ebp],esi
0091  EB D3				jmp		L$6
0093				L$10:
0093  8B 5D FC				mov		ebx,dword ptr -0x4[ebp]
0096  B9 FF 00 00 00			mov		ecx,0x000000ff
009B  2B 5D F4				sub		ebx,dword ptr -0xc[ebp]
009E  8B 55 F4				mov		edx,dword ptr -0xc[ebp]
00A1  D1 FB				sar		ebx,0x01
00A3  E8 00 00 00 00			call		copypart_
00A8  85 FF				test		edi,edi
00AA  75 02				jne		L$11
00AC  89 F7				mov		edi,esi
00AE				L$11:
00AE  B9 FF 00 00 00			mov		ecx,0x000000ff
00B3  89 FB				mov		ebx,edi
00B5  8B 55 FC				mov		edx,dword ptr -0x4[ebp]
00B8  2B 5D FC				sub		ebx,dword ptr -0x4[ebp]
00BB  8B 45 F8				mov		eax,dword ptr -0x8[ebp]
00BE  D1 FB				sar		ebx,0x01
00C0  E8 00 00 00 00			call		copypart_
00C5  B9 FF 00 00 00			mov		ecx,0x000000ff
00CA  89 F3				mov		ebx,esi
00CC  8B 45 10				mov		eax,dword ptr 0x10[ebp]
00CF  29 FB				sub		ebx,edi
00D1  89 FA				mov		edx,edi
00D3  D1 FB				sar		ebx,0x01
00D5  E8 00 00 00 00			call		copypart_
00DA  C9				leave		
00DB  5F				pop		edi
00DC  5E				pop		esi
00DD  C2 04 00				ret		0x0004

Routine Size: 192 bytes,    Routine Base: _TEXT + 0020

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

