Module: growiomd
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000AC bytes
0000				__grow_iomode_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  57				push		edi
0005  55				push		ebp
0006  83 EC 04				sub		esp,0x00000004
0009  89 C5				mov		ebp,eax
000B  FF 15 00 00 00 00			call		dword ptr __AccessIOB
0011  89 EA				mov		edx,ebp
0013  8B 1D 00 00 00 00			mov		ebx,dword ptr __iomode
0019  C1 E2 02				shl		edx,0x02
001C  81 FB 00 00 00 00			cmp		ebx,offset ___init_mode
0022  75 33				jne		L$1
0024  31 C0				xor		eax,eax
0026  E8 00 00 00 00			call		realloc_
002B  89 04 24				mov		dword ptr [esp],eax
002E  85 C0				test		eax,eax
0030  74 2F				je		L$2
0032  8B 0D 00 00 00 00			mov		ecx,dword ptr ___NFiles
0038  89 DE				mov		esi,ebx
003A  89 C7				mov		edi,eax
003C  C1 E1 02				shl		ecx,0x02
003F  06				push		es
0040  8C D8				mov		eax,ds
0042  8E C0				mov		es,eax
0044  57				push		edi
0045  89 C8				mov		eax,ecx
0047  C1 E9 02				shr		ecx,0x02
004A  F2 A5				repne movsd	
004C  8A C8				mov		cl,al
004E  80 E1 03				and		cl,0x03
0051  F2 A4				repne movsb	
0053  5F				pop		edi
0054  07				pop		es
0055  EB 0A				jmp		L$2
0057				L$1:
0057  89 D8				mov		eax,ebx
0059  E8 00 00 00 00			call		realloc_
005E  89 04 24				mov		dword ptr [esp],eax
0061				L$2:
0061  8B 0C 24				mov		ecx,dword ptr [esp]
0064  85 C9				test		ecx,ecx
0066  75 0D				jne		L$3
0068  E8 00 00 00 00			call		__get_errno_ptr_
006D  C7 00 05 00 00 00			mov		dword ptr [eax],0x00000005
0073  EB 27				jmp		L$4
0075				L$3:
0075  8B 35 00 00 00 00			mov		esi,dword ptr ___NFiles
007B  89 EB				mov		ebx,ebp
007D  31 D2				xor		edx,edx
007F  89 F0				mov		eax,esi
0081  29 F3				sub		ebx,esi
0083  C1 E0 02				shl		eax,0x02
0086  C1 E3 02				shl		ebx,0x02
0089  01 C8				add		eax,ecx
008B  E8 00 00 00 00			call		memset_
0090  89 0D 00 00 00 00			mov		dword ptr __iomode,ecx
0096  89 2D 00 00 00 00			mov		dword ptr ___NFiles,ebp
009C				L$4:
009C  FF 15 00 00 00 00			call		dword ptr __ReleaseIOB
00A2  83 C4 04				add		esp,0x00000004
00A5  5D				pop		ebp
00A6  5F				pop		edi
00A7  5E				pop		esi
00A8  5A				pop		edx
00A9  59				pop		ecx
00AA  5B				pop		ebx
00AB  C3				ret		

Routine Size: 172 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

