Module: fjgetmoj
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000053 bytes
0000				_fjgetmoji_:
0000  06				push		es
0001  0F A0				push		fs
0003  8E C2				mov		es,edx
0005  8E E1				mov		fs,ecx
0007  30 F6				xor		dh,dh
0009  26 8A 10				mov		dl,byte ptr es:[eax]
000C  66 64 89 13			mov		word ptr fs:[ebx],dx
0010  66 85 D2				test		dx,dx
0013  74 38				je		L$2
0015  31 D2				xor		edx,edx
0017  64 8A 13				mov		dl,byte ptr fs:[ebx]
001A  8A 92 01 00 00 00			mov		dl,byte ptr __IsKTable+0x1[edx]
0020  80 E2 04				and		dl,0x04
0023  81 E2 FF 00 00 00			and		edx,0x000000ff
0029  40				inc		eax
002A  85 D2				test		edx,edx
002C  74 1F				je		L$2
002E  26 8A 10				mov		dl,byte ptr es:[eax]
0031  84 D2				test		dl,dl
0033  74 12				je		L$1
0035  66 64 8B 0B			mov		cx,word ptr fs:[ebx]
0039  30 F6				xor		dh,dh
003B  C1 E1 08				shl		ecx,0x08
003E  09 D1				or		ecx,edx
0040  40				inc		eax
0041  66 64 89 0B			mov		word ptr fs:[ebx],cx
0045  EB 06				jmp		L$2
0047				L$1:
0047  66 64 C7 03 00 00			mov		word ptr fs:[ebx],0x0000
004D				L$2:
004D  8C C2				mov		edx,es
004F  0F A1				pop		fs
0051  07				pop		es
0052  CB				retf		

Routine Size: 83 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

