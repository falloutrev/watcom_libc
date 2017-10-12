Module: jstrnicm
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000AF bytes
0000				jstrnicmp_:
0000  51				push		ecx
0001  56				push		esi
0002  83 EC 08				sub		esp,0x00000008
0005  89 C1				mov		ecx,eax
0007  89 D6				mov		esi,edx
0009				L$1:
0009  4B				dec		ebx
000A  83 FB FF				cmp		ebx,0xffffffff
000D  0F 84 94 00 00 00			je		L$8
0013  8D 54 24 04			lea		edx,0x4[esp]
0017  89 C8				mov		eax,ecx
0019  E8 00 00 00 00			call		jgetmoji_
001E  89 C1				mov		ecx,eax
0020  31 C0				xor		eax,eax
0022  66 8B 44 24 04			mov		ax,word ptr 0x4[esp]
0027  E8 00 00 00 00			call		jiszen_
002C  85 C0				test		eax,eax
002E  74 0E				je		L$2
0030  31 C0				xor		eax,eax
0032  66 8B 44 24 04			mov		ax,word ptr 0x4[esp]
0037  E8 00 00 00 00			call		jtoupper_
003C  EB 0A				jmp		L$3
003E				L$2:
003E  66 8B 44 24 04			mov		ax,word ptr 0x4[esp]
0043  E8 00 00 00 00			call		toupper_
0048				L$3:
0048  89 44 24 04			mov		dword ptr 0x4[esp],eax
004C  89 E2				mov		edx,esp
004E  89 F0				mov		eax,esi
0050  E8 00 00 00 00			call		jgetmoji_
0055  89 C6				mov		esi,eax
0057  31 C0				xor		eax,eax
0059  66 8B 04 24			mov		ax,word ptr [esp]
005D  E8 00 00 00 00			call		jiszen_
0062  85 C0				test		eax,eax
0064  74 0D				je		L$4
0066  31 C0				xor		eax,eax
0068  66 8B 04 24			mov		ax,word ptr [esp]
006C  E8 00 00 00 00			call		jtoupper_
0071  EB 09				jmp		L$5
0073				L$4:
0073  66 8B 04 24			mov		ax,word ptr [esp]
0077  E8 00 00 00 00			call		toupper_
007C				L$5:
007C  89 04 24				mov		dword ptr [esp],eax
007F  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0083  8B 14 24				mov		edx,dword ptr [esp]
0086  66 39 D0				cmp		ax,dx
0089  74 10				je		L$7
008B  73 07				jae		L$6
008D  B8 FF FF FF FF			mov		eax,0xffffffff
0092  EB 15				jmp		L$9
0094				L$6:
0094  B8 01 00 00 00			mov		eax,0x00000001
0099  EB 0E				jmp		L$9
009B				L$7:
009B  66 83 7C 24 04 00			cmp		word ptr 0x4[esp],0x0000
00A1  0F 85 62 FF FF FF			jne		L$1
00A7				L$8:
00A7  31 C0				xor		eax,eax
00A9				L$9:
00A9  83 C4 08				add		esp,0x00000008
00AC  5E				pop		esi
00AD  59				pop		ecx
00AE  C3				ret		

Routine Size: 175 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

