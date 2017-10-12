Module: uprintf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000020 bytes
0000				_uprintf_:
0000  53				push		ebx
0001  52				push		edx
0002  C8 04 00 00			enter		0x0004,0x00
0006  8D 45 14				lea		eax,0x14[ebp]
0009  8D 5D FC				lea		ebx,-0x4[ebp]
000C  8B 55 10				mov		edx,dword ptr 0x10[ebp]
000F  89 45 FC				mov		dword ptr -0x4[ebp],eax
0012  B8 1A 00 00 00			mov		eax,offset ___iob+0x1a
0017  E8 00 00 00 00			call		__ufprtf_
001C  C9				leave		
001D  5A				pop		edx
001E  5B				pop		ebx
001F  C3				ret		

Routine Size: 32 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

