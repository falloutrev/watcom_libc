Module: conutwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000AB bytes
0000				__NTRealKey_:
0000  52				push		edx
0001  31 D2				xor		edx,edx
0003  66 8B 10				mov		dx,word ptr [eax]
0006  83 FA 01				cmp		edx,0x00000001
0009  75 1D				jne		L$2
000B  83 78 04 00			cmp		dword ptr 0x4[eax],0x00000000
000F  74 17				je		L$2
0011  66 8B 40 0A			mov		ax,word ptr 0xa[eax]
0015  66 3D 10 00			cmp		ax,0x0010
0019  72 06				jb		L$1
001B  66 3D 12 00			cmp		ax,0x0012
001F  76 07				jbe		L$2
0021				L$1:
0021  B8 01 00 00 00			mov		eax,0x00000001
0026  5A				pop		edx
0027  C3				ret		
0028				L$2:
0028  31 C0				xor		eax,eax
002A  5A				pop		edx
002B  C3				ret		
002C				initConsoleHandles_:
002C  51				push		ecx
002D  52				push		edx
002E  31 C0				xor		eax,eax
0030  FF 15 00 00 00 00			call		dword ptr __AccessFileH
0036  83 3D 00 00 00 00 FF		cmp		dword ptr _console_in,0xffffffff
003D  75 21				jne		L$3
003F  6A 00				push		0x00000000
0041  68 80 00 00 00			push		0x00000080
0046  6A 03				push		0x00000003
0048  6A 00				push		0x00000000
004A  6A 01				push		0x00000001
004C  68 00 00 00 80			push		0x80000000
0051  68 00 00 00 00			push		offset DGROUP:L$5
0056  E8 00 00 00 00			call		_CreateFileA
005B  A3 00 00 00 00			mov		dword ptr _console_in,eax
0060				L$3:
0060  83 3D 00 00 00 00 FF		cmp		dword ptr _console_out,0xffffffff
0067  75 21				jne		L$4
0069  6A 00				push		0x00000000
006B  68 80 00 00 00			push		0x00000080
0070  6A 03				push		0x00000003
0072  6A 00				push		0x00000000
0074  6A 02				push		0x00000002
0076  68 00 00 00 40			push		0x40000000
007B  68 07 00 00 00			push		offset DGROUP:L$6
0080  E8 00 00 00 00			call		_CreateFileA
0085  A3 00 00 00 00			mov		dword ptr _console_out,eax
008A				L$4:
008A  31 C0				xor		eax,eax
008C  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
0092  5A				pop		edx
0093  59				pop		ecx
0094  C3				ret		

Routine Size: 149 bytes,    Routine Base: _TEXT + 0000

0095				__NTConsoleInput_:
0095  E8 00 00 00 00			call		initConsoleHandles_
009A  A1 00 00 00 00			mov		eax,dword ptr _console_in
009F  C3				ret		

Routine Size: 11 bytes,    Routine Base: _TEXT + 0095

00A0				__NTConsoleOutput_:
00A0  E8 00 00 00 00			call		initConsoleHandles_
00A5  A1 00 00 00 00			mov		eax,dword ptr _console_out
00AA  C3				ret		

Routine Size: 11 bytes,    Routine Base: _TEXT + 00A0

No disassembly errors

Segment: CONST DWORD USE32 0000000F bytes
0000				L$5:
0000  63 6F 6E 69 6E 24 00                            conin$.
0007				L$6:
0007  63 6F 6E 6F 75 74 24 00                         conout$.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000008 bytes
0000				_console_in:
0000  FF FF FF FF                                     ....
0004				_console_out:
0004  FF FF FF FF                                     ....

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

