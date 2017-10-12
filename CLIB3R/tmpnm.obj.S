Module: tmpnm
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000117 bytes
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
0016  72 08				jb		L$2
0018  80 C3 37				add		bl,0x37
001B  88 18				mov		byte ptr [eax],bl
001D  40				inc		eax
001E  5B				pop		ebx
001F  C3				ret		
0020				L$2:
0020  80 C3 30				add		bl,0x30
0023  88 18				mov		byte ptr [eax],bl
0025  40				inc		eax
0026  5B				pop		ebx
0027  C3				ret		
0028				init_name_:
0028  53				push		ebx
0029  52				push		edx
002A  B4 5F				mov		ah,0x5f
002C  BB 00 00 00 00			mov		ebx,offset __tmpname
0031  88 25 00 00 00 00			mov		byte ptr __tmpname,ah
0037  43				inc		ebx
0038  E8 00 00 00 00			call		getpid_
003D  89 C2				mov		edx,eax
003F  89 D8				mov		eax,ebx
0041  E8 00 00 00 00			call		putbits_
0046  8D 58 01				lea		ebx,0x1[eax]
0049  C6 00 2E				mov		byte ptr [eax],0x2e
004C  C6 03 41				mov		byte ptr [ebx],0x41
004F  43				inc		ebx
0050  C6 03 41				mov		byte ptr [ebx],0x41
0053  43				inc		ebx
0054  89 D8				mov		eax,ebx
0056  C6 03 40				mov		byte ptr [ebx],0x40
0059  2D 00 00 00 00			sub		eax,offset __tmpname
005E  5A				pop		edx
005F  5B				pop		ebx
0060  C3				ret		

Routine Size: 97 bytes,    Routine Base: _TEXT + 0000

0061				tmpnam_:
0061  53				push		ebx
0062  51				push		ecx
0063  52				push		edx
0064  56				push		esi
0065  57				push		edi
0066  55				push		ebp
0067  89 C3				mov		ebx,eax
0069  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
006F  8B 68 04				mov		ebp,dword ptr 0x4[eax]
0072  80 3D 00 00 00 00 00		cmp		byte ptr __tmpname,0x00
0079  75 09				jne		L$4
007B				L$3:
007B  E8 00 00 00 00			call		init_name_
0080  89 C6				mov		esi,eax
0082  EB 18				jmp		L$5
0084				L$4:
0084  BF 00 00 00 00			mov		edi,offset __tmpname
0089  06				push		es
008A  8C D8				mov		eax,ds
008C  8E C0				mov		es,eax
008E  29 C9				sub		ecx,ecx
0090  49				dec		ecx
0091  31 C0				xor		eax,eax
0093  F2 AE				repne scasb	
0095  F7 D1				not		ecx
0097  49				dec		ecx
0098  07				pop		es
0099  8D 71 FF				lea		esi,-0x1[ecx]
009C				L$5:
009C  31 C0				xor		eax,eax
009E  8A 86 00 00 00 00			mov		al,byte ptr __tmpname[esi]
00A4  83 F8 5A				cmp		eax,0x0000005a
00A7  75 18				jne		L$6
00A9  B6 41				mov		dh,0x41
00AB  31 C0				xor		eax,eax
00AD  88 B6 00 00 00 00			mov		byte ptr __tmpname[esi],dh
00B3  8A 86 FF FF FF FF			mov		al,byte ptr __tmpname-0x1[esi]
00B9  4E				dec		esi
00BA  83 F8 2E				cmp		eax,0x0000002e
00BD  75 DD				jne		L$5
00BF  EB BA				jmp		L$3
00C1				L$6:
00C1  88 C2				mov		dl,al
00C3  FE C2				inc		dl
00C5  B8 00 00 00 00			mov		eax,offset __tmpname
00CA  88 96 00 00 00 00			mov		byte ptr __tmpname[esi],dl
00D0  31 D2				xor		edx,edx
00D2  E8 00 00 00 00			call		access_
00D7  85 C0				test		eax,eax
00D9  74 C1				je		L$5
00DB  85 DB				test		ebx,ebx
00DD  74 23				je		L$9
00DF  BE 00 00 00 00			mov		esi,offset __tmpname
00E4  89 DF				mov		edi,ebx
00E6  57				push		edi
00E7				L$7:
00E7  8A 06				mov		al,byte ptr [esi]
00E9  88 07				mov		byte ptr [edi],al
00EB  3C 00				cmp		al,0x00
00ED  74 10				je		L$8
00EF  8A 46 01				mov		al,byte ptr 0x1[esi]
00F2  83 C6 02				add		esi,0x00000002
00F5  88 47 01				mov		byte ptr 0x1[edi],al
00F8  83 C7 02				add		edi,0x00000002
00FB  3C 00				cmp		al,0x00
00FD  75 E8				jne		L$7
00FF				L$8:
00FF  5F				pop		edi
0100  EB 05				jmp		L$10
0102				L$9:
0102  BB 00 00 00 00			mov		ebx,offset __tmpname
0107				L$10:
0107  89 E8				mov		eax,ebp
0109  E8 00 00 00 00			call		__set_errno_
010E  89 D8				mov		eax,ebx
0110  5D				pop		ebp
0111  5F				pop		edi
0112  5E				pop		esi
0113  5A				pop		edx
0114  59				pop		ecx
0115  5B				pop		ebx
0116  C3				ret		

Routine Size: 182 bytes,    Routine Base: _TEXT + 0061

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 0000000D bytes
0000				__tmpname:

BSS Size: 13 bytes

