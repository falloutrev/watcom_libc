Module: ddgrpwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000D0 bytes
0000				__disallow_single_dgroup_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  57				push		edi
0005  89 C3				mov		ebx,eax
0007  68 04 01 00 00			push		0x00000104
000C  68 00 00 00 00			push		offset _pgmname
0011  6A 00				push		0x00000000
0013  E8 00 00 00 00			call		_GetModuleFileNameA
0018  68 04 01 00 00			push		0x00000104
001D  68 00 00 00 00			push		offset _dllname
0022  53				push		ebx
0023  BE 00 00 00 00			mov		esi,offset DGROUP:L$7
0028  E8 00 00 00 00			call		_GetModuleFileNameA
002D  30 E4				xor		ah,ah
002F  BF 00 00 00 00			mov		edi,offset _buf
0034  88 25 00 00 00 00			mov		byte ptr _buf,ah
003A  06				push		es
003B  1E				push		ds
003C  07				pop		es
003D  57				push		edi
003E  2B C9				sub		ecx,ecx
0040  49				dec		ecx
0041  B0 00				mov		al,0x00
0043  F2 AE				repne scasb	
0045  4F				dec		edi
0046				L$1:
0046  8A 06				mov		al,byte ptr [esi]
0048  88 07				mov		byte ptr [edi],al
004A  3C 00				cmp		al,0x00
004C  74 10				je		L$2
004E  8A 46 01				mov		al,byte ptr 0x1[esi]
0051  83 C6 02				add		esi,0x00000002
0054  88 47 01				mov		byte ptr 0x1[edi],al
0057  83 C7 02				add		edi,0x00000002
005A  3C 00				cmp		al,0x00
005C  75 E8				jne		L$1
005E				L$2:
005E  5F				pop		edi
005F  07				pop		es
0060  BE 00 00 00 00			mov		esi,offset _pgmname
0065  06				push		es
0066  1E				push		ds
0067  07				pop		es
0068  57				push		edi
0069  2B C9				sub		ecx,ecx
006B  49				dec		ecx
006C  B0 00				mov		al,0x00
006E  F2 AE				repne scasb	
0070  4F				dec		edi
0071				L$3:
0071  8A 06				mov		al,byte ptr [esi]
0073  88 07				mov		byte ptr [edi],al
0075  3C 00				cmp		al,0x00
0077  74 10				je		L$4
0079  8A 46 01				mov		al,byte ptr 0x1[esi]
007C  83 C6 02				add		esi,0x00000002
007F  88 47 01				mov		byte ptr 0x1[edi],al
0082  83 C7 02				add		edi,0x00000002
0085  3C 00				cmp		al,0x00
0087  75 E8				jne		L$3
0089				L$4:
0089  5F				pop		edi
008A  07				pop		es
008B  BE 31 00 00 00			mov		esi,offset DGROUP:L$8
0090  06				push		es
0091  1E				push		ds
0092  07				pop		es
0093  57				push		edi
0094  2B C9				sub		ecx,ecx
0096  49				dec		ecx
0097  B0 00				mov		al,0x00
0099  F2 AE				repne scasb	
009B  4F				dec		edi
009C				L$5:
009C  8A 06				mov		al,byte ptr [esi]
009E  88 07				mov		byte ptr [edi],al
00A0  3C 00				cmp		al,0x00
00A2  74 10				je		L$6
00A4  8A 46 01				mov		al,byte ptr 0x1[esi]
00A7  83 C6 02				add		esi,0x00000002
00AA  88 47 01				mov		byte ptr 0x1[edi],al
00AD  83 C7 02				add		edi,0x00000002
00B0  3C 00				cmp		al,0x00
00B2  75 E8				jne		L$5
00B4				L$6:
00B4  5F				pop		edi
00B5  07				pop		es
00B6  6A 00				push		0x00000000
00B8  68 00 00 00 00			push		offset _dllname
00BD  57				push		edi
00BE  6A 00				push		0x00000000
00C0  E8 00 00 00 00			call		_MessageBoxA
00C5  B8 01 00 00 00			mov		eax,0x00000001
00CA  5F				pop		edi
00CB  5E				pop		esi
00CC  5A				pop		edx
00CD  59				pop		ecx
00CE  5B				pop		ebx
00CF  C3				ret		

Routine Size: 208 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 000000E4 bytes
0000				L$7:
0000  54 68 69 73 20 44 79 6E 61 6D 69 63 20 4C 69 6E This Dynamic Lin
0010  6B 20 4C 69 62 72 61 72 79 20 69 73 20 61 6C 72 k Library is alr
0020  65 61 64 79 20 69 6E 20 75 73 65 20 62 79 3A 0A eady in use by:.
0030  00                                              .
0031				L$8:
0031  0A 0A 54 68 65 20 57 61 74 63 6F 6D 20 57 49 4E ..The Watcom WIN
0041  33 32 20 72 75 6E 74 69 6D 65 20 6C 69 62 72 61 32 runtime libra
0051  72 79 20 64 6F 65 73 20 6E 6F 74 20 73 75 70 70 ry does not supp
0061  6F 72 74 20 61 74 74 61 63 68 69 6E 67 20 6D 6F ort attaching mo
0071  72 65 20 74 68 61 6E 20 6F 6E 65 20 70 72 6F 63 re than one proc
0081  65 73 73 20 74 6F 20 61 20 44 79 6E 61 6D 69 63 ess to a Dynamic
0091  20 4C 69 6E 6B 20 4C 69 62 72 61 72 79 20 74 68  Link Library th
00A1  61 74 20 64 6F 65 73 20 6E 6F 74 20 68 61 76 65 at does not have
00B1  20 61 20 73 65 70 61 72 61 74 65 20 64 61 74 61  a separate data
00C1  20 73 70 61 63 65 20 66 6F 72 20 65 61 63 68 20  space for each 
00D1  61 74 74 61 63 68 65 64 20 70 72 6F 63 65 73 73 attached process
00E1  2E 0A 00                                        ...

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 000003F0 bytes
0000				_buf:
01E8				_pgmname:
02EC				_dllname:

BSS Size: 1008 bytes

