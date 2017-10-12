Module: efgfmt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000149 bytes
0000				_EFG_Format_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 08				sub		esp,0x00000008
0007  89 C6				mov		esi,eax
0009  89 DF				mov		edi,ebx
000B  89 D0				mov		eax,edx
000D  8C DB				mov		ebx,ds
000F  C7 47 0C 00 00 00 00		mov		dword ptr 0xc[edi],0x00000000
0016  89 F1				mov		ecx,esi
0018  8A 57 15				mov		dl,byte ptr 0x15[edi]
001B  31 ED				xor		ebp,ebp
001D  80 FA 47				cmp		dl,0x47
0020  72 1D				jb		L$2
0022  76 28				jbe		L$3
0024  80 FA 66				cmp		dl,0x66
0027  72 0C				jb		L$1
0029  76 36				jbe		L$6
002B  80 FA 67				cmp		dl,0x67
002E  74 1C				je		L$3
0030  E9 A9 00 00 00			jmp		L$11
0035				L$1:
0035  80 FA 65				cmp		dl,0x65
0038  74 22				je		L$5
003A  E9 9F 00 00 00			jmp		L$11
003F				L$2:
003F  80 FA 45				cmp		dl,0x45
0042  0F 82 96 00 00 00			jb		L$11
0048  76 12				jbe		L$5
004A  EB 15				jmp		L$6
004C				L$3:
004C  83 7F 08 00			cmp		dword ptr 0x8[edi],0x00000000
0050  75 07				jne		L$4
0052  C7 47 08 01 00 00 00		mov		dword ptr 0x8[edi],0x00000001
0059				L$4:
0059  80 EA 02				sub		dl,0x02
005C				L$5:
005C  BD 01 00 00 00			mov		ebp,0x00000001
0061				L$6:
0061  8B 08				mov		ecx,dword ptr [eax]
0063  83 C1 08				add		ecx,0x00000008
0066  89 08				mov		dword ptr [eax],ecx
0068  8B 41 F8				mov		eax,dword ptr -0x8[ecx]
006B  89 04 24				mov		dword ptr [esp],eax
006E  8B 41 FC				mov		eax,dword ptr -0x4[ecx]
0071  89 44 24 04			mov		dword ptr 0x4[esp],eax
0075  83 7F 08 FF			cmp		dword ptr 0x8[edi],0xffffffff
0079  75 07				jne		L$7
007B  C7 47 08 06 00 00 00		mov		dword ptr 0x8[edi],0x00000006
0082				L$7:
0082  8A 47 15				mov		al,byte ptr 0x15[edi]
0085  24 5F				and		al,0x5f
0087  25 FF 00 00 00			and		eax,0x000000ff
008C  50				push		eax
008D  31 C0				xor		eax,eax
008F  88 D0				mov		al,dl
0091  50				push		eax
0092  6A 03				push		0x00000003
0094  55				push		ebp
0095  8B 5F 08				mov		ebx,dword ptr 0x8[edi]
0098  31 C9				xor		ecx,ecx
009A  68 FF 00 00 00			push		0x000000ff
009F  8D 54 24 14			lea		edx,0x14[esp]
00A3  89 F0				mov		eax,esi
00A5  E8 00 00 00 00			call		_FtoS_
00AA  31 C0				xor		eax,eax
00AC  8A 06				mov		al,byte ptr [esi]
00AE  83 F8 2A				cmp		eax,0x0000002a
00B1  75 04				jne		L$8
00B3  C6 47 16 2A			mov		byte ptr 0x16[edi],0x2a
00B7				L$8:
00B7  C6 86 FF 00 00 00 00		mov		byte ptr 0xff[esi],0x00
00BE				L$9:
00BE  31 C0				xor		eax,eax
00C0  8A 06				mov		al,byte ptr [esi]
00C2  83 F8 20				cmp		eax,0x00000020
00C5  75 03				jne		L$10
00C7  46				inc		esi
00C8  EB F4				jmp		L$9
00CA				L$10:
00CA  89 FA				mov		edx,edi
00CC  89 F0				mov		eax,esi
00CE  E8 00 00 00 00			call		forcedecpt_
00D3  8C DB				mov		ebx,ds
00D5  89 F1				mov		ecx,esi
00D7  C7 47 08 FF FF FF FF		mov		dword ptr 0x8[edi],0xffffffff
00DE				L$11:
00DE  89 DA				mov		edx,ebx
00E0  89 C8				mov		eax,ecx
00E2  83 C4 08				add		esp,0x00000008
00E5  5D				pop		ebp
00E6  5F				pop		edi
00E7  5E				pop		esi
00E8  59				pop		ecx
00E9  C3				ret		
00EA				forcedecpt_:
00EA  53				push		ebx
00EB  89 D3				mov		ebx,edx
00ED  8A 52 14				mov		dl,byte ptr 0x14[edx]
00F0  80 E2 01				and		dl,0x01
00F3  81 E2 FF 00 00 00			and		edx,0x000000ff
00F9  75 4C				jne		L$17
00FB				L$12:
00FB  80 38 00				cmp		byte ptr [eax],0x00
00FE  74 11				je		L$13
0100  31 D2				xor		edx,edx
0102  8A 10				mov		dl,byte ptr [eax]
0104  83 FA 65				cmp		edx,0x00000065
0107  74 08				je		L$13
0109  83 FA 45				cmp		edx,0x00000045
010C  74 03				je		L$13
010E  40				inc		eax
010F  EB EA				jmp		L$12
0111				L$13:
0111  89 C2				mov		edx,eax
0113  8A 5B 15				mov		bl,byte ptr 0x15[ebx]
0116  81 E3 FF 00 00 00			and		ebx,0x000000ff
011C  48				dec		eax
011D  83 FB 47				cmp		ebx,0x00000047
0120  74 05				je		L$14
0122  83 FB 67				cmp		ebx,0x00000067
0125  75 0C				jne		L$15
0127				L$14:
0127  31 DB				xor		ebx,ebx
0129  8A 18				mov		bl,byte ptr [eax]
012B  83 FB 30				cmp		ebx,0x00000030
012E  75 03				jne		L$15
0130  48				dec		eax
0131  EB F4				jmp		L$14
0133				L$15:
0133  31 DB				xor		ebx,ebx
0135  8A 18				mov		bl,byte ptr [eax]
0137  83 FB 2E				cmp		ebx,0x0000002e
013A  74 01				je		L$16
013C  40				inc		eax
013D				L$16:
013D  8A 1A				mov		bl,byte ptr [edx]
013F  42				inc		edx
0140  88 18				mov		byte ptr [eax],bl
0142  40				inc		eax
0143  84 DB				test		bl,bl
0145  75 F6				jne		L$16
0147				L$17:
0147  5B				pop		ebx
0148  C3				ret		

Routine Size: 329 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

