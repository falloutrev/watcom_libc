Module: iomode
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000006A bytes
0000				__IOMode_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  89 C2				mov		edx,eax
0005  3B 05 00 00 00 00			cmp		eax,dword ptr ___NFiles
000B  72 06				jb		L$1
000D  31 C0				xor		eax,eax
000F  5A				pop		edx
0010  59				pop		ecx
0011  5B				pop		ebx
0012  C3				ret		
0013				L$1:
0013  83 F8 03				cmp		eax,0x00000003
0016  7F 31				jg		L$2
0018  89 C3				mov		ebx,eax
001A  A1 00 00 00 00			mov		eax,dword ptr __iomode
001F  C1 E3 02				shl		ebx,0x02
0022  01 D8				add		eax,ebx
0024  8A 48 01				mov		cl,byte ptr 0x1[eax]
0027  F6 C1 40				test		cl,0x40
002A  75 1D				jne		L$2
002C  88 CD				mov		ch,cl
002E  80 CD 40				or		ch,0x40
0031  88 68 01				mov		byte ptr 0x1[eax],ch
0034  89 D0				mov		eax,edx
0036  E8 00 00 00 00			call		isatty_
003B  85 C0				test		eax,eax
003D  74 0A				je		L$2
003F  A1 00 00 00 00			mov		eax,dword ptr __iomode
0044  80 4C 03 01 20			or		byte ptr 0x1[ebx+eax],0x20
0049				L$2:
0049  A1 00 00 00 00			mov		eax,dword ptr __iomode
004E  8B 04 90				mov		eax,dword ptr [eax+edx*4]
0051  5A				pop		edx
0052  59				pop		ecx
0053  5B				pop		ebx
0054  C3				ret		

Routine Size: 85 bytes,    Routine Base: _TEXT + 0000

0055				__SetIOMode_:
0055  53				push		ebx
0056  80 CE 40				or		dh,0x40
0059  89 D3				mov		ebx,edx
005B  89 C2				mov		edx,eax
005D  A1 00 00 00 00			mov		eax,dword ptr __iomode
0062  C1 E2 02				shl		edx,0x02
0065  89 1C 02				mov		dword ptr [edx+eax],ebx
0068  5B				pop		ebx
0069  C3				ret		

Routine Size: 21 bytes,    Routine Base: _TEXT + 0055

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000058 bytes
0000				___NFiles:
0000  14 00 00 00                                     ....
0004				___init_mode:
0004  01 00 00 00 02 00 00 00 02 00 00 00 03 00 00 00 ................
0014  02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
0024  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
0034  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
0044  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
0054				__iomode:
0054  00 00 00 00                                     DD	offset ___init_mode

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

