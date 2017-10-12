Module: ufputs
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000088 bytes
0000				_ufputs_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  57				push		edi
0004  C8 04 00 00			enter		0x0004,0x00
0008  89 C1				mov		ecx,eax
000A  89 D3				mov		ebx,edx
000C  8B 42 10				mov		eax,dword ptr 0x10[edx]
000F  FF 15 00 00 00 00			call		dword ptr __AccessFileH
0015  83 7A 08 00			cmp		dword ptr 0x8[edx],0x00000000
0019  75 07				jne		L$1
001B  89 D0				mov		eax,edx
001D  E8 00 00 00 00			call		__ioalloc_
0022				L$1:
0022  31 FF				xor		edi,edi
0024  F6 43 0D 04			test		byte ptr 0xd[ebx],0x04
0028  74 0D				je		L$2
002A  80 63 0D F9			and		byte ptr 0xd[ebx],0xf9
002E  BF 01 00 00 00			mov		edi,0x00000001
0033  80 4B 0D 02			or		byte ptr 0xd[ebx],0x02
0037				L$2:
0037  89 4D FC				mov		dword ptr -0x4[ebp],ecx
003A  31 F6				xor		esi,esi
003C				L$3:
003C  0F B7 01				movzx		eax,word ptr [ecx]
003F  85 C0				test		eax,eax
0041  74 10				je		L$4
0043  89 DA				mov		edx,ebx
0045  41				inc		ecx
0046  41				inc		ecx
0047  E8 00 00 00 00			call		_ufputc_
004C  83 F8 FF				cmp		eax,0xffffffff
004F  75 EB				jne		L$3
0051  89 C6				mov		esi,eax
0053				L$4:
0053  85 FF				test		edi,edi
0055  74 15				je		L$5
0057  80 63 0D F9			and		byte ptr 0xd[ebx],0xf9
005B  80 4B 0D 04			or		byte ptr 0xd[ebx],0x04
005F  85 F6				test		esi,esi
0061  75 09				jne		L$5
0063  89 D8				mov		eax,ebx
0065  E8 00 00 00 00			call		__flush_
006A  89 C6				mov		esi,eax
006C				L$5:
006C  85 F6				test		esi,esi
006E  75 07				jne		L$6
0070  89 CE				mov		esi,ecx
0072  2B 75 FC				sub		esi,dword ptr -0x4[ebp]
0075  D1 FE				sar		esi,0x01
0077				L$6:
0077  8B 43 10				mov		eax,dword ptr 0x10[ebx]
007A  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
0080  89 F0				mov		eax,esi
0082  C9				leave		
0083  5F				pop		edi
0084  5E				pop		esi
0085  59				pop		ecx
0086  5B				pop		ebx
0087  C3				ret		

Routine Size: 136 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

