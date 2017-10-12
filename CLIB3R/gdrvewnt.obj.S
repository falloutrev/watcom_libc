Module: gdrvewnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000031 bytes
0000				_dos_getdrive_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  81 EC 04 01 00 00			sub		esp,0x00000104
0009  89 C3				mov		ebx,eax
000B  89 E0				mov		eax,esp
000D  50				push		eax
000E  68 04 01 00 00			push		0x00000104
0013  E8 00 00 00 00			call		_GetCurrentDirectoryA
0018  31 C0				xor		eax,eax
001A  8A 04 24				mov		al,byte ptr [esp]
001D  E8 00 00 00 00			call		tolower_
0022  83 E8 60				sub		eax,0x00000060
0025  89 03				mov		dword ptr [ebx],eax
0027  81 C4 04 01 00 00			add		esp,0x00000104
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

