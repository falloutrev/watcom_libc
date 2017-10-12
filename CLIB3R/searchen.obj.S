Module: searchen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000F6 bytes
0000				_searchenv_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  C8 04 00 00			enter		0x0004,0x00
0007  89 C1				mov		ecx,eax
0009  89 D7				mov		edi,edx
000B  89 DE				mov		esi,ebx
000D  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0013  8B 40 04				mov		eax,dword ptr 0x4[eax]
0016  31 D2				xor		edx,edx
0018  89 45 FC				mov		dword ptr -0x4[ebp],eax
001B  89 C8				mov		eax,ecx
001D  E8 00 00 00 00			call		access_
0022  85 C0				test		eax,eax
0024  75 50				jne		L$3
0026  0F B6 11				movzx		edx,byte ptr [ecx]
0029  89 D8				mov		eax,ebx
002B  83 FA 5C				cmp		edx,0x0000005c
002E  74 3A				je		L$2
0030  83 FA 2E				cmp		edx,0x0000002e
0033  74 35				je		L$2
0035  83 FA 2F				cmp		edx,0x0000002f
0038  74 30				je		L$2
003A  80 39 00				cmp		byte ptr [ecx],0x00
003D  74 09				je		L$1
003F  0F B6 51 01			movzx		edx,byte ptr 0x1[ecx]
0043  83 FA 3A				cmp		edx,0x0000003a
0046  74 22				je		L$2
0048				L$1:
0048  BA 04 01 00 00			mov		edx,0x00000104
004D  89 F0				mov		eax,esi
004F  E8 00 00 00 00			call		getcwd_
0054  89 F0				mov		eax,esi
0056  E8 00 00 00 00			call		strlen_
005B  01 F0				add		eax,esi
005D  0F B6 50 FF			movzx		edx,byte ptr -0x1[eax]
0061  83 FA 5C				cmp		edx,0x0000005c
0064  74 04				je		L$2
0066  C6 00 5C				mov		byte ptr [eax],0x5c
0069  40				inc		eax
006A				L$2:
006A  89 CA				mov		edx,ecx
006C  E8 00 00 00 00			call		strcpy_
0071  C9				leave		
0072  5F				pop		edi
0073  5E				pop		esi
0074  59				pop		ecx
0075  C3				ret		
0076				L$3:
0076  89 F8				mov		eax,edi
0078  E8 00 00 00 00			call		getenv_
007D  89 C3				mov		ebx,eax
007F  85 C0				test		eax,eax
0081  0F 84 67 00 00 00			je		L$9
0087				L$4:
0087  80 3B 00				cmp		byte ptr [ebx],0x00
008A  0F 84 5E 00 00 00			je		L$9
0090  89 F0				mov		eax,esi
0092				L$5:
0092  80 3B 00				cmp		byte ptr [ebx],0x00
0095  74 10				je		L$6
0097  0F B6 13				movzx		edx,byte ptr [ebx]
009A  83 FA 3B				cmp		edx,0x0000003b
009D  74 08				je		L$6
009F  8A 13				mov		dl,byte ptr [ebx]
00A1  43				inc		ebx
00A2  88 10				mov		byte ptr [eax],dl
00A4  40				inc		eax
00A5  EB EB				jmp		L$5
00A7				L$6:
00A7  39 F0				cmp		eax,esi
00A9  74 3B				je		L$8
00AB  0F B6 50 FF			movzx		edx,byte ptr -0x1[eax]
00AF  83 FA 5C				cmp		edx,0x0000005c
00B2  74 0E				je		L$7
00B4  83 FA 2F				cmp		edx,0x0000002f
00B7  74 09				je		L$7
00B9  83 FA 3A				cmp		edx,0x0000003a
00BC  74 04				je		L$7
00BE  C6 00 5C				mov		byte ptr [eax],0x5c
00C1  40				inc		eax
00C2				L$7:
00C2  89 CA				mov		edx,ecx
00C4  C6 00 00				mov		byte ptr [eax],0x00
00C7  E8 00 00 00 00			call		strcat_
00CC  89 F0				mov		eax,esi
00CE  31 D2				xor		edx,edx
00D0  E8 00 00 00 00			call		access_
00D5  85 C0				test		eax,eax
00D7  75 0D				jne		L$8
00D9  8B 45 FC				mov		eax,dword ptr -0x4[ebp]
00DC  E8 00 00 00 00			call		__set_errno_
00E1  C9				leave		
00E2  5F				pop		edi
00E3  5E				pop		esi
00E4  59				pop		ecx
00E5  C3				ret		
00E6				L$8:
00E6  80 3B 00				cmp		byte ptr [ebx],0x00
00E9  74 03				je		L$9
00EB  43				inc		ebx
00EC  EB 99				jmp		L$4
00EE				L$9:
00EE  C6 06 00				mov		byte ptr [esi],0x00
00F1  C9				leave		
00F2  5F				pop		edi
00F3  5E				pop		esi
00F4  59				pop		ecx
00F5  C3				ret		

Routine Size: 246 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

