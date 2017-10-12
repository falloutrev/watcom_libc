Module: setenvp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000B8 bytes
0000				__setenvp_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  57				push		edi
0005  83 3D 00 00 00 00 00		cmp		dword ptr _environ,0x00000000
000C  0F 85 A0 00 00 00			jne		L$10
0012  8B 3D 00 00 00 00			mov		edi,dword ptr __Envptr
0018  31 C9				xor		ecx,ecx
001A  30 D2				xor		dl,dl
001C  89 F8				mov		eax,edi
001E				L$1:
001E  3A 10				cmp		dl,byte ptr [eax]
0020  74 12				je		L$4
0022				L$2:
0022  8A 30				mov		dh,byte ptr [eax]
0024  8D 58 01				lea		ebx,0x1[eax]
0027  38 F2				cmp		dl,dh
0029  74 04				je		L$3
002B  89 D8				mov		eax,ebx
002D  EB F3				jmp		L$2
002F				L$3:
002F  41				inc		ecx
0030  89 D8				mov		eax,ebx
0032  EB EA				jmp		L$1
0034				L$4:
0034  29 F8				sub		eax,edi
0036  75 05				jne		L$5
0038  B8 01 00 00 00			mov		eax,0x00000001
003D				L$5:
003D  E8 00 00 00 00			call		_nmalloc_
0042  89 C2				mov		edx,eax
0044  89 C3				mov		ebx,eax
0046  85 C0				test		eax,eax
0048  74 68				je		L$10
004A  89 C8				mov		eax,ecx
004C  C1 E0 02				shl		eax,0x02
004F  83 C0 04				add		eax,0x00000004
0052  01 C8				add		eax,ecx
0054  E8 00 00 00 00			call		_nmalloc_
0059  85 C0				test		eax,eax
005B  74 4E				je		L$9
005D  A3 00 00 00 00			mov		dword ptr _environ,eax
0062  31 F6				xor		esi,esi
0064  31 C9				xor		ecx,ecx
0066  89 F8				mov		eax,edi
0068				L$6:
0068  80 38 00				cmp		byte ptr [eax],0x00
006B  74 19				je		L$8
006D  8B 15 00 00 00 00			mov		edx,dword ptr _environ
0073  89 1C 11				mov		dword ptr [ecx+edx],ebx
0076				L$7:
0076  8A 10				mov		dl,byte ptr [eax]
0078  40				inc		eax
0079  88 13				mov		byte ptr [ebx],dl
007B  43				inc		ebx
007C  84 D2				test		dl,dl
007E  75 F6				jne		L$7
0080  83 C1 04				add		ecx,0x00000004
0083  46				inc		esi
0084  EB E2				jmp		L$6
0086				L$8:
0086  8B 15 00 00 00 00			mov		edx,dword ptr _environ
008C  C7 04 11 00 00 00 00		mov		dword ptr [ecx+edx],0x00000000
0093  83 C1 04				add		ecx,0x00000004
0096  01 CA				add		edx,ecx
0098  89 F3				mov		ebx,esi
009A  89 15 00 00 00 00			mov		dword ptr ___env_mask,edx
00A0  89 D0				mov		eax,edx
00A2  31 D2				xor		edx,edx
00A4  E8 00 00 00 00			call		memset_
00A9  EB 07				jmp		L$10
00AB				L$9:
00AB  89 D0				mov		eax,edx
00AD  E8 00 00 00 00			call		_nfree_
00B2				L$10:
00B2  5F				pop		edi
00B3  5E				pop		esi
00B4  5A				pop		edx
00B5  59				pop		ecx
00B6  5B				pop		ebx
00B7  C3				ret		

Routine Size: 184 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

