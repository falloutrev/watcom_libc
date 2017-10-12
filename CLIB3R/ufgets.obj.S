Module: ufgets
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000074 bytes
0000				_ufgets_:
0000  51				push		ecx
0001  56				push		esi
0002  C8 08 00 00			enter		0x0008,0x00
0006  89 C1				mov		ecx,eax
0008  89 D6				mov		esi,edx
000A  8B 43 10				mov		eax,dword ptr 0x10[ebx]
000D  FF 15 00 00 00 00			call		dword ptr __AccessFileH
0013  8B 43 0C				mov		eax,dword ptr 0xc[ebx]
0016  89 CA				mov		edx,ecx
0018  83 E0 30				and		eax,0x00000030
001B  80 63 0C CF			and		byte ptr 0xc[ebx],0xcf
001F  89 45 F8				mov		dword ptr -0x8[ebp],eax
0022				L$1:
0022  4E				dec		esi
0023  85 F6				test		esi,esi
0025  7E 1F				jle		L$2
0027  89 D8				mov		eax,ebx
0029  E8 00 00 00 00			call		_ufgetc_
002E  89 45 FC				mov		dword ptr -0x4[ebp],eax
0031  83 F8 FF				cmp		eax,0xffffffff
0034  74 10				je		L$2
0036  8B 45 FC				mov		eax,dword ptr -0x4[ebp]
0039  66 89 02				mov		word ptr [edx],ax
003C  0F B7 C0				movzx		eax,ax
003F  42				inc		edx
0040  42				inc		edx
0041  83 F8 0A				cmp		eax,0x0000000a
0044  75 DC				jne		L$1
0046				L$2:
0046  83 7D FC FF			cmp		dword ptr -0x4[ebp],0xffffffff
004A  75 0E				jne		L$4
004C  39 CA				cmp		edx,ecx
004E  74 06				je		L$3
0050  F6 43 0C 20			test		byte ptr 0xc[ebx],0x20
0054  74 04				je		L$4
0056				L$3:
0056  31 C9				xor		ecx,ecx
0058  EB 05				jmp		L$5
005A				L$4:
005A  66 C7 02 00 00			mov		word ptr [edx],0x0000
005F				L$5:
005F  8B 45 F8				mov		eax,dword ptr -0x8[ebp]
0062  09 43 0C				or		dword ptr 0xc[ebx],eax
0065  8B 43 10				mov		eax,dword ptr 0x10[ebx]
0068  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
006E  89 C8				mov		eax,ecx
0070  C9				leave		
0071  5E				pop		esi
0072  59				pop		ecx
0073  C3				ret		

Routine Size: 116 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

