Module: _clsewnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000006F bytes
0000				__close_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  57				push		edi
0005  89 C3				mov		ebx,eax
0007  8B 15 00 00 00 00			mov		edx,dword ptr ___FileHandleIDs
000D  31 C9				xor		ecx,ecx
000F  8B 3C 82				mov		edi,dword ptr [edx+eax*4]
0012  8B 15 00 00 00 00			mov		edx,dword ptr __WindowsCloseWindow
0018  31 F6				xor		esi,esi
001A  85 D2				test		edx,edx
001C  74 21				je		L$1
001E  FF 15 00 00 00 00			call		dword ptr __WindowsIsWindowedHandle
0024  89 C2				mov		edx,eax
0026  85 C0				test		eax,eax
0028  74 15				je		L$1
002A  89 D8				mov		eax,ebx
002C  FF 15 00 00 00 00			call		dword ptr __WindowsRemoveWindowedHandle
0032  89 D0				mov		eax,edx
0034  B9 01 00 00 00			mov		ecx,0x00000001
0039  FF 15 00 00 00 00			call		dword ptr __WindowsCloseWindow
003F				L$1:
003F  85 C9				test		ecx,ecx
0041  75 1B				jne		L$2
0043  57				push		edi
0044  E8 00 00 00 00			call		_CloseHandle
0049  85 C0				test		eax,eax
004B  75 11				jne		L$2
004D  B8 04 00 00 00			mov		eax,0x00000004
0052  BE FF FF FF FF			mov		esi,0xffffffff
0057  E8 00 00 00 00			call		__set_errno_
005C  EB 09				jmp		L$3
005E				L$2:
005E  89 D8				mov		eax,ebx
0060  31 D2				xor		edx,edx
0062  E8 00 00 00 00			call		__SetIOMode_
0067				L$3:
0067  89 F0				mov		eax,esi
0069  5F				pop		edi
006A  5E				pop		esi
006B  5A				pop		edx
006C  59				pop		ecx
006D  5B				pop		ebx
006E  C3				ret		

Routine Size: 111 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

