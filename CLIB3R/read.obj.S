Module: read
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001A7 bytes
0000				read_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 10				sub		esp,0x00000010
0007  50				push		eax
0008  89 D5				mov		ebp,edx
000A  8B 15 00 00 00 00			mov		edx,dword ptr ___FileHandleIDs
0010  8B 04 82				mov		eax,dword ptr [edx+eax*4]
0013  89 44 24 0C			mov		dword ptr 0xc[esp],eax
0017  8B 04 24				mov		eax,dword ptr [esp]
001A  E8 00 00 00 00			call		__IOMode_
001F  89 C2				mov		edx,eax
0021  89 44 24 08			mov		dword ptr 0x8[esp],eax
0025  85 C0				test		eax,eax
0027  75 14				jne		L$2
0029  B8 04 00 00 00			mov		eax,0x00000004
002E  E8 00 00 00 00			call		__set_errno_
0033				L$1:
0033  B8 FF FF FF FF			mov		eax,0xffffffff
0038  E9 62 01 00 00			jmp		L$16
003D				L$2:
003D  8B 04 24				mov		eax,dword ptr [esp]
0040  FF 15 00 00 00 00			call		dword ptr __AccessFileH
0046  F6 C2 01				test		dl,0x01
0049  75 15				jne		L$3
004B  B8 06 00 00 00			mov		eax,0x00000006
0050  E8 00 00 00 00			call		__set_errno_
0055  8B 04 24				mov		eax,dword ptr [esp]
0058  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
005E  EB D3				jmp		L$1
0060				L$3:
0060  F6 C2 40				test		dl,0x40
0063  74 65				je		L$6
0065  83 3D 00 00 00 00 00		cmp		dword ptr __WindowsStdin,0x00000000
006C  74 1C				je		L$4
006E  8B 04 24				mov		eax,dword ptr [esp]
0071  FF 15 00 00 00 00			call		dword ptr __WindowsIsWindowedHandle
0077  85 C0				test		eax,eax
0079  74 0F				je		L$4
007B  89 EA				mov		edx,ebp
007D  FF 15 00 00 00 00			call		dword ptr __WindowsStdin
0083  89 C7				mov		edi,eax
0085  E9 0A 01 00 00			jmp		L$14
008A				L$4:
008A  6A 00				push		0x00000000
008C  8D 44 24 08			lea		eax,0x8[esp]
0090  50				push		eax
0091  53				push		ebx
0092  55				push		ebp
0093  8B 5C 24 1C			mov		ebx,dword ptr 0x1c[esp]
0097  53				push		ebx
0098  E8 00 00 00 00			call		_ReadFile
009D  8B 7C 24 04			mov		edi,dword ptr 0x4[esp]
00A1  85 C0				test		eax,eax
00A3  0F 85 EB 00 00 00			jne		L$14
00A9  8B 04 24				mov		eax,dword ptr [esp]
00AC  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
00B2  E8 00 00 00 00			call		_GetLastError
00B7  83 F8 6D				cmp		eax,0x0000006d
00BA  0F 84 DD 00 00 00			je		L$15
00C0				L$5:
00C0  E8 00 00 00 00			call		__set_errno_nt_
00C5  E9 D5 00 00 00			jmp		L$16
00CA				L$6:
00CA  89 5C 24 10			mov		dword ptr 0x10[esp],ebx
00CE  31 FF				xor		edi,edi
00D0				L$7:
00D0  83 3D 00 00 00 00 00		cmp		dword ptr __WindowsStdin,0x00000000
00D7  74 1F				je		L$8
00D9  8B 04 24				mov		eax,dword ptr [esp]
00DC  FF 15 00 00 00 00			call		dword ptr __WindowsIsWindowedHandle
00E2  85 C0				test		eax,eax
00E4  74 12				je		L$8
00E6  8B 5C 24 10			mov		ebx,dword ptr 0x10[esp]
00EA  89 EA				mov		edx,ebp
00EC  FF 15 00 00 00 00			call		dword ptr __WindowsStdin
00F2  89 44 24 04			mov		dword ptr 0x4[esp],eax
00F6  EB 34				jmp		L$9
00F8				L$8:
00F8  6A 00				push		0x00000000
00FA  8D 44 24 08			lea		eax,0x8[esp]
00FE  50				push		eax
00FF  8B 74 24 18			mov		esi,dword ptr 0x18[esp]
0103  56				push		esi
0104  55				push		ebp
0105  8B 44 24 1C			mov		eax,dword ptr 0x1c[esp]
0109  50				push		eax
010A  E8 00 00 00 00			call		_ReadFile
010F  85 C0				test		eax,eax
0111  75 19				jne		L$9
0113  8B 04 24				mov		eax,dword ptr [esp]
0116  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
011C  E8 00 00 00 00			call		_GetLastError
0121  83 F8 6D				cmp		eax,0x0000006d
0124  0F 84 73 00 00 00			je		L$15
012A  EB 94				jmp		L$5
012C				L$9:
012C  83 7C 24 04 00			cmp		dword ptr 0x4[esp],0x00000000
0131  74 61				je		L$14
0133  89 E8				mov		eax,ebp
0135  31 DB				xor		ebx,ebx
0137  31 D2				xor		edx,edx
0139  EB 36				jmp		L$13
013B				L$10:
013B  31 C9				xor		ecx,ecx
013D  8A 08				mov		cl,byte ptr [eax]
013F  83 F9 1A				cmp		ecx,0x0000001a
0142  75 1F				jne		L$11
0144  2B 5C 24 04			sub		ebx,dword ptr 0x4[esp]
0148  8D 53 01				lea		edx,0x1[ebx]
014B  8B 04 24				mov		eax,dword ptr [esp]
014E  BB 01 00 00 00			mov		ebx,0x00000001
0153  E8 00 00 00 00			call		lseek_
0158  8B 04 24				mov		eax,dword ptr [esp]
015B  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
0161  EB 3A				jmp		L$15
0163				L$11:
0163  83 F9 0D				cmp		ecx,0x0000000d
0166  74 07				je		L$12
0168  89 D6				mov		esi,edx
016A  47				inc		edi
016B  42				inc		edx
016C  88 0C 2E				mov		byte ptr [esi+ebp],cl
016F				L$12:
016F  40				inc		eax
0170  43				inc		ebx
0171				L$13:
0171  3B 5C 24 04			cmp		ebx,dword ptr 0x4[esp]
0175  72 C4				jb		L$10
0177  8B 74 24 10			mov		esi,dword ptr 0x10[esp]
017B  8A 64 24 09			mov		ah,byte ptr 0x9[esp]
017F  29 D6				sub		esi,edx
0181  01 D5				add		ebp,edx
0183  89 74 24 10			mov		dword ptr 0x10[esp],esi
0187  F6 C4 20				test		ah,0x20
018A  75 08				jne		L$14
018C  85 F6				test		esi,esi
018E  0F 85 3C FF FF FF			jne		L$7
0194				L$14:
0194  8B 04 24				mov		eax,dword ptr [esp]
0197  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
019D				L$15:
019D  89 F8				mov		eax,edi
019F				L$16:
019F  83 C4 14				add		esp,0x00000014
01A2  5D				pop		ebp
01A3  5F				pop		edi
01A4  5E				pop		esi
01A5  59				pop		ecx
01A6  C3				ret		

Routine Size: 423 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

