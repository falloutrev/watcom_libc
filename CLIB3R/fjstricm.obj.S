Module: fjstricm
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000C1 bytes
0000				_fjstricmp_:
0000  56				push		esi
0001  57				push		edi
0002  83 EC 0C				sub		esp,0x0000000c
0005  52				push		edx
0006  89 C7				mov		edi,eax
0008  89 4C 24 0C			mov		dword ptr 0xc[esp],ecx
000C  89 DE				mov		esi,ebx
000E				L$1:
000E  8D 5C 24 04			lea		ebx,0x4[esp]
0012  8B 14 24				mov		edx,dword ptr [esp]
0015  8C D9				mov		ecx,ds
0017  89 F8				mov		eax,edi
0019  9A 00 00 00 00 00 00		call		_fjgetmoji_
0020  8D 5C 24 08			lea		ebx,0x8[esp]
0024  89 14 24				mov		dword ptr [esp],edx
0027  89 C7				mov		edi,eax
0029  8C D9				mov		ecx,ds
002B  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
002F  89 F0				mov		eax,esi
0031  9A 00 00 00 00 00 00		call		_fjgetmoji_
0038  89 C6				mov		esi,eax
003A  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
003E  89 54 24 0C			mov		dword ptr 0xc[esp],edx
0042  30 C0				xor		al,al
0044  25 FF FF 00 00			and		eax,0x0000ffff
0049  74 0E				je		L$2
004B  31 C0				xor		eax,eax
004D  66 8B 44 24 04			mov		ax,word ptr 0x4[esp]
0052  E8 00 00 00 00			call		jtoupper_
0057  EB 0A				jmp		L$3
0059				L$2:
0059  66 8B 44 24 04			mov		ax,word ptr 0x4[esp]
005E  E8 00 00 00 00			call		toupper_
0063				L$3:
0063  89 44 24 04			mov		dword ptr 0x4[esp],eax
0067  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
006B  30 C0				xor		al,al
006D  25 FF FF 00 00			and		eax,0x0000ffff
0072  74 0E				je		L$4
0074  31 C0				xor		eax,eax
0076  66 8B 44 24 08			mov		ax,word ptr 0x8[esp]
007B  E8 00 00 00 00			call		jtoupper_
0080  EB 0A				jmp		L$5
0082				L$4:
0082  66 8B 44 24 08			mov		ax,word ptr 0x8[esp]
0087  E8 00 00 00 00			call		toupper_
008C				L$5:
008C  89 44 24 08			mov		dword ptr 0x8[esp],eax
0090  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0094  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
0098  66 39 D0				cmp		ax,dx
009B  74 10				je		L$7
009D  73 07				jae		L$6
009F  B8 FF FF FF FF			mov		eax,0xffffffff
00A4  EB 15				jmp		L$8
00A6				L$6:
00A6  B8 01 00 00 00			mov		eax,0x00000001
00AB  EB 0E				jmp		L$8
00AD				L$7:
00AD  66 83 7C 24 04 00			cmp		word ptr 0x4[esp],0x0000
00B3  0F 85 55 FF FF FF			jne		L$1
00B9  31 C0				xor		eax,eax
00BB				L$8:
00BB  83 C4 10				add		esp,0x00000010
00BE  5F				pop		edi
00BF  5E				pop		esi
00C0  CB				retf		

Routine Size: 193 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

