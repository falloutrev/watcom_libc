Module: ubprintf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000006F bytes
0000				buf_putc_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  89 D1				mov		ecx,edx
0005  8B 10				mov		edx,dword ptr [eax]
0007  8B 58 10				mov		ebx,dword ptr 0x10[eax]
000A  3B 5A 04				cmp		ebx,dword ptr 0x4[edx]
000D  73 0D				jae		L$1
000F  8B 1A				mov		ebx,dword ptr [edx]
0011  8D 73 02				lea		esi,0x2[ebx]
0014  89 32				mov		dword ptr [edx],esi
0016  66 89 0B				mov		word ptr [ebx],cx
0019  FF 40 10				inc		dword ptr 0x10[eax]
001C				L$1:
001C  5E				pop		esi
001D  59				pop		ecx
001E  5B				pop		ebx
001F  C3				ret		

Routine Size: 32 bytes,    Routine Base: _TEXT + 0000

0020				_u_vbprintf_:
0020  56				push		esi
0021  C8 08 00 00			enter		0x0008,0x00
0025  89 C6				mov		esi,eax
0027  89 D0				mov		eax,edx
0029  89 DA				mov		edx,ebx
002B  89 CB				mov		ebx,ecx
002D  48				dec		eax
002E  B9 00 00 00 00			mov		ecx,offset buf_putc_
0033  89 45 FC				mov		dword ptr -0x4[ebp],eax
0036  8D 45 F8				lea		eax,-0x8[ebp]
0039  89 75 F8				mov		dword ptr -0x8[ebp],esi
003C  E8 00 00 00 00			call		__uprtf_
0041  89 C3				mov		ebx,eax
0043  66 C7 04 5E 00 00			mov		word ptr [esi+ebx*2],0x0000
0049  C9				leave		
004A  5E				pop		esi
004B  C3				ret		

Routine Size: 44 bytes,    Routine Base: _TEXT + 0020

004C				_u_bprintf_:
004C  53				push		ebx
004D  51				push		ecx
004E  52				push		edx
004F  C8 04 00 00			enter		0x0004,0x00
0053  8D 45 20				lea		eax,0x20[ebp]
0056  8D 4D FC				lea		ecx,-0x4[ebp]
0059  8B 5D 1C				mov		ebx,dword ptr 0x1c[ebp]
005C  8B 55 18				mov		edx,dword ptr 0x18[ebp]
005F  89 45 FC				mov		dword ptr -0x4[ebp],eax
0062  8B 45 14				mov		eax,dword ptr 0x14[ebp]
0065  E8 00 00 00 00			call		_u_vbprintf_
006A  C9				leave		
006B  5A				pop		edx
006C  59				pop		ecx
006D  5B				pop		ebx
006E  C3				ret		

Routine Size: 35 bytes,    Routine Base: _TEXT + 004C

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

