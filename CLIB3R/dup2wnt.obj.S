Module: dup2wnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000007F bytes
0000				dup2_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  83 EC 04				sub		esp,0x00000004
0006  89 C3				mov		ebx,eax
0008  89 D6				mov		esi,edx
000A  39 D0				cmp		eax,edx
000C  74 6A				je		L$2
000E  E8 00 00 00 00			call		_GetCurrentProcess
0013  89 D9				mov		ecx,ebx
0015  89 C2				mov		edx,eax
0017  A1 00 00 00 00			mov		eax,dword ptr ___FileHandleIDs
001C  8B 0C 88				mov		ecx,dword ptr [eax+ecx*4]
001F  89 D8				mov		eax,ebx
0021  FF 15 00 00 00 00			call		dword ptr __AccessFileH
0027  6A 02				push		0x00000002
0029  6A 01				push		0x00000001
002B  6A 00				push		0x00000000
002D  8D 44 24 0C			lea		eax,0xc[esp]
0031  50				push		eax
0032  52				push		edx
0033  51				push		ecx
0034  52				push		edx
0035  E8 00 00 00 00			call		_DuplicateHandle
003A  85 C0				test		eax,eax
003C  75 0F				jne		L$1
003E  89 D8				mov		eax,ebx
0040  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
0046  E8 00 00 00 00			call		__set_errno_nt_
004B  EB 2B				jmp		L$2
004D				L$1:
004D  89 F0				mov		eax,esi
004F  E8 00 00 00 00			call		close_
0054  89 F2				mov		edx,esi
0056  8B 04 24				mov		eax,dword ptr [esp]
0059  E8 00 00 00 00			call		__NTAddSpecificFileHandle_
005E  89 D8				mov		eax,ebx
0060  E8 00 00 00 00			call		__IOMode_
0065  89 C2				mov		edx,eax
0067  89 F0				mov		eax,esi
0069  E8 00 00 00 00			call		__SetIOMode_
006E  89 D8				mov		eax,ebx
0070  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
0076  31 C0				xor		eax,eax
0078				L$2:
0078  83 C4 04				add		esp,0x00000004
007B  5E				pop		esi
007C  59				pop		ecx
007D  5B				pop		ebx
007E  C3				ret		

Routine Size: 127 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

