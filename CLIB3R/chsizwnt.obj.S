Module: chsizwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000074 bytes
0000				chsize_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  57				push		edi
0004  55				push		ebp
0005  89 C6				mov		esi,eax
0007  89 D1				mov		ecx,edx
0009  8B 2D 00 00 00 00			mov		ebp,dword ptr ___FileHandleIDs
000F  BB 01 00 00 00			mov		ebx,0x00000001
0014  31 D2				xor		edx,edx
0016  8B 6C 85 00			mov		ebp,dword ptr [ebp+eax*4]
001A  FF 15 00 00 00 00			call		dword ptr __AccessFileH
0020  89 F0				mov		eax,esi
0022  E8 00 00 00 00			call		lseek_
0027  6A 00				push		0x00000000
0029  6A 00				push		0x00000000
002B  51				push		ecx
002C  55				push		ebp
002D  89 C7				mov		edi,eax
002F  E8 00 00 00 00			call		_SetFilePointer
0034  83 F8 FF				cmp		eax,0xffffffff
0037  75 0F				jne		L$3
0039				L$1:
0039  89 F0				mov		eax,esi
003B  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
0041				L$2:
0041  E8 00 00 00 00			call		__set_errno_nt_
0046  EB 26				jmp		L$4
0048				L$3:
0048  55				push		ebp
0049  E8 00 00 00 00			call		_SetEndOfFile
004E  85 C0				test		eax,eax
0050  74 E7				je		L$1
0052  89 FA				mov		edx,edi
0054  89 F0				mov		eax,esi
0056  31 DB				xor		ebx,ebx
0058  E8 00 00 00 00			call		lseek_
005D  89 C7				mov		edi,eax
005F  89 F0				mov		eax,esi
0061  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
0067  83 FF FF				cmp		edi,0xffffffff
006A  74 D5				je		L$2
006C  31 C0				xor		eax,eax
006E				L$4:
006E  5D				pop		ebp
006F  5F				pop		edi
0070  5E				pop		esi
0071  59				pop		ecx
0072  5B				pop		ebx
0073  C3				ret		

Routine Size: 116 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

