Module: mbsspn
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000EA bytes
0000				_mbsspn_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  57				push		edi
0004  55				push		ebp
0005  83 EC 08				sub		esp,0x00000008
0008  89 C5				mov		ebp,eax
000A  89 D7				mov		edi,edx
000C  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
0013  74 43				je		L$6
0015  89 C1				mov		ecx,eax
0017  EB 24				jmp		L$4
0019				L$1:
0019  89 FB				mov		ebx,edi
001B				L$2:
001B  89 E2				mov		edx,esp
001D  89 D8				mov		eax,ebx
001F  E8 00 00 00 00			call		_mbgetcode_
0024  89 C3				mov		ebx,eax
0026  83 3C 24 00			cmp		dword ptr [esp],0x00000000
002A  74 09				je		L$3
002C  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0030  3B 04 24				cmp		eax,dword ptr [esp]
0033  75 E6				jne		L$2
0035				L$3:
0035  83 3C 24 00			cmp		dword ptr [esp],0x00000000
0039  74 17				je		L$5
003B  89 F1				mov		ecx,esi
003D				L$4:
003D  8D 54 24 04			lea		edx,0x4[esp]
0041  89 C8				mov		eax,ecx
0043  E8 00 00 00 00			call		_mbgetcode_
0048  8B 5C 24 04			mov		ebx,dword ptr 0x4[esp]
004C  89 C6				mov		esi,eax
004E  85 DB				test		ebx,ebx
0050  75 C7				jne		L$1
0052				L$5:
0052  89 C8				mov		eax,ecx
0054  29 E8				sub		eax,ebp
0056  EB 07				jmp		L$7
0058				L$6:
0058  89 FA				mov		edx,edi
005A  E8 00 00 00 00			call		strspn_
005F				L$7:
005F  83 C4 08				add		esp,0x00000008
0062  5D				pop		ebp
0063  5F				pop		edi
0064  5E				pop		esi
0065  59				pop		ecx
0066  5B				pop		ebx
0067  C3				ret		

Routine Size: 104 bytes,    Routine Base: _TEXT + 0000

0068				_mbsspnp_:
0068  53				push		ebx
0069  51				push		ecx
006A  56				push		esi
006B  57				push		edi
006C  55				push		ebp
006D  83 EC 08				sub		esp,0x00000008
0070  89 C1				mov		ecx,eax
0072  89 D7				mov		edi,edx
0074  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
007B  75 24				jne		L$12
007D  EB 3B				jmp		L$14
007F				L$8:
007F  89 FB				mov		ebx,edi
0081				L$9:
0081  89 E2				mov		edx,esp
0083  89 D8				mov		eax,ebx
0085  E8 00 00 00 00			call		_mbgetcode_
008A  89 C3				mov		ebx,eax
008C  8B 04 24				mov		eax,dword ptr [esp]
008F  39 C5				cmp		ebp,eax
0091  75 04				jne		L$11
0093				L$10:
0093  89 C8				mov		eax,ecx
0095  EB C8				jmp		L$7
0097				L$11:
0097  3B 44 24 04			cmp		eax,dword ptr 0x4[esp]
009B  75 E4				jne		L$9
009D  89 F1				mov		ecx,esi
009F  EB 02				jmp		L$13
00A1				L$12:
00A1  31 ED				xor		ebp,ebp
00A3				L$13:
00A3  8D 54 24 04			lea		edx,0x4[esp]
00A7  89 C8				mov		eax,ecx
00A9  E8 00 00 00 00			call		_mbgetcode_
00AE  8B 5C 24 04			mov		ebx,dword ptr 0x4[esp]
00B2  89 C6				mov		esi,eax
00B4  39 DD				cmp		ebp,ebx
00B6  75 C7				jne		L$8
00B8  EB 29				jmp		L$18
00BA				L$14:
00BA  8A 21				mov		ah,byte ptr [ecx]
00BC  84 E4				test		ah,ah
00BE  74 23				je		L$18
00C0  88 E2				mov		dl,ah
00C2  89 FE				mov		esi,edi
00C4				L$15:
00C4  8A 06				mov		al,byte ptr [esi]
00C6  3A C2				cmp		al,dl
00C8  74 12				je		L$17
00CA  3C 00				cmp		al,0x00
00CC  74 0C				je		L$16
00CE  46				inc		esi
00CF  8A 06				mov		al,byte ptr [esi]
00D1  3A C2				cmp		al,dl
00D3  74 07				je		L$17
00D5  46				inc		esi
00D6  3C 00				cmp		al,0x00
00D8  75 EA				jne		L$15
00DA				L$16:
00DA  2B F6				sub		esi,esi
00DC				L$17:
00DC  85 F6				test		esi,esi
00DE  74 B3				je		L$10
00E0  41				inc		ecx
00E1  EB D7				jmp		L$14
00E3				L$18:
00E3  31 C0				xor		eax,eax
00E5  E9 75 FF FF FF			jmp		L$7

Routine Size: 130 bytes,    Routine Base: _TEXT + 0068

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

