Module: uisgraph
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001D bytes
0000				_uisgraph_:
0000  F6 C4 FF				test		ah,0xff
0003  75 15				jne		L$1
0005  8A 80 01 00 00 00			mov		al,byte ptr __IsTable+0x1[eax]
000B  24 0A				and		al,0x0a
000D  0F B6 C0				movzx		eax,al
0010  83 F8 08				cmp		eax,0x00000008
0013  0F 94 C0				sete		al
0016  0F B6 C0				movzx		eax,al
0019  C3				ret		
001A				L$1:
001A  31 C0				xor		eax,eax
001C  C3				ret		

Routine Size: 29 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

