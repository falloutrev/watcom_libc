Module: ntfio
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000088 bytes
0000				__GetNTCreateAttr_:
0000  A8 01				test		al,0x01
0002  74 0E				je		L$1
0004  C7 02 00 00 00 80			mov		dword ptr [edx],0x80000000
000A  C7 03 01 00 00 00			mov		dword ptr [ebx],0x00000001
0010  EB 0C				jmp		L$2
0012				L$1:
0012  C7 02 00 00 00 C0			mov		dword ptr [edx],0xc0000000
0018  C7 03 80 00 00 00			mov		dword ptr [ebx],0x00000080
001E				L$2:
001E  A8 02				test		al,0x02
0020  74 03				je		L$3
0022  80 0B 02				or		byte ptr [ebx],0x02
0025				L$3:
0025  A8 04				test		al,0x04
0027  74 03				je		L$4
0029  80 0B 04				or		byte ptr [ebx],0x04
002C				L$4:
002C  C3				ret		

Routine Size: 45 bytes,    Routine Base: _TEXT + 0000

002D				__GetNTAccessAttr_:
002D  83 F8 02				cmp		eax,0x00000002
0030  75 0D				jne		L$6
0032  C7 02 00 00 00 C0			mov		dword ptr [edx],0xc0000000
0038				L$5:
0038  C7 03 80 00 00 00			mov		dword ptr [ebx],0x00000080
003E  C3				ret		
003F				L$6:
003F  83 F8 01				cmp		eax,0x00000001
0042  75 08				jne		L$7
0044  C7 02 00 00 00 40			mov		dword ptr [edx],0x40000000
004A  EB EC				jmp		L$5
004C				L$7:
004C  C7 02 00 00 00 80			mov		dword ptr [edx],0x80000000
0052  C7 03 01 00 00 00			mov		dword ptr [ebx],0x00000001
0058  C3				ret		

Routine Size: 44 bytes,    Routine Base: _TEXT + 002D

0059				__GetNTShareAttr_:
0059  85 C0				test		eax,eax
005B  74 05				je		L$8
005D  83 F8 40				cmp		eax,0x00000040
0060  75 07				jne		L$9
0062				L$8:
0062  C7 02 03 00 00 00			mov		dword ptr [edx],0x00000003
0068  C3				ret		
0069				L$9:
0069  83 F8 20				cmp		eax,0x00000020
006C  75 07				jne		L$10
006E  C7 02 01 00 00 00			mov		dword ptr [edx],0x00000001
0074  C3				ret		
0075				L$10:
0075  83 F8 30				cmp		eax,0x00000030
0078  75 07				jne		L$11
007A  C7 02 02 00 00 00			mov		dword ptr [edx],0x00000002
0080  C3				ret		
0081				L$11:
0081  C7 02 00 00 00 00			mov		dword ptr [edx],0x00000000
0087  C3				ret		

Routine Size: 47 bytes,    Routine Base: _TEXT + 0059

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

