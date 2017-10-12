Module: fjstrset
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000008F bytes
0000				_fjstrset_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  06				push		es
0004  55				push		ebp
0005  83 EC 0C				sub		esp,0x0000000c
0008  8E C2				mov		es,edx
000A  89 C6				mov		esi,eax
000C  66 89 5C 24 04			mov		word ptr 0x4[esp],bx
0011  89 54 24 08			mov		dword ptr 0x8[esp],edx
0015  89 D1				mov		ecx,edx
0017  89 C7				mov		edi,eax
0019  89 C5				mov		ebp,eax
001B  06				push		es
001C  8E C1				mov		es,ecx
001E  31 C0				xor		eax,eax
0020  89 C1				mov		ecx,eax
0022  49				dec		ecx
0023  F2 AE				repne scasb	
0025  F7 D1				not		ecx
0027  49				dec		ecx
0028  07				pop		es
0029  31 C0				xor		eax,eax
002B  89 CF				mov		edi,ecx
002D  66 89 D8				mov		ax,bx
0030  89 0C 24				mov		dword ptr [esp],ecx
0033  E8 00 00 00 00			call		jiszen_
0038  85 C0				test		eax,eax
003A  74 2D				je		L$3
003C  D1 EF				shr		edi,0x01
003E  31 C9				xor		ecx,ecx
0040  EB 17				jmp		L$2
0042				L$1:
0042  8C C2				mov		edx,es
0044  31 DB				xor		ebx,ebx
0046  89 F0				mov		eax,esi
0048  66 8B 5C 24 04			mov		bx,word ptr 0x4[esp]
004D  41				inc		ecx
004E  9A 00 00 00 00 00 00		call		_fjputmoji_
0055  8E C2				mov		es,edx
0057  89 C6				mov		esi,eax
0059				L$2:
0059  39 F9				cmp		ecx,edi
005B  72 E5				jb		L$1
005D  F6 04 24 01			test		byte ptr [esp],0x01
0061  74 1D				je		L$4
0063  26 C6 06 20			mov		byte ptr es:[esi],0x20
0067  EB 17				jmp		L$4
0069				L$3:
0069  8A 44 24 04			mov		al,byte ptr 0x4[esp]
006D  89 F7				mov		edi,esi
006F  06				push		es
0070  57				push		edi
0071  8E C2				mov		es,edx
0073  88 C4				mov		ah,al
0075  D1 E9				shr		ecx,0x01
0077  F2 66 AB				repne stosw	
007A  11 C9				adc		ecx,ecx
007C  F2 AA				repne stosb	
007E  5F				pop		edi
007F  07				pop		es
0080				L$4:
0080  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
0084  89 E8				mov		eax,ebp
0086  83 C4 0C				add		esp,0x0000000c
0089  5D				pop		ebp
008A  07				pop		es
008B  5F				pop		edi
008C  5E				pop		esi
008D  59				pop		ecx
008E  CB				retf		

Routine Size: 143 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

