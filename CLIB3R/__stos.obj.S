Module: __stos
GROUP: 'DGROUP' _DATA

Segment: _TEXT PARA USE32 000000A3 bytes
0000				__STOSB:
0000  09 C9				or		ecx,ecx
0002  74 2C				je		L$3
0004  38 10				cmp		byte ptr [eax],dl
0006				L$1:
0006  A8 03				test		al,0x03
0008  74 09				je		L$2
000A  88 10				mov		byte ptr [eax],dl
000C  40				inc		eax
000D  C1 CA 08				ror		edx,0x08
0010  49				dec		ecx
0011  75 F3				jne		L$1
0013				L$2:
0013  51				push		ecx
0014  C1 E9 02				shr		ecx,0x02
0017  E8 1B 00 00 00			call		__STOSD
001C  59				pop		ecx
001D  83 E1 03				and		ecx,0x00000003
0020  74 0E				je		L$3
0022  88 10				mov		byte ptr [eax],dl
0024  49				dec		ecx
0025  74 09				je		L$3
0027  88 70 01				mov		byte ptr 0x1[eax],dh
002A  49				dec		ecx
002B  74 03				je		L$3
002D  88 50 02				mov		byte ptr 0x2[eax],dl
0030				L$3:
0030  C3				ret		
0031  90				nop		
0032  90				nop		
0033  90				nop		
0034  90				nop		
0035  90				nop		
0036  90				nop		

Routine Size: 55 bytes,    Routine Base: _TEXT + 0000

0037				__STOSD:
0037  09 C9				or		ecx,ecx
0039  74 67				je		L$10
003B				L$4:
003B  A8 1F				test		al,0x1f
003D  74 08				je		L$5
003F  89 10				mov		dword ptr [eax],edx
0041  8D 40 04				lea		eax,0x4[eax]
0044  49				dec		ecx
0045  75 F4				jne		L$4
0047				L$5:
0047  51				push		ecx
0048  C1 E9 02				shr		ecx,0x02
004B  74 3A				je		L$9
004D  49				dec		ecx
004E  74 29				je		L$8
0050				L$6:
0050  89 10				mov		dword ptr [eax],edx
0052  89 50 04				mov		dword ptr 0x4[eax],edx
0055  49				dec		ecx
0056  89 50 08				mov		dword ptr 0x8[eax],edx
0059  89 50 0C				mov		dword ptr 0xc[eax],edx
005C  74 18				je		L$7
005E  38 50 20				cmp		byte ptr 0x20[eax],dl
0061  89 50 10				mov		dword ptr 0x10[eax],edx
0064  89 50 14				mov		dword ptr 0x14[eax],edx
0067  49				dec		ecx
0068  89 50 18				mov		dword ptr 0x18[eax],edx
006B  89 50 1C				mov		dword ptr 0x1c[eax],edx
006E  8D 40 20				lea		eax,0x20[eax]
0071  75 DD				jne		L$6
0073  8D 40 F0				lea		eax,-0x10[eax]
0076				L$7:
0076  8D 40 10				lea		eax,0x10[eax]
0079				L$8:
0079  89 10				mov		dword ptr [eax],edx
007B  89 50 04				mov		dword ptr 0x4[eax],edx
007E  89 50 08				mov		dword ptr 0x8[eax],edx
0081  89 50 0C				mov		dword ptr 0xc[eax],edx
0084  8D 40 10				lea		eax,0x10[eax]
0087				L$9:
0087  59				pop		ecx
0088  83 E1 03				and		ecx,0x00000003
008B  74 15				je		L$10
008D  89 10				mov		dword ptr [eax],edx
008F  8D 40 04				lea		eax,0x4[eax]
0092  49				dec		ecx
0093  74 0D				je		L$10
0095  89 10				mov		dword ptr [eax],edx
0097  8D 40 04				lea		eax,0x4[eax]
009A  49				dec		ecx
009B  74 05				je		L$10
009D  89 10				mov		dword ptr [eax],edx
009F  8D 40 04				lea		eax,0x4[eax]
00A2				L$10:
00A2  C3				ret		

Routine Size: 108 bytes,    Routine Base: _TEXT + 0037

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes

