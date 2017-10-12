Module: uassert
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002D bytes
0000				__uassert_:
0000  C8 64 00 00			enter		0x0064,0x00
0004  85 C0				test		eax,eax
0006  75 23				jne		L$1
0008  51				push		ecx
0009  53				push		ebx
000A  52				push		edx
000B  8D 45 9C				lea		eax,-0x64[ebp]
000E  BA 00 00 00 00			mov		edx,offset DGROUP:L$2
0013  E8 00 00 00 00			call		_atouni_
0018  50				push		eax
0019  68 34 00 00 00			push		offset ___iob+0x34
001E  E8 00 00 00 00			call		_ufprintf_
0023  83 C4 14				add		esp,0x00000014
0026  E8 00 00 00 00			call		abort_
002B				L$1:
002B  C9				leave		
002C  C3				ret		

Routine Size: 45 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 0000002A bytes
0000				L$2:
0000  41 73 73 65 72 74 69 6F 6E 20 66 61 69 6C 65 64 Assertion failed
0010  3A 20 25 68 73 2C 20 66 69 6C 65 20 25 68 73 2C : %hs, file %hs,
0020  20 6C 69 6E 65 20 25 64 0A 00                    line %d..

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

