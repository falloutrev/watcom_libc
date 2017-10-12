Module: mbslen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000009D bytes
0000				_mbslen_:
0000  51				push		ecx
0001  52				push		edx
0002  57				push		edi
0003  83 EC 04				sub		esp,0x00000004
0006  8B 15 00 00 00 00			mov		edx,dword ptr ___IsDBCS
000C  31 C9				xor		ecx,ecx
000E  85 D2				test		edx,edx
0010  74 10				je		L$2
0012				L$1:
0012  89 E2				mov		edx,esp
0014  E8 00 00 00 00			call		_mbgetcode_
0019  83 3C 24 00			cmp		dword ptr [esp],0x00000000
001D  74 15				je		L$3
001F  41				inc		ecx
0020  EB F0				jmp		L$1
0022				L$2:
0022  89 C7				mov		edi,eax
0024  06				push		es
0025  8C D8				mov		eax,ds
0027  8E C0				mov		es,eax
0029  29 C9				sub		ecx,ecx
002B  49				dec		ecx
002C  31 C0				xor		eax,eax
002E  F2 AE				repne scasb	
0030  F7 D1				not		ecx
0032  49				dec		ecx
0033  07				pop		es
0034				L$3:
0034  89 C8				mov		eax,ecx
0036  83 C4 04				add		esp,0x00000004
0039  5F				pop		edi
003A  5A				pop		edx
003B  59				pop		ecx
003C  C3				ret		

Routine Size: 61 bytes,    Routine Base: _TEXT + 0000

003D				__mbslen_:
003D  53				push		ebx
003E  51				push		ecx
003F  52				push		edx
0040  57				push		edi
0041  8B 15 00 00 00 00			mov		edx,dword ptr ___IsDBCS
0047  31 C9				xor		ecx,ecx
0049  85 D2				test		edx,edx
004B  74 35				je		L$7
004D  8B 1D 00 00 00 00			mov		ebx,dword ptr ___IsDBCS
0053				L$4:
0053  80 38 00				cmp		byte ptr [eax],0x00
0056  74 3C				je		L$8
0058  85 DB				test		ebx,ebx
005A  74 15				je		L$5
005C  31 D2				xor		edx,edx
005E  8A 10				mov		dl,byte ptr [eax]
0060  8A 92 01 00 00 00			mov		dl,byte ptr ___MBCSIsTable+0x1[edx]
0066  80 E2 01				and		dl,0x01
0069  81 E2 FF 00 00 00			and		edx,0x000000ff
006F  EB 02				jmp		L$6
0071				L$5:
0071  31 D2				xor		edx,edx
0073				L$6:
0073  0F 95 C2				setne		dl
0076  81 E2 FF 00 00 00			and		edx,0x000000ff
007C  42				inc		edx
007D  41				inc		ecx
007E  01 D0				add		eax,edx
0080  EB D1				jmp		L$4
0082				L$7:
0082  89 C7				mov		edi,eax
0084  06				push		es
0085  8C D8				mov		eax,ds
0087  8E C0				mov		es,eax
0089  29 C9				sub		ecx,ecx
008B  49				dec		ecx
008C  31 C0				xor		eax,eax
008E  F2 AE				repne scasb	
0090  F7 D1				not		ecx
0092  49				dec		ecx
0093  07				pop		es
0094				L$8:
0094  89 CA				mov		edx,ecx
0096  89 D0				mov		eax,edx
0098  5F				pop		edi
0099  5A				pop		edx
009A  59				pop		ecx
009B  5B				pop		ebx
009C  C3				ret		

Routine Size: 96 bytes,    Routine Base: _TEXT + 003D

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

