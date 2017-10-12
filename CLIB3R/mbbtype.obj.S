Module: mbbtype
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000097 bytes
0000				_mbbtype_:
0000  53				push		ebx
0001  8B 1D 00 00 00 00			mov		ebx,dword ptr ___IsDBCS
0007  85 DB				test		ebx,ebx
0009  74 53				je		L$7
000B  83 FA 01				cmp		edx,0x00000001
000E  75 2A				jne		L$4
0010  85 DB				test		ebx,ebx
0012  74 14				je		L$1
0014  25 FF 00 00 00			and		eax,0x000000ff
0019  8A 80 01 00 00 00			mov		al,byte ptr ___MBCSIsTable+0x1[eax]
001F  24 02				and		al,0x02
0021  25 FF 00 00 00			and		eax,0x000000ff
0026  EB 02				jmp		L$2
0028				L$1:
0028  31 C0				xor		eax,eax
002A				L$2:
002A  74 07				je		L$3
002C  B8 02 00 00 00			mov		eax,0x00000002
0031  5B				pop		ebx
0032  C3				ret		
0033				L$3:
0033  B8 FF FF FF FF			mov		eax,0xffffffff
0038  5B				pop		ebx
0039  C3				ret		
003A				L$4:
003A  85 DB				test		ebx,ebx
003C  74 14				je		L$5
003E  25 FF 00 00 00			and		eax,0x000000ff
0043  8A 80 01 00 00 00			mov		al,byte ptr ___MBCSIsTable+0x1[eax]
0049  24 01				and		al,0x01
004B  25 FF 00 00 00			and		eax,0x000000ff
0050  EB 02				jmp		L$6
0052				L$5:
0052  31 C0				xor		eax,eax
0054				L$6:
0054  0F 95 C0				setne		al
0057  25 FF 00 00 00			and		eax,0x000000ff
005C  5B				pop		ebx
005D  C3				ret		
005E				L$7:
005E  31 C0				xor		eax,eax
0060  5B				pop		ebx
0061  C3				ret		

Routine Size: 98 bytes,    Routine Base: _TEXT + 0000

0062				_mbsbtype_:
0062  53				push		ebx
0063  51				push		ecx
0064  56				push		esi
0065  89 C3				mov		ebx,eax
0067  89 D1				mov		ecx,edx
0069  B8 FF FF FF FF			mov		eax,0xffffffff
006E				L$8:
006E  89 CE				mov		esi,ecx
0070  49				dec		ecx
0071  85 F6				test		esi,esi
0073  7C 1E				jl		L$10
0075  8A 13				mov		dl,byte ptr [ebx]
0077  84 D2				test		dl,dl
0079  75 09				jne		L$9
007B  B8 FF FF FF FF			mov		eax,0xffffffff
0080  5E				pop		esi
0081  59				pop		ecx
0082  5B				pop		ebx
0083  C3				ret		
0084				L$9:
0084  0F B6 F2				movzx		esi,dl
0087  89 C2				mov		edx,eax
0089  89 F0				mov		eax,esi
008B  43				inc		ebx
008C  E8 00 00 00 00			call		_mbbtype_
0091  EB DB				jmp		L$8
0093				L$10:
0093  5E				pop		esi
0094  59				pop		ecx
0095  5B				pop		ebx
0096  C3				ret		

Routine Size: 53 bytes,    Routine Base: _TEXT + 0062

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

