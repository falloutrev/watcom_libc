Module: dupwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000094 bytes
0000				_dup_:
0000				dup_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  83 EC 04				sub		esp,0x00000004
0007  89 C3				mov		ebx,eax
0009  BA FF FF FF FF			mov		edx,0xffffffff
000E  89 14 24				mov		dword ptr [esp],edx
0011  E8 00 00 00 00			call		__NTAtMaxFiles_
0016  85 C0				test		eax,eax
0018  74 0E				je		L$1
001A  B8 0B 00 00 00			mov		eax,0x0000000b
001F  E8 00 00 00 00			call		__set_errno_
0024  89 D0				mov		eax,edx
0026  EB 64				jmp		L$3
0028				L$1:
0028  A1 00 00 00 00			mov		eax,dword ptr ___FileHandleIDs
002D  89 D9				mov		ecx,ebx
002F  8B 34 88				mov		esi,dword ptr [eax+ecx*4]
0032  E8 00 00 00 00			call		_GetCurrentProcess
0037  89 C1				mov		ecx,eax
0039  89 D8				mov		eax,ebx
003B  FF 15 00 00 00 00			call		dword ptr __AccessFileH
0041  6A 02				push		0x00000002
0043  6A 01				push		0x00000001
0045  6A 00				push		0x00000000
0047  8D 44 24 0C			lea		eax,0xc[esp]
004B  50				push		eax
004C  51				push		ecx
004D  56				push		esi
004E  51				push		ecx
004F  E8 00 00 00 00			call		_DuplicateHandle
0054  85 C0				test		eax,eax
0056  75 0F				jne		L$2
0058  89 D8				mov		eax,ebx
005A  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
0060  E8 00 00 00 00			call		__set_errno_nt_
0065  EB 25				jmp		L$3
0067				L$2:
0067  8B 04 24				mov		eax,dword ptr [esp]
006A  FF 15 00 00 00 00			call		dword ptr __InitAccessH
0070  89 C1				mov		ecx,eax
0072  89 D8				mov		eax,ebx
0074  E8 00 00 00 00			call		__IOMode_
0079  89 C2				mov		edx,eax
007B  89 C8				mov		eax,ecx
007D  E8 00 00 00 00			call		__SetIOMode_
0082  89 D8				mov		eax,ebx
0084  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
008A  89 C8				mov		eax,ecx
008C				L$3:
008C  83 C4 04				add		esp,0x00000004
008F  5E				pop		esi
0090  5A				pop		edx
0091  59				pop		ecx
0092  5B				pop		ebx
0093  C3				ret		

Routine Size: 148 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

