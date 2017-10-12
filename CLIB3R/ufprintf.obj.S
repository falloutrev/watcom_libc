Module: ufprintf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001E bytes
0000				_ufprintf_:
0000  53				push		ebx
0001  52				push		edx
0002  C8 04 00 00			enter		0x0004,0x00
0006  8D 45 18				lea		eax,0x18[ebp]
0009  8D 5D FC				lea		ebx,-0x4[ebp]
000C  8B 55 14				mov		edx,dword ptr 0x14[ebp]
000F  89 45 FC				mov		dword ptr -0x4[ebp],eax
0012  8B 45 10				mov		eax,dword ptr 0x10[ebp]
0015  E8 00 00 00 00			call		__ufprtf_
001A  C9				leave		
001B  5A				pop		edx
001C  5B				pop		ebx
001D  C3				ret		

Routine Size: 30 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

