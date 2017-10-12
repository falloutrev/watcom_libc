Module: setmd
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000D4 bytes
0000				setmode_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  83 EC 04				sub		esp,0x00000004
0006  89 C3				mov		ebx,eax
0008  89 D1				mov		ecx,edx
000A  E8 00 00 00 00			call		__IOMode_
000F  89 04 24				mov		dword ptr [esp],eax
0012  89 C2				mov		edx,eax
0014  85 C0				test		eax,eax
0016  75 14				jne		L$2
0018  B8 04 00 00 00			mov		eax,0x00000004
001D  E8 00 00 00 00			call		__set_errno_
0022				L$1:
0022  B8 FF FF FF FF			mov		eax,0xffffffff
0027  E9 A1 00 00 00			jmp		L$12
002C				L$2:
002C  89 D8				mov		eax,ebx
002E  FF 15 00 00 00 00			call		dword ptr __AccessFileH
0034  F6 04 24 40			test		byte ptr [esp],0x40
0038  74 07				je		L$3
003A  B8 00 02 00 00			mov		eax,0x00000200
003F  EB 05				jmp		L$4
0041				L$3:
0041  B8 00 01 00 00			mov		eax,0x00000100
0046				L$4:
0046  89 C6				mov		esi,eax
0048  39 C1				cmp		ecx,eax
004A  0F 84 73 00 00 00			je		L$11
0050  81 F9 00 02 00 00			cmp		ecx,0x00000200
0056  74 08				je		L$5
0058  81 F9 00 01 00 00			cmp		ecx,0x00000100
005E  75 4C				jne		L$10
0060				L$5:
0060  80 E2 BF				and		dl,0xbf
0063  81 F9 00 02 00 00			cmp		ecx,0x00000200
0069  75 03				jne		L$6
006B  80 CA 40				or		dl,0x40
006E				L$6:
006E  89 D8				mov		eax,ebx
0070  E8 00 00 00 00			call		__SetIOMode_
0075  A1 00 00 00 00			mov		eax,dword ptr ___OpenStreams
007A  EB 2A				jmp		L$9
007C				L$7:
007C  8B 50 04				mov		edx,dword ptr 0x4[eax]
007F  83 7A 0C 00			cmp		dword ptr 0xc[edx],0x00000000
0083  74 1F				je		L$8
0085  3B 5A 10				cmp		ebx,dword ptr 0x10[edx]
0088  75 1A				jne		L$8
008A  8A 42 0C				mov		al,byte ptr 0xc[edx]
008D  24 BF				and		al,0xbf
008F  88 42 0C				mov		byte ptr 0xc[edx],al
0092  81 F9 00 02 00 00			cmp		ecx,0x00000200
0098  75 29				jne		L$11
009A  88 C4				mov		ah,al
009C  80 CC 40				or		ah,0x40
009F  88 62 0C				mov		byte ptr 0xc[edx],ah
00A2  EB 1F				jmp		L$11
00A4				L$8:
00A4  8B 00				mov		eax,dword ptr [eax]
00A6				L$9:
00A6  85 C0				test		eax,eax
00A8  75 D2				jne		L$7
00AA  EB 17				jmp		L$11
00AC				L$10:
00AC  B8 09 00 00 00			mov		eax,0x00000009
00B1  E8 00 00 00 00			call		__set_errno_
00B6  89 D8				mov		eax,ebx
00B8  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
00BE  E9 5F FF FF FF			jmp		L$1
00C3				L$11:
00C3  89 D8				mov		eax,ebx
00C5  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
00CB  89 F0				mov		eax,esi
00CD				L$12:
00CD  83 C4 04				add		esp,0x00000004
00D0  5E				pop		esi
00D1  59				pop		ecx
00D2  5B				pop		ebx
00D3  C3				ret		

Routine Size: 212 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

