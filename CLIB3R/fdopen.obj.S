Module: fdopen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000102 bytes
0000				_fdopen_:
0000				fdopen_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  57				push		edi
0004  55				push		ebp
0005  83 EC 04				sub		esp,0x00000004
0008  89 C6				mov		esi,eax
000A  89 D7				mov		edi,edx
000C  83 F8 FF				cmp		eax,0xffffffff
000F  75 11				jne		L$2
0011  B8 04 00 00 00			mov		eax,0x00000004
0016  E8 00 00 00 00			call		__set_errno_
001B				L$1:
001B  31 C0				xor		eax,eax
001D  E9 89 00 00 00			jmp		L$5
0022				L$2:
0022  89 D0				mov		eax,edx
0024  E8 00 00 00 00			call		__open_flags_
0029  89 C3				mov		ebx,eax
002B  89 04 24				mov		dword ptr [esp],eax
002E  85 C0				test		eax,eax
0030  0F 84 75 00 00 00			je		L$5
0036  89 C2				mov		edx,eax
0038  89 F0				mov		eax,esi
003A  E8 00 00 00 00			call		__iomode_
003F  83 F8 FF				cmp		eax,0xffffffff
0042  74 D7				je		L$1
0044  89 F0				mov		eax,esi
0046  E8 00 00 00 00			call		__allocfp_
004B  89 C1				mov		ecx,eax
004D  89 C5				mov		ebp,eax
004F  85 C0				test		eax,eax
0051  74 56				je		L$4
0053  8A 60 0C				mov		ah,byte ptr 0xc[eax]
0056  C7 41 04 00 00 00 00		mov		dword ptr 0x4[ecx],0x00000000
005D  C7 41 08 00 00 00 00		mov		dword ptr 0x8[ecx],0x00000000
0064  80 E4 FC				and		ah,0xfc
0067  C7 41 14 00 00 00 00		mov		dword ptr 0x14[ecx],0x00000000
006E  88 61 0C				mov		byte ptr 0xc[ecx],ah
0071  8B 51 0C				mov		edx,dword ptr 0xc[ecx]
0074  89 71 10				mov		dword ptr 0x10[ecx],esi
0077  09 DA				or		edx,ebx
0079  31 C0				xor		eax,eax
007B  89 51 0C				mov		dword ptr 0xc[ecx],edx
007E  8A 07				mov		al,byte ptr [edi]
0080  E8 00 00 00 00			call		tolower_
0085  83 F8 61				cmp		eax,0x00000061
0088  75 0E				jne		L$3
008A  BB 02 00 00 00			mov		ebx,0x00000002
008F  89 C8				mov		eax,ecx
0091  31 D2				xor		edx,edx
0093  E8 00 00 00 00			call		fseek_
0098				L$3:
0098  89 E8				mov		eax,ebp
009A  8B 14 24				mov		edx,dword ptr [esp]
009D  E8 00 00 00 00			call		__chktty_
00A2  89 F0				mov		eax,esi
00A4  E8 00 00 00 00			call		__SetIOMode_
00A9				L$4:
00A9  89 E8				mov		eax,ebp
00AB				L$5:
00AB  83 C4 04				add		esp,0x00000004
00AE  5D				pop		ebp
00AF  5F				pop		edi
00B0  5E				pop		esi
00B1  59				pop		ecx
00B2  5B				pop		ebx
00B3  C3				ret		
00B4				__iomode_:
00B4  53				push		ebx
00B5  51				push		ecx
00B6  E8 00 00 00 00			call		__IOMode_
00BB  89 C3				mov		ebx,eax
00BD  89 C1				mov		ecx,eax
00BF  31 D3				xor		ebx,edx
00C1  31 C0				xor		eax,eax
00C3  F6 C3 C0				test		bl,0xc0
00C6  74 05				je		L$6
00C8  B8 06 00 00 00			mov		eax,0x00000006
00CD				L$6:
00CD  F6 C2 01				test		dl,0x01
00D0  74 0A				je		L$7
00D2  F6 C1 01				test		cl,0x01
00D5  75 05				jne		L$7
00D7  B8 06 00 00 00			mov		eax,0x00000006
00DC				L$7:
00DC  F6 C2 02				test		dl,0x02
00DF  74 0A				je		L$8
00E1  F6 C1 02				test		cl,0x02
00E4  75 05				jne		L$8
00E6  B8 06 00 00 00			mov		eax,0x00000006
00EB				L$8:
00EB  83 F8 06				cmp		eax,0x00000006
00EE  75 0D				jne		L$9
00F0  E8 00 00 00 00			call		__set_errno_
00F5  B8 FF FF FF FF			mov		eax,0xffffffff
00FA  59				pop		ecx
00FB  5B				pop		ebx
00FC  C3				ret		
00FD				L$9:
00FD  31 C0				xor		eax,eax
00FF  59				pop		ecx
0100  5B				pop		ebx
0101  C3				ret		

Routine Size: 258 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

