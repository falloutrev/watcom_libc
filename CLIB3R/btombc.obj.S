Module: btombc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000F0 bytes
0000				_mbbtombc_:
0000  53				push		ebx
0001  52				push		edx
0002  8B 15 00 00 00 00			mov		edx,dword ptr ___IsDBCS
0008  85 D2				test		edx,edx
000A  0F 84 7B 00 00 00			je		L$6
0010  74 13				je		L$1
0012  31 D2				xor		edx,edx
0014  88 C2				mov		dl,al
0016  8A 92 01 00 00 00			mov		dl,byte ptr ___MBCSIsTable+0x1[edx]
001C  31 DB				xor		ebx,ebx
001E  80 E2 0C				and		dl,0x0c
0021  88 D3				mov		bl,dl
0023  EB 33				jmp		L$4
0025				L$1:
0025  88 C2				mov		dl,al
0027  FE C2				inc		dl
0029  81 E2 FF 00 00 00			and		edx,0x000000ff
002F  8A 9A 00 00 00 00			mov		bl,byte ptr __IsTable[edx]
0035  80 E3 C0				and		bl,0xc0
0038  81 E3 FF 00 00 00			and		ebx,0x000000ff
003E  75 11				jne		L$2
0040  8A 92 00 00 00 00			mov		dl,byte ptr __IsTable[edx]
0046  80 E2 04				and		dl,0x04
0049  81 E2 FF 00 00 00			and		edx,0x000000ff
004F  74 05				je		L$3
0051				L$2:
0051  BA 01 00 00 00			mov		edx,0x00000001
0056				L$3:
0056  89 D3				mov		ebx,edx
0058				L$4:
0058  89 C2				mov		edx,eax
005A  C1 E2 02				shl		edx,0x02
005D  85 DB				test		ebx,ebx
005F  74 09				je		L$5
0061  8B 82 7C FD FF FF			mov		eax,dword ptr _KANAtoDBCS-0x284[edx]
0067  5A				pop		edx
0068  5B				pop		ebx
0069  C3				ret		
006A				L$5:
006A  88 C3				mov		bl,al
006C  FE C3				inc		bl
006E  81 E3 FF 00 00 00			and		ebx,0x000000ff
0074  8A 9B 00 00 00 00			mov		bl,byte ptr __IsTable[ebx]
007A  80 E3 08				and		bl,0x08
007D  81 E3 FF 00 00 00			and		ebx,0x000000ff
0083  74 06				je		L$6
0085  8B 82 80 FF FF FF			mov		eax,dword ptr _ASCIItoDBCS-0x80[edx]
008B				L$6:
008B  5A				pop		edx
008C  5B				pop		ebx
008D  C3				ret		

Routine Size: 142 bytes,    Routine Base: _TEXT + 0000

008E				_mbctombb_:
008E  53				push		ebx
008F  52				push		edx
0090  89 C2				mov		edx,eax
0092  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
0099  74 50				je		L$12
009B  3D FF 00 00 00			cmp		eax,0x000000ff
00A0  72 49				jb		L$12
00A2  31 DB				xor		ebx,ebx
00A4  31 C0				xor		eax,eax
00A6				L$7:
00A6  3B 90 00 00 00 00			cmp		edx,dword ptr _ASCIItoDBCS[eax]
00AC  75 08				jne		L$8
00AE  8D 53 20				lea		edx,0x20[ebx]
00B1  89 D0				mov		eax,edx
00B3  5A				pop		edx
00B4  5B				pop		ebx
00B5  C3				ret		
00B6				L$8:
00B6  83 C0 04				add		eax,0x00000004
00B9  43				inc		ebx
00BA  3D 78 01 00 00			cmp		eax,0x00000178
00BF  7E E5				jle		L$7
00C1  31 DB				xor		ebx,ebx
00C3  31 C0				xor		eax,eax
00C5				L$9:
00C5  3B 90 00 00 00 00			cmp		edx,dword ptr _KANAtoDBCS[eax]
00CB  74 08				je		L$10
00CD  3B 90 04 00 00 00			cmp		edx,dword ptr _KANAtoDBCS+0x4[eax]
00D3  73 0B				jae		L$11
00D5				L$10:
00D5  8D 93 A1 00 00 00			lea		edx,0xa1[ebx]
00DB  89 D0				mov		eax,edx
00DD  5A				pop		edx
00DE  5B				pop		ebx
00DF  C3				ret		
00E0				L$11:
00E0  83 C0 04				add		eax,0x00000004
00E3  43				inc		ebx
00E4  3D F8 00 00 00			cmp		eax,0x000000f8
00E9  7E DA				jle		L$9
00EB				L$12:
00EB  89 D0				mov		eax,edx
00ED  5A				pop		edx
00EE  5B				pop		ebx
00EF  C3				ret		

Routine Size: 98 bytes,    Routine Base: _TEXT + 008E

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000278 bytes
0000				_ASCIItoDBCS:
0000  40 81 00 00 49 81 00 00 68 81 00 00 94 81 00 00 @...I...h.......
0010  90 81 00 00 93 81 00 00 95 81 00 00 66 81 00 00 ............f...
0020  69 81 00 00 6A 81 00 00 96 81 00 00 7B 81 00 00 i...j.......{...
0030  43 81 00 00 7C 81 00 00 44 81 00 00 5E 81 00 00 C...|...D...^...
0040  4F 82 00 00 50 82 00 00 51 82 00 00 52 82 00 00 O...P...Q...R...
0050  53 82 00 00 54 82 00 00 55 82 00 00 56 82 00 00 S...T...U...V...
0060  57 82 00 00 58 82 00 00 46 81 00 00 47 81 00 00 W...X...F...G...
0070  83 81 00 00 81 81 00 00 84 81 00 00 48 81 00 00 ............H...
0080  97 81 00 00 60 82 00 00 61 82 00 00 62 82 00 00 ....`...a...b...
0090  63 82 00 00 64 82 00 00 65 82 00 00 66 82 00 00 c...d...e...f...
00A0  67 82 00 00 68 82 00 00 69 82 00 00 6A 82 00 00 g...h...i...j...
00B0  6B 82 00 00 6C 82 00 00 6D 82 00 00 6E 82 00 00 k...l...m...n...
00C0  6F 82 00 00 70 82 00 00 71 82 00 00 72 82 00 00 o...p...q...r...
00D0  73 82 00 00 74 82 00 00 75 82 00 00 76 82 00 00 s...t...u...v...
00E0  77 82 00 00 78 82 00 00 79 82 00 00 6D 81 00 00 w...x...y...m...
00F0  8F 81 00 00 6E 81 00 00 4F 81 00 00 51 81 00 00 ....n...O...Q...
0100  65 81 00 00 81 82 00 00 82 82 00 00 83 82 00 00 e...............
0110  84 82 00 00 85 82 00 00 86 82 00 00 87 82 00 00 ................
0120  88 82 00 00 89 82 00 00 8A 82 00 00 8B 82 00 00 ................
0130  8C 82 00 00 8D 82 00 00 8E 82 00 00 8F 82 00 00 ................
0140  90 82 00 00 91 82 00 00 92 82 00 00 93 82 00 00 ................
0150  94 82 00 00 95 82 00 00 96 82 00 00 97 82 00 00 ................
0160  98 82 00 00 99 82 00 00 9A 82 00 00 6F 81 00 00 ............o...
0170  62 81 00 00 70 81 00 00 50 81 00 00             b...p...P...
017C				_KANAtoDBCS:
017C  42 81 00 00 75 81 00 00 76 81 00 00 41 81 00 00 B...u...v...A...
018C  45 81 00 00 92 83 00 00 40 83 00 00 42 83 00 00 E.......@...B...
019C  44 83 00 00 46 83 00 00 48 83 00 00 83 83 00 00 D...F...H.......
01AC  85 83 00 00 87 83 00 00 62 83 00 00 5B 81 00 00 ........b...[...
01BC  41 83 00 00 43 83 00 00 45 83 00 00 47 83 00 00 A...C...E...G...
01CC  49 83 00 00 4A 83 00 00 4C 83 00 00 4E 83 00 00 I...J...L...N...
01DC  50 83 00 00 52 83 00 00 54 83 00 00 56 83 00 00 P...R...T...V...
01EC  58 83 00 00 5A 83 00 00 5C 83 00 00 5E 83 00 00 X...Z...\...^...
01FC  60 83 00 00 63 83 00 00 65 83 00 00 67 83 00 00 `...c...e...g...
020C  69 83 00 00 6A 83 00 00 6B 83 00 00 6C 83 00 00 i...j...k...l...
021C  6D 83 00 00 6E 83 00 00 71 83 00 00 74 83 00 00 m...n...q...t...
022C  77 83 00 00 7A 83 00 00 7D 83 00 00 7E 83 00 00 w...z...}...~...
023C  80 83 00 00 81 83 00 00 82 83 00 00 84 83 00 00 ................
024C  86 83 00 00 88 83 00 00 89 83 00 00 8A 83 00 00 ................
025C  8B 83 00 00 8C 83 00 00 8D 83 00 00 8F 83 00 00 ................
026C  93 83 00 00 4A 81 00 00 4B 81 00 00             ....J...K...

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

