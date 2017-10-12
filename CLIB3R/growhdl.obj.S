Module: growhdl
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000004F bytes
0000				sys_grow_handles_:
0000  51				push		ecx
0001  52				push		edx
0002  50				push		eax
0003  E8 00 00 00 00			call		_SetHandleCount
0008  5A				pop		edx
0009  59				pop		ecx
000A  C3				ret		

Routine Size: 11 bytes,    Routine Base: _TEXT + 0000

000B				_grow_handles_:
000B  51				push		ecx
000C  52				push		edx
000D  89 C2				mov		edx,eax
000F  FF 15 00 00 00 00			call		dword ptr __AccessIOB
0015  3B 15 00 00 00 00			cmp		edx,dword ptr ___NFiles
001B  76 24				jbe		L$1
001D  89 D0				mov		eax,edx
001F  E8 00 00 00 00			call		sys_grow_handles_
0024  8B 0D 00 00 00 00			mov		ecx,dword ptr ___NFiles
002A  89 C2				mov		edx,eax
002C  39 C8				cmp		eax,ecx
002E  76 11				jbe		L$1
0030  E8 00 00 00 00			call		__get_errno_ptr_
0035  83 38 05				cmp		dword ptr [eax],0x00000005
0038  74 07				je		L$1
003A  89 D0				mov		eax,edx
003C  E8 00 00 00 00			call		__grow_iomode_
0041				L$1:
0041  FF 15 00 00 00 00			call		dword ptr __ReleaseIOB
0047  A1 00 00 00 00			mov		eax,dword ptr ___NFiles
004C  5A				pop		edx
004D  59				pop		ecx
004E  C3				ret		

Routine Size: 68 bytes,    Routine Base: _TEXT + 000B

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

