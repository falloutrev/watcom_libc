Module: fullpath
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000084 bytes
0000				_fullpath_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  83 EC 04				sub		esp,0x00000004
0006  89 C6				mov		esi,eax
0008  89 D1				mov		ecx,edx
000A  85 C0				test		eax,eax
000C  75 22				jne		L$3
000E  BB 04 01 00 00			mov		ebx,0x00000104
0013  89 D8				mov		eax,ebx
0015  E8 00 00 00 00			call		malloc_
001A  89 C7				mov		edi,eax
001C  85 C0				test		eax,eax
001E  75 0E				jne		L$2
0020  B8 05 00 00 00			mov		eax,0x00000005
0025				L$1:
0025  E8 00 00 00 00			call		__set_errno_
002A  31 C0				xor		eax,eax
002C  EB 4F				jmp		L$9
002E				L$2:
002E  89 C6				mov		esi,eax
0030				L$3:
0030  85 C9				test		ecx,ecx
0032  74 05				je		L$4
0034  80 39 00				cmp		byte ptr [ecx],0x00
0037  75 0B				jne		L$5
0039				L$4:
0039  89 DA				mov		edx,ebx
003B  89 F0				mov		eax,esi
003D  E8 00 00 00 00			call		getcwd_
0042  EB 39				jmp		L$9
0044				L$5:
0044  BA 00 00 00 00			mov		edx,offset DGROUP:L$10
0049  89 C8				mov		eax,ecx
004B  E8 00 00 00 00			call		stricmp_
0050  85 C0				test		eax,eax
0052  75 1C				jne		L$7
0054  83 FB 04				cmp		ebx,0x00000004
0057  73 0E				jae		L$6
0059  89 F8				mov		eax,edi
005B  E8 00 00 00 00			call		free_
0060  B8 0E 00 00 00			mov		eax,0x0000000e
0065  EB BE				jmp		L$1
0067				L$6:
0067  A1 00 00 00 00			mov		eax,dword ptr DGROUP:L$10
006C  89 06				mov		dword ptr [esi],eax
006E  EB 0B				jmp		L$8
0070				L$7:
0070  89 E0				mov		eax,esp
0072  50				push		eax
0073  56				push		esi
0074  53				push		ebx
0075  51				push		ecx
0076  E8 00 00 00 00			call		_GetFullPathNameA
007B				L$8:
007B  89 F0				mov		eax,esi
007D				L$9:
007D  83 C4 04				add		esp,0x00000004
0080  5F				pop		edi
0081  5E				pop		esi
0082  59				pop		ecx
0083  C3				ret		

Routine Size: 132 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000004 bytes
0000				L$10:
0000  63 6F 6E 00                                     con.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

