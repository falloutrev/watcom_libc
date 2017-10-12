Module: ustrerro
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000024 bytes
0000				_ustrerror_:
0000  52				push		edx
0001  85 C0				test		eax,eax
0003  7C 05				jl		L$1
0005  83 F8 0F				cmp		eax,0x0000000f
0008  7E 07				jle		L$2
000A				L$1:
000A  BA 00 00 00 00			mov		edx,offset DGROUP:L$4
000F  EB 07				jmp		L$3
0011				L$2:
0011  8B 14 85 00 00 00 00		mov		edx,dword ptr _sys_errlist[eax*4]
0018				L$3:
0018  B8 00 00 00 00			mov		eax,offset _Uni_Error_String
001D  E8 00 00 00 00			call		_atouni_
0022  5A				pop		edx
0023  C3				ret		

Routine Size: 36 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 0000000E bytes
0000				L$4:
0000  75 6E 6B 6E 6F 77 6E 20 65 72 72 6F 72 00       unknown error.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000050 bytes
0000				_Uni_Error_String:

BSS Size: 80 bytes

