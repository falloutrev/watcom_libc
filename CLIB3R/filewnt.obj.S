Module: filewnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000DC bytes
0000				_dos_open_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 0C				sub		esp,0x0000000c
0007  50				push		eax
0008  89 D1				mov		ecx,edx
000A  89 DD				mov		ebp,ebx
000C  E8 00 00 00 00			call		__NTAtMaxFiles_
0011  85 C0				test		eax,eax
0013  74 14				je		L$1
0015  B8 0B 00 00 00			mov		eax,0x0000000b
001A  E8 00 00 00 00			call		__set_errno_
001F  B8 FF FF FF FF			mov		eax,0xffffffff
0024  E9 80 00 00 00			jmp		L$6
0029				L$1:
0029  89 D6				mov		esi,edx
002B  8D 5C 24 04			lea		ebx,0x4[esp]
002F  83 E6 07				and		esi,0x00000007
0032  8D 54 24 08			lea		edx,0x8[esp]
0036  89 F0				mov		eax,esi
0038  E8 00 00 00 00			call		__GetNTAccessAttr_
003D  89 C8				mov		eax,ecx
003F  8D 54 24 0C			lea		edx,0xc[esp]
0043  83 E0 70				and		eax,0x00000070
0046  E8 00 00 00 00			call		__GetNTShareAttr_
004B  6A 00				push		0x00000000
004D  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
0051  52				push		edx
0052  6A 03				push		0x00000003
0054  6A 00				push		0x00000000
0056  8B 5C 24 1C			mov		ebx,dword ptr 0x1c[esp]
005A  53				push		ebx
005B  8B 4C 24 1C			mov		ecx,dword ptr 0x1c[esp]
005F  51				push		ecx
0060  8B 44 24 18			mov		eax,dword ptr 0x18[esp]
0064  50				push		eax
0065  E8 00 00 00 00			call		_CreateFileA
006A  83 F8 FF				cmp		eax,0xffffffff
006D  75 07				jne		L$2
006F  E8 00 00 00 00			call		__set_errno_nt_
0074  EB 33				jmp		L$6
0076				L$2:
0076  FF 15 00 00 00 00			call		dword ptr __InitAccessH
007C  89 C1				mov		ecx,eax
007E  89 45 00				mov		dword ptr [ebp],eax
0081  83 FE 02				cmp		esi,0x00000002
0084  75 05				jne		L$3
0086  BF 03 00 00 00			mov		edi,0x00000003
008B				L$3:
008B  85 F6				test		esi,esi
008D  75 05				jne		L$4
008F  BF 01 00 00 00			mov		edi,0x00000001
0094				L$4:
0094  83 FE 01				cmp		esi,0x00000001
0097  75 05				jne		L$5
0099  BF 02 00 00 00			mov		edi,0x00000002
009E				L$5:
009E  89 FA				mov		edx,edi
00A0  89 C8				mov		eax,ecx
00A2  E8 00 00 00 00			call		__SetIOMode_
00A7  31 C0				xor		eax,eax
00A9				L$6:
00A9  83 C4 10				add		esp,0x00000010
00AC  5D				pop		ebp
00AD  5F				pop		edi
00AE  5E				pop		esi
00AF  59				pop		ecx
00B0  C3				ret		

Routine Size: 177 bytes,    Routine Base: _TEXT + 0000

00B1				_dos_close_:
00B1  E9 00 00 00 00			jmp		close_

Routine Size: 5 bytes,    Routine Base: _TEXT + 00B1

00B6				_dos_commit_:
00B6  51				push		ecx
00B7  52				push		edx
00B8  89 C2				mov		edx,eax
00BA  A1 00 00 00 00			mov		eax,dword ptr ___FileHandleIDs
00BF  C1 E2 02				shl		edx,0x02
00C2  8B 04 02				mov		eax,dword ptr [edx+eax]
00C5  50				push		eax
00C6  E8 00 00 00 00			call		_FlushFileBuffers
00CB  85 C0				test		eax,eax
00CD  75 08				jne		L$7
00CF  E8 00 00 00 00			call		__set_errno_nt_
00D4  5A				pop		edx
00D5  59				pop		ecx
00D6  C3				ret		
00D7				L$7:
00D7  31 C0				xor		eax,eax
00D9  5A				pop		edx
00DA  59				pop		ecx
00DB  C3				ret		

Routine Size: 38 bytes,    Routine Base: _TEXT + 00B6

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

