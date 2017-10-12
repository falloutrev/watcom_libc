Module: trdlist
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000010B bytes
0000				__GetThreadData_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  31 C0				xor		eax,eax
0005  E8 00 00 00 00			call		__NTAddThread_
000A  31 DB				xor		ebx,ebx
000C  85 C0				test		eax,eax
000E  74 0E				je		L$1
0010  8B 15 00 00 00 00			mov		edx,dword ptr ___TlsIndex
0016  52				push		edx
0017  E8 00 00 00 00			call		_TlsGetValue
001C  89 C3				mov		ebx,eax
001E				L$1:
001E  85 DB				test		ebx,ebx
0020  75 0F				jne		L$2
0022  BA 01 00 00 00			mov		edx,0x00000001
0027  B8 00 00 00 00			mov		eax,offset DGROUP:L$14
002C  E8 00 00 00 00			call		__fatal_runtime_error_
0031				L$2:
0031  89 D8				mov		eax,ebx
0033  5A				pop		edx
0034  59				pop		ecx
0035  5B				pop		ebx
0036  C3				ret		

Routine Size: 55 bytes,    Routine Base: _TEXT + 0000

0037				__AddThreadData_:
0037  53				push		ebx
0038  51				push		ecx
0039  56				push		esi
003A  89 C6				mov		esi,eax
003C  89 D3				mov		ebx,edx
003E  FF 15 00 00 00 00			call		dword ptr __AccessTDList
0044  B9 01 00 00 00			mov		ecx,0x00000001
0049  BA 10 00 00 00			mov		edx,0x00000010
004E  89 C8				mov		eax,ecx
0050  E8 00 00 00 00			call		calloc_
0055  89 C2				mov		edx,eax
0057  85 C0				test		eax,eax
0059  74 2F				je		L$4
005B  89 D8				mov		eax,ebx
005D  E8 00 00 00 00			call		__initthread_
0062  85 C0				test		eax,eax
0064  74 09				je		L$3
0066  89 D0				mov		eax,edx
0068  E8 00 00 00 00			call		free_
006D  EB 1B				jmp		L$4
006F				L$3:
006F  89 5A 08				mov		dword ptr 0x8[edx],ebx
0072  89 72 04				mov		dword ptr 0x4[edx],esi
0075  8A 43 52				mov		al,byte ptr 0x52[ebx]
0078  89 42 0C				mov		dword ptr 0xc[edx],eax
007B  A1 00 00 00 00			mov		eax,dword ptr ___thread_data_list
0080  89 15 00 00 00 00			mov		dword ptr ___thread_data_list,edx
0086  89 02				mov		dword ptr [edx],eax
0088  EB 02				jmp		L$5
008A				L$4:
008A  31 C9				xor		ecx,ecx
008C				L$5:
008C  FF 15 00 00 00 00			call		dword ptr __ReleaseTDList
0092  89 C8				mov		eax,ecx
0094  5E				pop		esi
0095  59				pop		ecx
0096  5B				pop		ebx
0097  C3				ret		

Routine Size: 97 bytes,    Routine Base: _TEXT + 0037

0098				__RemoveThreadData_:
0098  53				push		ebx
0099  51				push		ecx
009A  52				push		edx
009B  89 C1				mov		ecx,eax
009D  FF 15 00 00 00 00			call		dword ptr __AccessTDList
00A3  BB 00 00 00 00			mov		ebx,offset ___thread_data_list
00A8  8B 15 00 00 00 00			mov		edx,dword ptr ___thread_data_list
00AE  EB 24				jmp		L$9
00B0				L$6:
00B0  3B 4A 04				cmp		ecx,dword ptr 0x4[edx]
00B3  75 1B				jne		L$8
00B5  83 7A 0C 00			cmp		dword ptr 0xc[edx],0x00000000
00B9  74 08				je		L$7
00BB  8B 42 08				mov		eax,dword ptr 0x8[edx]
00BE  E8 00 00 00 00			call		free_
00C3				L$7:
00C3  8B 02				mov		eax,dword ptr [edx]
00C5  89 03				mov		dword ptr [ebx],eax
00C7  89 D0				mov		eax,edx
00C9  E8 00 00 00 00			call		free_
00CE  EB 08				jmp		L$10
00D0				L$8:
00D0  89 D3				mov		ebx,edx
00D2  8B 12				mov		edx,dword ptr [edx]
00D4				L$9:
00D4  85 D2				test		edx,edx
00D6  75 D8				jne		L$6
00D8				L$10:
00D8  FF 15 00 00 00 00			call		dword ptr __ReleaseTDList
00DE				L$11:
00DE  5A				pop		edx
00DF  59				pop		ecx
00E0  5B				pop		ebx
00E1  C3				ret		

Routine Size: 74 bytes,    Routine Base: _TEXT + 0098

00E2				__FreeThreadDataList_:
00E2  53				push		ebx
00E3  51				push		ecx
00E4  52				push		edx
00E5  8B 15 00 00 00 00			mov		edx,dword ptr ___thread_data_list
00EB				L$12:
00EB  85 D2				test		edx,edx
00ED  74 EF				je		L$11
00EF  8B 4A 0C				mov		ecx,dword ptr 0xc[edx]
00F2  8B 1A				mov		ebx,dword ptr [edx]
00F4  85 C9				test		ecx,ecx
00F6  74 08				je		L$13
00F8  8B 42 08				mov		eax,dword ptr 0x8[edx]
00FB  E8 00 00 00 00			call		free_
0100				L$13:
0100  89 D0				mov		eax,edx
0102  E8 00 00 00 00			call		free_
0107  89 DA				mov		edx,ebx
0109  EB E0				jmp		L$12

Routine Size: 41 bytes,    Routine Base: _TEXT + 00E2

No disassembly errors

Segment: CONST DWORD USE32 00000025 bytes
0000				L$14:
0000  54 68 72 65 61 64 20 68 61 73 20 6E 6F 20 74 68 Thread has no th
0010  72 65 61 64 2D 73 70 65 63 69 66 69 63 20 64 61 read-specific da
0020  74 61 0D 0A 00                                  ta...

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000004 bytes
0000				___thread_data_list:

BSS Size: 4 bytes

