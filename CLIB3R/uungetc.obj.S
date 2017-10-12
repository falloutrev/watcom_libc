Module: uungetc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000CE bytes
0000				_uungetc_:
0000  53				push		ebx
0001  51				push		ecx
0002  89 C1				mov		ecx,eax
0004  89 D3				mov		ebx,edx
0006  83 F8 FF				cmp		eax,0xffffffff
0009  0F 84 BC 00 00 00			je		L$12
000F  8B 42 10				mov		eax,dword ptr 0x10[edx]
0012  FF 15 00 00 00 00			call		dword ptr __AccessFileH
0018  F6 42 0D 10			test		byte ptr 0xd[edx],0x10
001C  74 11				je		L$3
001E				L$1:
001E  8B 42 10				mov		eax,dword ptr 0x10[edx]
0021				L$2:
0021  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
0027  B8 FF FF FF FF			mov		eax,0xffffffff
002C  59				pop		ecx
002D  5B				pop		ebx
002E  C3				ret		
002F				L$3:
002F  F6 42 0C 01			test		byte ptr 0xc[edx],0x01
0033  74 E9				je		L$1
0035  83 7A 08 00			cmp		dword ptr 0x8[edx],0x00000000
0039  75 07				jne		L$4
003B  89 D0				mov		eax,edx
003D  E8 00 00 00 00			call		__ioalloc_
0042				L$4:
0042  8D 43 18				lea		eax,0x18[ebx]
0045  3B 43 08				cmp		eax,dword ptr 0x8[ebx]
0048  75 0D				jne		L$5
004A  B8 02 00 00 00			mov		eax,0x00000002
004F  E8 00 00 00 00			call		malloc_
0054  89 43 08				mov		dword ptr 0x8[ebx],eax
0057				L$5:
0057  83 7B 08 00			cmp		dword ptr 0x8[ebx],0x00000000
005B  75 11				jne		L$6
005D  BA 01 00 00 00			mov		edx,0x00000001
0062  B8 00 00 00 00			mov		eax,offset DGROUP:L$13
0067  E8 00 00 00 00			call		__fatal_runtime_error_
006C  EB 04				jmp		L$7
006E				L$6:
006E  80 4B 0C 08			or		byte ptr 0xc[ebx],0x08
0072				L$7:
0072  83 7B 04 00			cmp		dword ptr 0x4[ebx],0x00000000
0076  75 19				jne		L$8
0078  8B 43 08				mov		eax,dword ptr 0x8[ebx]
007B  03 43 14				add		eax,dword ptr 0x14[ebx]
007E  C7 43 04 02 00 00 00		mov		dword ptr 0x4[ebx],0x00000002
0085  48				dec		eax
0086  48				dec		eax
0087  89 03				mov		dword ptr [ebx],eax
0089  8B 03				mov		eax,dword ptr [ebx]
008B  80 4B 0C 04			or		byte ptr 0xc[ebx],0x04
008F  EB 27				jmp		L$11
0091				L$8:
0091  8B 03				mov		eax,dword ptr [ebx]
0093  3B 43 08				cmp		eax,dword ptr 0x8[ebx]
0096  74 16				je		L$9
0098  83 2B 02				sub		dword ptr [ebx],0x00000002
009B  8B 03				mov		eax,dword ptr [ebx]
009D  83 43 04 02			add		dword ptr 0x4[ebx],0x00000002
00A1  0F B7 00				movzx		eax,word ptr [eax]
00A4  39 C8				cmp		eax,ecx
00A6  74 0E				je		L$10
00A8  80 4B 0C 04			or		byte ptr 0xc[ebx],0x04
00AC  EB 08				jmp		L$10
00AE				L$9:
00AE  8B 43 10				mov		eax,dword ptr 0x10[ebx]
00B1  E9 6B FF FF FF			jmp		L$2
00B6				L$10:
00B6  8B 03				mov		eax,dword ptr [ebx]
00B8				L$11:
00B8  66 89 08				mov		word ptr [eax],cx
00BB  8B 43 10				mov		eax,dword ptr 0x10[ebx]
00BE  80 63 0C EF			and		byte ptr 0xc[ebx],0xef
00C2  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
00C8  0F B7 C1				movzx		eax,cx
00CB				L$12:
00CB  59				pop		ecx
00CC  5B				pop		ebx
00CD  C3				ret		

Routine Size: 206 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000038 bytes
0000				L$13:
0000  4E 6F 74 20 65 6E 6F 75 67 68 20 6D 65 6D 6F 72 Not enough memor
0010  79 20 74 6F 20 61 6C 6C 6F 63 61 74 65 20 55 4E y to allocate UN
0020  49 43 4F 44 45 20 66 69 6C 65 20 73 74 72 75 63 ICODE file struc
0030  74 75 72 65 73 0D 0A 00                         tures...

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

