Module: mbtowc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000095 bytes
0000				mbtowc_:
0000  51				push		ecx
0001  56				push		esi
0002  89 C1				mov		ecx,eax
0004  89 D6				mov		esi,edx
0006  85 D2				test		edx,edx
0008  75 05				jne		L$2
000A				L$1:
000A  31 C0				xor		eax,eax
000C  5E				pop		esi
000D  59				pop		ecx
000E  C3				ret		
000F				L$2:
000F  85 DB				test		ebx,ebx
0011  74 F7				je		L$1
0013  8A 12				mov		dl,byte ptr [edx]
0015  85 C0				test		eax,eax
0017  74 07				je		L$3
0019  30 E4				xor		ah,ah
001B  88 D0				mov		al,dl
001D  66 89 01				mov		word ptr [ecx],ax
0020				L$3:
0020  84 D2				test		dl,dl
0022  74 E6				je		L$1
0024  31 C0				xor		eax,eax
0026  88 D0				mov		al,dl
0028  3D 81 00 00 00			cmp		eax,0x00000081
002D  7C 07				jl		L$4
002F  3D 9F 00 00 00			cmp		eax,0x0000009f
0034  7E 12				jle		L$5
0036				L$4:
0036  31 C0				xor		eax,eax
0038  88 D0				mov		al,dl
003A  3D E0 00 00 00			cmp		eax,0x000000e0
003F  7C 4C				jl		L$10
0041  3D FC 00 00 00			cmp		eax,0x000000fc
0046  7F 45				jg		L$10
0048				L$5:
0048  83 FB 01				cmp		ebx,0x00000001
004B  76 05				jbe		L$6
004D  8A 76 01				mov		dh,byte ptr 0x1[esi]
0050  EB 02				jmp		L$7
0052				L$6:
0052  30 F6				xor		dh,dh
0054				L$7:
0054  31 C0				xor		eax,eax
0056  88 F0				mov		al,dh
0058  83 F8 40				cmp		eax,0x00000040
005B  7C 28				jl		L$9
005D  3D FC 00 00 00			cmp		eax,0x000000fc
0062  7F 21				jg		L$9
0064  83 F8 7F				cmp		eax,0x0000007f
0067  74 1C				je		L$9
0069  85 C9				test		ecx,ecx
006B  74 10				je		L$8
006D  30 E4				xor		ah,ah
006F  88 D0				mov		al,dl
0071  C1 E0 08				shl		eax,0x08
0074  88 F2				mov		dl,dh
0076  30 F6				xor		dh,dh
0078  01 D0				add		eax,edx
007A  66 89 01				mov		word ptr [ecx],ax
007D				L$8:
007D  B8 02 00 00 00			mov		eax,0x00000002
0082  5E				pop		esi
0083  59				pop		ecx
0084  C3				ret		
0085				L$9:
0085  B8 FF FF FF FF			mov		eax,0xffffffff
008A  5E				pop		esi
008B  59				pop		ecx
008C  C3				ret		
008D				L$10:
008D  B8 01 00 00 00			mov		eax,0x00000001
0092  5E				pop		esi
0093  59				pop		ecx
0094  C3				ret		

Routine Size: 149 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

