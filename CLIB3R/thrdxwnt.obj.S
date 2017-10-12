Module: thrdxwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000131 bytes
0000				_begin_thread_helper:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  89 E5				mov		ebp,esp
0006  83 EC 0C				sub		esp,0x0000000c
0009  8B 4D 14				mov		ecx,dword ptr 0x14[ebp]
000C  8B 15 00 00 00 00			mov		edx,dword ptr ___Is_DLL
0012  8B 01				mov		eax,dword ptr [ecx]
0014  8B 79 04				mov		edi,dword ptr 0x4[ecx]
0017  89 45 FC				mov		dword ptr -0x4[ebp],eax
001A  85 D2				test		edx,edx
001C  75 26				jne		L$1
001E  A1 00 00 00 00			mov		eax,dword ptr ___ThreadDataSize
0023  83 C0 03				add		eax,0x00000003
0026  24 FC				and		al,0xfc
0028  29 C4				sub		esp,eax
002A  89 E6				mov		esi,esp
002C  8B 1D 00 00 00 00			mov		ebx,dword ptr ___ThreadDataSize
0032  89 F0				mov		eax,esi
0034  E8 00 00 00 00			call		memset_
0039  89 F0				mov		eax,esi
003B  E8 00 00 00 00			call		__NTAddThread_
0040  85 C0				test		eax,eax
0042  74 42				je		L$3
0044				L$1:
0044  8B 59 0C				mov		ebx,dword ptr 0xc[ecx]
0047  85 DB				test		ebx,ebx
0049  74 11				je		L$2
004B  89 E0				mov		eax,esp
004D  2B 41 0C				sub		eax,dword ptr 0xc[ecx]
0050  05 FF 0F 00 00			add		eax,0x00000fff
0055  30 C0				xor		al,al
0057  80 E4 F0				and		ah,0xf0
005A  89 C3				mov		ebx,eax
005C				L$2:
005C  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0062  89 18				mov		dword ptr [eax],ebx
0064  89 C8				mov		eax,ecx
0066  E8 00 00 00 00			call		free_
006B  8D 45 F4				lea		eax,-0xc[ebp]
006E  E8 00 00 00 00			call		__NewExceptionHandler_
0073  FF 15 00 00 00 00			call		dword ptr ___sig_init_rtn
0079  57				push		edi
007A  FF 55 FC				call		dword ptr -0x4[ebp]
007D  31 C0				xor		eax,eax
007F  E8 00 00 00 00			call		_endthreadex_
0084  31 C0				xor		eax,eax
0086				L$3:
0086  89 EC				mov		esp,ebp
0088  5D				pop		ebp
0089  5F				pop		edi
008A  5E				pop		esi
008B  5B				pop		ebx
008C  C2 04 00				ret		0x0004

Routine Size: 143 bytes,    Routine Base: _TEXT + 0000

008F				__CBeginThreadEx_:
008F  56				push		esi
0090  57				push		edi
0091  89 C7				mov		edi,eax
0093  89 D6				mov		esi,edx
0095  89 DA				mov		edx,ebx
0097  B8 10 00 00 00			mov		eax,0x00000010
009C  E8 00 00 00 00			call		malloc_
00A1  89 C3				mov		ebx,eax
00A3  85 C0				test		eax,eax
00A5  75 11				jne		L$4
00A7  B8 05 00 00 00			mov		eax,0x00000005
00AC  E8 00 00 00 00			call		__set_errno_
00B1  31 C0				xor		eax,eax
00B3  5F				pop		edi
00B4  5E				pop		esi
00B5  C2 08 00				ret		0x0008
00B8				L$4:
00B8  83 3D 00 00 00 00 FF		cmp		dword ptr ___TlsIndex,0xffffffff
00BF  75 0E				jne		L$5
00C1  E8 00 00 00 00			call		__NTThreadInit_
00C6  85 C0				test		eax,eax
00C8  74 37				je		L$6
00CA  E8 00 00 00 00			call		__InitMultipleThread_
00CF				L$5:
00CF  89 13				mov		dword ptr [ebx],edx
00D1  89 4B 04				mov		dword ptr 0x4[ebx],ecx
00D4  E8 00 00 00 00			call		_GetCurrentThread
00D9  89 43 08				mov		dword ptr 0x8[ebx],eax
00DC  8B 44 24 10			mov		eax,dword ptr 0x10[esp]
00E0  50				push		eax
00E1  8B 54 24 10			mov		edx,dword ptr 0x10[esp]
00E5  52				push		edx
00E6  53				push		ebx
00E7  81 C6 FF 0F 00 00			add		esi,0x00000fff
00ED  68 00 00 00 00			push		offset _begin_thread_helper
00F2  66 81 E6 00 F0			and		si,0xf000
00F7  56				push		esi
00F8  57				push		edi
00F9  89 73 0C				mov		dword ptr 0xc[ebx],esi
00FC  E8 00 00 00 00			call		_CreateThread
0101				L$6:
0101  5F				pop		edi
0102  5E				pop		esi
0103  C2 08 00				ret		0x0008

Routine Size: 119 bytes,    Routine Base: _TEXT + 008F

0106				__CEndThreadEx_:
0106  51				push		ecx
0107  52				push		edx
0108  89 C2				mov		edx,eax
010A  FF 15 00 00 00 00			call		dword ptr ___sig_fini_rtn
0110  E8 00 00 00 00			call		__DoneExceptionHandler_
0115  83 3D 00 00 00 00 00		cmp		dword ptr ___Is_DLL,0x00000000
011C  75 0A				jne		L$7
011E  B8 01 00 00 00			mov		eax,0x00000001
0123  E8 00 00 00 00			call		__NTRemoveThread_
0128				L$7:
0128  52				push		edx
0129  E8 00 00 00 00			call		_ExitThread
012E  5A				pop		edx
012F  59				pop		ecx
0130  C3				ret		

Routine Size: 43 bytes,    Routine Base: _TEXT + 0106

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

