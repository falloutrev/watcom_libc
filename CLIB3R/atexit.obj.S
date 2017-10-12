Module: atexit
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000077 bytes
0000				_Full_at_exit_rtn_:
0000  53				push		ebx
0001  52				push		edx
0002  83 EC 04				sub		esp,0x00000004
0005  8B 1D 00 00 00 00			mov		ebx,dword ptr __ExitCount
000B  83 FB 21				cmp		ebx,0x00000021
000E  74 25				je		L$2
0010  C7 05 00 00 00 00 21 00 00 00
					mov		dword ptr __ExitCount,0x00000021
001A  89 DA				mov		edx,ebx
001C  C1 E2 02				shl		edx,0x02
001F				L$1:
001F  85 D2				test		edx,edx
0021  74 12				je		L$2
0023  8B 82 FC FF FF FF			mov		eax,dword ptr __ExitList-0x4[edx]
0029  83 EA 04				sub		edx,0x00000004
002C  89 04 24				mov		dword ptr [esp],eax
002F  4B				dec		ebx
0030  FF 14 24				call		dword ptr [esp]
0033  EB EA				jmp		L$1
0035				L$2:
0035  83 C4 04				add		esp,0x00000004
0038  5A				pop		edx
0039  5B				pop		ebx
003A  C3				ret		

Routine Size: 59 bytes,    Routine Base: _TEXT + 0000

003B				atexit_:
003B  53				push		ebx
003C  51				push		ecx
003D  52				push		edx
003E  89 C3				mov		ebx,eax
0040  BA 00 00 00 00			mov		edx,offset _Full_at_exit_rtn_
0045  8B 0D 00 00 00 00			mov		ecx,dword ptr __ExitCount
004B  89 15 00 00 00 00			mov		dword ptr ___atexit,edx
0051  83 F9 20				cmp		ecx,0x00000020
0054  7D 18				jge		L$3
0056  89 C8				mov		eax,ecx
0058  31 C8				xor		eax,ecx
005A  8D 51 01				lea		edx,0x1[ecx]
005D  89 1C 8D 00 00 00 00		mov		dword ptr __ExitList[ecx*4],ebx
0064  89 15 00 00 00 00			mov		dword ptr __ExitCount,edx
006A  5A				pop		edx
006B  59				pop		ecx
006C  5B				pop		ebx
006D  C3				ret		
006E				L$3:
006E  B8 FF FF FF FF			mov		eax,0xffffffff
0073  5A				pop		edx
0074  59				pop		ecx
0075  5B				pop		ebx
0076  C3				ret		

Routine Size: 60 bytes,    Routine Base: _TEXT + 003B

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000084 bytes
0000				__ExitList:
0080				__ExitCount:

BSS Size: 132 bytes

