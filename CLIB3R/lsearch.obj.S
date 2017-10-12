Module: lsearch
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000037 bytes
0000				lsearch_:
0000  56				push		esi
0001  57				push		edi
0002  55				push		ebp
0003  89 E5				mov		ebp,esp
0005  50				push		eax
0006  89 D7				mov		edi,edx
0008  89 DE				mov		esi,ebx
000A  89 CB				mov		ebx,ecx
000C  8B 0E				mov		ecx,dword ptr [esi]
000E  EB 0F				jmp		L$2
0010				L$1:
0010  8B 45 FC				mov		eax,dword ptr -0x4[ebp]
0013  89 FA				mov		edx,edi
0015  FF 55 10				call		dword ptr 0x10[ebp]
0018  85 C0				test		eax,eax
001A  74 13				je		L$3
001C  49				dec		ecx
001D  01 DF				add		edi,ebx
001F				L$2:
001F  85 C9				test		ecx,ecx
0021  75 ED				jne		L$1
0023  8B 55 FC				mov		edx,dword ptr -0x4[ebp]
0026  89 F8				mov		eax,edi
0028  E8 00 00 00 00			call		memcpy_
002D  FF 06				inc		dword ptr [esi]
002F				L$3:
002F  89 F8				mov		eax,edi
0031  C9				leave		
0032  5F				pop		edi
0033  5E				pop		esi
0034  C2 04 00				ret		0x0004

Routine Size: 55 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

