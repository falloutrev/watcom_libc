Module: getenv
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000061 bytes
0000				getenv_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  57				push		edi
0005  55				push		ebp
0006  89 C5				mov		ebp,eax
0008  8B 35 00 00 00 00			mov		esi,dword ptr _environ
000E  85 F6				test		esi,esi
0010  74 46				je		L$4
0012  85 C0				test		eax,eax
0014  74 42				je		L$4
0016  89 C7				mov		edi,eax
0018  06				push		es
0019  8C D8				mov		eax,ds
001B  8E C0				mov		es,eax
001D  29 C9				sub		ecx,ecx
001F  49				dec		ecx
0020  31 C0				xor		eax,eax
0022  F2 AE				repne scasb	
0024  F7 D1				not		ecx
0026  49				dec		ecx
0027  07				pop		es
0028  89 CF				mov		edi,ecx
002A  EB 26				jmp		L$3
002C				L$1:
002C  89 FB				mov		ebx,edi
002E  89 EA				mov		edx,ebp
0030  89 C8				mov		eax,ecx
0032  E8 00 00 00 00			call		strnicmp_
0037  85 C0				test		eax,eax
0039  75 14				jne		L$2
003B  8A 04 39				mov		al,byte ptr [ecx+edi]
003E  25 FF 00 00 00			and		eax,0x000000ff
0043  83 F8 3D				cmp		eax,0x0000003d
0046  75 07				jne		L$2
0048  8D 47 01				lea		eax,0x1[edi]
004B  01 C8				add		eax,ecx
004D  EB 0B				jmp		L$5
004F				L$2:
004F  83 C6 04				add		esi,0x00000004
0052				L$3:
0052  8B 0E				mov		ecx,dword ptr [esi]
0054  85 C9				test		ecx,ecx
0056  75 D4				jne		L$1
0058				L$4:
0058  31 C0				xor		eax,eax
005A				L$5:
005A  5D				pop		ebp
005B  5F				pop		edi
005C  5E				pop		esi
005D  5A				pop		edx
005E  59				pop		ecx
005F  5B				pop		ebx
0060  C3				ret		

Routine Size: 97 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

