Module: fjstrupr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000006B bytes
0000				_fjstrupr_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  57				push		edi
0004  55				push		ebp
0005  83 EC 10				sub		esp,0x00000010
0008  89 D7				mov		edi,edx
000A  89 C6				mov		esi,eax
000C  89 54 24 04			mov		dword ptr 0x4[esp],edx
0010  89 04 24				mov		dword ptr [esp],eax
0013  89 54 24 0C			mov		dword ptr 0xc[esp],edx
0017  89 C5				mov		ebp,eax
0019  EB 22				jmp		L$2
001B				L$1:
001B  31 C0				xor		eax,eax
001D  66 89 D0				mov		ax,dx
0020  31 DB				xor		ebx,ebx
0022  E8 00 00 00 00			call		jtoupper_
0027  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
002B  66 89 C3				mov		bx,ax
002E  89 E8				mov		eax,ebp
0030  9A 00 00 00 00 00 00		call		_fjputmoji_
0037  89 C5				mov		ebp,eax
0039  89 54 24 0C			mov		dword ptr 0xc[esp],edx
003D				L$2:
003D  8D 5C 24 08			lea		ebx,0x8[esp]
0041  8C D9				mov		ecx,ds
0043  89 FA				mov		edx,edi
0045  89 F0				mov		eax,esi
0047  9A 00 00 00 00 00 00		call		_fjgetmoji_
004E  89 D7				mov		edi,edx
0050  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
0054  89 C6				mov		esi,eax
0056  66 85 D2				test		dx,dx
0059  75 C0				jne		L$1
005B  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
005F  8B 04 24				mov		eax,dword ptr [esp]
0062  83 C4 10				add		esp,0x00000010
0065  5D				pop		ebp
0066  5F				pop		edi
0067  5E				pop		esi
0068  59				pop		ecx
0069  5B				pop		ebx
006A  CB				retf		

Routine Size: 107 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

