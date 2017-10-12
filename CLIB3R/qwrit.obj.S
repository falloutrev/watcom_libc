Module: qwrit
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000A6 bytes
0000				__qwrite_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 04				sub		esp,0x00000004
0007  89 C6				mov		esi,eax
0009  89 D7				mov		edi,edx
000B  8B 2D 00 00 00 00			mov		ebp,dword ptr ___FileHandleIDs
0011  8B 6C 85 00			mov		ebp,dword ptr [ebp+eax*4]
0015  FF 15 00 00 00 00			call		dword ptr __AccessFileH
001B  89 F0				mov		eax,esi
001D  E8 00 00 00 00			call		__IOMode_
0022  A8 80				test		al,0x80
0024  74 20				je		L$2
0026  6A 02				push		0x00000002
0028  6A 00				push		0x00000000
002A  6A 00				push		0x00000000
002C  55				push		ebp
002D  E8 00 00 00 00			call		_SetFilePointer
0032  83 F8 FF				cmp		eax,0xffffffff
0035  75 0F				jne		L$2
0037				L$1:
0037  89 F0				mov		eax,esi
0039  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
003F  E8 00 00 00 00			call		__set_errno_nt_
0044  EB 58				jmp		L$5
0046				L$2:
0046  83 3D 00 00 00 00 00		cmp		dword ptr __WindowsStdout,0x00000000
004D  74 22				je		L$3
004F  89 F0				mov		eax,esi
0051  FF 15 00 00 00 00			call		dword ptr __WindowsIsWindowedHandle
0057  85 C0				test		eax,eax
0059  74 16				je		L$3
005B  89 FA				mov		edx,edi
005D  FF 15 00 00 00 00			call		dword ptr __WindowsStdout
0063  89 C3				mov		ebx,eax
0065  89 F0				mov		eax,esi
0067  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
006D  89 D8				mov		eax,ebx
006F  EB 2D				jmp		L$5
0071				L$3:
0071  6A 00				push		0x00000000
0073  8D 44 24 04			lea		eax,0x4[esp]
0077  50				push		eax
0078  53				push		ebx
0079  57				push		edi
007A  55				push		ebp
007B  E8 00 00 00 00			call		_WriteFile
0080  85 C0				test		eax,eax
0082  74 B3				je		L$1
0084  3B 1C 24				cmp		ebx,dword ptr [esp]
0087  74 0A				je		L$4
0089  B8 0C 00 00 00			mov		eax,0x0000000c
008E  E8 00 00 00 00			call		__set_errno_
0093				L$4:
0093  89 F0				mov		eax,esi
0095  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
009B  8B 04 24				mov		eax,dword ptr [esp]
009E				L$5:
009E  83 C4 04				add		esp,0x00000004
00A1  5D				pop		ebp
00A2  5F				pop		edi
00A3  5E				pop		esi
00A4  59				pop		ecx
00A5  C3				ret		

Routine Size: 166 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

