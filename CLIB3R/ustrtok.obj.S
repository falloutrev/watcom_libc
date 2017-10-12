Module: ustrtok
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000009C bytes
0000				_ustrtok_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  C8 04 00 00			enter		0x0004,0x00
0007  89 C3				mov		ebx,eax
0009  89 D6				mov		esi,edx
000B  85 C0				test		eax,eax
000D  75 2C				jne		L$5
000F  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0015  8B 58 10				mov		ebx,dword ptr 0x10[eax]
0018  85 DB				test		ebx,ebx
001A  75 1F				jne		L$5
001C  E9 74 00 00 00			jmp		L$14
0021				L$1:
0021  89 F2				mov		edx,esi
0023  EB 07				jmp		L$3
0025				L$2:
0025  66 39 C1				cmp		cx,ax
0028  74 0A				je		L$4
002A  42				inc		edx
002B  42				inc		edx
002C				L$3:
002C  66 8B 02				mov		ax,word ptr [edx]
002F  66 85 C0				test		ax,ax
0032  75 F1				jne		L$2
0034				L$4:
0034  66 85 C0				test		ax,ax
0037  74 0A				je		L$6
0039  43				inc		ebx
003A  43				inc		ebx
003B				L$5:
003B  66 8B 0B				mov		cx,word ptr [ebx]
003E  66 85 C9				test		cx,cx
0041  75 DE				jne		L$1
0043				L$6:
0043  66 85 C9				test		cx,cx
0046  75 04				jne		L$7
0048  31 DB				xor		ebx,ebx
004A  EB 49				jmp		L$14
004C				L$7:
004C  89 DA				mov		edx,ebx
004E  EB 2D				jmp		L$13
0050				L$8:
0050  89 F0				mov		eax,esi
0052  EB 08				jmp		L$10
0054				L$9:
0054  66 3B 4D FC			cmp		cx,word ptr -0x4[ebp]
0058  74 0A				je		L$11
005A  40				inc		eax
005B  40				inc		eax
005C				L$10:
005C  66 8B 08				mov		cx,word ptr [eax]
005F  66 85 C9				test		cx,cx
0062  75 F0				jne		L$9
0064				L$11:
0064  66 85 C9				test		cx,cx
0067  74 12				je		L$12
0069  66 C7 02 00 00			mov		word ptr [edx],0x0000
006E  42				inc		edx
006F  42				inc		edx
0070  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0076  89 50 10				mov		dword ptr 0x10[eax],edx
0079  EB 1A				jmp		L$14
007B				L$12:
007B  42				inc		edx
007C  42				inc		edx
007D				L$13:
007D  66 8B 02				mov		ax,word ptr [edx]
0080  89 45 FC				mov		dword ptr -0x4[ebp],eax
0083  66 85 C0				test		ax,ax
0086  75 C8				jne		L$8
0088  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
008E  C7 40 10 00 00 00 00		mov		dword ptr 0x10[eax],0x00000000
0095				L$14:
0095  89 D8				mov		eax,ebx
0097  C9				leave		
0098  5E				pop		esi
0099  59				pop		ecx
009A  5B				pop		ebx
009B  C3				ret		

Routine Size: 156 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

