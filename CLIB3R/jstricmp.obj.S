Module: jstricmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000009F bytes
0000				jstricmp_:
0000  53				push		ebx
0001  51				push		ecx
0002  83 EC 08				sub		esp,0x00000008
0005  89 C1				mov		ecx,eax
0007  89 D3				mov		ebx,edx
0009				L$1:
0009  8D 54 24 04			lea		edx,0x4[esp]
000D  89 C8				mov		eax,ecx
000F  E8 00 00 00 00			call		jgetmoji_
0014  89 E2				mov		edx,esp
0016  89 C1				mov		ecx,eax
0018  89 D8				mov		eax,ebx
001A  E8 00 00 00 00			call		jgetmoji_
001F  89 C3				mov		ebx,eax
0021  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0025  30 C0				xor		al,al
0027  25 FF FF 00 00			and		eax,0x0000ffff
002C  74 0E				je		L$2
002E  31 C0				xor		eax,eax
0030  66 8B 44 24 04			mov		ax,word ptr 0x4[esp]
0035  E8 00 00 00 00			call		jtoupper_
003A  EB 0A				jmp		L$3
003C				L$2:
003C  66 8B 44 24 04			mov		ax,word ptr 0x4[esp]
0041  E8 00 00 00 00			call		toupper_
0046				L$3:
0046  89 44 24 04			mov		dword ptr 0x4[esp],eax
004A  8B 04 24				mov		eax,dword ptr [esp]
004D  30 C0				xor		al,al
004F  25 FF FF 00 00			and		eax,0x0000ffff
0054  74 0D				je		L$4
0056  31 C0				xor		eax,eax
0058  66 8B 04 24			mov		ax,word ptr [esp]
005C  E8 00 00 00 00			call		jtoupper_
0061  EB 09				jmp		L$5
0063				L$4:
0063  66 8B 04 24			mov		ax,word ptr [esp]
0067  E8 00 00 00 00			call		toupper_
006C				L$5:
006C  89 04 24				mov		dword ptr [esp],eax
006F  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0073  8B 14 24				mov		edx,dword ptr [esp]
0076  66 39 D0				cmp		ax,dx
0079  74 10				je		L$7
007B  73 07				jae		L$6
007D  B8 FF FF FF FF			mov		eax,0xffffffff
0082  EB 15				jmp		L$8
0084				L$6:
0084  B8 01 00 00 00			mov		eax,0x00000001
0089  EB 0E				jmp		L$8
008B				L$7:
008B  66 83 7C 24 04 00			cmp		word ptr 0x4[esp],0x0000
0091  0F 85 72 FF FF FF			jne		L$1
0097  31 C0				xor		eax,eax
0099				L$8:
0099  83 C4 08				add		esp,0x00000008
009C  59				pop		ecx
009D  5B				pop		ebx
009E  C3				ret		

Routine Size: 159 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

