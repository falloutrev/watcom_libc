Module: chipt32
GROUP: 'DGROUP' DATA32,_DATA

Segment: _TEXT DWORD USE32 000000B1 bytes
0000				__fptan_chk:
0000  50				push		eax
0001  83 EC 14				sub		esp,0x00000014
0004  DB 3C 24				fstp		tbyte ptr [esp]
0007  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
000B  25 FF 7F 00 00			and		eax,0x00007fff
0010  0F 84 91 00 00 00			je		L$3
0016  3D FF 7F 00 00			cmp		eax,0x00007fff
001B  0F 84 86 00 00 00			je		L$3
0021  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0025  01 C0				add		eax,eax
0027  73 7E				jae		L$3
0029  DB 2C 24				fld		tbyte ptr [esp]
002C  D9 E1				fabs		
002E  D8 1D 14 00 00 00			fcomp		dword ptr DGROUP:L$6
0034  DF E0				fnstsw		ax
0036  9E				sahf		
0037  73 6E				jae		L$3
0039  DB 2C 24				fld		tbyte ptr [esp]
003C  D9 FB				fsincos		
003E  DB 3C 24				fstp		tbyte ptr [esp]
0041  DB 2C 24				fld		tbyte ptr [esp]
0044  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0048  01 C0				add		eax,eax
004A  35 00 00 00 0E			xor		eax,0x0e000000
004F  A9 00 00 00 0E			test		eax,0x0e000000
0054  74 09				je		L$1
0056  DE F9				fdivp		st(1),st
0058  D9 E8				fld1		
005A  83 C4 14				add		esp,0x00000014
005D  58				pop		eax
005E  C3				ret		
005F				L$1:
005F  C1 E8 1C				shr		eax,0x1c
0062  38 A0 00 00 00 00			cmp		byte ptr DGROUP:L$4[eax],ah
0068  75 09				jne		L$2
006A  DE F9				fdivp		st(1),st
006C  D9 E8				fld1		
006E  83 C4 14				add		esp,0x00000014
0071  58				pop		eax
0072  C3				ret		
0073				L$2:
0073  9B				fwait		
0074  9B D9 7C 24 10			fstcw		word ptr 0x10[esp]
0079  8B 44 24 10			mov		eax,dword ptr 0x10[esp]
007D  0D 3F 03 00 00			or		eax,0x0000033f
0082  89 44 24 0C			mov		dword ptr 0xc[esp],eax
0086  D9 6C 24 0C			fldcw		word ptr 0xc[esp]
008A  D8 0D 10 00 00 00			fmul		dword ptr DGROUP:L$5
0090  D9 C9				fxch		st(1)
0092  D8 0D 10 00 00 00			fmul		dword ptr DGROUP:L$5
0098  D9 C9				fxch		st(1)
009A  D9 6C 24 10			fldcw		word ptr 0x10[esp]
009E  DE F9				fdivp		st(1),st
00A0  D9 E8				fld1		
00A2  83 C4 14				add		esp,0x00000014
00A5  58				pop		eax
00A6  C3				ret		
00A7				L$3:
00A7  DB 2C 24				fld		tbyte ptr [esp]
00AA  D9 F2				fptan		
00AC  83 C4 14				add		esp,0x00000014
00AF  58				pop		eax
00B0  C3				ret		

Routine Size: 177 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes

Segment: DATA32 DWORD USE32 00000018 bytes
0000				L$4:
0000  00 01 00 00 04 00 00 07 00 00 0A 00 00 0D 00 00 ................
0010				L$5:
0010  00 00 70 3F                                     ..p?
0014				L$6:
0014  00 00 00 5F                                     ..._

