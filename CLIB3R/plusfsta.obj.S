Module: plusfsta
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000067 bytes
0000				__plusplus_fstat_:
0000  53				push		ebx
0001  83 EC 48				sub		esp,0x00000048
0004  89 D3				mov		ebx,edx
0006  89 E2				mov		edx,esp
0008  E8 00 00 00 00			call		fstat_
000D  85 C0				test		eax,eax
000F  74 0A				je		L$1
0011  B8 FF FF FF FF			mov		eax,0xffffffff
0016  83 C4 48				add		esp,0x00000048
0019  5B				pop		ebx
001A  C3				ret		
001B				L$1:
001B  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
001F  30 E4				xor		ah,ah
0021  24 01				and		al,0x01
0023  25 FF FF 00 00			and		eax,0x0000ffff
0028  0F 94 C0				sete		al
002B  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
002F  25 FF 00 00 00			and		eax,0x000000ff
0034  30 F6				xor		dh,dh
0036  83 C0 02				add		eax,0x00000002
0039  80 E2 10				and		dl,0x10
003C  81 E2 FF FF 00 00			and		edx,0x0000ffff
0042  74 02				je		L$2
0044  0C 08				or		al,0x08
0046				L$2:
0046  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
004A  30 D2				xor		dl,dl
004C  80 E6 01				and		dh,0x01
004F  81 E2 FF FF 00 00			and		edx,0x0000ffff
0055  74 04				je		L$3
0057  0C 80				or		al,0x80
0059  EB 03				jmp		L$4
005B				L$3:
005B  80 CC 01				or		ah,0x01
005E				L$4:
005E  89 03				mov		dword ptr [ebx],eax
0060  31 C0				xor		eax,eax
0062  83 C4 48				add		esp,0x00000048
0065  5B				pop		ebx
0066  C3				ret		

Routine Size: 103 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

