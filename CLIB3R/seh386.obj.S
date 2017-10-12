Module: seh386
GROUP: 'DGROUP' _DATA

Segment: _TEXT DWORD USE32 0000012A bytes
0000				__TryInit_:
0000  64 FF 35 00 00 00 00		push		dword ptr fs:[0x0]
0007  8F 00				pop		dword ptr [eax]
0009  C7 40 04 32 00 00 00		mov		dword ptr 0x4[eax],offset __TryHandler
0010  89 68 08				mov		dword ptr 0x8[eax],ebp
0013  C6 40 10 FF			mov		byte ptr 0x10[eax],0xff
0017  C6 40 11 00			mov		byte ptr 0x11[eax],0x00
001B  64 A3 00 00 00 00			mov		dword ptr fs:[0x0],eax
0021  C3				ret		

Routine Size: 34 bytes,    Routine Base: _TEXT + 0000

0022				__TryFini_:
0022  FF 30				push		dword ptr [eax]
0024  64 8F 05 00 00 00 00		pop		dword ptr fs:[0x0]
002B  64 A3 00 00 00 00			mov		dword ptr fs:[0x0],eax
0031  C3				ret		

Routine Size: 16 bytes,    Routine Base: _TEXT + 0022

0032				__TryHandler:
0032  55				push		ebp
0033  89 E5				mov		ebp,esp
0035  57				push		edi
0036  56				push		esi
0037  52				push		edx
0038  51				push		ecx
0039  53				push		ebx
003A  8B 7D 0C				mov		edi,dword ptr 0xc[ebp]
003D  8B 45 10				mov		eax,dword ptr 0x10[ebp]
0040  50				push		eax
0041  8B 45 08				mov		eax,dword ptr 0x8[ebp]
0044  50				push		eax
0045  F7 40 04 06 00 00 00		test		dword ptr 0x4[eax],0x00000006
004C  75 0D				jne		L$1
004E  89 FD				mov		ebp,edi
0050  C6 45 12 FF			mov		byte ptr 0x12[ebp],0xff
0054  E8 79 00 00 00			call		L$9
0059  EB 3E				jmp		L$4
005B				L$1:
005B  89 67 18				mov		dword ptr 0x18[edi],esp
005E  8D 47 18				lea		eax,0x18[edi]
0061  89 47 14				mov		dword ptr 0x14[edi],eax
0064  89 FD				mov		ebp,edi
0066  8B 7D 0C				mov		edi,dword ptr 0xc[ebp]
0069  29 DB				sub		ebx,ebx
006B  8A 5D 10				mov		bl,byte ptr 0x10[ebp]
006E				L$2:
006E  80 FB FF				cmp		bl,0xff
0071  74 26				je		L$4
0073  88 5D 12				mov		byte ptr 0x12[ebp],bl
0076  8D 1C 5B				lea		ebx,[ebx+ebx*2]
0079  80 7C 5F 01 00			cmp		byte ptr 0x1[edi+ebx*2],0x00
007E  75 14				jne		L$3
0080  55				push		ebp
0081  57				push		edi
0082  53				push		ebx
0083  8B 6D 08				mov		ebp,dword ptr 0x8[ebp]
0086  FF 64 5F 02			jmp		dword ptr 0x2[edi+ebx*2]

Routine Size: 88 bytes,    Routine Base: _TEXT + 0032

008A				__Except_:
008A  5A				pop		edx
008B  5B				pop		ebx
008C  5F				pop		edi
008D  5D				pop		ebp
008E  40				inc		eax
008F  74 0D				je		L$5
0091  48				dec		eax
0092  75 13				jne		L$6
0094				L$3:
0094  8A 1C 5F				mov		bl,byte ptr [edi+ebx*2]
0097  EB D5				jmp		L$2
0099				L$4:
0099  B8 01 00 00 00			mov		eax,0x00000001
009E				L$5:
009E  5B				pop		ebx
009F  5B				pop		ebx
00A0  5B				pop		ebx
00A1  59				pop		ecx
00A2  5A				pop		edx
00A3  5E				pop		esi
00A4  5F				pop		edi
00A5  5D				pop		ebp
00A6  C3				ret		
00A7				L$6:
00A7  52				push		edx
00A8  E8 09 00 00 00			call		L$7
00AD  E8 20 00 00 00			call		L$9
00B2  8B 6D 08				mov		ebp,dword ptr 0x8[ebp]
00B5  C3				ret		
00B6				L$7:
00B6  55				push		ebp
00B7  57				push		edi
00B8  56				push		esi
00B9  52				push		edx
00BA  51				push		ecx
00BB  53				push		ebx
00BC  6A 00				push		0x00000000
00BE  6A 00				push		0x00000000
00C0  68 CB 00 00 00			push		offset L$8
00C5  55				push		ebp
00C6  E8 00 00 00 00			call		_RtlUnwind
00CB				L$8:
00CB  5B				pop		ebx
00CC  59				pop		ecx
00CD  5A				pop		edx
00CE  5E				pop		esi
00CF  5F				pop		edi
00D0  5D				pop		ebp
00D1  C3				ret		
00D2				L$9:
00D2  55				push		ebp
00D3  57				push		edi
00D4  56				push		esi
00D5  52				push		edx
00D6  51				push		ecx
00D7  53				push		ebx
00D8  8B 7D 0C				mov		edi,dword ptr 0xc[ebp]
00DB  29 DB				sub		ebx,ebx
00DD  8A 5D 10				mov		bl,byte ptr 0x10[ebp]
00E0  C6 45 11 01			mov		byte ptr 0x11[ebp],0x01
00E4				L$10:
00E4  80 FB FF				cmp		bl,0xff
00E7  74 24				je		L$12
00E9  3A 5D 12				cmp		bl,byte ptr 0x12[ebp]
00EC  74 1F				je		L$12
00EE  8D 1C 5B				lea		ebx,[ebx+ebx*2]
00F1  80 7C 5F 01 00			cmp		byte ptr 0x1[edi+ebx*2],0x00
00F6  74 0D				je		L$11
00F8  55				push		ebp
00F9  57				push		edi
00FA  53				push		ebx
00FB  8B 6D 08				mov		ebp,dword ptr 0x8[ebp]
00FE  FF 54 5F 02			call		dword ptr 0x2[edi+ebx*2]
0102  5B				pop		ebx
0103  5F				pop		edi
0104  5D				pop		ebp
0105				L$11:
0105  8A 1C 5F				mov		bl,byte ptr [edi+ebx*2]
0108  88 5D 10				mov		byte ptr 0x10[ebp],bl
010B  EB D7				jmp		L$10
010D				L$12:
010D  C6 45 11 00			mov		byte ptr 0x11[ebp],0x00
0111  5B				pop		ebx
0112  59				pop		ecx
0113  5A				pop		edx
0114  5E				pop		esi
0115  5F				pop		edi
0116  5D				pop		ebp
0117  C3				ret		

Routine Size: 142 bytes,    Routine Base: _TEXT + 008A

0118				__TryUnwind_:
0118  55				push		ebp
0119  64 8B 2D 00 00 00 00		mov		ebp,dword ptr fs:[0x0]
0120  88 45 12				mov		byte ptr 0x12[ebp],al
0123  E8 AA FF FF FF			call		L$9
0128  5D				pop		ebp
0129  C3				ret		

Routine Size: 18 bytes,    Routine Base: _TEXT + 0118

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes

