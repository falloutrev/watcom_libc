Module: jstrncpy
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000007A bytes
0000				jstrncpy_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 04				sub		esp,0x00000004
0007  50				push		eax
0008  89 DD				mov		ebp,ebx
000A  31 DB				xor		ebx,ebx
000C  EB 5D				jmp		L$6
000E				L$1:
000E  0F B6 32				movzx		esi,byte ptr [edx]
0011  8A 8E 01 00 00 00			mov		cl,byte ptr __IsKTable+0x1[esi]
0017  80 E1 04				and		cl,0x04
001A  0F B6 F1				movzx		esi,cl
001D  89 74 24 04			mov		dword ptr 0x4[esp],esi
0021  8D 7A 01				lea		edi,0x1[edx]
0024  8B 4C 24 04			mov		ecx,dword ptr 0x4[esp]
0028  8D 70 01				lea		esi,0x1[eax]
002B  85 C9				test		ecx,ecx
002D  74 22				je		L$3
002F  8A 12				mov		dl,byte ptr [edx]
0031  88 10				mov		byte ptr [eax],dl
0033  8A 07				mov		al,byte ptr [edi]
0035  8D 57 01				lea		edx,0x1[edi]
0038  88 C1				mov		cl,al
003A  88 06				mov		byte ptr [esi],al
003C  8D 46 01				lea		eax,0x1[esi]
003F  84 C9				test		cl,cl
0041  75 27				jne		L$5
0043  83 E8 02				sub		eax,0x00000002
0046				L$2:
0046  43				inc		ebx
0047  39 EB				cmp		ebx,ebp
0049  77 24				ja		L$7
004B  C6 00 00				mov		byte ptr [eax],0x00
004E  40				inc		eax
004F  EB F5				jmp		L$2
0051				L$3:
0051  8A 12				mov		dl,byte ptr [edx]
0053  88 D1				mov		cl,dl
0055  88 10				mov		byte ptr [eax],dl
0057  89 FA				mov		edx,edi
0059  89 F0				mov		eax,esi
005B  84 C9				test		cl,cl
005D  75 0B				jne		L$5
005F				L$4:
005F  43				inc		ebx
0060  39 EB				cmp		ebx,ebp
0062  73 0B				jae		L$7
0064  C6 00 00				mov		byte ptr [eax],0x00
0067  40				inc		eax
0068  EB F5				jmp		L$4
006A				L$5:
006A  43				inc		ebx
006B				L$6:
006B  39 EB				cmp		ebx,ebp
006D  72 9F				jb		L$1
006F				L$7:
006F  8B 04 24				mov		eax,dword ptr [esp]
0072  83 C4 08				add		esp,0x00000008
0075  5D				pop		ebp
0076  5F				pop		edi
0077  5E				pop		esi
0078  59				pop		ecx
0079  C3				ret		

Routine Size: 122 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

