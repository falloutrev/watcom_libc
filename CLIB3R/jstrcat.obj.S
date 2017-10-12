Module: jstrcat
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000005B bytes
0000				jstrncat_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  83 EC 04				sub		esp,0x00000004
0006  89 C6				mov		esi,eax
0008  89 D1				mov		ecx,edx
000A  89 DF				mov		edi,ebx
000C  89 C3				mov		ebx,eax
000E				L$1:
000E  89 E2				mov		edx,esp
0010  89 D8				mov		eax,ebx
0012  E8 00 00 00 00			call		jgetmoji_
0017  8B 14 24				mov		edx,dword ptr [esp]
001A  89 C3				mov		ebx,eax
001C  66 85 D2				test		dx,dx
001F  75 ED				jne		L$1
0021  89 FA				mov		edx,edi
0023  89 C8				mov		eax,ecx
0025  E8 00 00 00 00			call		mtob_
002A				L$2:
002A  48				dec		eax
002B  83 F8 FF				cmp		eax,0xffffffff
002E  74 08				je		L$3
0030  8A 11				mov		dl,byte ptr [ecx]
0032  41				inc		ecx
0033  88 13				mov		byte ptr [ebx],dl
0035  43				inc		ebx
0036  EB F2				jmp		L$2
0038				L$3:
0038  89 F0				mov		eax,esi
003A  C6 03 00				mov		byte ptr [ebx],0x00
003D  83 C4 04				add		esp,0x00000004
0040  5F				pop		edi
0041  5E				pop		esi
0042  59				pop		ecx
0043  C3				ret		

Routine Size: 68 bytes,    Routine Base: _TEXT + 0000

0044				jstrcat_:
0044  53				push		ebx
0045  51				push		ecx
0046  89 C1				mov		ecx,eax
0048  89 D0				mov		eax,edx
004A  E8 00 00 00 00			call		jstrlen_
004F  89 C3				mov		ebx,eax
0051  89 C8				mov		eax,ecx
0053  E8 00 00 00 00			call		jstrncat_
0058  59				pop		ecx
0059  5B				pop		ebx
005A  C3				ret		

Routine Size: 23 bytes,    Routine Base: _TEXT + 0044

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

