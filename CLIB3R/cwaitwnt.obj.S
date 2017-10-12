Module: cwaitwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000063 bytes
0000				cwait_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  83 EC 04				sub		esp,0x00000004
0006  89 C7				mov		edi,eax
0008  89 D6				mov		esi,edx
000A  85 DB				test		ebx,ebx
000C  74 11				je		L$3
000E				L$1:
000E  B8 09 00 00 00			mov		eax,0x00000009
0013				L$2:
0013  E8 00 00 00 00			call		__set_errno_
0018  B8 FF FF FF FF			mov		eax,0xffffffff
001D  EB 3D				jmp		L$5
001F				L$3:
001F  52				push		edx
0020  53				push		ebx
0021  68 00 04 10 00			push		0x00100400
0026  E8 00 00 00 00			call		_OpenProcess
002B  89 C3				mov		ebx,eax
002D  85 C0				test		eax,eax
002F  75 07				jne		L$4
0031  B8 11 00 00 00			mov		eax,0x00000011
0036  EB DB				jmp		L$2
0038				L$4:
0038  6A FF				push		0xffffffff
003A  50				push		eax
003B  E8 00 00 00 00			call		_WaitForSingleObject
0040  85 C0				test		eax,eax
0042  75 CA				jne		L$1
0044  89 E0				mov		eax,esp
0046  50				push		eax
0047  53				push		ebx
0048  E8 00 00 00 00			call		_GetExitCodeProcess
004D  8B 04 24				mov		eax,dword ptr [esp]
0050  C1 E0 08				shl		eax,0x08
0053  25 00 FF 00 00			and		eax,0x0000ff00
0058  89 07				mov		dword ptr [edi],eax
005A  89 F0				mov		eax,esi
005C				L$5:
005C  83 C4 04				add		esp,0x00000004
005F  5F				pop		edi
0060  5E				pop		esi
0061  59				pop		ecx
0062  C3				ret		

Routine Size: 99 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

