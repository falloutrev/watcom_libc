Module: cmdname
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002B bytes
0000				_cmdname_:
0000  56				push		esi
0001  57				push		edi
0002  8B 35 00 00 00 00			mov		esi,dword ptr __argv
0008  89 C7				mov		edi,eax
000A  8B 36				mov		esi,dword ptr [esi]
000C  57				push		edi
000D				L$1:
000D  8A 06				mov		al,byte ptr [esi]
000F  88 07				mov		byte ptr [edi],al
0011  3C 00				cmp		al,0x00
0013  74 10				je		L$2
0015  8A 46 01				mov		al,byte ptr 0x1[esi]
0018  83 C6 02				add		esi,0x00000002
001B  88 47 01				mov		byte ptr 0x1[edi],al
001E  83 C7 02				add		edi,0x00000002
0021  3C 00				cmp		al,0x00
0023  75 E8				jne		L$1
0025				L$2:
0025  5F				pop		edi
0026  89 F8				mov		eax,edi
0028  5F				pop		edi
0029  5E				pop		esi
002A  C3				ret		

Routine Size: 43 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

