Module: strcat
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000033 bytes
0000				strcat_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  89 D6				mov		esi,edx
0005  89 C7				mov		edi,eax
0007  06				push		es
0008  1E				push		ds
0009  07				pop		es
000A  57				push		edi
000B  2B C9				sub		ecx,ecx
000D  49				dec		ecx
000E  B0 00				mov		al,0x00
0010  F2 AE				repne scasb	
0012  4F				dec		edi
0013				L$1:
0013  8A 06				mov		al,byte ptr [esi]
0015  88 07				mov		byte ptr [edi],al
0017  3C 00				cmp		al,0x00
0019  74 10				je		L$2
001B  8A 46 01				mov		al,byte ptr 0x1[esi]
001E  83 C6 02				add		esi,0x00000002
0021  88 47 01				mov		byte ptr 0x1[edi],al
0024  83 C7 02				add		edi,0x00000002
0027  3C 00				cmp		al,0x00
0029  75 E8				jne		L$1
002B				L$2:
002B  5F				pop		edi
002C  07				pop		es
002D  89 F8				mov		eax,edi
002F  5F				pop		edi
0030  5E				pop		esi
0031  59				pop		ecx
0032  C3				ret		

Routine Size: 51 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

