Module: ufdopen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000F3 bytes
0000				_ufdopen_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  57				push		edi
0004  C8 08 00 00			enter		0x0008,0x00
0008  89 C6				mov		esi,eax
000A  89 D7				mov		edi,edx
000C  83 F8 FF				cmp		eax,0xffffffff
000F  75 11				jne		L$2
0011  B8 04 00 00 00			mov		eax,0x00000004
0016  E8 00 00 00 00			call		__set_errno_
001B				L$1:
001B  31 C0				xor		eax,eax
001D  E9 7D 00 00 00			jmp		L$5
0022				L$2:
0022  89 D0				mov		eax,edx
0024  E8 00 00 00 00			call		__uopen_flags_
0029  89 C3				mov		ebx,eax
002B  89 45 F8				mov		dword ptr -0x8[ebp],eax
002E  85 C0				test		eax,eax
0030  74 6D				je		L$5
0032  89 C2				mov		edx,eax
0034  89 F0				mov		eax,esi
0036  E8 00 00 00 00			call		__iomode_
003B  83 F8 FF				cmp		eax,0xffffffff
003E  74 DB				je		L$1
0040  89 F0				mov		eax,esi
0042  E8 00 00 00 00			call		__allocfp_
0047  89 C1				mov		ecx,eax
0049  89 45 FC				mov		dword ptr -0x4[ebp],eax
004C  85 C0				test		eax,eax
004E  74 4C				je		L$4
0050  C7 40 04 00 00 00 00		mov		dword ptr 0x4[eax],0x00000000
0057  C7 40 08 00 00 00 00		mov		dword ptr 0x8[eax],0x00000000
005E  C7 40 14 00 00 00 00		mov		dword ptr 0x14[eax],0x00000000
0065  89 70 10				mov		dword ptr 0x10[eax],esi
0068  80 60 0C FC			and		byte ptr 0xc[eax],0xfc
006C  09 58 0C				or		dword ptr 0xc[eax],ebx
006F  0F B7 07				movzx		eax,word ptr [edi]
0072  E8 00 00 00 00			call		_utolower_
0077  83 F8 61				cmp		eax,0x00000061
007A  75 0E				jne		L$3
007C  BB 02 00 00 00			mov		ebx,0x00000002
0081  89 C8				mov		eax,ecx
0083  31 D2				xor		edx,edx
0085  E8 00 00 00 00			call		fseek_
008A				L$3:
008A  8B 45 FC				mov		eax,dword ptr -0x4[ebp]
008D  8B 55 F8				mov		edx,dword ptr -0x8[ebp]
0090  E8 00 00 00 00			call		__chktty_
0095  89 F0				mov		eax,esi
0097  E8 00 00 00 00			call		__SetIOMode_
009C				L$4:
009C  8B 45 FC				mov		eax,dword ptr -0x4[ebp]
009F				L$5:
009F  C9				leave		
00A0  5F				pop		edi
00A1  5E				pop		esi
00A2  59				pop		ecx
00A3  5B				pop		ebx
00A4  C3				ret		
00A5				__iomode_:
00A5  53				push		ebx
00A6  51				push		ecx
00A7  E8 00 00 00 00			call		__IOMode_
00AC  89 C3				mov		ebx,eax
00AE  89 C1				mov		ecx,eax
00B0  31 D3				xor		ebx,edx
00B2  31 C0				xor		eax,eax
00B4  F6 C3 C0				test		bl,0xc0
00B7  74 05				je		L$6
00B9  B8 06 00 00 00			mov		eax,0x00000006
00BE				L$6:
00BE  F6 C2 01				test		dl,0x01
00C1  74 0A				je		L$7
00C3  F6 C1 01				test		cl,0x01
00C6  75 05				jne		L$7
00C8  B8 06 00 00 00			mov		eax,0x00000006
00CD				L$7:
00CD  F6 C2 02				test		dl,0x02
00D0  74 0A				je		L$8
00D2  F6 C1 02				test		cl,0x02
00D5  75 05				jne		L$8
00D7  B8 06 00 00 00			mov		eax,0x00000006
00DC				L$8:
00DC  83 F8 06				cmp		eax,0x00000006
00DF  75 0D				jne		L$9
00E1  E8 00 00 00 00			call		__set_errno_
00E6  B8 FF FF FF FF			mov		eax,0xffffffff
00EB  59				pop		ecx
00EC  5B				pop		ebx
00ED  C3				ret		
00EE				L$9:
00EE  31 C0				xor		eax,eax
00F0  59				pop		ecx
00F1  5B				pop		ebx
00F2  C3				ret		

Routine Size: 243 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

