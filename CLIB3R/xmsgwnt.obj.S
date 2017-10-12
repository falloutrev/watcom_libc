Module: xmsgwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000054 bytes
0000				__exit_with_msg_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  57				push		edi
0004  83 EC 04				sub		esp,0x00000004
0007  89 C7				mov		edi,eax
0009  89 D6				mov		esi,edx
000B  31 DB				xor		ebx,ebx
000D  EB 01				jmp		L$2
000F				L$1:
000F  43				inc		ebx
0010				L$2:
0010  89 C2				mov		edx,eax
0012  8A 0A				mov		cl,byte ptr [edx]
0014  40				inc		eax
0015  84 C9				test		cl,cl
0017  75 F6				jne		L$1
0019  6A 00				push		0x00000000
001B  8D 44 24 04			lea		eax,0x4[esp]
001F  50				push		eax
0020  53				push		ebx
0021  A1 00 00 00 00			mov		eax,dword ptr ___FileHandleIDs
0026  57				push		edi
0027  8B 50 08				mov		edx,dword ptr 0x8[eax]
002A  52				push		edx
002B  E8 00 00 00 00			call		_WriteFile
0030  89 F0				mov		eax,esi
0032  E9 00 00 00 00			jmp		__exit_

Routine Size: 55 bytes,    Routine Base: _TEXT + 0000

0037				__fatal_runtime_error_:
0037  53				push		ebx
0038  51				push		ecx
0039  89 C3				mov		ebx,eax
003B  89 D1				mov		ecx,edx
003D  8C DA				mov		edx,ds
003F  E8 00 00 00 00			call		__EnterWVIDEO_
0044  85 C0				test		eax,eax
0046  75 09				jne		L$3
0048  89 CA				mov		edx,ecx
004A  89 D8				mov		eax,ebx
004C  E8 00 00 00 00			call		__exit_with_msg_
0051				L$3:
0051  59				pop		ecx
0052  5B				pop		ebx
0053  C3				ret		

Routine Size: 29 bytes,    Routine Base: _TEXT + 0037

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

