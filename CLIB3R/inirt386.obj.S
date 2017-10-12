Module: inirt386
GROUP: 'DGROUP' YIE,YI,YIB,XIE,XI,XIB,_DATA

Segment: _TEXT WORD USE32 0000009A bytes
0000				__InitRtns:
0000  56				push		esi
0001  57				push		edi
0002  53				push		ebx
0003  52				push		edx
0004  06				push		es
0005  89 C2				mov		edx,eax
0007				L$1:
0007  3E BE 00 00 00 00			mov		esi,offset DGROUP:L$13
000D  3E BF 00 00 00 00			mov		edi,offset DGROUP:L$14
0013  89 FB				mov		ebx,edi
0015  88 D0				mov		al,dl
0017				L$2:
0017  39 FE				cmp		esi,edi
0019  73 14				jae		L$4
001B  80 3E 02				cmp		byte ptr [esi],0x02
001E  74 0A				je		L$3
0020  38 46 01				cmp		byte ptr 0x1[esi],al
0023  77 05				ja		L$3
0025  89 F3				mov		ebx,esi
0027  8A 46 01				mov		al,byte ptr 0x1[esi]
002A				L$3:
002A  83 C6 06				add		esi,0x00000006
002D  EB E8				jmp		L$2
002F				L$4:
002F  39 FB				cmp		ebx,edi
0031  74 12				je		L$6
0033  8B 43 02				mov		eax,dword ptr 0x2[ebx]
0036  09 C0				or		eax,eax
0038  74 06				je		L$5
003A  1E				push		ds
003B  07				pop		es
003C  52				push		edx
003D  FF D0				call		eax
003F  5A				pop		edx
0040				L$5:
0040  C6 03 02				mov		byte ptr [ebx],0x02
0043  EB C2				jmp		L$1
0045				L$6:
0045  07				pop		es
0046  5A				pop		edx
0047  5B				pop		ebx
0048  5F				pop		edi
0049  5E				pop		esi
004A  C3				ret		

Routine Size: 75 bytes,    Routine Base: _TEXT + 0000

004B				__FiniRtns:
004B  56				push		esi
004C  57				push		edi
004D  53				push		ebx
004E  06				push		es
004F  88 D6				mov		dh,dl
0051  88 C2				mov		dl,al
0053				L$7:
0053  3E BE 00 00 00 00			mov		esi,offset DGROUP:L$15
0059  3E BF 00 00 00 00			mov		edi,offset DGROUP:L$16
005F  89 FB				mov		ebx,edi
0061  88 D0				mov		al,dl
0063				L$8:
0063  39 FE				cmp		esi,edi
0065  73 14				jae		L$10
0067  80 3E 02				cmp		byte ptr [esi],0x02
006A  74 0A				je		L$9
006C  3A 46 01				cmp		al,byte ptr 0x1[esi]
006F  77 05				ja		L$9
0071  89 F3				mov		ebx,esi
0073  8A 46 01				mov		al,byte ptr 0x1[esi]
0076				L$9:
0076  83 C6 06				add		esi,0x00000006
0079  EB E8				jmp		L$8
007B				L$10:
007B  39 FB				cmp		ebx,edi
007D  74 16				je		L$12
007F  38 F0				cmp		al,dh
0081  77 0D				ja		L$11
0083  8B 43 02				mov		eax,dword ptr 0x2[ebx]
0086  09 C0				or		eax,eax
0088  74 06				je		L$11
008A  1E				push		ds
008B  07				pop		es
008C  52				push		edx
008D  FF D0				call		eax
008F  5A				pop		edx
0090				L$11:
0090  C6 03 02				mov		byte ptr [ebx],0x02
0093  EB BE				jmp		L$7
0095				L$12:
0095  07				pop		es
0096  5B				pop		ebx
0097  5F				pop		edi
0098  5E				pop		esi
0099  C3				ret		

Routine Size: 79 bytes,    Routine Base: _TEXT + 004B

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes

Segment: XIB WORD USE32 00000000 bytes

Segment: XI WORD USE32 00000000 bytes

Segment: XIE WORD USE32 00000000 bytes

Segment: YIB WORD USE32 00000000 bytes

Segment: YI WORD USE32 00000000 bytes

Segment: YIE WORD USE32 00000000 bytes

