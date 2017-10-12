Module: thredwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001AA bytes
0000				_begin_thread_helper:
0000  56				push		esi
0001  57				push		edi
0002  55				push		ebp
0003  89 E5				mov		ebp,esp
0005  83 EC 10				sub		esp,0x00000010
0008  8B 4D 10				mov		ecx,dword ptr 0x10[ebp]
000B  8B 01				mov		eax,dword ptr [ecx]
000D  89 45 F8				mov		dword ptr -0x8[ebp],eax
0010  8B 41 14				mov		eax,dword ptr 0x14[ecx]
0013  8B 15 00 00 00 00			mov		edx,dword ptr ___Is_DLL
0019  8B 00				mov		eax,dword ptr [eax]
001B  8B 79 04				mov		edi,dword ptr 0x4[ecx]
001E  89 45 FC				mov		dword ptr -0x4[ebp],eax
0021  85 D2				test		edx,edx
0023  75 31				jne		L$1
0025  A1 00 00 00 00			mov		eax,dword ptr ___ThreadDataSize
002A  83 C0 03				add		eax,0x00000003
002D  24 FC				and		al,0xfc
002F  29 C4				sub		esp,eax
0031  89 E6				mov		esi,esp
0033  8B 1D 00 00 00 00			mov		ebx,dword ptr ___ThreadDataSize
0039  89 F0				mov		eax,esi
003B  E8 00 00 00 00			call		memset_
0040  89 F0				mov		eax,esi
0042  E8 00 00 00 00			call		__NTAddThread_
0047  85 C0				test		eax,eax
0049  75 0B				jne		L$1
004B  8B 55 FC				mov		edx,dword ptr -0x4[ebp]
004E  52				push		edx
004F  E8 00 00 00 00			call		_CloseHandle
0054  EB 50				jmp		L$3
0056				L$1:
0056  8B 5D FC				mov		ebx,dword ptr -0x4[ebp]
0059  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
005F  89 98 DE 00 00 00			mov		dword ptr 0xde[eax],ebx
0065  8B 59 0C				mov		ebx,dword ptr 0xc[ecx]
0068  85 DB				test		ebx,ebx
006A  74 11				je		L$2
006C  89 E0				mov		eax,esp
006E  2B 41 0C				sub		eax,dword ptr 0xc[ecx]
0071  05 FF 0F 00 00			add		eax,0x00000fff
0076  30 C0				xor		al,al
0078  80 E4 F0				and		ah,0xf0
007B  89 C3				mov		ebx,eax
007D				L$2:
007D  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0083  89 18				mov		dword ptr [eax],ebx
0085  8B 41 10				mov		eax,dword ptr 0x10[ecx]
0088  50				push		eax
0089  E8 00 00 00 00			call		_SetEvent
008E  8D 45 F0				lea		eax,-0x10[ebp]
0091  E8 00 00 00 00			call		__NewExceptionHandler_
0096  FF 15 00 00 00 00			call		dword ptr ___sig_init_rtn
009C  89 F8				mov		eax,edi
009E  FF 55 F8				call		dword ptr -0x8[ebp]
00A1  E8 00 00 00 00			call		_endthread_
00A6				L$3:
00A6  89 EC				mov		esp,ebp
00A8  5D				pop		ebp
00A9  5F				pop		edi
00AA  5E				pop		esi
00AB  C3				ret		

Routine Size: 172 bytes,    Routine Base: _TEXT + 0000

00AC				__CBeginThread_:
00AC  56				push		esi
00AD  57				push		edi
00AE  06				push		es
00AF  55				push		ebp
00B0  83 EC 40				sub		esp,0x00000040
00B3  89 C6				mov		esi,eax
00B5  89 DD				mov		ebp,ebx
00B7  8B 15 00 00 00 00			mov		edx,dword ptr ___TlsIndex
00BD  83 FA FF				cmp		edx,0xffffffff
00C0  75 15				jne		L$5
00C2  E8 00 00 00 00			call		__NTThreadInit_
00C7  85 C0				test		eax,eax
00C9  75 07				jne		L$4
00CB  89 D0				mov		eax,edx
00CD  E9 A6 00 00 00			jmp		L$8
00D2				L$4:
00D2  E8 00 00 00 00			call		__InitMultipleThread_
00D7				L$5:
00D7  89 E7				mov		edi,esp
00D9  81 C5 FF 0F 00 00			add		ebp,0x00000fff
00DF  89 74 24 20			mov		dword ptr 0x20[esp],esi
00E3  89 4C 24 24			mov		dword ptr 0x24[esp],ecx
00E7  E8 00 00 00 00			call		_GetCurrentThread
00EC  89 44 24 28			mov		dword ptr 0x28[esp],eax
00F0  8C D8				mov		eax,ds
00F2  81 E5 00 F0 FF FF			and		ebp,0xfffff000
00F8  8E C0				mov		es,eax
00FA  BE 00 00 00 00			mov		esi,offset DGROUP:L$10
00FF  BB 10 00 00 00			mov		ebx,0x00000010
0104  89 6C 24 2C			mov		dword ptr 0x2c[esp],ebp
0108  A5				movsd		
0109  A5				movsd		
010A  A4				movsb		
010B  E8 00 00 00 00			call		_GetCurrentThreadId
0110  8D 54 24 08			lea		edx,0x8[esp]
0114  E8 00 00 00 00			call		itoa_
0119  89 E0				mov		eax,esp
011B  50				push		eax
011C  6A 00				push		0x00000000
011E  6A 00				push		0x00000000
0120  6A 00				push		0x00000000
0122  E8 00 00 00 00			call		_CreateEventA
0127  89 44 24 30			mov		dword ptr 0x30[esp],eax
012B  8D 44 24 38			lea		eax,0x38[esp]
012F  89 44 24 34			mov		dword ptr 0x34[esp],eax
0133  8D 44 24 3C			lea		eax,0x3c[esp]
0137  50				push		eax
0138  6A 00				push		0x00000000
013A  8D 44 24 28			lea		eax,0x28[esp]
013E  50				push		eax
013F  68 00 00 00 00			push		offset _begin_thread_helper
0144  55				push		ebp
0145  6A 00				push		0x00000000
0147  E8 00 00 00 00			call		_CreateThread
014C  89 44 24 38			mov		dword ptr 0x38[esp],eax
0150  85 C0				test		eax,eax
0152  75 0A				jne		L$6
0154  C7 44 24 3C FF FF FF FF		mov		dword ptr 0x3c[esp],0xffffffff
015C  EB 0C				jmp		L$7
015E				L$6:
015E  6A FF				push		0xffffffff
0160  8B 5C 24 34			mov		ebx,dword ptr 0x34[esp]
0164  53				push		ebx
0165  E8 00 00 00 00			call		_WaitForSingleObject
016A				L$7:
016A  8B 74 24 30			mov		esi,dword ptr 0x30[esp]
016E  56				push		esi
016F  E8 00 00 00 00			call		_CloseHandle
0174  8B 44 24 3C			mov		eax,dword ptr 0x3c[esp]
0178				L$8:
0178  83 C4 40				add		esp,0x00000040
017B  5D				pop		ebp
017C  07				pop		es
017D  5F				pop		edi
017E  5E				pop		esi
017F  C3				ret		

Routine Size: 212 bytes,    Routine Base: _TEXT + 00AC

0180				__CEndThread_:
0180  51				push		ecx
0181  52				push		edx
0182  FF 15 00 00 00 00			call		dword ptr ___sig_fini_rtn
0188  E8 00 00 00 00			call		__DoneExceptionHandler_
018D  83 3D 00 00 00 00 00		cmp		dword ptr ___Is_DLL,0x00000000
0194  75 0A				jne		L$9
0196  B8 01 00 00 00			mov		eax,0x00000001
019B  E8 00 00 00 00			call		__NTRemoveThread_
01A0				L$9:
01A0  6A 00				push		0x00000000
01A2  E8 00 00 00 00			call		_ExitThread
01A7  5A				pop		edx
01A8  59				pop		ecx
01A9  C3				ret		

Routine Size: 42 bytes,    Routine Base: _TEXT + 0180

No disassembly errors

Segment: CONST DWORD USE32 00000009 bytes
0000				L$10:
0000  5F 5F 62 67 6E 74 68 64 00                      __bgnthd.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

