Module: jstrrev
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000008A bytes
0000				jstrrev_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  57				push		edi
0005  55				push		ebp
0006  89 C5				mov		ebp,eax
0008  89 C7				mov		edi,eax
000A  89 C2				mov		edx,eax
000C  06				push		es
000D  8C D8				mov		eax,ds
000F  8E C0				mov		es,eax
0011  29 C9				sub		ecx,ecx
0013  49				dec		ecx
0014  31 C0				xor		eax,eax
0016  F2 AE				repne scasb	
0018  F7 D1				not		ecx
001A  49				dec		ecx
001B  07				pop		es
001C  8D 04 29				lea		eax,[ecx+ebp]
001F				L$1:
001F  39 C2				cmp		edx,eax
0021  73 44				jae		L$3
0023  31 DB				xor		ebx,ebx
0025  8A 1A				mov		bl,byte ptr [edx]
0027  8A 9B 01 00 00 00			mov		bl,byte ptr __IsKTable+0x1[ebx]
002D  80 E3 04				and		bl,0x04
0030  81 E3 FF 00 00 00			and		ebx,0x000000ff
0036  74 2C				je		L$2
0038  8D 5A 01				lea		ebx,0x1[edx]
003B  0F B6 33				movzx		esi,byte ptr [ebx]
003E  8A 8E 01 00 00 00			mov		cl,byte ptr __IsKTable+0x1[esi]
0044  80 E1 08				and		cl,0x08
0047  0F B6 F1				movzx		esi,cl
004A  85 F6				test		esi,esi
004C  74 16				je		L$2
004E  8A 0B				mov		cl,byte ptr [ebx]
0050  8A 2A				mov		ch,byte ptr [edx]
0052  30 CD				xor		ch,cl
0054  88 2A				mov		byte ptr [edx],ch
0056  88 E9				mov		cl,ch
0058  8A 2B				mov		ch,byte ptr [ebx]
005A  30 CD				xor		ch,cl
005C  88 2B				mov		byte ptr [ebx],ch
005E  88 E9				mov		cl,ch
0060  30 0A				xor		byte ptr [edx],cl
0062  89 DA				mov		edx,ebx
0064				L$2:
0064  42				inc		edx
0065  EB B8				jmp		L$1
0067				L$3:
0067  89 EA				mov		edx,ebp
0069				L$4:
0069  48				dec		eax
006A  39 C2				cmp		edx,eax
006C  73 13				jae		L$5
006E  8A 18				mov		bl,byte ptr [eax]
0070  8A 3A				mov		bh,byte ptr [edx]
0072  30 DF				xor		bh,bl
0074  88 3A				mov		byte ptr [edx],bh
0076  8A 08				mov		cl,byte ptr [eax]
0078  30 F9				xor		cl,bh
007A  88 08				mov		byte ptr [eax],cl
007C  30 0A				xor		byte ptr [edx],cl
007E  42				inc		edx
007F  EB E8				jmp		L$4
0081				L$5:
0081  89 E8				mov		eax,ebp
0083  5D				pop		ebp
0084  5F				pop		edi
0085  5E				pop		esi
0086  5A				pop		edx
0087  59				pop		ecx
0088  5B				pop		ebx
0089  C3				ret		

Routine Size: 138 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

