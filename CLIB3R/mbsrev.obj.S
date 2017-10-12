Module: mbsrev
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000B6 bytes
0000				_mbsrev_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  57				push		edi
0005  55				push		ebp
0006  89 C5				mov		ebp,eax
0008  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
000F  0F 84 91 00 00 00			je		L$9
0015  89 C7				mov		edi,eax
0017  89 C2				mov		edx,eax
0019  06				push		es
001A  8C D8				mov		eax,ds
001C  8E C0				mov		es,eax
001E  29 C9				sub		ecx,ecx
0020  49				dec		ecx
0021  31 C0				xor		eax,eax
0023  F2 AE				repne scasb	
0025  F7 D1				not		ecx
0027  49				dec		ecx
0028  07				pop		es
0029  8D 04 29				lea		eax,[ecx+ebp]
002C				L$1:
002C  39 C2				cmp		edx,eax
002E  73 58				jae		L$6
0030  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
0037  74 11				je		L$2
0039  0F B6 32				movzx		esi,byte ptr [edx]
003C  8A 8E 01 00 00 00			mov		cl,byte ptr ___MBCSIsTable+0x1[esi]
0042  80 E1 01				and		cl,0x01
0045  0F B6 F1				movzx		esi,cl
0048  EB 02				jmp		L$3
004A				L$2:
004A  31 F6				xor		esi,esi
004C				L$3:
004C  85 F6				test		esi,esi
004E  74 35				je		L$5
0050  8B 35 00 00 00 00			mov		esi,dword ptr ___IsDBCS
0056  85 F6				test		esi,esi
0058  74 12				je		L$4
005A  8D 5A 01				lea		ebx,0x1[edx]
005D  0F B6 33				movzx		esi,byte ptr [ebx]
0060  8A 8E 01 00 00 00			mov		cl,byte ptr ___MBCSIsTable+0x1[esi]
0066  80 E1 02				and		cl,0x02
0069  0F B6 F1				movzx		esi,cl
006C				L$4:
006C  85 F6				test		esi,esi
006E  74 15				je		L$5
0070  8A 0B				mov		cl,byte ptr [ebx]
0072  8A 2A				mov		ch,byte ptr [edx]
0074  30 CD				xor		ch,cl
0076  88 2A				mov		byte ptr [edx],ch
0078  88 E9				mov		cl,ch
007A  8A 2B				mov		ch,byte ptr [ebx]
007C  30 CD				xor		ch,cl
007E  88 2B				mov		byte ptr [ebx],ch
0080  88 E9				mov		cl,ch
0082  30 0A				xor		byte ptr [edx],cl
0084  42				inc		edx
0085				L$5:
0085  42				inc		edx
0086  EB A4				jmp		L$1
0088				L$6:
0088  89 EA				mov		edx,ebp
008A				L$7:
008A  48				dec		eax
008B  39 C2				cmp		edx,eax
008D  73 13				jae		L$8
008F  8A 18				mov		bl,byte ptr [eax]
0091  8A 3A				mov		bh,byte ptr [edx]
0093  30 DF				xor		bh,bl
0095  88 3A				mov		byte ptr [edx],bh
0097  8A 08				mov		cl,byte ptr [eax]
0099  30 F9				xor		cl,bh
009B  88 08				mov		byte ptr [eax],cl
009D  30 0A				xor		byte ptr [edx],cl
009F  42				inc		edx
00A0  EB E8				jmp		L$7
00A2				L$8:
00A2  89 EE				mov		esi,ebp
00A4  EB 07				jmp		L$10
00A6				L$9:
00A6  E8 00 00 00 00			call		strrev_
00AB  89 C6				mov		esi,eax
00AD				L$10:
00AD  89 F0				mov		eax,esi
00AF  5D				pop		ebp
00B0  5F				pop		edi
00B1  5E				pop		esi
00B2  5A				pop		edx
00B3  59				pop		ecx
00B4  5B				pop		ebx
00B5  C3				ret		

Routine Size: 182 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

