Module: ioexit
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000069 bytes
0000				__full_io_exit_:
0000  31 C0				xor		eax,eax
0002  E8 00 00 00 00			call		docloseall_
0007  E9 00 00 00 00			jmp		__purgefp_

Routine Size: 12 bytes,    Routine Base: _TEXT + 0000

000C				fcloseall_:
000C  B8 03 00 00 00			mov		eax,0x00000003
0011				docloseall_:
0011  53				push		ebx
0012  51				push		ecx
0013  52				push		edx
0014  56				push		esi
0015  89 C2				mov		edx,eax
0017  C1 E0 02				shl		eax,0x02
001A  29 D0				sub		eax,edx
001C  C1 E0 02				shl		eax,0x02
001F  01 D0				add		eax,edx
0021  BE 00 00 00 00			mov		esi,offset ___iob
0026  01 C0				add		eax,eax
0028  31 DB				xor		ebx,ebx
002A  01 C6				add		esi,eax
002C  A1 00 00 00 00			mov		eax,dword ptr ___OpenStreams
0031  EB 2B				jmp		L$4
0033				L$1:
0033  8B 08				mov		ecx,dword ptr [eax]
0035  8B 40 04				mov		eax,dword ptr 0x4[eax]
0038  BA 01 00 00 00			mov		edx,0x00000001
003D  F6 40 0D 40			test		byte ptr 0xd[eax],0x40
0041  75 13				jne		L$2
0043  F6 40 0D 08			test		byte ptr 0xd[eax],0x08
0047  75 0D				jne		L$2
0049  39 F0				cmp		eax,esi
004B  72 0F				jb		L$3
004D  3D 4E 00 00 00			cmp		eax,offset ___iob+0x4e
0052  73 02				jae		L$2
0054  31 D2				xor		edx,edx
0056				L$2:
0056  E8 00 00 00 00			call		__shutdown_stream_
005B  43				inc		ebx
005C				L$3:
005C  89 C8				mov		eax,ecx
005E				L$4:
005E  85 C0				test		eax,eax
0060  75 D1				jne		L$1
0062  89 D8				mov		eax,ebx
0064  5E				pop		esi
0065  5A				pop		edx
0066  59				pop		ecx
0067  5B				pop		ebx
0068  C3				ret		

Routine Size: 93 bytes,    Routine Base: _TEXT + 000C

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

