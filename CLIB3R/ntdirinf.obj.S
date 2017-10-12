Module: ntdirinf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000B3 bytes
0000				__MakeDOSDT_:
0000  51				push		ecx
0001  56				push		esi
0002  83 EC 08				sub		esp,0x00000008
0005  89 D6				mov		esi,edx
0007  89 E2				mov		edx,esp
0009  52				push		edx
000A  50				push		eax
000B  E8 00 00 00 00			call		_FileTimeToLocalFileTime
0010  53				push		ebx
0011  56				push		esi
0012  8D 44 24 08			lea		eax,0x8[esp]
0016  50				push		eax
0017  E8 00 00 00 00			call		_FileTimeToDosDateTime
001C  83 C4 08				add		esp,0x00000008
001F  5E				pop		esi
0020  59				pop		ecx
0021  C3				ret		

Routine Size: 34 bytes,    Routine Base: _TEXT + 0000

0022				__FromDOSDT_:
0022  51				push		ecx
0023  83 EC 08				sub		esp,0x00000008
0026  89 E1				mov		ecx,esp
0028  51				push		ecx
0029  31 C9				xor		ecx,ecx
002B  66 89 D1				mov		cx,dx
002E  51				push		ecx
002F  31 C9				xor		ecx,ecx
0031  66 89 C1				mov		cx,ax
0034  51				push		ecx
0035  E8 00 00 00 00			call		_DosDateTimeToFileTime
003A  53				push		ebx
003B  8D 5C 24 04			lea		ebx,0x4[esp]
003F  53				push		ebx
0040  E8 00 00 00 00			call		_LocalFileTimeToFileTime
0045  83 C4 08				add		esp,0x00000008
0048  59				pop		ecx
0049  C3				ret		

Routine Size: 40 bytes,    Routine Base: _TEXT + 0022

004A				__GetNTDirInfo_:
004A  53				push		ebx
004B  51				push		ecx
004C  56				push		esi
004D  89 C1				mov		ecx,eax
004F  89 D6				mov		esi,edx
0051  8D 58 16				lea		ebx,0x16[eax]
0054  8D 50 18				lea		edx,0x18[eax]
0057  8D 46 14				lea		eax,0x14[esi]
005A  E8 00 00 00 00			call		__MakeDOSDT_
005F  8A 06				mov		al,byte ptr [esi]
0061  88 41 15				mov		byte ptr 0x15[ecx],al
0064  BB FF 00 00 00			mov		ebx,0x000000ff
0069  8B 46 20				mov		eax,dword ptr 0x20[esi]
006C  8D 56 2C				lea		edx,0x2c[esi]
006F  89 41 1A				mov		dword ptr 0x1a[ecx],eax
0072  8D 41 1E				lea		eax,0x1e[ecx]
0075  E8 00 00 00 00			call		strncpy_
007A  C6 81 1D 01 00 00 00		mov		byte ptr 0x11d[ecx],0x00
0081  5E				pop		esi
0082  59				pop		ecx
0083  5B				pop		ebx
0084  C3				ret		

Routine Size: 59 bytes,    Routine Base: _TEXT + 004A

0085				__NTFindNextFileWithAttr_:
0085  51				push		ecx
0086  56				push		esi
0087  57				push		edi
0088  89 C6				mov		esi,eax
008A  89 D7				mov		edi,edx
008C				L$1:
008C  83 3B 00				cmp		dword ptr [ebx],0x00000000
008F  75 06				jne		L$2
0091  C7 03 80 00 00 00			mov		dword ptr [ebx],0x00000080
0097				L$2:
0097  85 3B				test		dword ptr [ebx],edi
0099  74 09				je		L$3
009B  B8 01 00 00 00			mov		eax,0x00000001
00A0  5F				pop		edi
00A1  5E				pop		esi
00A2  59				pop		ecx
00A3  C3				ret		
00A4				L$3:
00A4  53				push		ebx
00A5  56				push		esi
00A6  E8 00 00 00 00			call		_FindNextFileA
00AB  85 C0				test		eax,eax
00AD  75 DD				jne		L$1
00AF  5F				pop		edi
00B0  5E				pop		esi
00B1  59				pop		ecx
00B2  C3				ret		

Routine Size: 46 bytes,    Routine Base: _TEXT + 0085

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

