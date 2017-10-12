Module: tclen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000023 bytes
0000				_tclen_:
0000  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
0007  74 16				je		L$1
0009  8A 00				mov		al,byte ptr [eax]
000B  25 FF 00 00 00			and		eax,0x000000ff
0010  8A 80 01 00 00 00			mov		al,byte ptr ___MBCSIsTable+0x1[eax]
0016  24 01				and		al,0x01
0018  25 FF 00 00 00			and		eax,0x000000ff
001D  40				inc		eax
001E  C3				ret		
001F				L$1:
001F  31 C0				xor		eax,eax
0021  40				inc		eax
0022  C3				ret		

Routine Size: 35 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

