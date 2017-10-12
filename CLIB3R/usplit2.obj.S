Module: usplit2
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000DF bytes
0000				pcopy_:
0000  56				push		esi
0001  89 D6				mov		esi,edx
0003  89 DA				mov		edx,ebx
0005  85 C0				test		eax,eax
0007  74 29				je		L$2
0009  89 30				mov		dword ptr [eax],esi
000B  89 C8				mov		eax,ecx
000D  29 D8				sub		eax,ebx
000F  D1 F8				sar		eax,0x01
0011  3D 07 01 00 00			cmp		eax,0x00000107
0016  72 05				jb		L$1
0018  B8 06 01 00 00			mov		eax,0x00000106
001D				L$1:
001D  8D 0C 00				lea		ecx,[eax+eax]
0020  89 CB				mov		ebx,ecx
0022  89 F0				mov		eax,esi
0024  01 CE				add		esi,ecx
0026  E8 00 00 00 00			call		memcpy_
002B  66 C7 06 00 00			mov		word ptr [esi],0x0000
0030  46				inc		esi
0031  46				inc		esi
0032				L$2:
0032  89 F0				mov		eax,esi
0034  5E				pop		esi
0035  C3				ret		

Routine Size: 54 bytes,    Routine Base: _TEXT + 0000

0036				_u_splitpath2_:
0036  56				push		esi
0037  57				push		edi
0038  C8 08 00 00			enter		0x0008,0x00
003C  89 C6				mov		esi,eax
003E  89 C8				mov		eax,ecx
0040  66 83 3E 00			cmp		word ptr [esi],0x0000
0044  74 29				je		L$4
0046  0F B7 7E 02			movzx		edi,word ptr 0x2[esi]
004A  83 FF 3A				cmp		edi,0x0000003a
004D  75 20				jne		L$4
004F  85 DB				test		ebx,ebx
0051  74 17				je		L$3
0053  89 13				mov		dword ptr [ebx],edx
0055  66 8B 1E				mov		bx,word ptr [esi]
0058  66 C7 42 02 3A 00			mov		word ptr 0x2[edx],0x003a
005E  66 C7 42 04 00 00			mov		word ptr 0x4[edx],0x0000
0064  66 89 1A				mov		word ptr [edx],bx
0067  83 C2 06				add		edx,0x00000006
006A				L$3:
006A  83 C6 04				add		esi,0x00000004
006D  EB 0D				jmp		L$5
006F				L$4:
006F  85 DB				test		ebx,ebx
0071  74 09				je		L$5
0073  89 13				mov		dword ptr [ebx],edx
0075  66 C7 02 00 00			mov		word ptr [edx],0x0000
007A  42				inc		edx
007B  42				inc		edx
007C				L$5:
007C  89 75 FC				mov		dword ptr -0x4[ebp],esi
007F  89 75 F8				mov		dword ptr -0x8[ebp],esi
0082				L$6:
0082  31 FF				xor		edi,edi
0084				L$7:
0084  66 8B 1E				mov		bx,word ptr [esi]
0087  66 85 DB				test		bx,bx
008A  74 1F				je		L$10
008C  0F B7 DB				movzx		ebx,bx
008F  83 FB 2E				cmp		ebx,0x0000002e
0092  75 06				jne		L$8
0094  89 F7				mov		edi,esi
0096  46				inc		esi
0097  46				inc		esi
0098  EB EA				jmp		L$7
009A				L$8:
009A  46				inc		esi
009B  46				inc		esi
009C  83 FB 5C				cmp		ebx,0x0000005c
009F  74 05				je		L$9
00A1  83 FB 2F				cmp		ebx,0x0000002f
00A4  75 DE				jne		L$7
00A6				L$9:
00A6  89 75 FC				mov		dword ptr -0x4[ebp],esi
00A9  EB D7				jmp		L$6
00AB				L$10:
00AB  8B 4D FC				mov		ecx,dword ptr -0x4[ebp]
00AE  8B 5D F8				mov		ebx,dword ptr -0x8[ebp]
00B1  E8 00 00 00 00			call		pcopy_
00B6  89 C2				mov		edx,eax
00B8  85 FF				test		edi,edi
00BA  75 02				jne		L$11
00BC  89 F7				mov		edi,esi
00BE				L$11:
00BE  8B 5D FC				mov		ebx,dword ptr -0x4[ebp]
00C1  8B 45 10				mov		eax,dword ptr 0x10[ebp]
00C4  89 F9				mov		ecx,edi
00C6  E8 00 00 00 00			call		pcopy_
00CB  89 F1				mov		ecx,esi
00CD  89 FB				mov		ebx,edi
00CF  89 C2				mov		edx,eax
00D1  8B 45 14				mov		eax,dword ptr 0x14[ebp]
00D4  E8 00 00 00 00			call		pcopy_
00D9  C9				leave		
00DA  5F				pop		edi
00DB  5E				pop		esi
00DC  C2 08 00				ret		0x0008

Routine Size: 169 bytes,    Routine Base: _TEXT + 0036

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

