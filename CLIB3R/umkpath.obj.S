Module: umkpath
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000010C bytes
0000				pickup_:
0000  83 F8 5C				cmp		eax,0x0000005c
0003  74 05				je		L$1
0005  83 F8 2F				cmp		eax,0x0000002f
0008  75 09				jne		L$3
000A				L$1:
000A  83 3A 00				cmp		dword ptr [edx],0x00000000
000D  75 02				jne		L$2
000F  89 02				mov		dword ptr [edx],eax
0011				L$2:
0011  8B 02				mov		eax,dword ptr [edx]
0013				L$3:
0013  C3				ret		

Routine Size: 20 bytes,    Routine Base: _TEXT + 0000

0014				_u_makepath_:
0014  56				push		esi
0015  57				push		edi
0016  C8 04 00 00			enter		0x0004,0x00
001A  8B 7D 10				mov		edi,dword ptr 0x10[ebp]
001D  89 C6				mov		esi,eax
001F  C7 45 FC 00 00 00 00		mov		dword ptr -0x4[ebp],0x00000000
0026  85 D2				test		edx,edx
0028  74 15				je		L$4
002A  66 83 3A 00			cmp		word ptr [edx],0x0000
002E  74 0F				je		L$4
0030  66 8B 02				mov		ax,word ptr [edx]
0033  66 89 06				mov		word ptr [esi],ax
0036  46				inc		esi
0037  46				inc		esi
0038  66 C7 06 3A 00			mov		word ptr [esi],0x003a
003D  46				inc		esi
003E  46				inc		esi
003F				L$4:
003F  66 C7 06 00 00			mov		word ptr [esi],0x0000
0044  85 DB				test		ebx,ebx
0046  74 3E				je		L$8
0048  66 83 3B 00			cmp		word ptr [ebx],0x0000
004C  74 38				je		L$8
004E				L$5:
004E  8D 55 FC				lea		edx,-0x4[ebp]
0051  0F B7 03				movzx		eax,word ptr [ebx]
0054  E8 00 00 00 00			call		pickup_
0059  43				inc		ebx
005A  43				inc		ebx
005B  66 89 06				mov		word ptr [esi],ax
005E  46				inc		esi
005F  46				inc		esi
0060  66 83 3B 00			cmp		word ptr [ebx],0x0000
0064  75 E8				jne		L$5
0066  83 7D FC 00			cmp		dword ptr -0x4[ebp],0x00000000
006A  75 07				jne		L$6
006C  C7 45 FC 5C 00 00 00		mov		dword ptr -0x4[ebp],0x0000005c
0073				L$6:
0073  0F B7 46 FE			movzx		eax,word ptr -0x2[esi]
0077  3B 45 FC				cmp		eax,dword ptr -0x4[ebp]
007A  75 04				jne		L$7
007C  4E				dec		esi
007D  4E				dec		esi
007E  EB 06				jmp		L$8
0080				L$7:
0080  8B 45 FC				mov		eax,dword ptr -0x4[ebp]
0083  66 89 06				mov		word ptr [esi],ax
0086				L$8:
0086  83 7D FC 00			cmp		dword ptr -0x4[ebp],0x00000000
008A  75 07				jne		L$9
008C  C7 45 FC 5C 00 00 00		mov		dword ptr -0x4[ebp],0x0000005c
0093				L$9:
0093  8D 5E 02				lea		ebx,0x2[esi]
0096  85 C9				test		ecx,ecx
0098  74 34				je		L$11
009A  8D 55 FC				lea		edx,-0x4[ebp]
009D  0F B7 01				movzx		eax,word ptr [ecx]
00A0  E8 00 00 00 00			call		pickup_
00A5  3B 45 FC				cmp		eax,dword ptr -0x4[ebp]
00A8  74 0A				je		L$10
00AA  0F B7 06				movzx		eax,word ptr [esi]
00AD  3B 45 FC				cmp		eax,dword ptr -0x4[ebp]
00B0  75 02				jne		L$10
00B2  89 DE				mov		esi,ebx
00B4				L$10:
00B4  8D 55 FC				lea		edx,-0x4[ebp]
00B7  0F B7 01				movzx		eax,word ptr [ecx]
00BA  E8 00 00 00 00			call		pickup_
00BF  41				inc		ecx
00C0  41				inc		ecx
00C1  66 89 06				mov		word ptr [esi],ax
00C4  46				inc		esi
00C5  46				inc		esi
00C6  66 83 39 00			cmp		word ptr [ecx],0x0000
00CA  75 E8				jne		L$10
00CC  EB 0A				jmp		L$12
00CE				L$11:
00CE  0F B7 06				movzx		eax,word ptr [esi]
00D1  3B 45 FC				cmp		eax,dword ptr -0x4[ebp]
00D4  75 02				jne		L$12
00D6  89 DE				mov		esi,ebx
00D8				L$12:
00D8  85 FF				test		edi,edi
00DA  74 25				je		L$15
00DC  66 83 3F 00			cmp		word ptr [edi],0x0000
00E0  74 1F				je		L$15
00E2  0F B7 07				movzx		eax,word ptr [edi]
00E5  83 F8 2E				cmp		eax,0x0000002e
00E8  74 07				je		L$14
00EA  66 C7 06 2E 00			mov		word ptr [esi],0x002e
00EF				L$13:
00EF  46				inc		esi
00F0  46				inc		esi
00F1				L$14:
00F1  66 83 3F 00			cmp		word ptr [edi],0x0000
00F5  74 0A				je		L$15
00F7  66 8B 07				mov		ax,word ptr [edi]
00FA  47				inc		edi
00FB  47				inc		edi
00FC  66 89 06				mov		word ptr [esi],ax
00FF  EB EE				jmp		L$13
0101				L$15:
0101  66 C7 06 00 00			mov		word ptr [esi],0x0000
0106  C9				leave		
0107  5F				pop		edi
0108  5E				pop		esi
0109  C2 04 00				ret		0x0004

Routine Size: 248 bytes,    Routine Base: _TEXT + 0014

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

