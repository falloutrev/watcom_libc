Module: gtctmwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000065 bytes
0000				__getctime_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  83 EC 10				sub		esp,0x00000010
0006  89 C3				mov		ebx,eax
0008  89 E0				mov		eax,esp
000A  50				push		eax
000B  E8 00 00 00 00			call		_GetLocalTime
0010  31 C0				xor		eax,eax
0012  66 8B 04 24			mov		ax,word ptr [esp]
0016  2D 6C 07 00 00			sub		eax,0x0000076c
001B  89 43 14				mov		dword ptr 0x14[ebx],eax
001E  31 C0				xor		eax,eax
0020  66 8B 44 24 02			mov		ax,word ptr 0x2[esp]
0025  48				dec		eax
0026  89 43 10				mov		dword ptr 0x10[ebx],eax
0029  31 C0				xor		eax,eax
002B  66 8B 44 24 06			mov		ax,word ptr 0x6[esp]
0030  89 43 0C				mov		dword ptr 0xc[ebx],eax
0033  31 C0				xor		eax,eax
0035  66 8B 44 24 08			mov		ax,word ptr 0x8[esp]
003A  89 43 08				mov		dword ptr 0x8[ebx],eax
003D  31 C0				xor		eax,eax
003F  66 8B 44 24 0A			mov		ax,word ptr 0xa[esp]
0044  89 43 04				mov		dword ptr 0x4[ebx],eax
0047  31 C0				xor		eax,eax
0049  66 8B 44 24 0C			mov		ax,word ptr 0xc[esp]
004E  C7 43 20 FF FF FF FF		mov		dword ptr 0x20[ebx],0xffffffff
0055  89 03				mov		dword ptr [ebx],eax
0057  31 C0				xor		eax,eax
0059  66 8B 44 24 0E			mov		ax,word ptr 0xe[esp]
005E  83 C4 10				add		esp,0x00000010
0061  5A				pop		edx
0062  59				pop		ecx
0063  5B				pop		ebx
0064  C3				ret		

Routine Size: 101 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

