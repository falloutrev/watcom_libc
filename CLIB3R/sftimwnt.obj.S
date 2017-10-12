Module: sftimwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000006F bytes
0000				_dos_setftime_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 18				sub		esp,0x00000018
0007  89 C6				mov		esi,eax
0009  89 D7				mov		edi,edx
000B  FF 15 00 00 00 00			call		dword ptr __AccessFileH
0011  A1 00 00 00 00			mov		eax,dword ptr ___FileHandleIDs
0016  89 F5				mov		ebp,esi
0018  8B 2C A8				mov		ebp,dword ptr [eax+ebp*4]
001B  89 E0				mov		eax,esp
001D  50				push		eax
001E  8D 44 24 0C			lea		eax,0xc[esp]
0022  50				push		eax
0023  8D 44 24 18			lea		eax,0x18[esp]
0027  50				push		eax
0028  55				push		ebp
0029  E8 00 00 00 00			call		_GetFileTime
002E  85 C0				test		eax,eax
0030  75 0F				jne		L$2
0032				L$1:
0032  89 F0				mov		eax,esi
0034  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
003A  E8 00 00 00 00			call		__set_errno_nt_
003F  EB 26				jmp		L$3
0041				L$2:
0041  31 D2				xor		edx,edx
0043  31 C0				xor		eax,eax
0045  66 89 DA				mov		dx,bx
0048  66 89 F8				mov		ax,di
004B  89 E3				mov		ebx,esp
004D  E8 00 00 00 00			call		__FromDOSDT_
0052  89 E0				mov		eax,esp
0054  50				push		eax
0055  50				push		eax
0056  8D 44 24 18			lea		eax,0x18[esp]
005A  50				push		eax
005B  55				push		ebp
005C  E8 00 00 00 00			call		_SetFileTime
0061  85 C0				test		eax,eax
0063  74 CD				je		L$1
0065  31 C0				xor		eax,eax
0067				L$3:
0067  83 C4 18				add		esp,0x00000018
006A  5D				pop		ebp
006B  5F				pop		edi
006C  5E				pop		esi
006D  59				pop		ecx
006E  C3				ret		

Routine Size: 111 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

