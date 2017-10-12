Module: qread
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000074 bytes
0000				__qread_:
0000  51				push		ecx
0001  56				push		esi
0002  83 EC 04				sub		esp,0x00000004
0005  89 C6				mov		esi,eax
0007  FF 15 00 00 00 00			call		dword ptr __AccessFileH
000D  83 3D 00 00 00 00 00		cmp		dword ptr __WindowsStdin,0x00000000
0014  74 20				je		L$1
0016  89 F0				mov		eax,esi
0018  FF 15 00 00 00 00			call		dword ptr __WindowsIsWindowedHandle
001E  85 C0				test		eax,eax
0020  74 14				je		L$1
0022  FF 15 00 00 00 00			call		dword ptr __WindowsStdin
0028  89 C2				mov		edx,eax
002A  89 F0				mov		eax,esi
002C  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
0032  89 D0				mov		eax,edx
0034  EB 38				jmp		L$3
0036				L$1:
0036  8B 0D 00 00 00 00			mov		ecx,dword ptr ___FileHandleIDs
003C  89 F0				mov		eax,esi
003E  6A 00				push		0x00000000
0040  8B 04 81				mov		eax,dword ptr [ecx+eax*4]
0043  8D 4C 24 04			lea		ecx,0x4[esp]
0047  51				push		ecx
0048  53				push		ebx
0049  52				push		edx
004A  50				push		eax
004B  E8 00 00 00 00			call		_ReadFile
0050  85 C0				test		eax,eax
0052  75 0F				jne		L$2
0054  89 F0				mov		eax,esi
0056  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
005C  E8 00 00 00 00			call		__set_errno_nt_
0061  EB 0B				jmp		L$3
0063				L$2:
0063  89 F0				mov		eax,esi
0065  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
006B  8B 04 24				mov		eax,dword ptr [esp]
006E				L$3:
006E  83 C4 04				add		esp,0x00000004
0071  5E				pop		esi
0072  59				pop		ecx
0073  C3				ret		

Routine Size: 116 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

