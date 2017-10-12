Module: findwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000D8 bytes
0000				_dos_findfirst_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  81 EC 40 01 00 00			sub		esp,0x00000140
0009  89 D7				mov		edi,edx
000B  89 DE				mov		esi,ebx
000D  89 E2				mov		edx,esp
000F  52				push		edx
0010  50				push		eax
0011  E8 00 00 00 00			call		_FindFirstFileA
0016  89 C1				mov		ecx,eax
0018  83 F8 FF				cmp		eax,0xffffffff
001B  75 09				jne		L$1
001D  89 03				mov		dword ptr [ebx],eax
001F  E8 00 00 00 00			call		__set_errno_nt_
0024  EB 40				jmp		L$4
0026				L$1:
0026  85 FF				test		edi,edi
0028  75 05				jne		L$2
002A  BF E7 FF FF FF			mov		edi,0xffffffe7
002F				L$2:
002F  89 E3				mov		ebx,esp
0031  89 FA				mov		edx,edi
0033  89 C8				mov		eax,ecx
0035  E8 00 00 00 00			call		__NTFindNextFileWithAttr_
003A  85 C0				test		eax,eax
003C  75 18				jne		L$3
003E  51				push		ecx
003F  C7 06 FF FF FF FF			mov		dword ptr [esi],0xffffffff
0045  E8 00 00 00 00			call		_FindClose
004A  B8 02 00 00 00			mov		eax,0x00000002
004F  E8 00 00 00 00			call		__set_errno_dos_
0054  EB 10				jmp		L$4
0056				L$3:
0056  89 E2				mov		edx,esp
0058  89 0E				mov		dword ptr [esi],ecx
005A  89 F0				mov		eax,esi
005C  89 7E 04				mov		dword ptr 0x4[esi],edi
005F  E8 00 00 00 00			call		__GetNTDirInfo_
0064  31 C0				xor		eax,eax
0066				L$4:
0066  81 C4 40 01 00 00			add		esp,0x00000140
006C  5F				pop		edi
006D  5E				pop		esi
006E  59				pop		ecx
006F  C3				ret		

Routine Size: 112 bytes,    Routine Base: _TEXT + 0000

0070				_dos_findnext_:
0070  53				push		ebx
0071  51				push		ecx
0072  52				push		edx
0073  56				push		esi
0074  81 EC 40 01 00 00			sub		esp,0x00000140
007A  89 C6				mov		esi,eax
007C  89 E0				mov		eax,esp
007E  50				push		eax
007F  8B 16				mov		edx,dword ptr [esi]
0081  52				push		edx
0082  E8 00 00 00 00			call		_FindNextFileA
0087  85 C0				test		eax,eax
0089  75 07				jne		L$6
008B				L$5:
008B  E8 00 00 00 00			call		__set_errno_nt_
0090  EB 1B				jmp		L$7
0092				L$6:
0092  89 E3				mov		ebx,esp
0094  8B 56 04				mov		edx,dword ptr 0x4[esi]
0097  8B 06				mov		eax,dword ptr [esi]
0099  E8 00 00 00 00			call		__NTFindNextFileWithAttr_
009E  85 C0				test		eax,eax
00A0  74 E9				je		L$5
00A2  89 E2				mov		edx,esp
00A4  89 F0				mov		eax,esi
00A6  E8 00 00 00 00			call		__GetNTDirInfo_
00AB  31 C0				xor		eax,eax
00AD				L$7:
00AD  81 C4 40 01 00 00			add		esp,0x00000140
00B3  5E				pop		esi
00B4  5A				pop		edx
00B5  59				pop		ecx
00B6  5B				pop		ebx
00B7  C3				ret		

Routine Size: 72 bytes,    Routine Base: _TEXT + 0070

00B8				_dos_findclose_:
00B8  51				push		ecx
00B9  52				push		edx
00BA  8B 10				mov		edx,dword ptr [eax]
00BC  83 FA FF				cmp		edx,0xffffffff
00BF  74 12				je		L$8
00C1  52				push		edx
00C2  E8 00 00 00 00			call		_FindClose
00C7  85 C0				test		eax,eax
00C9  75 08				jne		L$8
00CB  E8 00 00 00 00			call		__set_errno_nt_
00D0  5A				pop		edx
00D1  59				pop		ecx
00D2  C3				ret		
00D3				L$8:
00D3  31 C0				xor		eax,eax
00D5  5A				pop		edx
00D6  59				pop		ecx
00D7  C3				ret		

Routine Size: 32 bytes,    Routine Base: _TEXT + 00B8

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

