Module: ustrstr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000073 bytes
0000				_ustrstr_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  57				push		edi
0004  C8 04 00 00			enter		0x0004,0x00
0008  89 C6				mov		esi,eax
000A  89 D1				mov		ecx,edx
000C  66 83 3A 00			cmp		word ptr [edx],0x0000
0010  74 59				je		L$4
0012  66 83 7A 02 00			cmp		word ptr 0x2[edx],0x0000
0017  75 0C				jne		L$1
0019  0F B7 12				movzx		edx,word ptr [edx]
001C  E8 00 00 00 00			call		_ustrchr_
0021  89 C6				mov		esi,eax
0023  EB 46				jmp		L$4
0025				L$1:
0025  BB FF FF FF FF			mov		ebx,0xffffffff
002A  31 D2				xor		edx,edx
002C  E8 00 00 00 00			call		__umemchr_
0031  89 45 FC				mov		dword ptr -0x4[ebp],eax
0034  89 C8				mov		eax,ecx
0036  E8 00 00 00 00			call		_ustrlen_
003B  89 C7				mov		edi,eax
003D				L$2:
003D  8B 5D FC				mov		ebx,dword ptr -0x4[ebp]
0040  29 F3				sub		ebx,esi
0042  D1 FB				sar		ebx,0x01
0044  39 FB				cmp		ebx,edi
0046  72 21				jb		L$3
0048  89 F0				mov		eax,esi
004A  0F B7 11				movzx		edx,word ptr [ecx]
004D  E8 00 00 00 00			call		__umemchr_
0052  89 C6				mov		esi,eax
0054  85 C0				test		eax,eax
0056  74 11				je		L$3
0058  89 FB				mov		ebx,edi
005A  89 CA				mov		edx,ecx
005C  E8 00 00 00 00			call		__umemcmp_
0061  85 C0				test		eax,eax
0063  74 06				je		L$4
0065  46				inc		esi
0066  46				inc		esi
0067  EB D4				jmp		L$2
0069				L$3:
0069  31 F6				xor		esi,esi
006B				L$4:
006B  89 F0				mov		eax,esi
006D  C9				leave		
006E  5F				pop		edi
006F  5E				pop		esi
0070  59				pop		ecx
0071  5B				pop		ebx
0072  C3				ret		

Routine Size: 115 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

