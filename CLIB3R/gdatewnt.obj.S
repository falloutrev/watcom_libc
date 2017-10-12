Module: gdatewnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000032 bytes
0000				_dos_getdate_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  83 EC 10				sub		esp,0x00000010
0006  89 C3				mov		ebx,eax
0008  89 E0				mov		eax,esp
000A  50				push		eax
000B  E8 00 00 00 00			call		_GetLocalTime
0010  8A 44 24 06			mov		al,byte ptr 0x6[esp]
0014  88 03				mov		byte ptr [ebx],al
0016  8A 44 24 02			mov		al,byte ptr 0x2[esp]
001A  88 43 01				mov		byte ptr 0x1[ebx],al
001D  8B 04 24				mov		eax,dword ptr [esp]
0020  66 89 43 02			mov		word ptr 0x2[ebx],ax
0024  8A 44 24 04			mov		al,byte ptr 0x4[esp]
0028  88 43 04				mov		byte ptr 0x4[ebx],al
002B  83 C4 10				add		esp,0x00000010
002E  5A				pop		edx
002F  59				pop		ecx
0030  5B				pop		ebx
0031  C3				ret		

Routine Size: 50 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

