Module: winio
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000154 bytes
0000				_DoStdin_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  89 C1				mov		ecx,eax
0006  89 D6				mov		esi,edx
0008  89 DF				mov		edi,ebx
000A  85 C0				test		eax,eax
000C  74 59				je		L$5
000E  F6 40 52 02			test		byte ptr 0x52[eax],0x02
0012  75 07				jne		L$1
0014  89 C8				mov		eax,ecx
0016  E8 00 00 00 00			call		_MakeWindowActive_
001B				L$1:
001B  89 FB				mov		ebx,edi
001D  89 F2				mov		edx,esi
001F  89 C8				mov		eax,ecx
0021  E8 00 00 00 00			call		_GetString_
0026  8B 2D 00 00 00 00			mov		ebp,dword ptr __GotEOF
002C  89 C3				mov		ebx,eax
002E  8D 0C 06				lea		ecx,[esi+eax]
0031  8D 50 01				lea		edx,0x1[eax]
0034  85 ED				test		ebp,ebp
0036  74 0B				je		L$2
0038  39 F8				cmp		eax,edi
003A  73 29				jae		L$4
003C  89 D3				mov		ebx,edx
003E  C6 01 1A				mov		byte ptr [ecx],0x1a
0041  EB 22				jmp		L$4
0043				L$2:
0043  85 C0				test		eax,eax
0045  75 0D				jne		L$3
0047  B8 01 00 00 00			mov		eax,0x00000001
004C  C6 06 0A				mov		byte ptr [esi],0x0a
004F  5D				pop		ebp
0050  5F				pop		edi
0051  5E				pop		esi
0052  59				pop		ecx
0053  C3				ret		
0054				L$3:
0054  83 C0 02				add		eax,0x00000002
0057  39 F8				cmp		eax,edi
0059  73 0A				jae		L$4
005B  C6 01 0D				mov		byte ptr [ecx],0x0d
005E  8D 5A 01				lea		ebx,0x1[edx]
0061  C6 04 32 0A			mov		byte ptr [edx+esi],0x0a
0065				L$4:
0065  89 D8				mov		eax,ebx
0067				L$5:
0067  5D				pop		ebp
0068  5F				pop		edi
0069  5E				pop		esi
006A  59				pop		ecx
006B  C3				ret		

Routine Size: 108 bytes,    Routine Base: _TEXT + 0000

006C				_DoStdout_:
006C  51				push		ecx
006D  56				push		esi
006E  89 C1				mov		ecx,eax
0070  89 DE				mov		esi,ebx
0072  85 C0				test		eax,eax
0074  75 07				jne		L$6
0076  31 DE				xor		esi,ebx
0078  89 F0				mov		eax,esi
007A  5E				pop		esi
007B  59				pop		ecx
007C  C3				ret		
007D				L$6:
007D  F6 40 52 02			test		byte ptr 0x52[eax],0x02
0081  75 07				jne		L$7
0083  89 C8				mov		eax,ecx
0085  E8 00 00 00 00			call		_MakeWindowActive_
008A				L$7:
008A  89 F3				mov		ebx,esi
008C  89 C8				mov		eax,ecx
008E  E8 00 00 00 00			call		_AddLine_
0093  B8 01 00 00 00			mov		eax,0x00000001
0098  E8 00 00 00 00			call		_MessageLoop_
009D  89 F0				mov		eax,esi
009F  5E				pop		esi
00A0  59				pop		ecx
00A1  C3				ret		

Routine Size: 54 bytes,    Routine Base: _TEXT + 006C

00A2				_DoKbhit_:
00A2  85 C0				test		eax,eax
00A4  75 01				jne		L$8
00A6  C3				ret		
00A7				L$8:
00A7  F6 40 52 02			test		byte ptr 0x52[eax],0x02
00AB  75 05				jne		L$9
00AD  E8 00 00 00 00			call		_MakeWindowActive_
00B2				L$9:
00B2  31 C0				xor		eax,eax
00B4  E9 00 00 00 00			jmp		_KeyboardHit_

Routine Size: 23 bytes,    Routine Base: _TEXT + 00A2

00B9				_DoGetch_:
00B9  52				push		edx
00BA  85 C0				test		eax,eax
00BC  74 2E				je		L$12
00BE  F6 40 52 02			test		byte ptr 0x52[eax],0x02
00C2  75 05				jne		L$10
00C4  E8 00 00 00 00			call		_MakeWindowActive_
00C9				L$10:
00C9  B8 01 00 00 00			mov		eax,0x00000001
00CE  E8 00 00 00 00			call		_KeyboardHit_
00D3  85 C0				test		eax,eax
00D5  74 F2				je		L$10
00D7  31 C0				xor		eax,eax
00D9  E8 00 00 00 00			call		_GetKeyboard_
00DE  89 C2				mov		edx,eax
00E0  3D 80 00 00 00			cmp		eax,0x00000080
00E5  76 03				jbe		L$11
00E7  8D 50 80				lea		edx,-0x80[eax]
00EA				L$11:
00EA  89 D0				mov		eax,edx
00EC				L$12:
00EC  5A				pop		edx
00ED  C3				ret		

Routine Size: 53 bytes,    Routine Base: _TEXT + 00B9

00EE				_DoGetche_:
00EE  53				push		ebx
00EF  51				push		ecx
00F0  52				push		edx
00F1  89 C3				mov		ebx,eax
00F3  E8 00 00 00 00			call		_DoGetch_
00F8  89 C1				mov		ecx,eax
00FA  83 F8 0D				cmp		eax,0x0000000d
00FD  75 07				jne		L$13
00FF  BA 0A 00 00 00			mov		edx,0x0000000a
0104  EB 02				jmp		L$14
0106				L$13:
0106  89 C2				mov		edx,eax
0108				L$14:
0108  89 D8				mov		eax,ebx
010A  E8 00 00 00 00			call		_DoPutch_
010F  89 C8				mov		eax,ecx
0111  5A				pop		edx
0112  59				pop		ecx
0113  5B				pop		ebx
0114  C3				ret		

Routine Size: 39 bytes,    Routine Base: _TEXT + 00EE

0115				_DoPutch_:
0115  53				push		ebx
0116  51				push		ecx
0117  83 EC 04				sub		esp,0x00000004
011A  89 C1				mov		ecx,eax
011C  85 C0				test		eax,eax
011E  74 2E				je		L$16
0120  F6 40 52 02			test		byte ptr 0x52[eax],0x02
0124  75 07				jne		L$15
0126  89 C8				mov		eax,ecx
0128  E8 00 00 00 00			call		_MakeWindowActive_
012D				L$15:
012D  BB 01 00 00 00			mov		ebx,0x00000001
0132  88 14 24				mov		byte ptr [esp],dl
0135  30 D2				xor		dl,dl
0137  89 C8				mov		eax,ecx
0139  88 54 24 01			mov		byte ptr 0x1[esp],dl
013D  89 E2				mov		edx,esp
013F  E8 00 00 00 00			call		_AddLine_
0144  B8 01 00 00 00			mov		eax,0x00000001
0149  E8 00 00 00 00			call		_MessageLoop_
014E				L$16:
014E  83 C4 04				add		esp,0x00000004
0151  59				pop		ecx
0152  5B				pop		ebx
0153  C3				ret		

Routine Size: 63 bytes,    Routine Base: _TEXT + 0115

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

