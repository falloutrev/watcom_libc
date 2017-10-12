Module: utmpnm
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000101 bytes
0000				putbits_:
0000  53				push		ebx
0001  89 D3				mov		ebx,edx
0003  83 FA 1F				cmp		edx,0x0000001f
0006  76 0B				jbe		L$1
0008  C1 EA 05				shr		edx,0x05
000B  E8 00 00 00 00			call		putbits_
0010  83 E3 1F				and		ebx,0x0000001f
0013				L$1:
0013  83 FB 0A				cmp		ebx,0x0000000a
0016  72 05				jb		L$2
0018  83 C3 37				add		ebx,0x00000037
001B  EB 03				jmp		L$3
001D				L$2:
001D  83 C3 30				add		ebx,0x00000030
0020				L$3:
0020  66 89 18				mov		word ptr [eax],bx
0023  40				inc		eax
0024  40				inc		eax
0025  5B				pop		ebx
0026  C3				ret		
0027				init_name_:
0027  53				push		ebx
0028  52				push		edx
0029  66 C7 05 00 00 00 00 5F 00	mov		word ptr __tmpname,0x005f
0032  BB 00 00 00 00			mov		ebx,offset __tmpname
0037  E8 00 00 00 00			call		getpid_
003C  43				inc		ebx
003D  43				inc		ebx
003E  89 C2				mov		edx,eax
0040  89 D8				mov		eax,ebx
0042  E8 00 00 00 00			call		putbits_
0047  8D 58 02				lea		ebx,0x2[eax]
004A  66 C7 00 2E 00			mov		word ptr [eax],0x002e
004F  66 C7 03 41 00			mov		word ptr [ebx],0x0041
0054  43				inc		ebx
0055  43				inc		ebx
0056  66 C7 03 41 00			mov		word ptr [ebx],0x0041
005B  43				inc		ebx
005C  43				inc		ebx
005D  89 D8				mov		eax,ebx
005F  2D 00 00 00 00			sub		eax,offset __tmpname
0064  66 C7 03 40 00			mov		word ptr [ebx],0x0040
0069  D1 F8				sar		eax,0x01
006B  5A				pop		edx
006C  5B				pop		ebx
006D  C3				ret		

Routine Size: 110 bytes,    Routine Base: _TEXT + 0000

006E				_utmpnam_:
006E  53				push		ebx
006F  51				push		ecx
0070  52				push		edx
0071  56				push		esi
0072  89 C3				mov		ebx,eax
0074  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
007A  8B 70 04				mov		esi,dword ptr 0x4[eax]
007D  66 83 3D 00 00 00 00 00		cmp		word ptr __tmpname,0x0000
0085  75 09				jne		L$5
0087				L$4:
0087  E8 00 00 00 00			call		init_name_
008C  89 C1				mov		ecx,eax
008E  EB 0D				jmp		L$6
0090				L$5:
0090  B8 00 00 00 00			mov		eax,offset __tmpname
0095  E8 00 00 00 00			call		_ustrlen_
009A  8D 48 FF				lea		ecx,-0x1[eax]
009D				L$6:
009D  8D 04 09				lea		eax,[ecx+ecx]
00A0  0F B7 90 00 00 00 00		movzx		edx,word ptr __tmpname[eax]
00A7  83 FA 5A				cmp		edx,0x0000005a
00AA  75 19				jne		L$7
00AC  66 C7 80 00 00 00 00 41 00	mov		word ptr __tmpname[eax],0x0041
00B5  0F B7 04 4D FE FF FF FF		movzx		eax,word ptr __tmpname-0x2[ecx*2]
00BD  49				dec		ecx
00BE  83 F8 2E				cmp		eax,0x0000002e
00C1  75 DA				jne		L$6
00C3  EB C2				jmp		L$4
00C5				L$7:
00C5  31 D2				xor		edx,edx
00C7  66 FF 80 00 00 00 00		inc		word ptr __tmpname[eax]
00CE  B8 00 00 00 00			mov		eax,offset __tmpname
00D3  E8 00 00 00 00			call		_uaccess_
00D8  85 C0				test		eax,eax
00DA  74 C1				je		L$6
00DC  85 DB				test		ebx,ebx
00DE  74 0E				je		L$8
00E0  BA 00 00 00 00			mov		edx,offset __tmpname
00E5  89 D8				mov		eax,ebx
00E7  E8 00 00 00 00			call		_ustrcpy_
00EC  EB 05				jmp		L$9
00EE				L$8:
00EE  BB 00 00 00 00			mov		ebx,offset __tmpname
00F3				L$9:
00F3  89 F0				mov		eax,esi
00F5  E8 00 00 00 00			call		__set_errno_
00FA  89 D8				mov		eax,ebx
00FC  5E				pop		esi
00FD  5A				pop		edx
00FE  59				pop		ecx
00FF  5B				pop		ebx
0100  C3				ret		

Routine Size: 147 bytes,    Routine Base: _TEXT + 006E

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 0000001A bytes
0000				__tmpname:

BSS Size: 26 bytes

