Module: splitpat
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000010F bytes
0000				copypart_:
0000  56				push		esi
0001  57				push		edi
0002  89 C6				mov		esi,eax
0004  89 D7				mov		edi,edx
0006  89 DA				mov		edx,ebx
0008  85 C0				test		eax,eax
000A  74 27				je		L$2
000C  39 CB				cmp		ebx,ecx
000E  7E 02				jle		L$1
0010  89 CA				mov		edx,ecx
0012				L$1:
0012  89 F8				mov		eax,edi
0014  E8 00 00 00 00			call		_mbsnccnt_
0019  89 C1				mov		ecx,eax
001B  89 C3				mov		ebx,eax
001D  89 FA				mov		edx,edi
001F  89 F0				mov		eax,esi
0021  E8 00 00 00 00			call		_mbsncpy_
0026  89 CA				mov		edx,ecx
0028  89 F0				mov		eax,esi
002A  E8 00 00 00 00			call		_mbsnbcnt_
002F  C6 04 06 00			mov		byte ptr [esi+eax],0x00
0033				L$2:
0033  5F				pop		edi
0034  5E				pop		esi
0035  C3				ret		

Routine Size: 54 bytes,    Routine Base: _TEXT + 0000

0036				_splitpath_:
0036  56				push		esi
0037  57				push		edi
0038  55				push		ebp
0039  83 EC 0C				sub		esp,0x0000000c
003C  89 C6				mov		esi,eax
003E  89 1C 24				mov		dword ptr [esp],ebx
0041  89 4C 24 04			mov		dword ptr 0x4[esp],ecx
0045  80 38 00				cmp		byte ptr [eax],0x00
0048  74 1F				je		L$4
004A  31 C0				xor		eax,eax
004C  8A 46 01				mov		al,byte ptr 0x1[esi]
004F  83 F8 3A				cmp		eax,0x0000003a
0052  75 15				jne		L$4
0054  85 D2				test		edx,edx
0056  74 0C				je		L$3
0058  8A 06				mov		al,byte ptr [esi]
005A  C6 42 01 3A			mov		byte ptr 0x1[edx],0x3a
005E  C6 42 02 00			mov		byte ptr 0x2[edx],0x00
0062  88 02				mov		byte ptr [edx],al
0064				L$3:
0064  83 C6 02				add		esi,0x00000002
0067  EB 07				jmp		L$5
0069				L$4:
0069  85 D2				test		edx,edx
006B  74 03				je		L$5
006D  C6 02 00				mov		byte ptr [edx],0x00
0070				L$5:
0070  89 F5				mov		ebp,esi
0072  89 74 24 08			mov		dword ptr 0x8[esp],esi
0076				L$6:
0076  31 FF				xor		edi,edi
0078				L$7:
0078  80 3E 00				cmp		byte ptr [esi],0x00
007B  74 42				je		L$12
007D  89 F0				mov		eax,esi
007F  E8 00 00 00 00			call		_mbptov_
0084  89 C2				mov		edx,eax
0086  83 F8 2E				cmp		eax,0x0000002e
0089  75 05				jne		L$8
008B  89 F7				mov		edi,esi
008D  46				inc		esi
008E  EB E8				jmp		L$7
0090				L$8:
0090  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
0097  74 13				je		L$9
0099  31 C0				xor		eax,eax
009B  8A 06				mov		al,byte ptr [esi]
009D  8A 80 01 00 00 00			mov		al,byte ptr ___MBCSIsTable+0x1[eax]
00A3  24 01				and		al,0x01
00A5  25 FF 00 00 00			and		eax,0x000000ff
00AA  EB 02				jmp		L$10
00AC				L$9:
00AC  31 C0				xor		eax,eax
00AE				L$10:
00AE  46				inc		esi
00AF  01 C6				add		esi,eax
00B1  83 FA 5C				cmp		edx,0x0000005c
00B4  74 05				je		L$11
00B6  83 FA 2F				cmp		edx,0x0000002f
00B9  75 BD				jne		L$7
00BB				L$11:
00BB  89 F5				mov		ebp,esi
00BD  EB B7				jmp		L$6
00BF				L$12:
00BF  8B 4C 24 08			mov		ecx,dword ptr 0x8[esp]
00C3  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
00C7  89 EB				mov		ebx,ebp
00C9  8B 04 24				mov		eax,dword ptr [esp]
00CC  29 CB				sub		ebx,ecx
00CE  B9 FF 00 00 00			mov		ecx,0x000000ff
00D3  E8 00 00 00 00			call		copypart_
00D8  85 FF				test		edi,edi
00DA  75 02				jne		L$13
00DC  89 F7				mov		edi,esi
00DE				L$13:
00DE  B9 FF 00 00 00			mov		ecx,0x000000ff
00E3  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
00E7  89 FB				mov		ebx,edi
00E9  89 EA				mov		edx,ebp
00EB  29 EB				sub		ebx,ebp
00ED  E8 00 00 00 00			call		copypart_
00F2  B9 FF 00 00 00			mov		ecx,0x000000ff
00F7  8B 44 24 1C			mov		eax,dword ptr 0x1c[esp]
00FB  89 F3				mov		ebx,esi
00FD  89 FA				mov		edx,edi
00FF  29 FB				sub		ebx,edi
0101  E8 00 00 00 00			call		copypart_
0106  83 C4 0C				add		esp,0x0000000c
0109  5D				pop		ebp
010A  5F				pop		edi
010B  5E				pop		esi
010C  C2 04 00				ret		0x0004

Routine Size: 217 bytes,    Routine Base: _TEXT + 0036

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

