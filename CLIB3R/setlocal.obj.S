Module: setlocal
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000087 bytes
0000				setlocale_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  57				push		edi
0004  89 C7				mov		edi,eax
0006  89 D6				mov		esi,edx
0008  85 C0				test		eax,eax
000A  7C 05				jl		L$1
000C  83 F8 06				cmp		eax,0x00000006
000F  7E 07				jle		L$2
0011				L$1:
0011  31 C0				xor		eax,eax
0013  5F				pop		edi
0014  5E				pop		esi
0015  59				pop		ecx
0016  5B				pop		ebx
0017  C3				ret		
0018				L$2:
0018  85 D2				test		edx,edx
001A  75 0A				jne		L$3
001C  31 C9				xor		ecx,ecx
001E  8A 88 00 00 00 00			mov		cl,byte ptr __LocaleSetting[eax]
0024  EB 55				jmp		L$8
0026				L$3:
0026  8A 22				mov		ah,byte ptr [edx]
0028  31 C9				xor		ecx,ecx
002A  84 E4				test		ah,ah
002C  75 13				jne		L$5
002E  EB 1D				jmp		L$7
0030				L$4:
0030  89 F0				mov		eax,esi
0032  E8 00 00 00 00			call		strcmp_
0037  85 C0				test		eax,eax
0039  74 12				je		L$7
003B  83 C3 04				add		ebx,0x00000004
003E  41				inc		ecx
003F  EB 02				jmp		L$6
0041				L$5:
0041  31 DB				xor		ebx,ebx
0043				L$6:
0043  8B 93 00 00 00 00			mov		edx,dword ptr _ValidLocales[ebx]
0049  85 D2				test		edx,edx
004B  75 E3				jne		L$4
004D				L$7:
004D  83 F9 02				cmp		ecx,0x00000002
0050  74 29				je		L$8
0052  88 8F 00 00 00 00			mov		byte ptr __LocaleSetting[edi],cl
0058  83 FF 06				cmp		edi,0x00000006
005B  75 1E				jne		L$8
005D  88 0D 03 00 00 00			mov		byte ptr __LocaleSetting+0x3,cl
0063  88 0D 00 00 00 00			mov		byte ptr __LocaleSetting,cl
0069  88 0D 01 00 00 00			mov		byte ptr __LocaleSetting+0x1,cl
006F  88 0D 02 00 00 00			mov		byte ptr __LocaleSetting+0x2,cl
0075  88 0D 04 00 00 00			mov		byte ptr __LocaleSetting+0x4,cl
007B				L$8:
007B  8B 04 8D 00 00 00 00		mov		eax,dword ptr _ValidLocales[ecx*4]
0082  5F				pop		edi
0083  5E				pop		esi
0084  59				pop		ecx
0085  5B				pop		ebx
0086  C3				ret		

Routine Size: 135 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000003 bytes
0000				L$9:
0000  43 00                                           C.
0002				L$10:
0002  00                                              .

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 0000000C bytes
0000				_ValidLocales:
0000  00 00 00 00                                     DD	offset DGROUP:L$9
0004  02 00 00 00                                     DD	offset DGROUP:L$10
0008  00 00 00 00                                     ....

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

