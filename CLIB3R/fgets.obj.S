Module: fgets
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000007B bytes
0000				fgets_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 04				sub		esp,0x00000004
0007  89 C6				mov		esi,eax
0009  89 D1				mov		ecx,edx
000B  8B 43 10				mov		eax,dword ptr 0x10[ebx]
000E  89 F2				mov		edx,esi
0010  FF 15 00 00 00 00			call		dword ptr __AccessFileH
0016  8A 63 0C				mov		ah,byte ptr 0xc[ebx]
0019  8B 7B 0C				mov		edi,dword ptr 0xc[ebx]
001C  80 E4 CF				and		ah,0xcf
001F  83 E7 30				and		edi,0x00000030
0022  88 63 0C				mov		byte ptr 0xc[ebx],ah
0025				L$1:
0025  49				dec		ecx
0026  85 C9				test		ecx,ecx
0028  7E 1F				jle		L$2
002A  89 D8				mov		eax,ebx
002C  E8 00 00 00 00			call		fgetc_
0031  89 04 24				mov		dword ptr [esp],eax
0034  83 F8 FF				cmp		eax,0xffffffff
0037  74 10				je		L$2
0039  8A 04 24				mov		al,byte ptr [esp]
003C  88 02				mov		byte ptr [edx],al
003E  25 FF 00 00 00			and		eax,0x000000ff
0043  42				inc		edx
0044  83 F8 0A				cmp		eax,0x0000000a
0047  75 DC				jne		L$1
0049				L$2:
0049  83 3C 24 FF			cmp		dword ptr [esp],0xffffffff
004D  75 0E				jne		L$4
004F  39 F2				cmp		edx,esi
0051  74 06				je		L$3
0053  F6 43 0C 20			test		byte ptr 0xc[ebx],0x20
0057  74 04				je		L$4
0059				L$3:
0059  31 F6				xor		esi,esi
005B  EB 03				jmp		L$5
005D				L$4:
005D  C6 02 00				mov		byte ptr [edx],0x00
0060				L$5:
0060  8B 6B 0C				mov		ebp,dword ptr 0xc[ebx]
0063  09 FD				or		ebp,edi
0065  8B 43 10				mov		eax,dword ptr 0x10[ebx]
0068  89 6B 0C				mov		dword ptr 0xc[ebx],ebp
006B  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
0071  89 F0				mov		eax,esi
0073  83 C4 04				add		esp,0x00000004
0076  5D				pop		ebp
0077  5F				pop		edi
0078  5E				pop		esi
0079  59				pop		ecx
007A  C3				ret		

Routine Size: 123 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

