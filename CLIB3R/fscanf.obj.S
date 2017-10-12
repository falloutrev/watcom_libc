Module: fscanf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000082 bytes
0000				cget_file_:
0000  53				push		ebx
0001  52				push		edx
0002  89 C2				mov		edx,eax
0004  8B 40 08				mov		eax,dword ptr 0x8[eax]
0007  E8 00 00 00 00			call		fgetc_
000C  89 C3				mov		ebx,eax
000E  83 F8 FF				cmp		eax,0xffffffff
0011  75 04				jne		L$1
0013  80 4A 10 02			or		byte ptr 0x10[edx],0x02
0017				L$1:
0017  89 D8				mov		eax,ebx
0019  5A				pop		edx
001A  5B				pop		ebx
001B  C3				ret		
001C				uncget_file_:
001C  8B 52 08				mov		edx,dword ptr 0x8[edx]
001F  E9 00 00 00 00			jmp		ungetc_

Routine Size: 36 bytes,    Routine Base: _TEXT + 0000

0024				vfscanf_:
0024  51				push		ecx
0025  56				push		esi
0026  57				push		edi
0027  83 EC 14				sub		esp,0x00000014
002A  89 C1				mov		ecx,eax
002C  BE 00 00 00 00			mov		esi,offset cget_file_
0031  8B 40 10				mov		eax,dword ptr 0x10[eax]
0034  BF 00 00 00 00			mov		edi,offset uncget_file_
0039  FF 15 00 00 00 00			call		dword ptr __AccessFileH
003F  89 4C 24 08			mov		dword ptr 0x8[esp],ecx
0043  89 34 24				mov		dword ptr [esp],esi
0046  89 7C 24 04			mov		dword ptr 0x4[esp],edi
004A  8B 41 10				mov		eax,dword ptr 0x10[ecx]
004D  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
0053  89 E0				mov		eax,esp
0055  E8 00 00 00 00			call		__scnf_
005A  83 C4 14				add		esp,0x00000014
005D  5F				pop		edi
005E  5E				pop		esi
005F  59				pop		ecx
0060  C3				ret		

Routine Size: 61 bytes,    Routine Base: _TEXT + 0024

0061				fscanf_:
0061  53				push		ebx
0062  52				push		edx
0063  83 EC 04				sub		esp,0x00000004
0066  8D 44 24 18			lea		eax,0x18[esp]
006A  89 E3				mov		ebx,esp
006C  8B 54 24 14			mov		edx,dword ptr 0x14[esp]
0070  89 04 24				mov		dword ptr [esp],eax
0073  8B 44 24 10			mov		eax,dword ptr 0x10[esp]
0077  E8 00 00 00 00			call		vfscanf_
007C  83 C4 04				add		esp,0x00000004
007F  5A				pop		edx
0080  5B				pop		ebx
0081  C3				ret		

Routine Size: 33 bytes,    Routine Base: _TEXT + 0061

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

