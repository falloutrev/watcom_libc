Module: ufprtf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000094 bytes
0000				file_putc_:
0000  53				push		ebx
0001  89 C3				mov		ebx,eax
0003  89 D0				mov		eax,edx
0005  8B 13				mov		edx,dword ptr [ebx]
0007  E8 00 00 00 00			call		_ufputc_
000C  FF 43 10				inc		dword ptr 0x10[ebx]
000F  5B				pop		ebx
0010  C3				ret		

Routine Size: 17 bytes,    Routine Base: _TEXT + 0000

0011				__ufprtf_:
0011  51				push		ecx
0012  56				push		esi
0013  57				push		edi
0014  C8 04 00 00			enter		0x0004,0x00
0018  89 C6				mov		esi,eax
001A  8B 40 10				mov		eax,dword ptr 0x10[eax]
001D  FF 15 00 00 00 00			call		dword ptr __AccessFileH
0023  8B 46 0C				mov		eax,dword ptr 0xc[esi]
0026  83 E0 30				and		eax,0x00000030
0029  80 66 0C CF			and		byte ptr 0xc[esi],0xcf
002D  89 45 FC				mov		dword ptr -0x4[ebp],eax
0030  83 7E 08 00			cmp		dword ptr 0x8[esi],0x00000000
0034  75 07				jne		L$1
0036  89 F0				mov		eax,esi
0038  E8 00 00 00 00			call		__ioalloc_
003D				L$1:
003D  31 FF				xor		edi,edi
003F  F6 46 0D 04			test		byte ptr 0xd[esi],0x04
0043  74 0D				je		L$2
0045  80 66 0D FA			and		byte ptr 0xd[esi],0xfa
0049  BF 01 00 00 00			mov		edi,0x00000001
004E  80 4E 0D 01			or		byte ptr 0xd[esi],0x01
0052				L$2:
0052  B9 00 00 00 00			mov		ecx,offset file_putc_
0057  89 F0				mov		eax,esi
0059  E8 00 00 00 00			call		__uprtf_
005E  89 C2				mov		edx,eax
0060  85 FF				test		edi,edi
0062  74 0F				je		L$3
0064  80 66 0D FA			and		byte ptr 0xd[esi],0xfa
0068  89 F0				mov		eax,esi
006A  80 4E 0D 04			or		byte ptr 0xd[esi],0x04
006E  E8 00 00 00 00			call		__flush_
0073				L$3:
0073  8B 46 10				mov		eax,dword ptr 0x10[esi]
0076  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
007C  F6 46 0C 20			test		byte ptr 0xc[esi],0x20
0080  74 05				je		L$4
0082  BA FF FF FF FF			mov		edx,0xffffffff
0087				L$4:
0087  8B 45 FC				mov		eax,dword ptr -0x4[ebp]
008A  09 46 0C				or		dword ptr 0xc[esi],eax
008D  89 D0				mov		eax,edx
008F  C9				leave		
0090  5F				pop		edi
0091  5E				pop		esi
0092  59				pop		ecx
0093  C3				ret		

Routine Size: 131 bytes,    Routine Base: _TEXT + 0011

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

