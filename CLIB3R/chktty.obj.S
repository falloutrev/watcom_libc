Module: chktty
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000031 bytes
0000				__chktty_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  89 C2				mov		edx,eax
0005  F6 40 0D 20			test		byte ptr 0xd[eax],0x20
0009  75 22				jne		L$1
000B  8B 42 10				mov		eax,dword ptr 0x10[edx]
000E  E8 00 00 00 00			call		isatty_
0013  85 C0				test		eax,eax
0015  74 16				je		L$1
0017  8A 5A 0D				mov		bl,byte ptr 0xd[edx]
001A  80 CB 20				or		bl,0x20
001D  88 5A 0D				mov		byte ptr 0xd[edx],bl
0020  F6 C3 07				test		bl,0x07
0023  75 08				jne		L$1
0025  88 D9				mov		cl,bl
0027  80 C9 02				or		cl,0x02
002A  88 4A 0D				mov		byte ptr 0xd[edx],cl
002D				L$1:
002D  5A				pop		edx
002E  59				pop		ecx
002F  5B				pop		ebx
0030  C3				ret		

Routine Size: 49 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

