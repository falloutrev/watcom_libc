Module: uispunct
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000014 bytes
0000				_uispunct_:
0000  F6 C4 FF				test		ah,0xff
0003  75 0C				jne		L$1
0005  8A 80 01 00 00 00			mov		al,byte ptr __IsTable+0x1[eax]
000B  24 04				and		al,0x04
000D  0F B6 C0				movzx		eax,al
0010  C3				ret		
0011				L$1:
0011  31 C0				xor		eax,eax
0013  C3				ret		

Routine Size: 20 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

