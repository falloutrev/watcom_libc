Module: uitoa
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000094 bytes
0000				_Alphabet:
0000  30 31 32 33 34 35 36 37 38 39 61 62 63 64 65 66 0123456789abcdef
0010  67 68 69 6A 6B 6C 6D 6E 6F 70 71 72 73 74 75 76 ghijklmnopqrstuv
0020  77 78 79 7A 00                                  wxyz.

Routine Size: 37 bytes,    Routine Base: _TEXT + 0000

0025				_uutoa_:
0025  51				push		ecx
0026  56				push		esi
0027  57				push		edi
0028  55				push		ebp
0029  83 EC 28				sub		esp,0x00000028
002C  89 D5				mov		ebp,edx
002E  89 DF				mov		edi,ebx
0030  89 D6				mov		esi,edx
0032  30 D2				xor		dl,dl
0034  8D 4C 24 01			lea		ecx,0x1[esp]
0038  88 14 24				mov		byte ptr [esp],dl
003B				L$1:
003B  8D 5C 24 24			lea		ebx,0x24[esp]
003F  89 7C 24 24			mov		dword ptr 0x24[esp],edi
0043  31 D2				xor		edx,edx
0045  F7 33				div		dword ptr [ebx]
0047  89 03				mov		dword ptr [ebx],eax
0049  2E 8A 82 00 00 00 00		mov		al,byte ptr cs:_Alphabet[edx]
0050  88 01				mov		byte ptr [ecx],al
0052  8B 44 24 24			mov		eax,dword ptr 0x24[esp]
0056  41				inc		ecx
0057  85 C0				test		eax,eax
0059  75 E0				jne		L$1
005B				L$2:
005B  49				dec		ecx
005C  30 E4				xor		ah,ah
005E  8A 01				mov		al,byte ptr [ecx]
0060  66 89 06				mov		word ptr [esi],ax
0063  83 C6 02				add		esi,0x00000002
0066  66 85 C0				test		ax,ax
0069  75 F0				jne		L$2
006B  89 E8				mov		eax,ebp
006D  83 C4 28				add		esp,0x00000028
0070  5D				pop		ebp
0071  5F				pop		edi
0072  5E				pop		esi
0073  59				pop		ecx
0074  C3				ret		

Routine Size: 80 bytes,    Routine Base: _TEXT + 0025

0075				_uitoa_:
0075  51				push		ecx
0076  89 D1				mov		ecx,edx
0078  83 FB 0A				cmp		ebx,0x0000000a
007B  75 0E				jne		L$3
007D  85 C0				test		eax,eax
007F  7D 0A				jge		L$3
0081  F7 D8				neg		eax
0083  66 C7 02 2D 00			mov		word ptr [edx],0x002d
0088  83 C2 02				add		edx,0x00000002
008B				L$3:
008B  E8 00 00 00 00			call		_uutoa_
0090  89 C8				mov		eax,ecx
0092  59				pop		ecx
0093  C3				ret		

Routine Size: 31 bytes,    Routine Base: _TEXT + 0075

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

