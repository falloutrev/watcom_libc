Module: ufgetc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000194 bytes
0000				read_wide_char_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  57				push		edi
0004  C8 08 00 00			enter		0x0008,0x00
0008  89 C6				mov		esi,eax
000A  89 D7				mov		edi,edx
000C  F6 40 0C 40			test		byte ptr 0xc[eax],0x40
0010  74 15				je		L$1
0012  BB 01 00 00 00			mov		ebx,0x00000001
0017  BA 02 00 00 00			mov		edx,0x00000002
001C  89 C1				mov		ecx,eax
001E  89 F8				mov		eax,edi
0020  E8 00 00 00 00			call		fread_
0025  EB 60				jmp		L$4
0027				L$1:
0027  BB 01 00 00 00			mov		ebx,0x00000001
002C  89 C1				mov		ecx,eax
002E  8D 45 FC				lea		eax,-0x4[ebp]
0031  89 DA				mov		edx,ebx
0033  E8 00 00 00 00			call		fread_
0038  85 C0				test		eax,eax
003A  74 4B				je		L$4
003C  0F B6 45 FC			movzx		eax,byte ptr -0x4[ebp]
0040  8A 80 01 00 00 00			mov		al,byte ptr __IsKTable+0x1[eax]
0046  24 04				and		al,0x04
0048  0F B6 C0				movzx		eax,al
004B  85 C0				test		eax,eax
004D  74 15				je		L$2
004F  BB 01 00 00 00			mov		ebx,0x00000001
0054  8D 45 FD				lea		eax,-0x3[ebp]
0057  89 F1				mov		ecx,esi
0059  89 DA				mov		edx,ebx
005B  E8 00 00 00 00			call		fread_
0060  85 C0				test		eax,eax
0062  74 23				je		L$4
0064				L$2:
0064  BB 02 00 00 00			mov		ebx,0x00000002
0069  8D 55 FC				lea		edx,-0x4[ebp]
006C  8D 45 F8				lea		eax,-0x8[ebp]
006F  E8 00 00 00 00			call		mbtowc_
0074  85 C0				test		eax,eax
0076  7C 0D				jl		L$3
0078  8B 45 F8				mov		eax,dword ptr -0x8[ebp]
007B  66 89 07				mov		word ptr [edi],ax
007E  B8 01 00 00 00			mov		eax,0x00000001
0083  EB 02				jmp		L$4
0085				L$3:
0085  31 C0				xor		eax,eax
0087				L$4:
0087  C9				leave		
0088  5F				pop		edi
0089  5E				pop		esi
008A  59				pop		ecx
008B  5B				pop		ebx
008C  C3				ret		

Routine Size: 141 bytes,    Routine Base: _TEXT + 0000

008D				_ufgetc_:
008D  53				push		ebx
008E  52				push		edx
008F  C8 04 00 00			enter		0x0004,0x00
0093  89 C3				mov		ebx,eax
0095  8D 55 FC				lea		edx,-0x4[ebp]
0098  E8 00 00 00 00			call		read_wide_char_
009D  85 C0				test		eax,eax
009F  75 09				jne		L$6
00A1				L$5:
00A1  B8 FF FF FF FF			mov		eax,0xffffffff
00A6  C9				leave		
00A7  5A				pop		edx
00A8  5B				pop		ebx
00A9  C3				ret		
00AA				L$6:
00AA  F6 43 0C 40			test		byte ptr 0xc[ebx],0x40
00AE  75 15				jne		L$7
00B0  66 83 7D FC 0D			cmp		word ptr -0x4[ebp],0x000d
00B5  75 0E				jne		L$7
00B7  8D 55 FC				lea		edx,-0x4[ebp]
00BA  89 D8				mov		eax,ebx
00BC  E8 00 00 00 00			call		read_wide_char_
00C1  85 C0				test		eax,eax
00C3  74 DC				je		L$5
00C5				L$7:
00C5  0F B7 45 FC			movzx		eax,word ptr -0x4[ebp]
00C9  C9				leave		
00CA  5A				pop		edx
00CB  5B				pop		ebx
00CC  C3				ret		

Routine Size: 64 bytes,    Routine Base: _TEXT + 008D

00CD				__ufilbuf_:
00CD  52				push		edx
00CE  89 C2				mov		edx,eax
00D0  E8 00 00 00 00			call		__ufill_buffer_
00D5  85 C0				test		eax,eax
00D7  75 07				jne		L$8
00D9  B8 FF FF FF FF			mov		eax,0xffffffff
00DE  5A				pop		edx
00DF  C3				ret		
00E0				L$8:
00E0  83 02 02				add		dword ptr [edx],0x00000002
00E3  8B 02				mov		eax,dword ptr [edx]
00E5  83 6A 04 02			sub		dword ptr 0x4[edx],0x00000002
00E9  66 8B 40 FE			mov		ax,word ptr -0x2[eax]
00ED  0F B7 C0				movzx		eax,ax
00F0  5A				pop		edx
00F1  C3				ret		

Routine Size: 37 bytes,    Routine Base: _TEXT + 00CD

00F2				__ufill_buffer_:
00F2  53				push		ebx
00F3  51				push		ecx
00F4  52				push		edx
00F5  89 C1				mov		ecx,eax
00F7  83 78 08 00			cmp		dword ptr 0x8[eax],0x00000000
00FB  75 05				jne		L$9
00FD  E8 00 00 00 00			call		__ioalloc_
0102				L$9:
0102  F6 41 0D 20			test		byte ptr 0xd[ecx],0x20
0106  74 10				je		L$10
0108  F6 41 0D 06			test		byte ptr 0xd[ecx],0x06
010C  74 0A				je		L$10
010E  B8 00 20 00 00			mov		eax,0x00002000
0113  E8 00 00 00 00			call		__flushall_
0118				L$10:
0118  8B 51 08				mov		edx,dword ptr 0x8[ecx]
011B  8B 41 0C				mov		eax,dword ptr 0xc[ecx]
011E  89 11				mov		dword ptr [ecx],edx
0120  25 00 24 00 00			and		eax,0x00002400
0125  80 61 0C FB			and		byte ptr 0xc[ecx],0xfb
0129  3D 00 24 00 00			cmp		eax,0x00002400
012E  75 27				jne		L$11
0130  83 79 10 00			cmp		dword ptr 0x10[ecx],0x00000000
0134  75 21				jne		L$11
0136  C7 41 04 00 00 00 00		mov		dword ptr 0x4[ecx],0x00000000
013D  E8 00 00 00 00			call		getche_
0142  89 C2				mov		edx,eax
0144  83 F8 FF				cmp		eax,0xffffffff
0147  74 2B				je		L$14
0149  8B 19				mov		ebx,dword ptr [ecx]
014B  66 89 03				mov		word ptr [ebx],ax
014E  C7 41 04 02 00 00 00		mov		dword ptr 0x4[ecx],0x00000002
0155  EB 1D				jmp		L$14
0157				L$11:
0157  F6 41 0D 04			test		byte ptr 0xd[ecx],0x04
015B  74 07				je		L$12
015D  BB 02 00 00 00			mov		ebx,0x00000002
0162  EB 03				jmp		L$13
0164				L$12:
0164  8B 59 14				mov		ebx,dword ptr 0x14[ecx]
0167				L$13:
0167  8B 11				mov		edx,dword ptr [ecx]
0169  8B 41 10				mov		eax,dword ptr 0x10[ecx]
016C  E8 00 00 00 00			call		__qread_
0171  89 41 04				mov		dword ptr 0x4[ecx],eax
0174				L$14:
0174  83 79 04 00			cmp		dword ptr 0x4[ecx],0x00000000
0178  7F 13				jg		L$16
017A  75 06				jne		L$15
017C  80 49 0C 10			or		byte ptr 0xc[ecx],0x10
0180  EB 0B				jmp		L$16
0182				L$15:
0182  C7 41 04 00 00 00 00		mov		dword ptr 0x4[ecx],0x00000000
0189  80 49 0C 20			or		byte ptr 0xc[ecx],0x20
018D				L$16:
018D  8B 41 04				mov		eax,dword ptr 0x4[ecx]
0190  5A				pop		edx
0191  59				pop		ecx
0192  5B				pop		ebx
0193  C3				ret		

Routine Size: 162 bytes,    Routine Base: _TEXT + 00F2

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

