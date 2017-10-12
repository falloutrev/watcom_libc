Module: swab
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001C bytes
0000				swab_:
0000  51				push		ecx
0001  D1 FB				sar		ebx,0x01
0003  EB 11				jmp		L$2
0005				L$1:
0005  8A 28				mov		ch,byte ptr [eax]
0007  8A 48 01				mov		cl,byte ptr 0x1[eax]
000A  4B				dec		ebx
000B  88 0A				mov		byte ptr [edx],cl
000D  83 C0 02				add		eax,0x00000002
0010  88 6A 01				mov		byte ptr 0x1[edx],ch
0013  83 C2 02				add		edx,0x00000002
0016				L$2:
0016  85 DB				test		ebx,ebx
0018  75 EB				jne		L$1
001A  59				pop		ecx
001B  C3				ret		

Routine Size: 28 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

