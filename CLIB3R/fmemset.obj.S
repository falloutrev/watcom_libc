Module: fmemset
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001A bytes
0000				_fmemset_:
0000  57				push		edi
0001  89 C7				mov		edi,eax
0003  88 D8				mov		al,bl
0005  06				push		es
0006  57				push		edi
0007  8E C2				mov		es,edx
0009  88 C4				mov		ah,al
000B  D1 E9				shr		ecx,0x01
000D  F2 66 AB				repne stosw	
0010  11 C9				adc		ecx,ecx
0012  F2 AA				repne stosb	
0014  5F				pop		edi
0015  07				pop		es
0016  89 F8				mov		eax,edi
0018  5F				pop		edi
0019  C3				ret		

Routine Size: 26 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

