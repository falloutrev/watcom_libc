Module: ufputc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000064 bytes
0000				write_wide_char_:
0000  53				push		ebx
0001  51				push		ecx
0002  C8 08 00 00			enter		0x0008,0x00
0006  89 C1				mov		ecx,eax
0008  89 55 FC				mov		dword ptr -0x4[ebp],edx
000B  F6 40 0C 40			test		byte ptr 0xc[eax],0x40
000F  74 16				je		L$2
0011  BB 01 00 00 00			mov		ebx,0x00000001
0016  BA 02 00 00 00			mov		edx,0x00000002
001B  8D 45 FC				lea		eax,-0x4[ebp]
001E				L$1:
001E  E8 00 00 00 00			call		fwrite_
0023  C9				leave		
0024  59				pop		ecx
0025  5B				pop		ebx
0026  C3				ret		
0027				L$2:
0027  8D 45 F8				lea		eax,-0x8[ebp]
002A  0F B7 D2				movzx		edx,dx
002D  E8 00 00 00 00			call		wctomb_
0032  85 C0				test		eax,eax
0034  7E 0C				jle		L$3
0036  BB 01 00 00 00			mov		ebx,0x00000001
003B  89 C2				mov		edx,eax
003D  8D 45 F8				lea		eax,-0x8[ebp]
0040  EB DC				jmp		L$1
0042				L$3:
0042  31 C0				xor		eax,eax
0044  C9				leave		
0045  59				pop		ecx
0046  5B				pop		ebx
0047  C3				ret		

Routine Size: 72 bytes,    Routine Base: _TEXT + 0000

0048				_ufputc_:
0048  53				push		ebx
0049  89 C3				mov		ebx,eax
004B  89 D0				mov		eax,edx
004D  0F B7 D3				movzx		edx,bx
0050  E8 00 00 00 00			call		write_wide_char_
0055  85 C0				test		eax,eax
0057  75 07				jne		L$4
0059  B8 FF FF FF FF			mov		eax,0xffffffff
005E  5B				pop		ebx
005F  C3				ret		
0060				L$4:
0060  89 D8				mov		eax,ebx
0062  5B				pop		ebx
0063  C3				ret		

Routine Size: 28 bytes,    Routine Base: _TEXT + 0048

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

