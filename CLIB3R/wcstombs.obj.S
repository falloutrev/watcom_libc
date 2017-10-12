Module: wcstombs
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000079 bytes
0000				wcstombs_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 04				sub		esp,0x00000004
0007  89 C1				mov		ecx,eax
0009  89 D6				mov		esi,edx
000B  89 DF				mov		edi,ebx
000D  31 ED				xor		ebp,ebp
000F				L$1:
000F  8A 06				mov		al,byte ptr [esi]
0011  88 04 24				mov		byte ptr [esp],al
0014  31 C0				xor		eax,eax
0016  66 8B 06				mov		ax,word ptr [esi]
0019  C1 F8 08				sar		eax,0x08
001C  BB 02 00 00 00			mov		ebx,0x00000002
0021  25 FF 00 00 00			and		eax,0x000000ff
0026  89 E2				mov		edx,esp
0028  88 44 24 01			mov		byte ptr 0x1[esp],al
002C  31 C0				xor		eax,eax
002E  E8 00 00 00 00			call		mbtowc_
0033  89 C2				mov		edx,eax
0035  83 F8 FF				cmp		eax,0xffffffff
0038  74 37				je		L$6
003A  85 C0				test		eax,eax
003C  75 05				jne		L$2
003E  BA 01 00 00 00			mov		edx,0x00000001
0043				L$2:
0043  39 FA				cmp		edx,edi
0045  77 28				ja		L$5
0047  83 FA 01				cmp		edx,0x00000001
004A  72 13				jb		L$4
004C  76 0C				jbe		L$3
004E  83 FA 02				cmp		edx,0x00000002
0051  75 0C				jne		L$4
0053  8A 44 24 01			mov		al,byte ptr 0x1[esp]
0057  88 41 01				mov		byte ptr 0x1[ecx],al
005A				L$3:
005A  8A 04 24				mov		al,byte ptr [esp]
005D  88 01				mov		byte ptr [ecx],al
005F				L$4:
005F  80 39 00				cmp		byte ptr [ecx],0x00
0062  74 0B				je		L$5
0064  83 C6 02				add		esi,0x00000002
0067  01 D1				add		ecx,edx
0069  01 D5				add		ebp,edx
006B  29 D7				sub		edi,edx
006D  EB A0				jmp		L$1
006F				L$5:
006F  89 E8				mov		eax,ebp
0071				L$6:
0071  83 C4 04				add		esp,0x00000004
0074  5D				pop		ebp
0075  5F				pop		edi
0076  5E				pop		esi
0077  59				pop		ecx
0078  C3				ret		

Routine Size: 121 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

