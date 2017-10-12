Module: wrlang
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000056 bytes
0000				WResLanguage_:
0000				_WResLanguage_:
0000  53				push		ebx
0001  52				push		edx
0002  B8 00 00 00 00			mov		eax,offset DGROUP:L$4
0007  E8 00 00 00 00			call		getenv_
000C  89 C3				mov		ebx,eax
000E  85 C0				test		eax,eax
0010  75 0E				jne		L$2
0012  83 3D 00 00 00 00 00		cmp		dword ptr ___IsDBCS,0x00000000
0019  74 36				je		L$3
001B				L$1:
001B  B0 01				mov		al,0x01
001D  5A				pop		edx
001E  5B				pop		ebx
001F  C3				ret		
0020				L$2:
0020  BA 06 00 00 00			mov		edx,offset DGROUP:L$5
0025  E8 00 00 00 00			call		stricmp_
002A  85 C0				test		eax,eax
002C  74 23				je		L$3
002E  BA 0E 00 00 00			mov		edx,offset DGROUP:L$6
0033  89 D8				mov		eax,ebx
0035  E8 00 00 00 00			call		stricmp_
003A  85 C0				test		eax,eax
003C  74 DD				je		L$1
003E  31 C0				xor		eax,eax
0040  8A 03				mov		al,byte ptr [ebx]
0042  83 F8 30				cmp		eax,0x00000030
0045  7C 0A				jl		L$3
0047  83 F8 39				cmp		eax,0x00000039
004A  7F 05				jg		L$3
004C  2C 30				sub		al,0x30
004E  5A				pop		edx
004F  5B				pop		ebx
0050  C3				ret		
0051				L$3:
0051  30 C0				xor		al,al
0053  5A				pop		edx
0054  5B				pop		ebx
0055  C3				ret		

Routine Size: 86 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000017 bytes
0000				L$4:
0000  57 4C 41 4E 47 00                               WLANG.
0006				L$5:
0006  65 6E 67 6C 69 73 68 00                         english.
000E				L$6:
000E  6A 61 70 61 6E 65 73 65 00                      japanese.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

