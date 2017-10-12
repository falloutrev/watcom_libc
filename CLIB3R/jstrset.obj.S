Module: jstrset
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000071 bytes
0000				jstrset_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  57				push		edi
0004  55				push		ebp
0005  83 EC 08				sub		esp,0x00000008
0008  89 C6				mov		esi,eax
000A  89 54 24 04			mov		dword ptr 0x4[esp],edx
000E  89 C5				mov		ebp,eax
0010  31 D2				xor		edx,edx
0012  89 C7				mov		edi,eax
0014  66 8B 54 24 04			mov		dx,word ptr 0x4[esp]
0019  06				push		es
001A  8C D8				mov		eax,ds
001C  8E C0				mov		es,eax
001E  29 C9				sub		ecx,ecx
0020  49				dec		ecx
0021  31 C0				xor		eax,eax
0023  F2 AE				repne scasb	
0025  F7 D1				not		ecx
0027  49				dec		ecx
0028  07				pop		es
0029  89 D0				mov		eax,edx
002B  89 0C 24				mov		dword ptr [esp],ecx
002E  E8 00 00 00 00			call		jiszen_
0033  85 C0				test		eax,eax
0035  74 26				je		L$3
0037  D1 E9				shr		ecx,0x01
0039  31 DB				xor		ebx,ebx
003B  EB 11				jmp		L$2
003D				L$1:
003D  31 D2				xor		edx,edx
003F  89 F0				mov		eax,esi
0041  66 8B 54 24 04			mov		dx,word ptr 0x4[esp]
0046  43				inc		ebx
0047  E8 00 00 00 00			call		jputmoji_
004C  89 C6				mov		esi,eax
004E				L$2:
004E  39 CB				cmp		ebx,ecx
0050  72 EB				jb		L$1
0052  F6 04 24 01			test		byte ptr [esp],0x01
0056  74 0E				je		L$4
0058  C6 06 20				mov		byte ptr [esi],0x20
005B  EB 09				jmp		L$4
005D				L$3:
005D  89 CB				mov		ebx,ecx
005F  89 F0				mov		eax,esi
0061  E8 00 00 00 00			call		memset_
0066				L$4:
0066  89 E8				mov		eax,ebp
0068  83 C4 08				add		esp,0x00000008
006B  5D				pop		ebp
006C  5F				pop		edi
006D  5E				pop		esi
006E  59				pop		ecx
006F  5B				pop		ebx
0070  C3				ret		

Routine Size: 113 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

