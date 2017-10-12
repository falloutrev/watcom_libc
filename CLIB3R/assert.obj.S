Module: assert
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001F bytes
0000				__assert_:
0000  85 C0				test		eax,eax
0002  75 1A				jne		L$1
0004  51				push		ecx
0005  53				push		ebx
0006  52				push		edx
0007  68 00 00 00 00			push		offset DGROUP:L$2
000C  68 34 00 00 00			push		offset ___iob+0x34
0011  E8 00 00 00 00			call		fprintf_
0016  83 C4 14				add		esp,0x00000014
0019  E9 00 00 00 00			jmp		abort_
001E				L$1:
001E  C3				ret		

Routine Size: 31 bytes,    Routine Base: _TEXT + 0000

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

