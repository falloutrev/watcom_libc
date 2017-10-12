Module: fjstrnic
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000105 bytes
0000				_fjstrnicmp_:
0000  56				push		esi
0001  57				push		edi
0002  55				push		ebp
0003  83 EC 0C				sub		esp,0x0000000c
0006  89 D6				mov		esi,edx
0008  89 04 24				mov		dword ptr [esp],eax
000B  89 CF				mov		edi,ecx
000D  89 DD				mov		ebp,ebx
000F				L$1:
000F  8B 54 24 20			mov		edx,dword ptr 0x20[esp]
0013  4A				dec		edx
0014  89 54 24 20			mov		dword ptr 0x20[esp],edx
0018  83 FA FF				cmp		edx,0xffffffff
001B  0F 84 D9 00 00 00			je		L$12
0021  8D 5C 24 04			lea		ebx,0x4[esp]
0025  8B 04 24				mov		eax,dword ptr [esp]
0028  8C D9				mov		ecx,ds
002A  89 F2				mov		edx,esi
002C  9A 00 00 00 00 00 00		call		_fjgetmoji_
0033  89 04 24				mov		dword ptr [esp],eax
0036  31 C0				xor		eax,eax
0038  66 8B 44 24 04			mov		ax,word ptr 0x4[esp]
003D  89 D6				mov		esi,edx
003F  83 F8 7F				cmp		eax,0x0000007f
0042  7E 1C				jle		L$3
0044  3D 81 82 00 00			cmp		eax,0x00008281
0049  7C 0C				jl		L$2
004B  3D 9A 82 00 00			cmp		eax,0x0000829a
0050  7F 05				jg		L$2
0052  8D 58 DF				lea		ebx,-0x21[eax]
0055  EB 1F				jmp		L$5
0057				L$2:
0057  31 DB				xor		ebx,ebx
0059  66 8B 5C 24 04			mov		bx,word ptr 0x4[esp]
005E  EB 16				jmp		L$5
0060				L$3:
0060  83 F8 61				cmp		eax,0x00000061
0063  7C 0A				jl		L$4
0065  83 F8 7A				cmp		eax,0x0000007a
0068  7F 05				jg		L$4
006A  8D 58 E0				lea		ebx,-0x20[eax]
006D  EB 07				jmp		L$5
006F				L$4:
006F  31 DB				xor		ebx,ebx
0071  66 8B 5C 24 04			mov		bx,word ptr 0x4[esp]
0076				L$5:
0076  89 5C 24 04			mov		dword ptr 0x4[esp],ebx
007A  8D 5C 24 08			lea		ebx,0x8[esp]
007E  8C D9				mov		ecx,ds
0080  89 FA				mov		edx,edi
0082  89 E8				mov		eax,ebp
0084  9A 00 00 00 00 00 00		call		_fjgetmoji_
008B  89 C5				mov		ebp,eax
008D  31 C0				xor		eax,eax
008F  66 8B 44 24 08			mov		ax,word ptr 0x8[esp]
0094  89 D7				mov		edi,edx
0096  83 F8 7F				cmp		eax,0x0000007f
0099  7E 1C				jle		L$7
009B  3D 81 82 00 00			cmp		eax,0x00008281
00A0  7C 0C				jl		L$6
00A2  3D 9A 82 00 00			cmp		eax,0x0000829a
00A7  7F 05				jg		L$6
00A9  8D 58 DF				lea		ebx,-0x21[eax]
00AC  EB 1F				jmp		L$9
00AE				L$6:
00AE  31 DB				xor		ebx,ebx
00B0  66 8B 5C 24 08			mov		bx,word ptr 0x8[esp]
00B5  EB 16				jmp		L$9
00B7				L$7:
00B7  83 F8 61				cmp		eax,0x00000061
00BA  7C 0A				jl		L$8
00BC  83 F8 7A				cmp		eax,0x0000007a
00BF  7F 05				jg		L$8
00C1  8D 58 E0				lea		ebx,-0x20[eax]
00C4  EB 07				jmp		L$9
00C6				L$8:
00C6  31 DB				xor		ebx,ebx
00C8  66 8B 5C 24 08			mov		bx,word ptr 0x8[esp]
00CD				L$9:
00CD  89 5C 24 08			mov		dword ptr 0x8[esp],ebx
00D1  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
00D5  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
00D9  66 39 D0				cmp		ax,dx
00DC  74 10				je		L$11
00DE  73 07				jae		L$10
00E0  B8 FF FF FF FF			mov		eax,0xffffffff
00E5  EB 15				jmp		L$13
00E7				L$10:
00E7  B8 01 00 00 00			mov		eax,0x00000001
00EC  EB 0E				jmp		L$13
00EE				L$11:
00EE  66 83 7C 24 04 00			cmp		word ptr 0x4[esp],0x0000
00F4  0F 85 15 FF FF FF			jne		L$1
00FA				L$12:
00FA  31 C0				xor		eax,eax
00FC				L$13:
00FC  83 C4 0C				add		esp,0x0000000c
00FF  5D				pop		ebp
0100  5F				pop		edi
0101  5E				pop		esi
0102  CA 04 00				retf		0x0004

Routine Size: 261 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

