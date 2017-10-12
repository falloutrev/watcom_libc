Module: mbascii1
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000DE bytes
0000				_ismbdupper_:
0000  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
0007  74 17				je		L$2
0009  3D 60 82 00 00			cmp		eax,0x00008260
000E  72 0D				jb		L$1
0010  3D 79 82 00 00			cmp		eax,0x00008279
0015  77 06				ja		L$1
0017  B8 01 00 00 00			mov		eax,0x00000001
001C  C3				ret		
001D				L$1:
001D  31 C0				xor		eax,eax
001F  C3				ret		
0020				L$2:
0020  F6 C4 FF				test		ah,0xff
0023  75 F8				jne		L$1
0025  FE C0				inc		al
0027  25 FF 00 00 00			and		eax,0x000000ff
002C  8A 80 00 00 00 00			mov		al,byte ptr __IsTable[eax]
0032  24 40				and		al,0x40
0034  25 FF 00 00 00			and		eax,0x000000ff
0039  C3				ret		

Routine Size: 58 bytes,    Routine Base: _TEXT + 0000

003A				_ismbdlower_:
003A  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
0041  74 17				je		L$4
0043  3D 81 82 00 00			cmp		eax,0x00008281
0048  72 0D				jb		L$3
004A  3D 9A 82 00 00			cmp		eax,0x0000829a
004F  77 06				ja		L$3
0051  B8 01 00 00 00			mov		eax,0x00000001
0056  C3				ret		
0057				L$3:
0057  31 C0				xor		eax,eax
0059  C3				ret		
005A				L$4:
005A  F6 C4 FF				test		ah,0xff
005D  75 F8				jne		L$3
005F  FE C0				inc		al
0061  25 FF 00 00 00			and		eax,0x000000ff
0066  8A 80 00 00 00 00			mov		al,byte ptr __IsTable[eax]
006C  24 80				and		al,0x80
006E  25 FF 00 00 00			and		eax,0x000000ff
0073  C3				ret		

Routine Size: 58 bytes,    Routine Base: _TEXT + 003A

0074				_ismbddigit_:
0074  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
007B  74 17				je		L$6
007D  3D 4F 82 00 00			cmp		eax,0x0000824f
0082  72 0D				jb		L$5
0084  3D 58 82 00 00			cmp		eax,0x00008258
0089  77 06				ja		L$5
008B  B8 01 00 00 00			mov		eax,0x00000001
0090  C3				ret		
0091				L$5:
0091  31 C0				xor		eax,eax
0093  C3				ret		
0094				L$6:
0094  F6 C4 FF				test		ah,0xff
0097  75 F8				jne		L$5
0099  FE C0				inc		al
009B  25 FF 00 00 00			and		eax,0x000000ff
00A0  8A 80 00 00 00 00			mov		al,byte ptr __IsTable[eax]
00A6  24 20				and		al,0x20
00A8  25 FF 00 00 00			and		eax,0x000000ff
00AD  C3				ret		

Routine Size: 58 bytes,    Routine Base: _TEXT + 0074

00AE				_ismbdspace_:
00AE  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
00B5  74 0A				je		L$7
00B7  3D 40 81 00 00			cmp		eax,0x00008140
00BC  0F 94 C0				sete		al
00BF  EB 17				jmp		L$9
00C1				L$7:
00C1  F6 C4 FF				test		ah,0xff
00C4  74 03				je		L$8
00C6  31 C0				xor		eax,eax
00C8  C3				ret		
00C9				L$8:
00C9  FE C0				inc		al
00CB  25 FF 00 00 00			and		eax,0x000000ff
00D0  8A 80 00 00 00 00			mov		al,byte ptr __IsTable[eax]
00D6  24 02				and		al,0x02
00D8				L$9:
00D8  25 FF 00 00 00			and		eax,0x000000ff
00DD  C3				ret		

Routine Size: 48 bytes,    Routine Base: _TEXT + 00AE

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

