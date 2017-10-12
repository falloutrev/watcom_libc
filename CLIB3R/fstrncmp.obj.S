Module: fstrncmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000003D bytes
0000				_fstrncmp_:
0000  06				push		es
0001  0F A0				push		fs
0003  8E C2				mov		es,edx
0005  8E E1				mov		fs,ecx
0007  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
000B				L$1:
000B  85 D2				test		edx,edx
000D  75 04				jne		L$3
000F				L$2:
000F  31 C0				xor		eax,eax
0011  EB 24				jmp		L$5
0013				L$3:
0013  26 8A 08				mov		cl,byte ptr es:[eax]
0016  64 8A 2B				mov		ch,byte ptr fs:[ebx]
0019  38 E9				cmp		cl,ch
001B  74 0F				je		L$4
001D  88 C8				mov		al,cl
001F  31 D2				xor		edx,edx
0021  25 FF 00 00 00			and		eax,0x000000ff
0026  88 EA				mov		dl,ch
0028  29 D0				sub		eax,edx
002A  EB 0B				jmp		L$5
002C				L$4:
002C  26 80 38 00			cmp		byte ptr es:[eax],0x00
0030  74 DD				je		L$2
0032  40				inc		eax
0033  43				inc		ebx
0034  4A				dec		edx
0035  EB D4				jmp		L$1
0037				L$5:
0037  0F A1				pop		fs
0039  07				pop		es
003A  C2 04 00				ret		0x0004

Routine Size: 61 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

