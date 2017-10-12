Module: setvbuf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000079 bytes
0000				setvbuf_:
0000  56				push		esi
0001  89 C6				mov		esi,eax
0003  81 F9 FF FF FF 7F			cmp		ecx,0x7fffffff
0009  76 07				jbe		L$2
000B				L$1:
000B  B8 FF FF FF FF			mov		eax,0xffffffff
0010  5E				pop		esi
0011  C3				ret		
0012				L$2:
0012  81 FB 00 02 00 00			cmp		ebx,0x00000200
0018  72 0A				jb		L$3
001A  76 10				jbe		L$5
001C  81 FB 00 04 00 00			cmp		ebx,0x00000400
0022  EB 06				jmp		L$4
0024				L$3:
0024  81 FB 00 01 00 00			cmp		ebx,0x00000100
002A				L$4:
002A  75 DF				jne		L$1
002C				L$5:
002C  85 D2				test		edx,edx
002E  74 04				je		L$6
0030  85 C9				test		ecx,ecx
0032  74 D7				je		L$1
0034				L$6:
0034  8B 46 10				mov		eax,dword ptr 0x10[esi]
0037  FF 15 00 00 00 00			call		dword ptr __AccessFileH
003D  89 F0				mov		eax,esi
003F  E8 00 00 00 00			call		__chktty_
0044  85 C9				test		ecx,ecx
0046  74 03				je		L$7
0048  89 4E 14				mov		dword ptr 0x14[esi],ecx
004B				L$7:
004B  8A 66 0D				mov		ah,byte ptr 0xd[esi]
004E  89 56 08				mov		dword ptr 0x8[esi],edx
0051  80 E4 F8				and		ah,0xf8
0054  88 66 0D				mov		byte ptr 0xd[esi],ah
0057  8B 4E 0C				mov		ecx,dword ptr 0xc[esi]
005A  89 16				mov		dword ptr [esi],edx
005C  09 D9				or		ecx,ebx
005E  89 4E 0C				mov		dword ptr 0xc[esi],ecx
0061  85 D2				test		edx,edx
0063  75 07				jne		L$8
0065  89 F0				mov		eax,esi
0067  E8 00 00 00 00			call		__ioalloc_
006C				L$8:
006C  8B 46 10				mov		eax,dword ptr 0x10[esi]
006F  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
0075  31 C0				xor		eax,eax
0077  5E				pop		esi
0078  C3				ret		

Routine Size: 121 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

