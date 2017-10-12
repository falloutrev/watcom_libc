Module: fsetbits
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000059 bytes
0000				__fsetbits_:
0000  56				push		esi
0001  57				push		edi
0002  06				push		es
0003  0F A0				push		fs
0005  55				push		ebp
0006  89 D6				mov		esi,edx
0008  89 C5				mov		ebp,eax
000A  8E C1				mov		es,ecx
000C  B9 20 00 00 00			mov		ecx,0x00000020
0011  89 EF				mov		edi,ebp
0013  30 C0				xor		al,al
0015  06				push		es
0016  57				push		edi
0017  8E C2				mov		es,edx
0019  88 C4				mov		ah,al
001B  D1 E9				shr		ecx,0x01
001D  F2 66 AB				repne stosw	
0020  11 C9				adc		ecx,ecx
0022  F2 AA				repne stosb	
0024  5F				pop		edi
0025  07				pop		es
0026  8E E6				mov		fs,esi
0028  EB 21				jmp		L$2
002A				L$1:
002A  31 C0				xor		eax,eax
002C  88 D0				mov		al,dl
002E  C1 F8 03				sar		eax,0x03
0031  80 E2 07				and		dl,0x07
0034  81 E2 FF 00 00 00			and		edx,0x000000ff
003A  8A 92 00 00 00 00			mov		dl,byte ptr __Bits[edx]
0040  64 8A 34 28			mov		dh,byte ptr fs:[eax+ebp]
0044  08 D6				or		dh,dl
0046  43				inc		ebx
0047  64 88 34 28			mov		byte ptr fs:[eax+ebp],dh
004B				L$2:
004B  26 8A 13				mov		dl,byte ptr es:[ebx]
004E  84 D2				test		dl,dl
0050  75 D8				jne		L$1
0052  5D				pop		ebp
0053  0F A1				pop		fs
0055  07				pop		es
0056  5F				pop		edi
0057  5E				pop		esi
0058  C3				ret		

Routine Size: 89 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

