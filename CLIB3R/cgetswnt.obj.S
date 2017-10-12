Module: cgetswnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000154 bytes
0000				cgets_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  57				push		edi
0005  55				push		ebp
0006  83 EC 1C				sub		esp,0x0000001c
0009  50				push		eax
000A  8B 15 00 00 00 00			mov		edx,dword ptr __WindowsStdin
0010  8D 78 02				lea		edi,0x2[eax]
0013  85 D2				test		edx,edx
0015  74 54				je		L$3
0017  31 DB				xor		ebx,ebx
0019  8A 18				mov		bl,byte ptr [eax]
001B  89 FA				mov		edx,edi
001D  4B				dec		ebx
001E  31 C0				xor		eax,eax
0020  E8 00 00 00 00			call		__qread_
0025  8B 04 24				mov		eax,dword ptr [esp]
0028  89 7C 24 18			mov		dword ptr 0x18[esp],edi
002C  8A 00				mov		al,byte ptr [eax]
002E				L$1:
002E  0F B6 F0				movzx		esi,al
0031  83 FE 01				cmp		esi,0x00000001
0034  7E 20				jle		L$2
0036  8B 74 24 18			mov		esi,dword ptr 0x18[esp]
003A  0F B6 36				movzx		esi,byte ptr [esi]
003D  83 FE 0D				cmp		esi,0x0000000d
0040  74 14				je		L$2
0042  8B 54 24 18			mov		edx,dword ptr 0x18[esp]
0046  80 3A 00				cmp		byte ptr [edx],0x00
0049  74 0B				je		L$2
004B  8D 5A 01				lea		ebx,0x1[edx]
004E  FE C8				dec		al
0050  89 5C 24 18			mov		dword ptr 0x18[esp],ebx
0054  EB D8				jmp		L$1
0056				L$2:
0056  8B 44 24 18			mov		eax,dword ptr 0x18[esp]
005A  8A 14 24				mov		dl,byte ptr [esp]
005D  C6 00 00				mov		byte ptr [eax],0x00
0060  8A 44 24 18			mov		al,byte ptr 0x18[esp]
0064  28 D0				sub		al,dl
0066  E9 D4 00 00 00			jmp		L$10
006B				L$3:
006B  31 C0				xor		eax,eax
006D  8B 1C 24				mov		ebx,dword ptr [esp]
0070  FF 15 00 00 00 00			call		dword ptr __AccessFileH
0076  E8 00 00 00 00			call		__NTConsoleInput_
007B  89 7C 24 18			mov		dword ptr 0x18[esp],edi
007F  89 C6				mov		esi,eax
0081  8A 1B				mov		bl,byte ptr [ebx]
0083  BD 08 00 00 00			mov		ebp,0x00000008
0088				L$4:
0088  8D 44 24 1C			lea		eax,0x1c[esp]
008C  50				push		eax
008D  6A 01				push		0x00000001
008F  8D 44 24 0C			lea		eax,0xc[esp]
0093  50				push		eax
0094  56				push		esi
0095  E8 00 00 00 00			call		_ReadConsoleInputA
009A  8D 44 24 04			lea		eax,0x4[esp]
009E  E8 00 00 00 00			call		__NTRealKey_
00A3  85 C0				test		eax,eax
00A5  74 E1				je		L$4
00A7  31 C0				xor		eax,eax
00A9  8A 44 24 12			mov		al,byte ptr 0x12[esp]
00AD  83 F8 0D				cmp		eax,0x0000000d
00B0  0F 84 71 00 00 00			je		L$9
00B6  EB 62				jmp		L$8
00B8				L$5:
00B8  31 C0				xor		eax,eax
00BA  8A 44 24 12			mov		al,byte ptr 0x12[esp]
00BE  83 F8 08				cmp		eax,0x00000008
00C1  75 2B				jne		L$6
00C3  3B 7C 24 18			cmp		edi,dword ptr 0x18[esp]
00C7  73 4C				jae		L$7
00C9  89 E8				mov		eax,ebp
00CB  8B 54 24 18			mov		edx,dword ptr 0x18[esp]
00CF  E8 00 00 00 00			call		putch_
00D4  B8 20 00 00 00			mov		eax,0x00000020
00D9  FE C3				inc		bl
00DB  E8 00 00 00 00			call		putch_
00E0  89 E8				mov		eax,ebp
00E2  4A				dec		edx
00E3  E8 00 00 00 00			call		putch_
00E8  89 54 24 18			mov		dword ptr 0x18[esp],edx
00EC  EB 27				jmp		L$7
00EE				L$6:
00EE  31 C0				xor		eax,eax
00F0  88 D8				mov		al,bl
00F2  83 F8 01				cmp		eax,0x00000001
00F5  7E 1E				jle		L$7
00F7  8B 54 24 18			mov		edx,dword ptr 0x18[esp]
00FB  8A 44 24 12			mov		al,byte ptr 0x12[esp]
00FF  FE CB				dec		bl
0101  88 02				mov		byte ptr [edx],al
0103  31 C0				xor		eax,eax
0105  8D 4A 01				lea		ecx,0x1[edx]
0108  8A 44 24 12			mov		al,byte ptr 0x12[esp]
010C  89 4C 24 18			mov		dword ptr 0x18[esp],ecx
0110  E8 00 00 00 00			call		putch_
0115				L$7:
0115  66 FF 4C 24 0C			dec		word ptr 0xc[esp]
011A				L$8:
011A  66 83 7C 24 0C 00			cmp		word ptr 0xc[esp],0x0000
0120  77 96				ja		L$5
0122  E9 61 FF FF FF			jmp		L$4
0127				L$9:
0127  8B 44 24 18			mov		eax,dword ptr 0x18[esp]
012B  C6 00 00				mov		byte ptr [eax],0x00
012E  31 C0				xor		eax,eax
0130  8A 34 24				mov		dh,byte ptr [esp]
0133  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
0139  8A 44 24 18			mov		al,byte ptr 0x18[esp]
013D  28 F0				sub		al,dh
013F				L$10:
013F  8B 14 24				mov		edx,dword ptr [esp]
0142  2C 02				sub		al,0x02
0144  88 42 01				mov		byte ptr 0x1[edx],al
0147  8D 42 02				lea		eax,0x2[edx]
014A  83 C4 20				add		esp,0x00000020
014D  5D				pop		ebp
014E  5F				pop		edi
014F  5E				pop		esi
0150  5A				pop		edx
0151  59				pop		ecx
0152  5B				pop		ebx
0153  C3				ret		

Routine Size: 340 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

