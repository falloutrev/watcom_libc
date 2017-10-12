Module: chipbug
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS,XIB,XI,XIE

Segment: _TEXT BYTE USE32 00000055 bytes
0000				verify_pentium_fdiv_bug_:
0000  83 EC 10				sub		esp,0x00000010
0003  C7 44 24 08 00 00 00 C0		mov		dword ptr 0x8[esp],0xc0000000
000B  C7 44 24 0C 7E 01 50 41		mov		dword ptr 0xc[esp],0x4150017e
0013  C7 04 24 00 00 00 80		mov		dword ptr [esp],0x80000000
001A  C7 44 24 04 FF FF 47 41		mov		dword ptr 0x4[esp],0x4147ffff
0022  31 C0				xor		eax,eax
0024  A0 00 00 00 00			mov		al,byte ptr __real87
0029  83 F8 03				cmp		eax,0x00000003
002C  7C 23				jl		L$1
002E  DD 44 24 08			fld		qword ptr 0x8[esp]
0032  D9 C0				fld		st
0034  DD 04 24				fld		qword ptr [esp]
0037  D9 C9				fxch		st(1)
0039  D8 F1				fdiv		st,st(1)
003B  DE C9				fmulp		st(1),st
003D  DE E9				fsubp		st(1),st
003F  DC 1D 00 00 00 00			fcomp		qword ptr DGROUP:L$2
0045  DF E0				fnstsw		ax
0047  9E				sahf		
0048  76 07				jbe		L$1
004A  80 0D 00 00 00 00 01		or		byte ptr ___chipbug,0x01
0051				L$1:
0051  83 C4 10				add		esp,0x00000010
0054  C3				ret		

Routine Size: 85 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000008 bytes
0000				L$2:
0000  3A 8C 30 E2 8E 79 45 3E                         :.0..yE>

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

Segment: XIB BYTE USE32 00000000 bytes

Segment: XI BYTE USE32 00000006 bytes
0000				___anon42:
0000  00 03                                           ..
0002  00 00 00 00                                     DD	offset verify_pentium_fdiv_bug_

Segment: XIE BYTE USE32 00000000 bytes

