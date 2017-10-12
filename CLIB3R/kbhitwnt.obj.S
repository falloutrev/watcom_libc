Module: kbhitwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000082 bytes
0000				kbhit_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  83 EC 18				sub		esp,0x00000018
0006  83 3D 00 00 00 00 00		cmp		dword ptr __WindowsKbhit,0x00000000
000D  74 10				je		L$1
000F  31 C0				xor		eax,eax
0011  FF 15 00 00 00 00			call		dword ptr __WindowsIsWindowedHandle
0017  FF 15 00 00 00 00			call		dword ptr __WindowsKbhit
001D  EB 5C				jmp		L$4
001F				L$1:
001F  31 C0				xor		eax,eax
0021  FF 15 00 00 00 00			call		dword ptr __AccessFileH
0027  E8 00 00 00 00			call		__NTConsoleInput_
002C  89 C3				mov		ebx,eax
002E				L$2:
002E  8D 44 24 14			lea		eax,0x14[esp]
0032  50				push		eax
0033  6A 01				push		0x00000001
0035  8D 44 24 08			lea		eax,0x8[esp]
0039  50				push		eax
003A  53				push		ebx
003B  E8 00 00 00 00			call		_PeekConsoleInputA
0040  83 7C 24 14 00			cmp		dword ptr 0x14[esp],0x00000000
0045  74 1F				je		L$3
0047  89 E0				mov		eax,esp
0049  E8 00 00 00 00			call		__NTRealKey_
004E  85 C0				test		eax,eax
0050  75 14				jne		L$3
0052  8D 44 24 14			lea		eax,0x14[esp]
0056  50				push		eax
0057  6A 01				push		0x00000001
0059  8D 44 24 08			lea		eax,0x8[esp]
005D  50				push		eax
005E  53				push		ebx
005F  E8 00 00 00 00			call		_ReadConsoleInputA
0064  EB C8				jmp		L$2
0066				L$3:
0066  31 C0				xor		eax,eax
0068  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
006E  83 7C 24 14 00			cmp		dword ptr 0x14[esp],0x00000000
0073  0F 95 C0				setne		al
0076  25 FF 00 00 00			and		eax,0x000000ff
007B				L$4:
007B  83 C4 18				add		esp,0x00000018
007E  5A				pop		edx
007F  59				pop		ecx
0080  5B				pop		ebx
0081  C3				ret		

Routine Size: 130 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

