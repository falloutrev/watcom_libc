Module: fputs
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000008D bytes
0000				fputs_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  57				push		edi
0004  55				push		ebp
0005  89 C1				mov		ecx,eax
0007  89 D3				mov		ebx,edx
0009  8B 42 10				mov		eax,dword ptr 0x10[edx]
000C  FF 15 00 00 00 00			call		dword ptr __AccessFileH
0012  83 7A 08 00			cmp		dword ptr 0x8[edx],0x00000000
0016  75 07				jne		L$1
0018  89 D8				mov		eax,ebx
001A  E8 00 00 00 00			call		__ioalloc_
001F				L$1:
001F  8A 63 0D				mov		ah,byte ptr 0xd[ebx]
0022  31 FF				xor		edi,edi
0024  F6 C4 04				test		ah,0x04
0027  74 12				je		L$2
0029  88 E2				mov		dl,ah
002B  80 E2 F9				and		dl,0xf9
002E  88 D6				mov		dh,dl
0030  80 CE 02				or		dh,0x02
0033  BF 01 00 00 00			mov		edi,0x00000001
0038  88 73 0D				mov		byte ptr 0xd[ebx],dh
003B				L$2:
003B  89 CD				mov		ebp,ecx
003D  31 F6				xor		esi,esi
003F				L$3:
003F  31 C0				xor		eax,eax
0041  8A 01				mov		al,byte ptr [ecx]
0043  85 C0				test		eax,eax
0045  74 0F				je		L$4
0047  89 DA				mov		edx,ebx
0049  41				inc		ecx
004A  E8 00 00 00 00			call		fputc_
004F  83 F8 FF				cmp		eax,0xffffffff
0052  75 EB				jne		L$3
0054  89 C6				mov		esi,eax
0056				L$4:
0056  85 FF				test		edi,edi
0058  74 1A				je		L$5
005A  8A 43 0D				mov		al,byte ptr 0xd[ebx]
005D  24 F9				and		al,0xf9
005F  88 C4				mov		ah,al
0061  80 CC 04				or		ah,0x04
0064  88 63 0D				mov		byte ptr 0xd[ebx],ah
0067  85 F6				test		esi,esi
0069  75 09				jne		L$5
006B  89 D8				mov		eax,ebx
006D  E8 00 00 00 00			call		__flush_
0072  89 C6				mov		esi,eax
0074				L$5:
0074  85 F6				test		esi,esi
0076  75 04				jne		L$6
0078  89 CE				mov		esi,ecx
007A  29 EE				sub		esi,ebp
007C				L$6:
007C  8B 43 10				mov		eax,dword ptr 0x10[ebx]
007F  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
0085  89 F0				mov		eax,esi
0087  5D				pop		ebp
0088  5F				pop		edi
0089  5E				pop		esi
008A  59				pop		ecx
008B  5B				pop		ebx
008C  C3				ret		

Routine Size: 141 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

