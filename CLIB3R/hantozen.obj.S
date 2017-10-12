Module: hantozen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000055 bytes
0000				hantozen_:
0000  52				push		edx
0001  31 D2				xor		edx,edx
0003  66 89 C2				mov		dx,ax
0006  83 FA 20				cmp		edx,0x00000020
0009  7C 17				jl		L$1
000B  83 FA 7E				cmp		edx,0x0000007e
000E  7F 12				jg		L$1
0010  66 8B 14 55 C0 FF FF FF		mov		dx,word ptr _hanzen-0x40[edx*2]
0018  81 E2 FF FF 00 00			and		edx,0x0000ffff
001E  89 D0				mov		eax,edx
0020  5A				pop		edx
0021  C3				ret		
0022				L$1:
0022  31 D2				xor		edx,edx
0024  66 89 C2				mov		dx,ax
0027  89 D0				mov		eax,edx
0029  5A				pop		edx
002A  C3				ret		

Routine Size: 43 bytes,    Routine Base: _TEXT + 0000

002B				zentohan_:
002B  53				push		ebx
002C  52				push		edx
002D  89 C3				mov		ebx,eax
002F  31 C0				xor		eax,eax
0031  EB 13				jmp		L$4
0033				L$2:
0033  66 3B 1C 55 00 00 00 00		cmp		bx,word ptr _hanzen[edx*2]
003B  75 08				jne		L$3
003D  05 20 00 00 00			add		eax,0x00000020
0042  5A				pop		edx
0043  5B				pop		ebx
0044  C3				ret		
0045				L$3:
0045  40				inc		eax
0046				L$4:
0046  31 D2				xor		edx,edx
0048  66 89 C2				mov		dx,ax
004B  83 FA 5E				cmp		edx,0x0000005e
004E  7E E3				jle		L$2
0050  89 D8				mov		eax,ebx
0052  5A				pop		edx
0053  5B				pop		ebx
0054  C3				ret		

Routine Size: 42 bytes,    Routine Base: _TEXT + 002B

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 000000BE bytes
0000				_hanzen:
0000  40 81 49 81 68 81 94 81 90 81 93 81 95 81 66 81 @.I.h.........f.
0010  69 81 6A 81 96 81 7B 81 43 81 7C 81 44 81 5E 81 i.j...{.C.|.D.^.
0020  4F 82 50 82 51 82 52 82 53 82 54 82 55 82 56 82 O.P.Q.R.S.T.U.V.
0030  57 82 58 82 46 81 47 81 83 81 81 81 84 81 48 81 W.X.F.G.......H.
0040  97 81 60 82 61 82 62 82 63 82 64 82 65 82 66 82 ..`.a.b.c.d.e.f.
0050  67 82 68 82 69 82 6A 82 6B 82 6C 82 6D 82 6E 82 g.h.i.j.k.l.m.n.
0060  6F 82 70 82 71 82 72 82 73 82 74 82 75 82 76 82 o.p.q.r.s.t.u.v.
0070  77 82 78 82 79 82 6D 81 8F 81 6E 81 4F 81 51 81 w.x.y.m...n.O.Q.
0080  65 81 81 82 82 82 83 82 84 82 85 82 86 82 87 82 e...............
0090  88 82 89 82 8A 82 8B 82 8C 82 8D 82 8E 82 8F 82 ................
00A0  90 82 91 82 92 82 93 82 94 82 95 82 96 82 97 82 ................
00B0  98 82 99 82 9A 82 6F 81 62 81 70 81 50 81       ......o.b.p.P.

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

