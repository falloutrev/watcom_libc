Module: plusopen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000084 bytes
0000				__plusplus_open_:
0000  51				push		ecx
0001  56				push		esi
0002  83 EC 48				sub		esp,0x00000048
0005  89 C1				mov		ecx,eax
0007  89 DE				mov		esi,ebx
0009  8B 02				mov		eax,dword ptr [edx]
000B  89 C3				mov		ebx,eax
000D  83 E3 03				and		ebx,0x00000003
0010  83 FB 03				cmp		ebx,0x00000003
0013  75 07				jne		L$1
0015  BB 22 00 00 00			mov		ebx,0x00000022
001A  EB 18				jmp		L$5
001C				L$1:
001C  A8 01				test		al,0x01
001E  74 04				je		L$2
0020  31 DB				xor		ebx,ebx
0022  EB 10				jmp		L$5
0024				L$2:
0024  A8 02				test		al,0x02
0026  75 07				jne		L$4
0028				L$3:
0028  B8 FF FF FF FF			mov		eax,0xffffffff
002D  EB 4F				jmp		L$12
002F				L$4:
002F  BB 21 00 00 00			mov		ebx,0x00000021
0034				L$5:
0034  A8 08				test		al,0x08
0036  74 03				je		L$6
0038  80 CB 10				or		bl,0x10
003B				L$6:
003B  A8 10				test		al,0x10
003D  74 03				je		L$7
003F  80 CB 40				or		bl,0x40
0042				L$7:
0042  A8 20				test		al,0x20
0044  74 03				je		L$8
0046  80 E3 DF				and		bl,0xdf
0049				L$8:
0049  F6 C4 01				test		ah,0x01
004C  74 05				je		L$9
004E  80 CF 02				or		bh,0x02
0051  EB 06				jmp		L$10
0053				L$9:
0053  80 CF 01				or		bh,0x01
0056  80 0A 80				or		byte ptr [edx],0x80
0059				L$10:
0059  A8 40				test		al,0x40
005B  74 16				je		L$11
005D  89 D8				mov		eax,ebx
005F  0C 20				or		al,0x20
0061  85 C0				test		eax,eax
0063  74 0E				je		L$11
0065  89 E2				mov		edx,esp
0067  89 C8				mov		eax,ecx
0069  E8 00 00 00 00			call		stat_
006E  83 F8 FF				cmp		eax,0xffffffff
0071  75 B5				jne		L$3
0073				L$11:
0073  56				push		esi
0074  53				push		ebx
0075  51				push		ecx
0076  E8 00 00 00 00			call		open_
007B  83 C4 0C				add		esp,0x0000000c
007E				L$12:
007E  83 C4 48				add		esp,0x00000048
0081  5E				pop		esi
0082  59				pop		ecx
0083  C3				ret		

Routine Size: 132 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

