Module: mainwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001A8 bytes
0000				__threadid_:
0000  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0006  05 DA 00 00 00			add		eax,0x000000da
000B  C3				ret		
000C				__SingleThread_:
000C  A1 00 00 00 00			mov		eax,dword ptr ___FirstThreadData
0011				__NullAccessRtn_:
0011				__NullExitRtn_:
0011				__NullAccIOBRtn_:
0011				__NullAccHeapRtn_:
0011				__NullAccTDListRtn_:
0011  C3				ret		
0012				__DefInitAccessH_:
0012  E9 00 00 00 00			jmp		__NTAddFileHandle_
0017				__DefFiniAccessH_:
0017  E9 00 00 00 00			jmp		__NTRemoveFileHandle_

Routine Size: 28 bytes,    Routine Base: _TEXT + 0000

001C				__NTInit_:
001C  51				push		ecx
001D  56				push		esi
001E  81 EC 04 01 00 00			sub		esp,0x00000104
0024  89 C6				mov		esi,eax
0026  89 D0				mov		eax,edx
0028  89 35 00 00 00 00			mov		dword ptr ___Is_DLL,esi
002E  E8 00 00 00 00			call		__InitThreadData_
0033  A3 00 00 00 00			mov		dword ptr ___FirstThreadData,eax
0038  85 C0				test		eax,eax
003A  75 12				jne		L$2
003C  85 F6				test		esi,esi
003E  74 07				je		L$1
0040  31 D2				xor		edx,edx
0042  E9 F1 00 00 00			jmp		L$9
0047				L$1:
0047  6A 01				push		0x00000001
0049  E8 00 00 00 00			call		_ExitProcess
004E				L$2:
004E  E8 00 00 00 00			call		__NTInitFileHandles_
0053  E8 00 00 00 00			call		_GetEnvironmentStrings
0058  68 04 01 00 00			push		0x00000104
005D  A3 00 00 00 00			mov		dword ptr __Envptr,eax
0062  8D 44 24 04			lea		eax,0x4[esp]
0066  50				push		eax
0067  6A 00				push		0x00000000
0069  E8 00 00 00 00			call		_GetModuleFileNameA
006E  89 E0				mov		eax,esp
0070  E8 00 00 00 00			call		strdup_
0075  A3 00 00 00 00			mov		dword ptr __LpPgmName,eax
007A  E8 00 00 00 00			call		_GetCommandLineA
007F  31 C9				xor		ecx,ecx
0081  E8 00 00 00 00			call		strdup_
0086  8A 08				mov		cl,byte ptr [eax]
0088  89 C2				mov		edx,eax
008A  83 F9 22				cmp		ecx,0x00000022
008D  75 16				jne		L$6
008F				L$3:
008F  40				inc		eax
0090  31 D2				xor		edx,edx
0092  8A 10				mov		dl,byte ptr [eax]
0094  83 FA 22				cmp		edx,0x00000022
0097  74 04				je		L$4
0099  84 D2				test		dl,dl
009B  75 F2				jne		L$3
009D				L$4:
009D  80 38 00				cmp		byte ptr [eax],0x00
00A0  74 26				je		L$7
00A2				L$5:
00A2  40				inc		eax
00A3  EB 23				jmp		L$7
00A5				L$6:
00A5  8A 10				mov		dl,byte ptr [eax]
00A7  FE C2				inc		dl
00A9  81 E2 FF 00 00 00			and		edx,0x000000ff
00AF  8A 92 00 00 00 00			mov		dl,byte ptr __IsTable[edx]
00B5  80 E2 02				and		dl,0x02
00B8  81 E2 FF 00 00 00			and		edx,0x000000ff
00BE  75 08				jne		L$7
00C0  80 38 00				cmp		byte ptr [eax],0x00
00C3  74 03				je		L$7
00C5  40				inc		eax
00C6  EB DD				jmp		L$6
00C8				L$7:
00C8  8A 10				mov		dl,byte ptr [eax]
00CA  FE C2				inc		dl
00CC  81 E2 FF 00 00 00			and		edx,0x000000ff
00D2  8A 92 00 00 00 00			mov		dl,byte ptr __IsTable[edx]
00D8  80 E2 02				and		dl,0x02
00DB  81 E2 FF 00 00 00			and		edx,0x000000ff
00E1  75 BF				jne		L$5
00E3  A3 00 00 00 00			mov		dword ptr __LpCmdLine,eax
00E8  85 F6				test		esi,esi
00EA  74 1C				je		L$8
00EC  68 04 01 00 00			push		0x00000104
00F1  8D 44 24 04			lea		eax,0x4[esp]
00F5  50				push		eax
00F6  53				push		ebx
00F7  E8 00 00 00 00			call		_GetModuleFileNameA
00FC  89 E0				mov		eax,esp
00FE  E8 00 00 00 00			call		strdup_
0103  A3 00 00 00 00			mov		dword ptr __LpDllName,eax
0108				L$8:
0108  E8 00 00 00 00			call		_GetVersion
010D  89 C3				mov		ebx,eax
010F  C1 E8 10				shr		eax,0x10
0112  31 D2				xor		edx,edx
0114  25 FF FF 00 00			and		eax,0x0000ffff
0119  66 89 C2				mov		dx,ax
011C  66 89 1D 00 00 00 00		mov		word ptr __osbuild,bx
0123  C1 FA 08				sar		edx,0x08
0126  24 0F				and		al,0x0f
0128  88 15 00 00 00 00			mov		byte ptr __osmajor,dl
012E  A2 00 00 00 00			mov		byte ptr __osminor,al
0133  BA 01 00 00 00			mov		edx,0x00000001
0138				L$9:
0138  89 D0				mov		eax,edx
013A  81 C4 04 01 00 00			add		esp,0x00000104
0140  5E				pop		esi
0141  59				pop		ecx
0142  C3				ret		

Routine Size: 295 bytes,    Routine Base: _TEXT + 001C

0143				__NTMainInit_:
0143  53				push		ebx
0144  51				push		ecx
0145  56				push		esi
0146  57				push		edi
0147  89 C6				mov		esi,eax
0149  89 D7				mov		edi,edx
014B  6A 00				push		0x00000000
014D  E8 00 00 00 00			call		_GetModuleHandleA
0152  89 C3				mov		ebx,eax
0154  89 FA				mov		edx,edi
0156  31 C0				xor		eax,eax
0158  E8 00 00 00 00			call		__NTInit_
015D  89 F0				mov		eax,esi
015F  E8 00 00 00 00			call		__NewExceptionHandler_
0164  FF 15 00 00 00 00			call		dword ptr ___sig_init_rtn
016A  64 A1 08 00 00 00			mov		eax,dword ptr fs:[0x8]
0170  89 C6				mov		esi,eax
0172  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0178  89 30				mov		dword ptr [eax],esi
017A  B8 FF 00 00 00			mov		eax,0x000000ff
017F  E8 00 00 00 00			call		__InitRtns
0184  5F				pop		edi
0185  5E				pop		esi
0186  59				pop		ecx
0187  5B				pop		ebx
0188  C3				ret		

Routine Size: 70 bytes,    Routine Base: _TEXT + 0143

0189				__exit_:
0189  89 C3				mov		ebx,eax
018B  E8 00 00 00 00			call		__DoneExceptionHandler_
0190  BA FF 00 00 00			mov		edx,0x000000ff
0195  31 C0				xor		eax,eax
0197  E8 00 00 00 00			call		__FiniRtns
019C  FF 15 00 00 00 00			call		dword ptr __ThreadExitRtn
01A2  53				push		ebx
01A3  E8 00 00 00 00			call		_ExitProcess

Routine Size: 31 bytes,    Routine Base: _TEXT + 0189

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 0000004C bytes
0000				___TlsIndex:
0000  FF FF FF FF                                     ....
0004				___GetThreadPtr:
0004  00 00 00 00                                     DD	offset __SingleThread_
0008				__AccessFileH:
0008  00 00 00 00                                     DD	offset __NullAccessRtn_
000C				__ReleaseFileH:
000C  00 00 00 00                                     DD	offset __NullAccessRtn_
0010				__InitAccessH:
0010  00 00 00 00                                     DD	offset __DefInitAccessH_
0014				__FiniAccessH:
0014  00 00 00 00                                     DD	offset __DefFiniAccessH_
0018				__AccessIOB:
0018  00 00 00 00                                     DD	offset __NullAccIOBRtn_
001C				__ReleaseIOB:
001C  00 00 00 00                                     DD	offset __NullAccIOBRtn_
0020				__AccessNHeap:
0020  00 00 00 00                                     DD	offset __NullAccHeapRtn_
0024				__AccessFHeap:
0024  00 00 00 00                                     DD	offset __NullAccHeapRtn_
0028				__ReleaseNHeap:
0028  00 00 00 00                                     DD	offset __NullAccHeapRtn_
002C				__ReleaseFHeap:
002C  00 00 00 00                                     DD	offset __NullAccHeapRtn_
0030				__AccessTDList:
0030  00 00 00 00                                     DD	offset __NullAccTDListRtn_
0034				__ReleaseTDList:
0034  00 00 00 00                                     DD	offset __NullAccTDListRtn_
0038				__AccessFList:
0038  00 00 00 00                                     DD	offset __NullAccIOBRtn_
003C				__ReleaseFList:
003C  00 00 00 00                                     DD	offset __NullAccIOBRtn_
0040				__ThreadExitRtn:
0040  00 00 00 00                                     DD	offset __NullExitRtn_
0044				___sig_init_rtn:
0044  00 00 00 00                                     DD	offset __SigInit_
0048				___sig_fini_rtn:
0048  00 00 00 00                                     DD	offset __SigFini_

Segment: _BSS DWORD USE32 00000008 bytes
0000				___Is_DLL:
0004				___FirstThreadData:

BSS Size: 8 bytes

