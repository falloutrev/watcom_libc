Module: fstrcat
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002F bytes
0000				_fstrcat_:
0000  56				push		esi
0001  57				push		edi
0002  1E				push		ds
0003  06				push		es
0004  50				push		eax
0005  66 8E C2				mov		es,dx
0008  66 8E D9				mov		ds,cx
000B  8B F3				mov		esi,ebx
000D  8B F8				mov		edi,eax
000F  2B C9				sub		ecx,ecx
0011  49				dec		ecx
0012  B0 00				mov		al,0x00
0014  F2 AE				repne scasb	
0016  4F				dec		edi
0017				L$1:
0017  8A 06				mov		al,byte ptr [esi]
0019  AA				stosb		
001A  3C 00				cmp		al,0x00
001C  74 0B				je		L$2
001E  8A 46 01				mov		al,byte ptr 0x1[esi]
0021  83 C6 02				add		esi,0x00000002
0024  AA				stosb		
0025  3C 00				cmp		al,0x00
0027  75 EE				jne		L$1
0029				L$2:
0029  58				pop		eax
002A  07				pop		es
002B  1F				pop		ds
002C  5F				pop		edi
002D  5E				pop		esi
002E  C3				ret		

Routine Size: 47 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

