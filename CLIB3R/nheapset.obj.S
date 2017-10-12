Module: nheapset
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000072 bytes
0000				_heapset_:
0000				_nheapset_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  57				push		edi
0005  55				push		ebp
0006  50				push		eax
0007  E8 00 00 00 00			call		_heapchk_
000C  85 C0				test		eax,eax
000E  75 58				jne		L$5
0010  8B 04 24				mov		eax,dword ptr [esp]
0013  8B 14 24				mov		edx,dword ptr [esp]
0016  C1 E0 08				shl		eax,0x08
0019  09 C2				or		edx,eax
001B  FF 15 00 00 00 00			call		dword ptr __AccessNHeap
0021  89 14 24				mov		dword ptr [esp],edx
0024  8B 2D 00 00 00 00			mov		ebp,dword ptr ___nheapbeg
002A  8A 04 24				mov		al,byte ptr [esp]
002D  8C DA				mov		edx,ds
002F  EB 2B				jmp		L$4
0031				L$1:
0031  8D 75 20				lea		esi,0x20[ebp]
0034  8B 5D 28				mov		ebx,dword ptr 0x28[ebp]
0037				L$2:
0037  39 F3				cmp		ebx,esi
0039  74 1E				je		L$3
003B  8B 0B				mov		ecx,dword ptr [ebx]
003D  8D 7B 0C				lea		edi,0xc[ebx]
0040  83 E9 0C				sub		ecx,0x0000000c
0043  06				push		es
0044  57				push		edi
0045  8E C2				mov		es,edx
0047  88 C4				mov		ah,al
0049  D1 E9				shr		ecx,0x01
004B  F2 66 AB				repne stosw	
004E  11 C9				adc		ecx,ecx
0050  F2 AA				repne stosb	
0052  5F				pop		edi
0053  07				pop		es
0054  8B 5B 08				mov		ebx,dword ptr 0x8[ebx]
0057  EB DE				jmp		L$2
0059				L$3:
0059  8B 6D 08				mov		ebp,dword ptr 0x8[ebp]
005C				L$4:
005C  85 ED				test		ebp,ebp
005E  75 D1				jne		L$1
0060  FF 15 00 00 00 00			call		dword ptr __ReleaseNHeap
0066  31 C0				xor		eax,eax
0068				L$5:
0068  83 C4 04				add		esp,0x00000004
006B  5D				pop		ebp
006C  5F				pop		edi
006D  5E				pop		esi
006E  5A				pop		edx
006F  59				pop		ecx
0070  5B				pop		ebx
0071  C3				ret		

Routine Size: 114 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

