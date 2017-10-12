Module: ustricmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000067 bytes
0000				_ustrcmpi_:
0000				_ustricmp_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  89 C3				mov		ebx,eax
0005				L$1:
0005  66 8B 03				mov		ax,word ptr [ebx]
0008  89 C6				mov		esi,eax
000A  81 E6 00 FF 00 00			and		esi,0x0000ff00
0010  0F B7 F6				movzx		esi,si
0013  66 8B 0A				mov		cx,word ptr [edx]
0016  85 F6				test		esi,esi
0018  75 31				jne		L$3
001A  89 CE				mov		esi,ecx
001C  81 E6 00 FF 00 00			and		esi,0x0000ff00
0022  0F B7 F6				movzx		esi,si
0025  85 F6				test		esi,esi
0027  75 22				jne		L$3
0029  0F B7 F0				movzx		esi,ax
002C  83 FE 41				cmp		esi,0x00000041
002F  7C 0A				jl		L$2
0031  83 FE 5A				cmp		esi,0x0000005a
0034  7F 05				jg		L$2
0036  05 20 00 00 00			add		eax,0x00000020
003B				L$2:
003B  0F B7 F1				movzx		esi,cx
003E  83 FE 41				cmp		esi,0x00000041
0041  7C 08				jl		L$3
0043  83 FE 5A				cmp		esi,0x0000005a
0046  7F 03				jg		L$3
0048  83 C1 20				add		ecx,0x00000020
004B				L$3:
004B  66 39 C8				cmp		ax,cx
004E  75 0B				jne		L$4
0050  66 85 C9				test		cx,cx
0053  74 06				je		L$4
0055  43				inc		ebx
0056  43				inc		ebx
0057  42				inc		edx
0058  42				inc		edx
0059  EB AA				jmp		L$1
005B				L$4:
005B  0F B7 C0				movzx		eax,ax
005E  0F B7 D1				movzx		edx,cx
0061  29 D0				sub		eax,edx
0063  5E				pop		esi
0064  59				pop		ecx
0065  5B				pop		ebx
0066  C3				ret		

Routine Size: 103 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

