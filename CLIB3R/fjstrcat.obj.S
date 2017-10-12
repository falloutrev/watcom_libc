Module: fjstrcat
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000086 bytes
0000				_fjstrncat_:
0000  56				push		esi
0001  57				push		edi
0002  06				push		es
0003  0F A0				push		fs
0005  0F A8				push		gs
0007  55				push		ebp
0008  83 EC 04				sub		esp,0x00000004
000B  8E EA				mov		gs,edx
000D  89 C5				mov		ebp,eax
000F  8E E1				mov		fs,ecx
0011  89 DF				mov		edi,ebx
0013  8E C2				mov		es,edx
0015  89 C6				mov		esi,eax
0017				L$1:
0017  89 E3				mov		ebx,esp
0019  8C D9				mov		ecx,ds
001B  8C C2				mov		edx,es
001D  89 F0				mov		eax,esi
001F  9A 00 00 00 00 00 00		call		_fjgetmoji_
0026  8E C2				mov		es,edx
0028  8B 14 24				mov		edx,dword ptr [esp]
002B  89 C6				mov		esi,eax
002D  66 85 D2				test		dx,dx
0030  75 E5				jne		L$1
0032  8B 5C 24 24			mov		ebx,dword ptr 0x24[esp]
0036  8C E2				mov		edx,fs
0038  89 F8				mov		eax,edi
003A  9A 00 00 00 00 00 00		call		_fmtob_
0041				L$2:
0041  48				dec		eax
0042  83 F8 FF				cmp		eax,0xffffffff
0045  74 0A				je		L$3
0047  64 8A 1F				mov		bl,byte ptr fs:[edi]
004A  47				inc		edi
004B  26 88 1E				mov		byte ptr es:[esi],bl
004E  46				inc		esi
004F  EB F0				jmp		L$2
0051				L$3:
0051  8C EA				mov		edx,gs
0053  89 E8				mov		eax,ebp
0055  26 C6 06 00			mov		byte ptr es:[esi],0x00
0059  83 C4 04				add		esp,0x00000004
005C  5D				pop		ebp
005D  0F A9				pop		gs
005F  0F A1				pop		fs
0061  07				pop		es
0062  5F				pop		edi
0063  5E				pop		esi
0064  CA 04 00				retf		0x0004

Routine Size: 103 bytes,    Routine Base: _TEXT + 0000

0067				_fjstrcat_:
0067  56				push		esi
0068  57				push		edi
0069  89 D6				mov		esi,edx
006B  89 C7				mov		edi,eax
006D  89 CA				mov		edx,ecx
006F  89 D8				mov		eax,ebx
0071  9A 00 00 00 00 00 00		call		_fjstrlen_
0078  50				push		eax
0079  89 F2				mov		edx,esi
007B  89 F8				mov		eax,edi
007D  0E				push		cs
007E  E8 00 00 00 00			call		_fjstrncat_
0083  5F				pop		edi
0084  5E				pop		esi
0085  CB				retf		

Routine Size: 31 bytes,    Routine Base: _TEXT + 0067

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

