Module: dosgdf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000070 bytes
0000				_dos_getdiskfree_:
0000  53				push		ebx
0001  51				push		ecx
0002  83 EC 14				sub		esp,0x00000014
0005  89 D3				mov		ebx,edx
0007  85 C0				test		eax,eax
0009  74 19				je		L$1
000B  04 40				add		al,0x40
000D  B2 5C				mov		dl,0x5c
000F  88 04 24				mov		byte ptr [esp],al
0012  88 54 24 02			mov		byte ptr 0x2[esp],dl
0016  B4 3A				mov		ah,0x3a
0018  30 F6				xor		dh,dh
001A  88 64 24 01			mov		byte ptr 0x1[esp],ah
001E  88 74 24 03			mov		byte ptr 0x3[esp],dh
0022  89 E0				mov		eax,esp
0024				L$1:
0024  8D 54 24 04			lea		edx,0x4[esp]
0028  52				push		edx
0029  8D 54 24 10			lea		edx,0x10[esp]
002D  52				push		edx
002E  8D 54 24 18			lea		edx,0x18[esp]
0032  52				push		edx
0033  8D 54 24 14			lea		edx,0x14[esp]
0037  52				push		edx
0038  50				push		eax
0039  E8 00 00 00 00			call		_GetDiskFreeSpaceA
003E  85 C0				test		eax,eax
0040  75 07				jne		L$2
0042  E8 00 00 00 00			call		__set_errno_nt_
0047  EB 21				jmp		L$3
0049				L$2:
0049  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
004D  66 89 03				mov		word ptr [ebx],ax
0050  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
0054  66 89 43 02			mov		word ptr 0x2[ebx],ax
0058  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
005C  66 89 43 04			mov		word ptr 0x4[ebx],ax
0060  8B 44 24 10			mov		eax,dword ptr 0x10[esp]
0064  66 89 43 06			mov		word ptr 0x6[ebx],ax
0068  31 C0				xor		eax,eax
006A				L$3:
006A  83 C4 14				add		esp,0x00000014
006D  59				pop		ecx
006E  5B				pop		ebx
006F  C3				ret		

Routine Size: 112 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

