Module: fjstrncp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000AC bytes
0000				_fjstrncpy_:
0000  56				push		esi
0001  57				push		edi
0002  06				push		es
0003  0F A0				push		fs
0005  0F A8				push		gs
0007  55				push		ebp
0008  83 EC 10				sub		esp,0x00000010
000B  8B 6C 24 30			mov		ebp,dword ptr 0x30[esp]
000F  89 54 24 08			mov		dword ptr 0x8[esp],edx
0013  89 44 24 04			mov		dword ptr 0x4[esp],eax
0017  8E E1				mov		fs,ecx
0019  8E C2				mov		es,edx
001B  31 D2				xor		edx,edx
001D  E9 70 00 00 00			jmp		L$6
0022				L$1:
0022  64 0F B6 33			movzx		esi,byte ptr fs:[ebx]
0026  8A 8E 01 00 00 00			mov		cl,byte ptr __IsKTable+0x1[esi]
002C  8C 44 24 0C			mov		dword ptr 0xc[esp],es
0030  80 E1 04				and		cl,0x04
0033  8C E7				mov		edi,fs
0035  0F B6 F1				movzx		esi,cl
0038  8E EF				mov		gs,edi
003A  89 34 24				mov		dword ptr [esp],esi
003D  8D 7B 01				lea		edi,0x1[ebx]
0040  8B 0C 24				mov		ecx,dword ptr [esp]
0043  8D 70 01				lea		esi,0x1[eax]
0046  85 C9				test		ecx,ecx
0048  74 2B				je		L$3
004A  64 8A 1B				mov		bl,byte ptr fs:[ebx]
004D  26 88 18				mov		byte ptr es:[eax],bl
0050  65 8A 07				mov		al,byte ptr gs:[edi]
0053  8E 6C 24 0C			mov		gs,dword ptr 0xc[esp]
0057  8D 5F 01				lea		ebx,0x1[edi]
005A  88 C1				mov		cl,al
005C  65 88 06				mov		byte ptr gs:[esi],al
005F  8D 46 01				lea		eax,0x1[esi]
0062  84 C9				test		cl,cl
0064  75 2B				jne		L$5
0066  83 E8 02				sub		eax,0x00000002
0069				L$2:
0069  42				inc		edx
006A  39 EA				cmp		edx,ebp
006C  77 28				ja		L$7
006E  26 C6 00 00			mov		byte ptr es:[eax],0x00
0072  40				inc		eax
0073  EB F4				jmp		L$2
0075				L$3:
0075  64 8A 1B				mov		bl,byte ptr fs:[ebx]
0078  88 D9				mov		cl,bl
007A  26 88 18				mov		byte ptr es:[eax],bl
007D  89 FB				mov		ebx,edi
007F  89 F0				mov		eax,esi
0081  84 C9				test		cl,cl
0083  75 0C				jne		L$5
0085				L$4:
0085  42				inc		edx
0086  39 EA				cmp		edx,ebp
0088  73 0C				jae		L$7
008A  26 C6 00 00			mov		byte ptr es:[eax],0x00
008E  40				inc		eax
008F  EB F4				jmp		L$4
0091				L$5:
0091  42				inc		edx
0092				L$6:
0092  39 EA				cmp		edx,ebp
0094  72 8C				jb		L$1
0096				L$7:
0096  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
009A  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
009E  83 C4 10				add		esp,0x00000010
00A1  5D				pop		ebp
00A2  0F A9				pop		gs
00A4  0F A1				pop		fs
00A6  07				pop		es
00A7  5F				pop		edi
00A8  5E				pop		esi
00A9  CA 04 00				retf		0x0004

Routine Size: 172 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

