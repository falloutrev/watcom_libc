Module: fmemmove
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000062 bytes
0000				_fmemmove_:
0000  56				push		esi
0001  57				push		edi
0002  06				push		es
0003  0F A0				push		fs
0005  52				push		edx
0006  89 CE				mov		esi,ecx
0008  8B 4C 24 18			mov		ecx,dword ptr 0x18[esp]
000C  89 C2				mov		edx,eax
000E  89 D8				mov		eax,ebx
0010  39 D3				cmp		ebx,edx
0012  75 06				jne		L$1
0014  66 3B 34 24			cmp		si,word ptr [esp]
0018  74 36				je		L$4
001A				L$1:
001A  39 D0				cmp		eax,edx
001C  73 1F				jae		L$3
001E  8D 3C 08				lea		edi,[eax+ecx]
0021  39 D7				cmp		edi,edx
0023  76 18				jbe		L$3
0025  8E 24 24				mov		fs,dword ptr [esp]
0028  8E C6				mov		es,esi
002A  89 F8				mov		eax,edi
002C  01 CA				add		edx,ecx
002E				L$2:
002E  85 C9				test		ecx,ecx
0030  74 1E				je		L$4
0032  48				dec		eax
0033  4A				dec		edx
0034  26 8A 18				mov		bl,byte ptr es:[eax]
0037  49				dec		ecx
0038  64 88 1A				mov		byte ptr fs:[edx],bl
003B  EB F1				jmp		L$2
003D				L$3:
003D  8E 04 24				mov		es,dword ptr [esp]
0040  89 D7				mov		edi,edx
0042  1E				push		ds
0043  96				xchg		eax,esi
0044  8E D8				mov		ds,eax
0046  D1 E9				shr		ecx,0x01
0048  66 F3 A5				rep movsw	
004B  11 C9				adc		ecx,ecx
004D  F3 A4				rep movsb	
004F  1F				pop		ds
0050				L$4:
0050  8B 1C 24				mov		ebx,dword ptr [esp]
0053  89 D0				mov		eax,edx
0055  89 DA				mov		edx,ebx
0057  83 C4 04				add		esp,0x00000004
005A  0F A1				pop		fs
005C  07				pop		es
005D  5F				pop		edi
005E  5E				pop		esi
005F  C2 04 00				ret		0x0004

Routine Size: 98 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

