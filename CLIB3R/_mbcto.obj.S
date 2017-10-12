Module: _mbcto
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000C4 bytes
0000				_mbctolower_:
0000  52				push		edx
0001  89 C2				mov		edx,eax
0003  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
000A  74 10				je		L$2
000C  E8 00 00 00 00			call		_ismbdlower_
0011  85 C0				test		eax,eax
0013  74 03				je		L$1
0015  83 C2 21				add		edx,0x00000021
0018				L$1:
0018  89 D0				mov		eax,edx
001A  5A				pop		edx
001B  C3				ret		
001C				L$2:
001C  F6 C6 FF				test		dh,0xff
001F  74 04				je		L$3
0021  31 C0				xor		eax,eax
0023  5A				pop		edx
0024  C3				ret		
0025				L$3:
0025  31 C0				xor		eax,eax
0027  88 D0				mov		al,dl
0029  E8 00 00 00 00			call		tolower_
002E  5A				pop		edx
002F  C3				ret		

Routine Size: 48 bytes,    Routine Base: _TEXT + 0000

0030				_mbctoupper_:
0030  52				push		edx
0031  89 C2				mov		edx,eax
0033  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
003A  74 10				je		L$5
003C  E8 00 00 00 00			call		_ismbdlower_
0041  85 C0				test		eax,eax
0043  74 03				je		L$4
0045  83 EA 21				sub		edx,0x00000021
0048				L$4:
0048  89 D0				mov		eax,edx
004A  5A				pop		edx
004B  C3				ret		
004C				L$5:
004C  F6 C6 FF				test		dh,0xff
004F  74 04				je		L$6
0051  31 C0				xor		eax,eax
0053  5A				pop		edx
0054  C3				ret		
0055				L$6:
0055  31 C0				xor		eax,eax
0057  88 D0				mov		al,dl
0059  E8 00 00 00 00			call		toupper_
005E  5A				pop		edx
005F  C3				ret		

Routine Size: 48 bytes,    Routine Base: _TEXT + 0030

0060				_mbctohira_:
0060  52				push		edx
0061  89 C2				mov		edx,eax
0063  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
006A  74 26				je		L$7
006C  E8 00 00 00 00			call		_ismbckata_
0071  85 C0				test		eax,eax
0073  74 1D				je		L$7
0075  81 FA 93 83 00 00			cmp		edx,0x00008393
007B  77 15				ja		L$7
007D  81 FA 7F 83 00 00			cmp		edx,0x0000837f
0083  0F 93 C0				setae		al
0086  25 FF 00 00 00			and		eax,0x000000ff
008B  05 A1 00 00 00			add		eax,0x000000a1
0090  29 C2				sub		edx,eax
0092				L$7:
0092  89 D0				mov		eax,edx
0094  5A				pop		edx
0095  C3				ret		

Routine Size: 54 bytes,    Routine Base: _TEXT + 0060

0096				_mbctokata_:
0096  52				push		edx
0097  89 C2				mov		edx,eax
0099  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
00A0  74 1E				je		L$8
00A2  E8 00 00 00 00			call		_ismbchira_
00A7  85 C0				test		eax,eax
00A9  74 15				je		L$8
00AB  81 FA DE 82 00 00			cmp		edx,0x000082de
00B1  0F 93 C0				setae		al
00B4  25 FF 00 00 00			and		eax,0x000000ff
00B9  05 A1 00 00 00			add		eax,0x000000a1
00BE  01 C2				add		edx,eax
00C0				L$8:
00C0  89 D0				mov		eax,edx
00C2  5A				pop		edx
00C3  C3				ret		

Routine Size: 46 bytes,    Routine Base: _TEXT + 0096

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

