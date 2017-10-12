Module: uperror
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000004D bytes
0000				_uperror_:
0000  52				push		edx
0001  85 C0				test		eax,eax
0003  74 1F				je		L$1
0005  66 83 38 00			cmp		word ptr [eax],0x0000
0009  74 19				je		L$1
000B  BA 34 00 00 00			mov		edx,offset ___iob+0x34
0010  E8 00 00 00 00			call		_ufputs_
0015  BA 34 00 00 00			mov		edx,offset ___iob+0x34
001A  B8 00 00 00 00			mov		eax,offset DGROUP:L$2
001F  E8 00 00 00 00			call		_ufputs_
0024				L$1:
0024  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
002A  8B 40 04				mov		eax,dword ptr 0x4[eax]
002D  BA 34 00 00 00			mov		edx,offset ___iob+0x34
0032  E8 00 00 00 00			call		_ustrerror_
0037  E8 00 00 00 00			call		_ufputs_
003C  BA 34 00 00 00			mov		edx,offset ___iob+0x34
0041  B8 0A 00 00 00			mov		eax,0x0000000a
0046  E8 00 00 00 00			call		_ufputc_
004B  5A				pop		edx
004C  C3				ret		

Routine Size: 77 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000006 bytes
0000				L$2:
0000  3A 00 20 00 00 00                               :. ...

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

