Module: fstrnset
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000022 bytes
0000				_fstrnset_:
0000  56				push		esi
0001  57				push		edi
0002  06				push		es
0003  89 D7				mov		edi,edx
0005  89 C6				mov		esi,eax
0007  8E C2				mov		es,edx
0009  EB 0B				jmp		L$2
000B				L$1:
000B  26 80 38 00			cmp		byte ptr es:[eax],0x00
000F  74 09				je		L$3
0011  49				dec		ecx
0012  26 88 18				mov		byte ptr es:[eax],bl
0015  40				inc		eax
0016				L$2:
0016  85 C9				test		ecx,ecx
0018  75 F1				jne		L$1
001A				L$3:
001A  89 FA				mov		edx,edi
001C  89 F0				mov		eax,esi
001E  07				pop		es
001F  5F				pop		edi
0020  5E				pop		esi
0021  C3				ret		

Routine Size: 34 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

