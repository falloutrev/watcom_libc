Module: fgetpos
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000013 bytes
0000				fgetpos_:
0000  E8 00 00 00 00			call		ftell_
0005  89 02				mov		dword ptr [edx],eax
0007  83 F8 FF				cmp		eax,0xffffffff
000A  0F 94 C0				sete		al
000D  25 FF 00 00 00			and		eax,0x000000ff
0012  C3				ret		

Routine Size: 19 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

