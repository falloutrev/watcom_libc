Module: strstr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000BE bytes
0000				strstr_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  57				push		edi
0004  55				push		ebp
0005  83 EC 04				sub		esp,0x00000004
0008  89 C6				mov		esi,eax
000A  89 D3				mov		ebx,edx
000C  80 3A 00				cmp		byte ptr [edx],0x00
000F  75 07				jne		L$2
0011				L$1:
0011  89 F0				mov		eax,esi
0013  E9 9D 00 00 00			jmp		L$13
0018				L$2:
0018  80 7A 01 00			cmp		byte ptr 0x1[edx],0x00
001C  75 1C				jne		L$6
001E  8A 13				mov		dl,byte ptr [ebx]
0020				L$3:
0020  8A 06				mov		al,byte ptr [esi]
0022  3A C2				cmp		al,dl
0024  74 12				je		L$5
0026  3C 00				cmp		al,0x00
0028  74 0C				je		L$4
002A  46				inc		esi
002B  8A 06				mov		al,byte ptr [esi]
002D  3A C2				cmp		al,dl
002F  74 07				je		L$5
0031  46				inc		esi
0032  3C 00				cmp		al,0x00
0034  75 EA				jne		L$3
0036				L$4:
0036  2B F6				sub		esi,esi
0038				L$5:
0038  EB D7				jmp		L$1
003A				L$6:
003A  B9 FF FF FF FF			mov		ecx,0xffffffff
003F  89 F7				mov		edi,esi
0041  30 C0				xor		al,al
0043  06				push		es
0044  E3 0B				jecxz		L$7
0046  8C DA				mov		edx,ds
0048  8E C2				mov		es,edx
004A  F2 AE				repne scasb	
004C  75 03				jne		L$7
004E  4F				dec		edi
004F  66 A9                                           f.
0051				L$7:
0051  89 CF				mov		edi,ecx
0053  07				pop		es
0054  89 3C 24				mov		dword ptr [esp],edi
0057  89 DF				mov		edi,ebx
0059  06				push		es
005A  8C D8				mov		eax,ds
005C  8E C0				mov		es,eax
005E  29 C9				sub		ecx,ecx
0060  49				dec		ecx
0061  31 C0				xor		eax,eax
0063  F2 AE				repne scasb	
0065  F7 D1				not		ecx
0067  49				dec		ecx
0068  07				pop		es
0069  89 CD				mov		ebp,ecx
006B				L$8:
006B  8B 0C 24				mov		ecx,dword ptr [esp]
006E  29 F1				sub		ecx,esi
0070  39 E9				cmp		ecx,ebp
0072  72 3F				jb		L$12
0074  89 F7				mov		edi,esi
0076  8A 03				mov		al,byte ptr [ebx]
0078  06				push		es
0079  E3 0B				jecxz		L$9
007B  8C DA				mov		edx,ds
007D  8E C2				mov		es,edx
007F  F2 AE				repne scasb	
0081  75 03				jne		L$9
0083  4F				dec		edi
0084  66 A9                                           f.
0086				L$9:
0086  89 CF				mov		edi,ecx
0088  07				pop		es
0089  89 FA				mov		edx,edi
008B  85 FF				test		edi,edi
008D  74 24				je		L$12
008F  89 E9				mov		ecx,ebp
0091  89 DF				mov		edi,ebx
0093  89 D6				mov		esi,edx
0095  06				push		es
0096  8C D8				mov		eax,ds
0098  8E C0				mov		es,eax
009A  31 C0				xor		eax,eax
009C  F3 A6				repe cmpsb	
009E  74 05				je		L$10
00A0  19 C0				sbb		eax,eax
00A2  83 D8 FF				sbb		eax,0xffffffff
00A5				L$10:
00A5  07				pop		es
00A6  85 C0				test		eax,eax
00A8  75 04				jne		L$11
00AA  89 D0				mov		eax,edx
00AC  EB 07				jmp		L$13
00AE				L$11:
00AE  8D 72 01				lea		esi,0x1[edx]
00B1  EB B8				jmp		L$8
00B3				L$12:
00B3  31 C0				xor		eax,eax
00B5				L$13:
00B5  83 C4 04				add		esp,0x00000004
00B8  5D				pop		ebp
00B9  5F				pop		edi
00BA  5E				pop		esi
00BB  59				pop		ecx
00BC  5B				pop		ebx
00BD  C3				ret		

Routine Size: 190 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

