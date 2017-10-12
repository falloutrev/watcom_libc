Module: rand
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000003E bytes
0000				initrandnext_:
0000  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0006  83 C0 0C				add		eax,0x0000000c
0009  C3				ret		

Routine Size: 10 bytes,    Routine Base: _TEXT + 0000

000A				rand_:
000A  52				push		edx
000B  E8 00 00 00 00			call		initrandnext_
0010  85 C0				test		eax,eax
0012  74 18				je		L$1
0014  69 10 6D 4E C6 41			imul		edx,dword ptr [eax],0x41c64e6d
001A  81 C2 39 30 00 00			add		edx,0x00003039
0020  89 10				mov		dword ptr [eax],edx
0022  89 D0				mov		eax,edx
0024  C1 E8 10				shr		eax,0x10
0027  25 FF 7F 00 00			and		eax,0x00007fff
002C				L$1:
002C  5A				pop		edx
002D  C3				ret		

Routine Size: 36 bytes,    Routine Base: _TEXT + 000A

002E				srand_:
002E  52				push		edx
002F  89 C2				mov		edx,eax
0031  E8 00 00 00 00			call		initrandnext_
0036  85 C0				test		eax,eax
0038  74 02				je		L$2
003A  89 10				mov		dword ptr [eax],edx
003C				L$2:
003C  5A				pop		edx
003D  C3				ret		

Routine Size: 16 bytes,    Routine Base: _TEXT + 002E

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

