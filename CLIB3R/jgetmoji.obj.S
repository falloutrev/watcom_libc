Module: jgetmoji
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000045 bytes
0000				jgetmoji_:
0000  53				push		ebx
0001  51				push		ecx
0002  30 FF				xor		bh,bh
0004  8A 18				mov		bl,byte ptr [eax]
0006  66 89 1A				mov		word ptr [edx],bx
0009  66 85 DB				test		bx,bx
000C  74 34				je		L$2
000E  31 DB				xor		ebx,ebx
0010  8A 1A				mov		bl,byte ptr [edx]
0012  8A 9B 01 00 00 00			mov		bl,byte ptr __IsKTable+0x1[ebx]
0018  80 E3 04				and		bl,0x04
001B  81 E3 FF 00 00 00			and		ebx,0x000000ff
0021  40				inc		eax
0022  85 DB				test		ebx,ebx
0024  74 1C				je		L$2
0026  8A 18				mov		bl,byte ptr [eax]
0028  84 DB				test		bl,bl
002A  74 11				je		L$1
002C  66 8B 0A				mov		cx,word ptr [edx]
002F  30 FF				xor		bh,bh
0031  C1 E1 08				shl		ecx,0x08
0034  09 D9				or		ecx,ebx
0036  40				inc		eax
0037  66 89 0A				mov		word ptr [edx],cx
003A  59				pop		ecx
003B  5B				pop		ebx
003C  C3				ret		
003D				L$1:
003D  66 C7 02 00 00			mov		word ptr [edx],0x0000
0042				L$2:
0042  59				pop		ecx
0043  5B				pop		ebx
0044  C3				ret		

Routine Size: 69 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

