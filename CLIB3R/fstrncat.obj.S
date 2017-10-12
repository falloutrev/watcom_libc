Module: fstrncat
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000005A bytes
0000				_fstrncat_:
0000  56				push		esi
0001  57				push		edi
0002  06				push		es
0003  0F A0				push		fs
0005  55				push		ebp
0006  83 EC 04				sub		esp,0x00000004
0009  8B 74 24 1C			mov		esi,dword ptr 0x1c[esp]
000D  89 14 24				mov		dword ptr [esp],edx
0010  89 C5				mov		ebp,eax
0012  8E E1				mov		fs,ecx
0014  B9 FF FF FF FF			mov		ecx,0xffffffff
0019  89 EF				mov		edi,ebp
001B  30 C0				xor		al,al
001D  06				push		es
001E  E3 0B				jecxz		L$1
0020  8E C2				mov		es,edx
0022  F2 AE				repne scasb	
0024  75 05				jne		L$1
0026  4F				dec		edi
0027  8C C1				mov		ecx,es
0029  66 A9                                           f.
002B				L$1:
002B  89 CF				mov		edi,ecx
002D  07				pop		es
002E  8E C1				mov		es,ecx
0030  89 F8				mov		eax,edi
0032				L$2:
0032  85 F6				test		esi,esi
0034  74 0F				je		L$3
0036  64 8A 13				mov		dl,byte ptr fs:[ebx]
0039  26 88 10				mov		byte ptr es:[eax],dl
003C  84 D2				test		dl,dl
003E  74 05				je		L$3
0040  40				inc		eax
0041  43				inc		ebx
0042  4E				dec		esi
0043  EB ED				jmp		L$2
0045				L$3:
0045  8B 14 24				mov		edx,dword ptr [esp]
0048  26 C6 00 00			mov		byte ptr es:[eax],0x00
004C  89 E8				mov		eax,ebp
004E  83 C4 04				add		esp,0x00000004
0051  5D				pop		ebp
0052  0F A1				pop		fs
0054  07				pop		es
0055  5F				pop		edi
0056  5E				pop		esi
0057  C2 04 00				ret		0x0004

Routine Size: 90 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

