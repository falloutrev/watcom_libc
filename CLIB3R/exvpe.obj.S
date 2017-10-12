Module: exvpe
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000014C bytes
0000				execvpe_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  C8 18 01 00			enter		0x0118,0x00
0007  89 C1				mov		ecx,eax
0009  89 55 F0				mov		dword ptr -0x10[ebp],edx
000C  89 5D F4				mov		dword ptr -0xc[ebp],ebx
000F  E8 00 00 00 00			call		execve_
0014  89 C2				mov		edx,eax
0016  83 F8 FF				cmp		eax,0xffffffff
0019  0F 85 26 01 00 00			jne		L$7
001F  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0025  83 78 04 01			cmp		dword ptr 0x4[eax],0x00000001
0029  74 10				je		L$1
002B  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0031  83 78 04 09			cmp		dword ptr 0x4[eax],0x00000009
0035  0F 85 0A 01 00 00			jne		L$7
003B				L$1:
003B  0F B6 01				movzx		eax,byte ptr [ecx]
003E  83 F8 5C				cmp		eax,0x0000005c
0041  0F 84 FE 00 00 00			je		L$7
0047  80 39 00				cmp		byte ptr [ecx],0x00
004A  0F 84 F5 00 00 00			je		L$7
0050  0F B6 41 01			movzx		eax,byte ptr 0x1[ecx]
0054  83 F8 3A				cmp		eax,0x0000003a
0057  0F 84 E8 00 00 00			je		L$7
005D  B8 00 00 00 00			mov		eax,offset DGROUP:L$8
0062  E8 00 00 00 00			call		getenv_
0067  89 C6				mov		esi,eax
0069  85 C0				test		eax,eax
006B  0F 84 D4 00 00 00			je		L$7
0071  89 C8				mov		eax,ecx
0073  E8 00 00 00 00			call		strlen_
0078  40				inc		eax
0079  89 45 F8				mov		dword ptr -0x8[ebp],eax
007C  B8 04 01 00 00			mov		eax,0x00000104
0081  2B 45 F8				sub		eax,dword ptr -0x8[ebp]
0084  89 45 EC				mov		dword ptr -0x14[ebp],eax
0087				L$2:
0087  80 3E 00				cmp		byte ptr [esi],0x00
008A  0F 84 B5 00 00 00			je		L$7
0090  BA 3B 00 00 00			mov		edx,0x0000003b
0095  89 F0				mov		eax,esi
0097  E8 00 00 00 00			call		strchr_
009C  89 C7				mov		edi,eax
009E  85 C0				test		eax,eax
00A0  75 0A				jne		L$3
00A2  89 F0				mov		eax,esi
00A4  E8 00 00 00 00			call		strlen_
00A9  8D 3C 06				lea		edi,[esi+eax]
00AC				L$3:
00AC  89 F8				mov		eax,edi
00AE  29 F0				sub		eax,esi
00B0  89 45 FC				mov		dword ptr -0x4[ebp],eax
00B3  3B 45 EC				cmp		eax,dword ptr -0x14[ebp]
00B6  76 1E				jbe		L$4
00B8  B8 02 00 00 00			mov		eax,0x00000002
00BD  E8 00 00 00 00			call		__set_errno_
00C2  B8 0A 00 00 00			mov		eax,0x0000000a
00C7  E8 00 00 00 00			call		__set_doserrno_
00CC  B8 FF FF FF FF			mov		eax,0xffffffff
00D1  C9				leave		
00D2  5F				pop		edi
00D3  5E				pop		esi
00D4  59				pop		ecx
00D5  C3				ret		
00D6				L$4:
00D6  89 C3				mov		ebx,eax
00D8  89 F2				mov		edx,esi
00DA  8D 85 E8 FE FF FF			lea		eax,-0x118[ebp]
00E0  E8 00 00 00 00			call		memcpy_
00E5  8D 85 E8 FE FF FF			lea		eax,-0x118[ebp]
00EB  03 45 FC				add		eax,dword ptr -0x4[ebp]
00EE  0F B6 50 FF			movzx		edx,byte ptr -0x1[eax]
00F2  83 FA 5C				cmp		edx,0x0000005c
00F5  74 04				je		L$5
00F7  C6 00 5C				mov		byte ptr [eax],0x5c
00FA  40				inc		eax
00FB				L$5:
00FB  8B 5D F8				mov		ebx,dword ptr -0x8[ebp]
00FE  89 CA				mov		edx,ecx
0100  E8 00 00 00 00			call		memcpy_
0105  8B 5D F4				mov		ebx,dword ptr -0xc[ebp]
0108  8B 55 F0				mov		edx,dword ptr -0x10[ebp]
010B  8D 85 E8 FE FF FF			lea		eax,-0x118[ebp]
0111  E8 00 00 00 00			call		execve_
0116  89 C2				mov		edx,eax
0118  83 F8 FF				cmp		eax,0xffffffff
011B  75 28				jne		L$7
011D  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0123  83 78 04 01			cmp		dword ptr 0x4[eax],0x00000001
0127  74 0C				je		L$6
0129  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
012F  83 78 04 09			cmp		dword ptr 0x4[eax],0x00000009
0133  75 10				jne		L$7
0135				L$6:
0135  0F B6 07				movzx		eax,byte ptr [edi]
0138  83 F8 3B				cmp		eax,0x0000003b
013B  75 08				jne		L$7
013D  8D 77 01				lea		esi,0x1[edi]
0140  E9 42 FF FF FF			jmp		L$2
0145				L$7:
0145  89 D0				mov		eax,edx
0147  C9				leave		
0148  5F				pop		edi
0149  5E				pop		esi
014A  59				pop		ecx
014B  C3				ret		

Routine Size: 332 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000005 bytes
0000				L$8:
0000  50 41 54 48 00                                  PATH.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

