Module: locking
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000079 bytes
0000				_locking_:
0000				locking_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 04				sub		esp,0x00000004
0007  89 C6				mov		esi,eax
0009  89 D5				mov		ebp,edx
000B  89 DF				mov		edi,ebx
000D  BB 01 00 00 00			mov		ebx,0x00000001
0012  31 D2				xor		edx,edx
0014  E8 00 00 00 00			call		lseek_
0019  89 04 24				mov		dword ptr [esp],eax
001C  85 ED				test		ebp,ebp
001E  75 0D				jne		L$1
0020  89 FB				mov		ebx,edi
0022  89 C2				mov		edx,eax
0024  89 F0				mov		eax,esi
0026  E8 00 00 00 00			call		unlock_
002B  EB 44				jmp		L$3
002D				L$1:
002D  31 C9				xor		ecx,ecx
002F				L$2:
002F  8B 14 24				mov		edx,dword ptr [esp]
0032  89 FB				mov		ebx,edi
0034  89 F0				mov		eax,esi
0036  E8 00 00 00 00			call		lock_
003B  89 C2				mov		edx,eax
003D  85 C0				test		eax,eax
003F  74 30				je		L$3
0041  83 FD 02				cmp		ebp,0x00000002
0044  74 2B				je		L$3
0046  83 FD 04				cmp		ebp,0x00000004
0049  74 26				je		L$3
004B  B8 01 00 00 00			mov		eax,0x00000001
0050  41				inc		ecx
0051  E8 00 00 00 00			call		sleep_
0056  83 F9 0A				cmp		ecx,0x0000000a
0059  7C D4				jl		L$2
005B  89 D0				mov		eax,edx
005D  E8 00 00 00 00			call		__set_doserrno_
0062  B8 0F 00 00 00			mov		eax,0x0000000f
0067  E8 00 00 00 00			call		__set_errno_
006C  B8 FF FF FF FF			mov		eax,0xffffffff
0071				L$3:
0071  83 C4 04				add		esp,0x00000004
0074  5D				pop		ebp
0075  5F				pop		edi
0076  5E				pop		esi
0077  59				pop		ecx
0078  C3				ret		

Routine Size: 121 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

