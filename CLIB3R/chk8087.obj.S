Module: chk8087
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000008E bytes
0000				__save_8087_:
0000  9B DD 30				fsave		[eax]
0003  9B				fwait		
0004  C3				ret		
0005				__rest_8087_:
0005  DD 20				frstor		[eax]
0007  9B				fwait		
0008  C3				ret		

Routine Size: 9 bytes,    Routine Base: _TEXT + 0000

0009				__init_8087_:
0009  53				push		ebx
000A  52				push		edx
000B  80 3D 00 00 00 00 00		cmp		byte ptr __real87,0x00
0012  74 16				je		L$1
0014  BA 00 00 00 00			mov		edx,offset __save_8087_
0019  BB 00 00 00 00			mov		ebx,offset __rest_8087_
001E  89 15 00 00 00 00			mov		dword ptr ___Save8087,edx
0024  89 1D 00 00 00 00			mov		dword ptr ___Rest8087,ebx
002A				L$1:
002A  31 C0				xor		eax,eax
002C  66 A1 00 00 00 00			mov		ax,word ptr __8087cw
0032  E8 00 00 00 00			call		__init_80x87
0037  5A				pop		edx
0038  5B				pop		ebx
0039  C3				ret		

Routine Size: 49 bytes,    Routine Base: _TEXT + 0009

003A				_fpreset_:
003A  80 3D 00 00 00 00 00		cmp		byte ptr __real87,0x00
0041  75 C6				jne		__init_8087_
0043  C3				ret		

Routine Size: 10 bytes,    Routine Base: _TEXT + 003A

0044				__chk8087_:
0044  52				push		edx
0045  8A 25 00 00 00 00			mov		ah,byte ptr __8087
004B  84 E4				test		ah,ah
004D  75 3D				jne		L$3
004F  88 25 00 00 00 00			mov		byte ptr __real87,ah
0055  30 D2				xor		dl,dl
0057  2B C0				sub		eax,eax
0059  50				push		eax
005A  DB E3				fninit		
005C  D9 3C 24				fnstcw		word ptr [esp]
005F  58				pop		eax
0060  8A C4				mov		al,ah
0062  30 F6				xor		dh,dh
0064  25 FF 00 00 00			and		eax,0x000000ff
0069  83 F8 03				cmp		eax,0x00000003
006C  75 09				jne		L$2
006E  E8 00 00 00 00			call		__init_8087_
0073  88 C2				mov		dl,al
0075  88 C6				mov		dh,al
0077				L$2:
0077  80 3D 00 00 00 00 00		cmp		byte ptr __no87,0x00
007E  75 0C				jne		L$3
0080  88 15 00 00 00 00			mov		byte ptr __8087,dl
0086  88 35 00 00 00 00			mov		byte ptr __real87,dh
008C				L$3:
008C  5A				pop		edx
008D  C3				ret		

Routine Size: 74 bytes,    Routine Base: _TEXT + 0044

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

