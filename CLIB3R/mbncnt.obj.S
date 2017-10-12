Module: mbncnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000CD bytes
0000				_mbsnccnt_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  57				push		edi
0004  83 EC 04				sub		esp,0x00000004
0007  89 C3				mov		ebx,eax
0009  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
0010  74 22				je		L$3
0012  31 C9				xor		ecx,ecx
0014  8D 34 10				lea		esi,[eax+edx]
0017				L$1:
0017  89 E2				mov		edx,esp
0019  89 D8				mov		eax,ebx
001B  E8 00 00 00 00			call		_mbgetcode_
0020  8B 3C 24				mov		edi,dword ptr [esp]
0023  89 C3				mov		ebx,eax
0025  85 FF				test		edi,edi
0027  74 07				je		L$2
0029  39 F0				cmp		eax,esi
002B  77 03				ja		L$2
002D  41				inc		ecx
002E  EB E7				jmp		L$1
0030				L$2:
0030  89 C8				mov		eax,ecx
0032  EB 02				jmp		L$4
0034				L$3:
0034  89 D0				mov		eax,edx
0036				L$4:
0036  83 C4 04				add		esp,0x00000004
0039  5F				pop		edi
003A  5E				pop		esi
003B  59				pop		ecx
003C  5B				pop		ebx
003D  C3				ret		

Routine Size: 62 bytes,    Routine Base: _TEXT + 0000

003E				_mbsnbcnt_:
003E  53				push		ebx
003F  51				push		ecx
0040  83 EC 04				sub		esp,0x00000004
0043  89 C1				mov		ecx,eax
0045  89 D3				mov		ebx,edx
0047  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
004E  74 17				je		L$7
0050				L$5:
0050  4B				dec		ebx
0051  83 FB FF				cmp		ebx,0xffffffff
0054  74 0D				je		L$6
0056  89 E2				mov		edx,esp
0058  E8 00 00 00 00			call		_mbgetcode_
005D  83 3C 24 00			cmp		dword ptr [esp],0x00000000
0061  75 ED				jne		L$5
0063				L$6:
0063  29 C8				sub		eax,ecx
0065  EB 02				jmp		L$8
0067				L$7:
0067  89 D8				mov		eax,ebx
0069				L$8:
0069  83 C4 04				add		esp,0x00000004
006C  59				pop		ecx
006D  5B				pop		ebx
006E  C3				ret		

Routine Size: 49 bytes,    Routine Base: _TEXT + 003E

006F				_mbsninc_:
006F  53				push		ebx
0070  89 C3				mov		ebx,eax
0072  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
0079  74 09				je		L$9
007B  E8 00 00 00 00			call		_mbsnbcnt_
0080  01 D8				add		eax,ebx
0082  5B				pop		ebx
0083  C3				ret		
0084				L$9:
0084  01 D0				add		eax,edx
0086  5B				pop		ebx
0087  C3				ret		

Routine Size: 25 bytes,    Routine Base: _TEXT + 006F

0088				__mbsninc_:
0088  53				push		ebx
0089  56				push		esi
008A  8B 35 00 00 00 00			mov		esi,dword ptr ___IsDBCS
0090  85 F6				test		esi,esi
0092  74 2E				je		L$13
0094				L$10:
0094  85 D2				test		edx,edx
0096  7E 2C				jle		L$14
0098  85 F6				test		esi,esi
009A  74 15				je		L$11
009C  31 DB				xor		ebx,ebx
009E  8A 18				mov		bl,byte ptr [eax]
00A0  8A 9B 01 00 00 00			mov		bl,byte ptr ___MBCSIsTable+0x1[ebx]
00A6  80 E3 01				and		bl,0x01
00A9  81 E3 FF 00 00 00			and		ebx,0x000000ff
00AF  EB 02				jmp		L$12
00B1				L$11:
00B1  31 DB				xor		ebx,ebx
00B3				L$12:
00B3  0F 95 C3				setne		bl
00B6  81 E3 FF 00 00 00			and		ebx,0x000000ff
00BC  43				inc		ebx
00BD  4A				dec		edx
00BE  01 D8				add		eax,ebx
00C0  EB D2				jmp		L$10
00C2				L$13:
00C2  01 D0				add		eax,edx
00C4				L$14:
00C4  89 35 00 00 00 00			mov		dword ptr ___IsDBCS,esi
00CA  5E				pop		esi
00CB  5B				pop		ebx
00CC  C3				ret		

Routine Size: 69 bytes,    Routine Base: _TEXT + 0088

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

