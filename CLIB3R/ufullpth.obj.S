Module: ufullpth
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000008D bytes
0000				_u_fullpath_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  83 EC 04				sub		esp,0x00000004
0006  89 C6				mov		esi,eax
0008  89 D1				mov		ecx,edx
000A  85 C0				test		eax,eax
000C  75 25				jne		L$3
000E  B8 08 02 00 00			mov		eax,0x00000208
0013  BB 04 01 00 00			mov		ebx,0x00000104
0018  E8 00 00 00 00			call		malloc_
001D  89 C7				mov		edi,eax
001F  85 C0				test		eax,eax
0021  75 0E				jne		L$2
0023  B8 05 00 00 00			mov		eax,0x00000005
0028				L$1:
0028  E8 00 00 00 00			call		__set_errno_
002D  31 C0				xor		eax,eax
002F  EB 55				jmp		L$8
0031				L$2:
0031  89 C6				mov		esi,eax
0033				L$3:
0033  85 C9				test		ecx,ecx
0035  74 06				je		L$4
0037  66 83 39 00			cmp		word ptr [ecx],0x0000
003B  75 0B				jne		L$5
003D				L$4:
003D  89 DA				mov		edx,ebx
003F  89 F0				mov		eax,esi
0041  E8 00 00 00 00			call		_ugetcwd_
0046  EB 3E				jmp		L$8
0048				L$5:
0048  BA 00 00 00 00			mov		edx,offset DGROUP:L$9
004D  89 C8				mov		eax,ecx
004F  E8 00 00 00 00			call		_ustricmp_
0054  85 C0				test		eax,eax
0056  75 21				jne		L$7
0058  83 FB 04				cmp		ebx,0x00000004
005B  73 0E				jae		L$6
005D  89 F8				mov		eax,edi
005F  E8 00 00 00 00			call		free_
0064  B8 0E 00 00 00			mov		eax,0x0000000e
0069  EB BD				jmp		L$1
006B				L$6:
006B  BA 00 00 00 00			mov		edx,offset DGROUP:L$9
0070  89 F0				mov		eax,esi
0072  E8 00 00 00 00			call		_ustrcpy_
0077  EB 0D				jmp		L$8
0079				L$7:
0079  89 E0				mov		eax,esp
007B  50				push		eax
007C  56				push		esi
007D  53				push		ebx
007E  51				push		ecx
007F  E8 00 00 00 00			call		_GetFullPathNameW
0084  89 F0				mov		eax,esi
0086				L$8:
0086  83 C4 04				add		esp,0x00000004
0089  5F				pop		edi
008A  5E				pop		esi
008B  59				pop		ecx
008C  C3				ret		

Routine Size: 141 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000008 bytes
0000				L$9:
0000  63 00 6F 00 6E 00 00 00                         c.o.n...

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

