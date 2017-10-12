Module: gets
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000069 bytes
0000				gets_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  89 C1				mov		ecx,eax
0006  8B 35 0C 00 00 00			mov		esi,dword ptr ___iob+0xc
000C  8A 25 0C 00 00 00			mov		ah,byte ptr ___iob+0xc
0012  89 CA				mov		edx,ecx
0014  80 E4 CF				and		ah,0xcf
0017  83 E6 30				and		esi,0x00000030
001A  88 25 0C 00 00 00			mov		byte ptr ___iob+0xc,ah
0020				L$1:
0020  B8 00 00 00 00			mov		eax,offset ___iob
0025  E8 00 00 00 00			call		fgetc_
002A  89 C3				mov		ebx,eax
002C  83 F8 FF				cmp		eax,0xffffffff
002F  74 0A				je		L$2
0031  83 F8 0A				cmp		eax,0x0000000a
0034  74 05				je		L$2
0036  88 1A				mov		byte ptr [edx],bl
0038  42				inc		edx
0039  EB E5				jmp		L$1
003B				L$2:
003B  83 FB FF				cmp		ebx,0xffffffff
003E  75 11				jne		L$4
0040  39 CA				cmp		edx,ecx
0042  74 09				je		L$3
0044  F6 05 0C 00 00 00 20		test		byte ptr ___iob+0xc,0x20
004B  74 04				je		L$4
004D				L$3:
004D  31 C9				xor		ecx,ecx
004F  EB 03				jmp		L$5
0051				L$4:
0051  C6 02 00				mov		byte ptr [edx],0x00
0054				L$5:
0054  8B 15 0C 00 00 00			mov		edx,dword ptr ___iob+0xc
005A  09 F2				or		edx,esi
005C  89 C8				mov		eax,ecx
005E  89 15 0C 00 00 00			mov		dword ptr ___iob+0xc,edx
0064  5E				pop		esi
0065  5A				pop		edx
0066  59				pop		ecx
0067  5B				pop		ebx
0068  C3				ret		

Routine Size: 105 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

