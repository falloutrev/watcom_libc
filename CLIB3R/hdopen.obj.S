Module: hdopen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000006D bytes
0000				check_mode_:
0000  31 C0				xor		eax,eax
0002  C3				ret		

Routine Size: 3 bytes,    Routine Base: _TEXT + 0000

0003				_dopen_:

Routine Size: 0 bytes,    Routine Base: _TEXT + 0003

0003				_hdopen_:
0003  53				push		ebx
0004  51				push		ecx
0005  56				push		esi
0006  89 C3				mov		ebx,eax
0008  89 D1				mov		ecx,edx
000A  83 F8 FF				cmp		eax,0xffffffff
000D  74 58				je		L$7
000F  E8 00 00 00 00			call		check_mode_
0014  85 C0				test		eax,eax
0016  74 09				je		L$1
0018  B8 FF FF FF FF			mov		eax,0xffffffff
001D  5E				pop		esi
001E  59				pop		ecx
001F  5B				pop		ebx
0020  C3				ret		
0021				L$1:
0021  89 D8				mov		eax,ebx
0023  89 CE				mov		esi,ecx
0025  FF 15 00 00 00 00			call		dword ptr __InitAccessH
002B  89 C3				mov		ebx,eax
002D  E8 00 00 00 00			call		__IOMode_
0032  24 3C				and		al,0x3c
0034  83 E6 03				and		esi,0x00000003
0037  89 C2				mov		edx,eax
0039  83 FE 02				cmp		esi,0x00000002
003C  75 03				jne		L$2
003E  80 CA 03				or		dl,0x03
0041				L$2:
0041  85 F6				test		esi,esi
0043  75 03				jne		L$3
0045  80 CA 01				or		dl,0x01
0048				L$3:
0048  83 FE 01				cmp		esi,0x00000001
004B  75 03				jne		L$4
004D  80 CA 02				or		dl,0x02
0050				L$4:
0050  F6 C1 10				test		cl,0x10
0053  74 03				je		L$5
0055  80 CA 80				or		dl,0x80
0058				L$5:
0058  F6 C5 02				test		ch,0x02
005B  74 03				je		L$6
005D  80 CA 40				or		dl,0x40
0060				L$6:
0060  89 D8				mov		eax,ebx
0062  E8 00 00 00 00			call		__SetIOMode_
0067				L$7:
0067  89 D8				mov		eax,ebx
0069  5E				pop		esi
006A  59				pop		ecx
006B  5B				pop		ebx
006C  C3				ret		

Routine Size: 106 bytes,    Routine Base: _TEXT + 0003

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

