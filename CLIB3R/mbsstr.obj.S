Module: mbsstr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000A8 bytes
0000				_mbsstr_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  57				push		edi
0004  55				push		ebp
0005  83 EC 10				sub		esp,0x00000010
0008  89 C5				mov		ebp,eax
000A  89 14 24				mov		dword ptr [esp],edx
000D  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
0014  0F 84 79 00 00 00			je		L$7
001A  8B 3C 24				mov		edi,dword ptr [esp]
001D  06				push		es
001E  8C D8				mov		eax,ds
0020  8E C0				mov		es,eax
0022  29 C9				sub		ecx,ecx
0024  49				dec		ecx
0025  31 C0				xor		eax,eax
0027  F2 AE				repne scasb	
0029  F7 D1				not		ecx
002B  49				dec		ecx
002C  07				pop		es
002D  89 4C 24 0C			mov		dword ptr 0xc[esp],ecx
0031				L$1:
0031  80 7D 00 00			cmp		byte ptr [ebp],0x00
0035  74 58				je		L$6
0037  8B 1C 24				mov		ebx,dword ptr [esp]
003A  31 C9				xor		ecx,ecx
003C  31 FF				xor		edi,edi
003E				L$2:
003E  8D 54 24 08			lea		edx,0x8[esp]
0042  89 F0				mov		eax,esi
0044  E8 00 00 00 00			call		_mbgetcode_
0049  8D 54 24 04			lea		edx,0x4[esp]
004D  89 C6				mov		esi,eax
004F  89 D8				mov		eax,ebx
0051  E8 00 00 00 00			call		_mbgetcode_
0056  89 C2				mov		edx,eax
0058  89 C3				mov		ebx,eax
005A  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
005E  41				inc		ecx
005F  3B 44 24 04			cmp		eax,dword ptr 0x4[esp]
0063  75 0B				jne		L$3
0065  8A 02				mov		al,byte ptr [edx]
0067  BF 01 00 00 00			mov		edi,0x00000001
006C  84 C0				test		al,al
006E  75 CE				jne		L$2
0070				L$3:
0070  85 FF				test		edi,edi
0072  74 0B				je		L$4
0074  83 7C 24 04 00			cmp		dword ptr 0x4[esp],0x00000000
0079  75 04				jne		L$4
007B  89 EA				mov		edx,ebp
007D  EB 1E				jmp		L$8
007F				L$4:
007F  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
0083  29 C8				sub		eax,ecx
0085  39 C8				cmp		eax,ecx
0087  73 02				jae		L$5
0089  89 C1				mov		ecx,eax
008B				L$5:
008B  01 CD				add		ebp,ecx
008D  EB A2				jmp		L$1
008F				L$6:
008F  31 D2				xor		edx,edx
0091  EB 0A				jmp		L$8
0093				L$7:
0093  8B 14 24				mov		edx,dword ptr [esp]
0096  E8 00 00 00 00			call		strstr_
009B  89 C2				mov		edx,eax
009D				L$8:
009D  89 D0				mov		eax,edx
009F  83 C4 10				add		esp,0x00000010
00A2  5D				pop		ebp
00A3  5F				pop		edi
00A4  5E				pop		esi
00A5  59				pop		ecx
00A6  5B				pop		ebx
00A7  C3				ret		

Routine Size: 168 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

