Module: clearenv
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000099 bytes
0000				clearenv_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  8B 15 00 00 00 00			mov		edx,dword ptr _environ
000A  85 D2				test		edx,edx
000C  0F 84 80 00 00 00			je		L$8
0012  EB 30				jmp		L$4
0014				L$1:
0014  83 3D 00 00 00 00 00		cmp		dword ptr ___env_mask,0x00000000
001B  74 24				je		L$3
001D  8B 35 00 00 00 00			mov		esi,dword ptr _environ
0023  89 D1				mov		ecx,edx
0025  29 F1				sub		ecx,esi
0027  8B 1D 00 00 00 00			mov		ebx,dword ptr ___env_mask
002D  C1 F9 02				sar		ecx,0x02
0030  80 3C 19 00			cmp		byte ptr [ecx+ebx],0x00
0034  74 05				je		L$2
0036  E8 00 00 00 00			call		free_
003B				L$2:
003B  C7 02 00 00 00 00			mov		dword ptr [edx],0x00000000
0041				L$3:
0041  83 C2 04				add		edx,0x00000004
0044				L$4:
0044  8B 02				mov		eax,dword ptr [edx]
0046  85 C0				test		eax,eax
0048  75 CA				jne		L$1
004A  83 3D 00 00 00 00 00		cmp		dword ptr ___env_mask,0x00000000
0051  75 0C				jne		L$5
0053  B8 05 00 00 00			mov		eax,0x00000005
0058  E8 00 00 00 00			call		malloc_
005D  EB 0F				jmp		L$6
005F				L$5:
005F  BA 05 00 00 00			mov		edx,0x00000005
0064  A1 00 00 00 00			mov		eax,dword ptr _environ
0069  E8 00 00 00 00			call		realloc_
006E				L$6:
006E  85 C0				test		eax,eax
0070  75 0A				jne		L$7
0072  B8 FF FF FF FF			mov		eax,0xffffffff
0077  5E				pop		esi
0078  5A				pop		edx
0079  59				pop		ecx
007A  5B				pop		ebx
007B  C3				ret		
007C				L$7:
007C  A3 00 00 00 00			mov		dword ptr _environ,eax
0081  C7 00 00 00 00 00			mov		dword ptr [eax],0x00000000
0087  83 C0 04				add		eax,0x00000004
008A  A3 00 00 00 00			mov		dword ptr ___env_mask,eax
008F  C6 00 00				mov		byte ptr [eax],0x00
0092				L$8:
0092  31 C0				xor		eax,eax
0094  5E				pop		esi
0095  5A				pop		edx
0096  59				pop		ecx
0097  5B				pop		ebx
0098  C3				ret		

Routine Size: 153 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

