Module: filelen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000059 bytes
0000				filelength_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  57				push		edi
0005  89 C1				mov		ecx,eax
0007  FF 15 00 00 00 00			call		dword ptr __AccessFileH
000D  BB 01 00 00 00			mov		ebx,0x00000001
0012  89 C8				mov		eax,ecx
0014  31 D2				xor		edx,edx
0016  E8 00 00 00 00			call		lseek_
001B  89 C6				mov		esi,eax
001D  83 F8 FF				cmp		eax,0xffffffff
0020  75 0C				jne		L$1
0022  89 C8				mov		eax,ecx
0024  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
002A  89 F0				mov		eax,esi
002C  EB 25				jmp		L$2
002E				L$1:
002E  BB 02 00 00 00			mov		ebx,0x00000002
0033  89 C8				mov		eax,ecx
0035  31 D2				xor		edx,edx
0037  E8 00 00 00 00			call		lseek_
003C  89 C7				mov		edi,eax
003E  89 F2				mov		edx,esi
0040  89 C8				mov		eax,ecx
0042  31 DB				xor		ebx,ebx
0044  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
004A  89 C8				mov		eax,ecx
004C  E8 00 00 00 00			call		lseek_
0051  89 F8				mov		eax,edi
0053				L$2:
0053  5F				pop		edi
0054  5E				pop		esi
0055  5A				pop		edx
0056  59				pop		ecx
0057  5B				pop		ebx
0058  C3				ret		

Routine Size: 89 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

