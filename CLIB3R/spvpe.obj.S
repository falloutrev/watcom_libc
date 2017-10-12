Module: spvpe
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000015A bytes
0000				spawnvpe_:
0000  68 2C 01 00 00			push		0x0000012c
0005  E8 00 00 00 00			call		__CHK
000A  56				push		esi
000B  57				push		edi
000C  C8 18 01 00			enter		0x0118,0x00
0010  50				push		eax
0011  89 D6				mov		esi,edx
0013  89 5D F0				mov		dword ptr -0x10[ebp],ebx
0016  89 4D F4				mov		dword ptr -0xc[ebp],ecx
0019  E8 00 00 00 00			call		spawnve_
001E  89 C2				mov		edx,eax
0020  83 F8 FF				cmp		eax,0xffffffff
0023  0F 85 2B 01 00 00			jne		L$7
0029  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
002F  83 78 04 01			cmp		dword ptr 0x4[eax],0x00000001
0033  74 10				je		L$1
0035  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
003B  83 78 04 09			cmp		dword ptr 0x4[eax],0x00000009
003F  0F 85 0F 01 00 00			jne		L$7
0045				L$1:
0045  0F B6 06				movzx		eax,byte ptr [esi]
0048  83 F8 5C				cmp		eax,0x0000005c
004B  0F 84 03 01 00 00			je		L$7
0051  80 3E 00				cmp		byte ptr [esi],0x00
0054  0F 84 FA 00 00 00			je		L$7
005A  0F B6 46 01			movzx		eax,byte ptr 0x1[esi]
005E  83 F8 3A				cmp		eax,0x0000003a
0061  0F 84 ED 00 00 00			je		L$7
0067  B8 00 00 00 00			mov		eax,offset DGROUP:L$8
006C  E8 00 00 00 00			call		getenv_
0071  89 C1				mov		ecx,eax
0073  85 C0				test		eax,eax
0075  0F 84 D9 00 00 00			je		L$7
007B  89 F0				mov		eax,esi
007D  E8 00 00 00 00			call		strlen_
0082  40				inc		eax
0083  89 45 F8				mov		dword ptr -0x8[ebp],eax
0086  B8 04 01 00 00			mov		eax,0x00000104
008B  2B 45 F8				sub		eax,dword ptr -0x8[ebp]
008E  89 45 EC				mov		dword ptr -0x14[ebp],eax
0091				L$2:
0091  80 39 00				cmp		byte ptr [ecx],0x00
0094  0F 84 BA 00 00 00			je		L$7
009A  BA 3B 00 00 00			mov		edx,0x0000003b
009F  89 C8				mov		eax,ecx
00A1  E8 00 00 00 00			call		strchr_
00A6  89 C7				mov		edi,eax
00A8  85 C0				test		eax,eax
00AA  75 0A				jne		L$3
00AC  89 C8				mov		eax,ecx
00AE  E8 00 00 00 00			call		strlen_
00B3  8D 3C 01				lea		edi,[ecx+eax]
00B6				L$3:
00B6  89 F8				mov		eax,edi
00B8  29 C8				sub		eax,ecx
00BA  89 45 FC				mov		dword ptr -0x4[ebp],eax
00BD  3B 45 EC				cmp		eax,dword ptr -0x14[ebp]
00C0  76 1D				jbe		L$4
00C2  B8 02 00 00 00			mov		eax,0x00000002
00C7  E8 00 00 00 00			call		__set_errno_
00CC  B8 0A 00 00 00			mov		eax,0x0000000a
00D1  E8 00 00 00 00			call		__set_doserrno_
00D6  B8 FF FF FF FF			mov		eax,0xffffffff
00DB  C9				leave		
00DC  5F				pop		edi
00DD  5E				pop		esi
00DE  C3				ret		
00DF				L$4:
00DF  89 C3				mov		ebx,eax
00E1  89 CA				mov		edx,ecx
00E3  8D 85 E8 FE FF FF			lea		eax,-0x118[ebp]
00E9  E8 00 00 00 00			call		memcpy_
00EE  8D 85 E8 FE FF FF			lea		eax,-0x118[ebp]
00F4  03 45 FC				add		eax,dword ptr -0x4[ebp]
00F7  0F B6 50 FF			movzx		edx,byte ptr -0x1[eax]
00FB  83 FA 5C				cmp		edx,0x0000005c
00FE  74 04				je		L$5
0100  C6 00 5C				mov		byte ptr [eax],0x5c
0103  40				inc		eax
0104				L$5:
0104  8B 5D F8				mov		ebx,dword ptr -0x8[ebp]
0107  89 F2				mov		edx,esi
0109  8B 4D F4				mov		ecx,dword ptr -0xc[ebp]
010C  E8 00 00 00 00			call		memcpy_
0111  8B 5D F0				mov		ebx,dword ptr -0x10[ebp]
0114  8D 95 E8 FE FF FF			lea		edx,-0x118[ebp]
011A  8B 85 E4 FE FF FF			mov		eax,dword ptr -0x11c[ebp]
0120  E8 00 00 00 00			call		spawnve_
0125  89 C2				mov		edx,eax
0127  83 F8 FF				cmp		eax,0xffffffff
012A  75 28				jne		L$7
012C  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0132  83 78 04 01			cmp		dword ptr 0x4[eax],0x00000001
0136  74 0C				je		L$6
0138  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
013E  83 78 04 09			cmp		dword ptr 0x4[eax],0x00000009
0142  75 10				jne		L$7
0144				L$6:
0144  0F B6 07				movzx		eax,byte ptr [edi]
0147  83 F8 3B				cmp		eax,0x0000003b
014A  75 08				jne		L$7
014C  8D 4F 01				lea		ecx,0x1[edi]
014F  E9 3D FF FF FF			jmp		L$2
0154				L$7:
0154  89 D0				mov		eax,edx
0156  C9				leave		
0157  5F				pop		edi
0158  5E				pop		esi
0159  C3				ret		

Routine Size: 346 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000005 bytes
0000				L$8:
0000  50 41 54 48 00                                  PATH.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

