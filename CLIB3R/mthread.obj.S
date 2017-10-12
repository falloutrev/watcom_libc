Module: mthread
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS,YIB,YI,YIE

Segment: _TEXT BYTE USE32 0000042E bytes
0000				nullSema4Rtn_:
0000  C3				ret		

Routine Size: 1 bytes,    Routine Base: _TEXT + 0000

0001				__CloseSemaphore_:
0001  53				push		ebx
0002  51				push		ecx
0003  52				push		edx
0004  89 C3				mov		ebx,eax
0006  83 78 04 00			cmp		dword ptr 0x4[eax],0x00000000
000A  74 08				je		L$1
000C  8B 08				mov		ecx,dword ptr [eax]
000E  51				push		ecx
000F  E8 00 00 00 00			call		_CloseHandle
0014				L$1:
0014  C7 43 04 00 00 00 00		mov		dword ptr 0x4[ebx],0x00000000
001B  C7 43 08 00 00 00 00		mov		dword ptr 0x8[ebx],0x00000000
0022  C7 43 0C 00 00 00 00		mov		dword ptr 0xc[ebx],0x00000000
0029  5A				pop		edx
002A  59				pop		ecx
002B  5B				pop		ebx
002C  C3				ret		

Routine Size: 44 bytes,    Routine Base: _TEXT + 0001

002D				__AccessIOB_:
002D  B8 00 00 00 00			mov		eax,offset _IOBSemaphore
0032  E9 00 00 00 00			jmp		__AccessSemaphore_

Routine Size: 10 bytes,    Routine Base: _TEXT + 002D

0037				__ReleaseIOB_:
0037  B8 00 00 00 00			mov		eax,offset _IOBSemaphore
003C  E9 00 00 00 00			jmp		__ReleaseSemaphore_

Routine Size: 10 bytes,    Routine Base: _TEXT + 0037

0041				__AccessFileH_:
0041  83 E0 0F				and		eax,0x0000000f
0044  C1 E0 04				shl		eax,0x04
0047  05 00 00 00 00			add		eax,offset _FileSemaphores
004C  EB 66				jmp		__AccessSemaphore_

Routine Size: 13 bytes,    Routine Base: _TEXT + 0041

004E				__ReleaseFileH_:
004E  83 E0 0F				and		eax,0x0000000f
0051  C1 E0 04				shl		eax,0x04
0054  05 00 00 00 00			add		eax,offset _FileSemaphores
0059  E9 00 00 00 00			jmp		__ReleaseSemaphore_

Routine Size: 16 bytes,    Routine Base: _TEXT + 004E

005E				__InitAccessH_:
005E  E9 00 00 00 00			jmp		__NTAddFileHandle_

Routine Size: 5 bytes,    Routine Base: _TEXT + 005E

0063				__FiniAccessH_:
0063  52				push		edx
0064  89 C2				mov		edx,eax
0066  83 E0 0F				and		eax,0x0000000f
0069  C1 E0 04				shl		eax,0x04
006C  05 00 00 00 00			add		eax,offset _FileSemaphores
0071  E8 00 00 00 00			call		__CloseSemaphore_
0076  89 D0				mov		eax,edx
0078  E8 00 00 00 00			call		__NTRemoveFileHandle_
007D  5A				pop		edx
007E  C3				ret		

Routine Size: 28 bytes,    Routine Base: _TEXT + 0063

007F				__AccessNHeap_:
007F  B8 00 00 00 00			mov		eax,offset _NHeapSemaphore
0084  EB 2E				jmp		__AccessSemaphore_

Routine Size: 7 bytes,    Routine Base: _TEXT + 007F

0086				__ReleaseNHeap_:
0086  B8 00 00 00 00			mov		eax,offset _NHeapSemaphore
008B  E9 00 00 00 00			jmp		__ReleaseSemaphore_

Routine Size: 10 bytes,    Routine Base: _TEXT + 0086

0090				__AccessFHeap_:
0090  B8 00 00 00 00			mov		eax,offset _FHeapSemaphore
0095  EB 1D				jmp		__AccessSemaphore_

Routine Size: 7 bytes,    Routine Base: _TEXT + 0090

0097				__ReleaseFHeap_:
0097  B8 00 00 00 00			mov		eax,offset _FHeapSemaphore
009C  E9 00 00 00 00			jmp		__ReleaseSemaphore_

Routine Size: 10 bytes,    Routine Base: _TEXT + 0097

00A1				__AccessTDList_:
00A1  B8 00 00 00 00			mov		eax,offset _TDListSemaphore
00A6  EB 0C				jmp		__AccessSemaphore_

Routine Size: 7 bytes,    Routine Base: _TEXT + 00A1

00A8				__ReleaseTDList_:
00A8  B8 00 00 00 00			mov		eax,offset _TDListSemaphore
00AD  EB 67				jmp		__ReleaseSemaphore_

Routine Size: 7 bytes,    Routine Base: _TEXT + 00A8

00AF				__AccessFList_:
00AF  B8 00 00 00 00			mov		eax,offset _FListSemaphore

Routine Size: 5 bytes,    Routine Base: _TEXT + 00AF

00B4				__AccessSemaphore_:
00B4  53				push		ebx
00B5  51				push		ecx
00B6  52				push		edx
00B7  56				push		esi
00B8  55				push		ebp
00B9  89 C3				mov		ebx,eax
00BB  E8 00 00 00 00			call		_GetCurrentThreadId
00C0  8B 53 08				mov		edx,dword ptr 0x8[ebx]
00C3  89 C6				mov		esi,eax
00C5  39 D0				cmp		eax,edx
00C7  74 3F				je		L$4
00C9  8B 4B 04				mov		ecx,dword ptr 0x4[ebx]
00CC  85 C9				test		ecx,ecx
00CE  75 2B				jne		L$3
00D0  B8 00 00 00 00			mov		eax,offset _InitSemaphore
00D5  E8 00 00 00 00			call		__AccessSemaphore_
00DA  83 7B 04 00			cmp		dword ptr 0x4[ebx],0x00000000
00DE  75 11				jne		L$2
00E0  51				push		ecx
00E1  51				push		ecx
00E2  51				push		ecx
00E3  E8 00 00 00 00			call		_CreateMutexA
00E8  C7 43 04 01 00 00 00		mov		dword ptr 0x4[ebx],0x00000001
00EF  89 03				mov		dword ptr [ebx],eax
00F1				L$2:
00F1  B8 00 00 00 00			mov		eax,offset _InitSemaphore
00F6  E8 00 00 00 00			call		__ReleaseSemaphore_
00FB				L$3:
00FB  6A FF				push		0xffffffff
00FD  8B 2B				mov		ebp,dword ptr [ebx]
00FF  55				push		ebp
0100  E8 00 00 00 00			call		_WaitForSingleObject
0105  89 73 08				mov		dword ptr 0x8[ebx],esi
0108				L$4:
0108  FF 43 0C				inc		dword ptr 0xc[ebx]
010B  5D				pop		ebp
010C  5E				pop		esi
010D  5A				pop		edx
010E  59				pop		ecx
010F  5B				pop		ebx
0110  C3				ret		

Routine Size: 93 bytes,    Routine Base: _TEXT + 00B4

0111				__ReleaseFList_:
0111  B8 00 00 00 00			mov		eax,offset _FListSemaphore

Routine Size: 5 bytes,    Routine Base: _TEXT + 0111

0116				__ReleaseSemaphore_:
0116  53				push		ebx
0117  51				push		ecx
0118  52				push		edx
0119  56				push		esi
011A  8B 50 0C				mov		edx,dword ptr 0xc[eax]
011D  85 D2				test		edx,edx
011F  76 15				jbe		L$5
0121  8D 5A FF				lea		ebx,-0x1[edx]
0124  89 58 0C				mov		dword ptr 0xc[eax],ebx
0127  85 DB				test		ebx,ebx
0129  75 0B				jne		L$5
012B  8B 30				mov		esi,dword ptr [eax]
012D  56				push		esi
012E  89 58 08				mov		dword ptr 0x8[eax],ebx
0131  E8 00 00 00 00			call		_ReleaseMutex
0136				L$5:
0136  5E				pop		esi
0137  5A				pop		edx
0138  59				pop		ecx
0139  5B				pop		ebx
013A  C3				ret		

Routine Size: 37 bytes,    Routine Base: _TEXT + 0116

013B				__MultipleThread_:
013B  51				push		ecx
013C  52				push		edx
013D  8B 15 00 00 00 00			mov		edx,dword ptr ___TlsIndex
0143  52				push		edx
0144  E8 00 00 00 00			call		_TlsGetValue
0149  89 C2				mov		edx,eax
014B  85 C0				test		eax,eax
014D  75 07				jne		L$6
014F  E8 00 00 00 00			call		__GetThreadData_
0154  89 C2				mov		edx,eax
0156				L$6:
0156  89 D0				mov		eax,edx
0158  5A				pop		edx
0159  59				pop		ecx
015A  C3				ret		

Routine Size: 32 bytes,    Routine Base: _TEXT + 013B

015B				__InitThreadData_:
015B  53				push		ebx
015C  51				push		ecx
015D  52				push		edx
015E  89 C3				mov		ebx,eax
0160  85 C0				test		eax,eax
0162  75 1A				jne		L$7
0164  B8 01 00 00 00			mov		eax,0x00000001
0169  8B 15 00 00 00 00			mov		edx,dword ptr ___ThreadDataSize
016F  E8 00 00 00 00			call		calloc_
0174  89 C3				mov		ebx,eax
0176  85 C0				test		eax,eax
0178  74 04				je		L$7
017A  C6 40 52 01			mov		byte ptr 0x52[eax],0x01
017E				L$7:
017E  85 DB				test		ebx,ebx
0180  74 12				je		L$8
0182  C7 43 0C 01 00 00 00		mov		dword ptr 0xc[ebx],0x00000001
0189  E8 00 00 00 00			call		_GetCurrentThreadId
018E  89 83 DA 00 00 00			mov		dword ptr 0xda[ebx],eax
0194				L$8:
0194  89 D8				mov		eax,ebx
0196  5A				pop		edx
0197  59				pop		ecx
0198  5B				pop		ebx
0199  C3				ret		

Routine Size: 63 bytes,    Routine Base: _TEXT + 015B

019A				__NTThreadInit_:
019A  51				push		ecx
019B  52				push		edx
019C  E8 00 00 00 00			call		_TlsAlloc
01A1  A3 00 00 00 00			mov		dword ptr ___TlsIndex,eax
01A6  66 A1 00 00 00 00			mov		ax,word ptr __osbuild
01AC  30 C0				xor		al,al
01AE  80 E4 80				and		ah,0x80
01B1  25 FF FF 00 00			and		eax,0x0000ffff
01B6  74 1C				je		L$10
01B8				L$9:
01B8  8B 15 00 00 00 00			mov		edx,dword ptr ___TlsIndex
01BE  83 FA FF				cmp		edx,0xffffffff
01C1  74 11				je		L$10
01C3  83 FA 02				cmp		edx,0x00000002
01C6  77 0C				ja		L$10
01C8  E8 00 00 00 00			call		_TlsAlloc
01CD  A3 00 00 00 00			mov		dword ptr ___TlsIndex,eax
01D2  EB E4				jmp		L$9
01D4				L$10:
01D4  83 3D 00 00 00 00 FF		cmp		dword ptr ___TlsIndex,0xffffffff
01DB  0F 95 C0				setne		al
01DE  25 FF 00 00 00			and		eax,0x000000ff
01E3  5A				pop		edx
01E4  59				pop		ecx
01E5  C3				ret		

Routine Size: 76 bytes,    Routine Base: _TEXT + 019A

01E6				__NTAddThread_:
01E6  53				push		ebx
01E7  51				push		ecx
01E8  52				push		edx
01E9  83 3D 00 00 00 00 FF		cmp		dword ptr ___TlsIndex,0xffffffff
01F0  75 06				jne		L$12
01F2				L$11:
01F2  31 C0				xor		eax,eax
01F4  5A				pop		edx
01F5  59				pop		ecx
01F6  5B				pop		ebx
01F7  C3				ret		
01F8				L$12:
01F8  E8 00 00 00 00			call		__InitThreadData_
01FD  89 C3				mov		ebx,eax
01FF  85 C0				test		eax,eax
0201  74 2C				je		L$14
0203  89 DA				mov		edx,ebx
0205  8B 80 DA 00 00 00			mov		eax,dword ptr 0xda[eax]
020B  E8 00 00 00 00			call		__AddThreadData_
0210  85 C0				test		eax,eax
0212  75 09				jne		L$13
0214  89 D8				mov		eax,ebx
0216  E8 00 00 00 00			call		free_
021B  EB D5				jmp		L$11
021D				L$13:
021D  53				push		ebx
021E  8B 1D 00 00 00 00			mov		ebx,dword ptr ___TlsIndex
0224  53				push		ebx
0225  E8 00 00 00 00			call		_TlsSetValue
022A  B8 01 00 00 00			mov		eax,0x00000001
022F				L$14:
022F  5A				pop		edx
0230  59				pop		ecx
0231  5B				pop		ebx
0232  C3				ret		

Routine Size: 77 bytes,    Routine Base: _TEXT + 01E6

0233				__NTRemoveThread_:
0233  53				push		ebx
0234  51				push		ecx
0235  52				push		edx
0236  56				push		esi
0237  89 C6				mov		esi,eax
0239  8B 15 00 00 00 00			mov		edx,dword ptr ___TlsIndex
023F  83 FA FF				cmp		edx,0xffffffff
0242  74 37				je		L$15
0244  52				push		edx
0245  E8 00 00 00 00			call		_TlsGetValue
024A  85 C0				test		eax,eax
024C  74 2D				je		L$15
024E  8B 98 DE 00 00 00			mov		ebx,dword ptr 0xde[eax]
0254  8B 80 DA 00 00 00			mov		eax,dword ptr 0xda[eax]
025A  E8 00 00 00 00			call		__RemoveThreadData_
025F  6A 00				push		0x00000000
0261  8B 0D 00 00 00 00			mov		ecx,dword ptr ___TlsIndex
0267  51				push		ecx
0268  E8 00 00 00 00			call		_TlsSetValue
026D  85 DB				test		ebx,ebx
026F  74 0A				je		L$15
0271  85 F6				test		esi,esi
0273  74 06				je		L$15
0275  53				push		ebx
0276  E8 00 00 00 00			call		_CloseHandle
027B				L$15:
027B  5E				pop		esi
027C  5A				pop		edx
027D  59				pop		ecx
027E  5B				pop		ebx
027F  C3				ret		
0280				__ThreadExit_:
0280  B8 01 00 00 00			mov		eax,0x00000001
0285  E8 00 00 00 00			call		__NTRemoveThread_

Routine Size: 87 bytes,    Routine Base: _TEXT + 0233

028A				__NTThreadFini_:
028A  51				push		ecx
028B  52				push		edx
028C  8B 15 00 00 00 00			mov		edx,dword ptr ___TlsIndex
0292  83 FA FF				cmp		edx,0xffffffff
0295  74 10				je		L$16
0297  52				push		edx
0298  E8 00 00 00 00			call		_TlsFree
029D  C7 05 00 00 00 00 FF FF FF FF
					mov		dword ptr ___TlsIndex,0xffffffff
02A7				L$16:
02A7  5A				pop		edx
02A8  59				pop		ecx
02A9  C3				ret		

Routine Size: 32 bytes,    Routine Base: _TEXT + 028A

02AA				__InitMultipleThread_:
02AA  53				push		ebx
02AB  51				push		ecx
02AC  52				push		edx
02AD  56				push		esi
02AE  57				push		edi
02AF  55				push		ebp
02B0  BA 00 00 00 00			mov		edx,offset __AccessFileH_
02B5  BB 00 00 00 00			mov		ebx,offset __ReleaseFileH_
02BA  B9 00 00 00 00			mov		ecx,offset __InitAccessH_
02BF  BE 00 00 00 00			mov		esi,offset __FiniAccessH_
02C4  BF 00 00 00 00			mov		edi,offset __AccessIOB_
02C9  6A 00				push		0x00000000
02CB  BD 00 00 00 00			mov		ebp,offset __ReleaseIOB_
02D0  B8 00 00 00 00			mov		eax,offset __AccessSemaphore_
02D5  6A 00				push		0x00000000
02D7  89 15 00 00 00 00			mov		dword ptr __AccessFileH,edx
02DD  89 1D 00 00 00 00			mov		dword ptr __ReleaseFileH,ebx
02E3  89 0D 00 00 00 00			mov		dword ptr __InitAccessH,ecx
02E9  89 35 00 00 00 00			mov		dword ptr __FiniAccessH,esi
02EF  89 3D 00 00 00 00			mov		dword ptr __AccessIOB,edi
02F5  89 2D 00 00 00 00			mov		dword ptr __ReleaseIOB,ebp
02FB  A3 00 00 00 00			mov		dword ptr ___AccessSema4,eax
0300  BA 00 00 00 00			mov		edx,offset __ReleaseSemaphore_
0305  BB 00 00 00 00			mov		ebx,offset __CloseSemaphore_
030A  B9 00 00 00 00			mov		ecx,offset __AccessNHeap_
030F  BE 00 00 00 00			mov		esi,offset __AccessFHeap_
0314  BF 00 00 00 00			mov		edi,offset __ReleaseNHeap_
0319  BD 00 00 00 00			mov		ebp,offset __ReleaseFHeap_
031E  B8 00 00 00 00			mov		eax,offset __AccessTDList_
0323  6A 00				push		0x00000000
0325  89 15 00 00 00 00			mov		dword ptr ___ReleaseSema4,edx
032B  89 1D 00 00 00 00			mov		dword ptr ___CloseSema4,ebx
0331  89 0D 00 00 00 00			mov		dword ptr __AccessNHeap,ecx
0337  89 35 00 00 00 00			mov		dword ptr __AccessFHeap,esi
033D  89 3D 00 00 00 00			mov		dword ptr __ReleaseNHeap,edi
0343  89 2D 00 00 00 00			mov		dword ptr __ReleaseFHeap,ebp
0349  A3 00 00 00 00			mov		dword ptr __AccessTDList,eax
034E  BA 00 00 00 00			mov		edx,offset __ReleaseTDList_
0353  BB 01 00 00 00			mov		ebx,0x00000001
0358  BE 00 00 00 00			mov		esi,offset __ReleaseFList_
035D  BF 00 00 00 00			mov		edi,offset __ThreadExit_
0362  89 15 00 00 00 00			mov		dword ptr __ReleaseTDList,edx
0368  E8 00 00 00 00			call		_CreateMutexA
036D  B9 00 00 00 00			mov		ecx,offset __AccessFList_
0372  8B 15 00 00 00 00			mov		edx,dword ptr ___FirstThreadData
0378  A3 00 00 00 00			mov		dword ptr _InitSemaphore,eax
037D  89 1D 04 00 00 00			mov		dword ptr _InitSemaphore+0x4,ebx
0383  89 35 00 00 00 00			mov		dword ptr __ReleaseFList,esi
0389  89 3D 00 00 00 00			mov		dword ptr __ThreadExitRtn,edi
038F  8B 82 DA 00 00 00			mov		eax,dword ptr 0xda[edx]
0395  89 0D 00 00 00 00			mov		dword ptr __AccessFList,ecx
039B  E8 00 00 00 00			call		__AddThreadData_
03A0  8B 2D 00 00 00 00			mov		ebp,dword ptr ___FirstThreadData
03A6  55				push		ebp
03A7  A1 00 00 00 00			mov		eax,dword ptr ___TlsIndex
03AC  50				push		eax
03AD  E8 00 00 00 00			call		_TlsSetValue
03B2  C7 05 00 00 00 00 00 00 00 00
					mov		dword ptr ___GetThreadPtr,offset __MultipleThread_
03BC  5D				pop		ebp
03BD  5F				pop		edi
03BE  5E				pop		esi
03BF  5A				pop		edx
03C0  59				pop		ecx
03C1  5B				pop		ebx
03C2  C3				ret		
03C3				__FiniSema4s_:
03C3  53				push		ebx
03C4  52				push		edx
03C5  B8 00 00 00 00			mov		eax,offset _NHeapSemaphore
03CA  FF 15 00 00 00 00			call		dword ptr ___CloseSema4
03D0  B8 00 00 00 00			mov		eax,offset _FHeapSemaphore
03D5  BA 00 00 00 00			mov		edx,offset _FileSemaphores
03DA  FF 15 00 00 00 00			call		dword ptr ___CloseSema4
03E0  B8 00 00 00 00			mov		eax,offset _IOBSemaphore
03E5  8D 9A 00 01 00 00			lea		ebx,0x100[edx]
03EB  FF 15 00 00 00 00			call		dword ptr ___CloseSema4
03F1				L$17:
03F1  89 D0				mov		eax,edx
03F3  83 C2 10				add		edx,0x00000010
03F6  FF 15 00 00 00 00			call		dword ptr ___CloseSema4
03FC  39 DA				cmp		edx,ebx
03FE  75 F1				jne		L$17
0400  B8 00 00 00 00			mov		eax,offset _FListSemaphore
0405  FF 15 00 00 00 00			call		dword ptr ___CloseSema4
040B  E8 00 00 00 00			call		__FiniThreadProcessing_
0410  B8 00 00 00 00			mov		eax,offset _TDListSemaphore
0415  FF 15 00 00 00 00			call		dword ptr ___CloseSema4
041B  B8 00 00 00 00			mov		eax,offset _InitSemaphore
0420  FF 15 00 00 00 00			call		dword ptr ___CloseSema4
0426  E8 00 00 00 00			call		__NTThreadFini_
042B  5A				pop		edx
042C  5B				pop		ebx
042D  C3				ret		

Routine Size: 388 bytes,    Routine Base: _TEXT + 02AA

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 0000000C bytes
0000				___AccessSema4:
0000  00 00 00 00                                     DD	offset nullSema4Rtn_
0004				___ReleaseSema4:
0004  00 00 00 00                                     DD	offset nullSema4Rtn_
0008				___CloseSema4:
0008  00 00 00 00                                     DD	offset nullSema4Rtn_

Segment: _BSS DWORD USE32 00000160 bytes
0000				_IOBSemaphore:
0010				_FHeapSemaphore:
0020				_FileSemaphores:
0120				_NHeapSemaphore:
0130				_InitSemaphore:
0140				_TDListSemaphore:
0150				_FListSemaphore:

BSS Size: 352 bytes

Segment: YIB BYTE USE32 00000000 bytes

Segment: YI BYTE USE32 00000006 bytes
0000				___AccessSema4Fini:
0000  00 0A                                           ..
0002  00 00 00 00                                     DD	offset __FiniSema4s_

Segment: YIE BYTE USE32 00000000 bytes

