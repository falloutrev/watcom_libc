Module: ftime
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000003F bytes
0000				ftime_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  83 EC 24				sub		esp,0x00000024
0006  89 C3				mov		ebx,eax
0008  89 E0				mov		eax,esp
000A  E8 00 00 00 00			call		__getctime_
000F  66 89 43 04			mov		word ptr 0x4[ebx],ax
0013  89 E0				mov		eax,esp
0015  E8 00 00 00 00			call		mktime_
001A  89 03				mov		dword ptr [ebx],eax
001C  B9 3C 00 00 00			mov		ecx,0x0000003c
0021  8B 44 24 20			mov		eax,dword ptr 0x20[esp]
0025  31 D2				xor		edx,edx
0027  66 89 43 08			mov		word ptr 0x8[ebx],ax
002B  A1 00 00 00 00			mov		eax,dword ptr _timezone
0030  F7 F1				div		ecx
0032  66 89 43 06			mov		word ptr 0x6[ebx],ax
0036  31 C0				xor		eax,eax
0038  83 C4 24				add		esp,0x00000024
003B  5A				pop		edx
003C  59				pop		ecx
003D  5B				pop		ebx
003E  C3				ret		

Routine Size: 63 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

