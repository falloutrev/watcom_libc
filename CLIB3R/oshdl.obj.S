Module: oshdl
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000015 bytes
0000				_os_handle_:
0000  52				push		edx
0001  83 F8 FF				cmp		eax,0xffffffff
0004  74 0D				je		L$1
0006  89 C2				mov		edx,eax
0008  A1 00 00 00 00			mov		eax,dword ptr ___FileHandleIDs
000D  C1 E2 02				shl		edx,0x02
0010  8B 04 02				mov		eax,dword ptr [edx+eax]
0013				L$1:
0013  5A				pop		edx
0014  C3				ret		

Routine Size: 21 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

