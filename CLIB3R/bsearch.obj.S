Module: bsearch
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000006B bytes
0000				bsearch_:
0000  56				push		esi
0001  57				push		edi
0002  C8 08 00 00			enter		0x0008,0x00
0006  89 C7				mov		edi,eax
0008  89 CE				mov		esi,ecx
000A  89 D8				mov		eax,ebx
000C  8B 5D 10				mov		ebx,dword ptr 0x10[ebp]
000F  89 5D F8				mov		dword ptr -0x8[ebp],ebx
0012  85 C0				test		eax,eax
0014  74 4F				je		L$6
0016  48				dec		eax
0017  0F AF C1				imul		eax,ecx
001A  89 D3				mov		ebx,edx
001C  01 C2				add		edx,eax
001E  89 55 FC				mov		dword ptr -0x4[ebp],edx
0021				L$1:
0021  3B 5D FC				cmp		ebx,dword ptr -0x4[ebp]
0024  73 2C				jae		L$4
0026  8B 45 FC				mov		eax,dword ptr -0x4[ebp]
0029  31 D2				xor		edx,edx
002B  29 D8				sub		eax,ebx
002D  F7 F6				div		esi
002F  D1 E8				shr		eax,0x01
0031  0F AF C6				imul		eax,esi
0034  8D 0C 03				lea		ecx,[ebx+eax]
0037  89 CA				mov		edx,ecx
0039  89 F8				mov		eax,edi
003B  FF 55 F8				call		dword ptr -0x8[ebp]
003E  85 C0				test		eax,eax
0040  75 04				jne		L$2
0042  89 C8				mov		eax,ecx
0044  EB 1F				jmp		L$6
0046				L$2:
0046  7D 05				jge		L$3
0048  89 4D FC				mov		dword ptr -0x4[ebp],ecx
004B  EB D4				jmp		L$1
004D				L$3:
004D  8D 1C 31				lea		ebx,[ecx+esi]
0050  EB CF				jmp		L$1
0052				L$4:
0052  75 0F				jne		L$5
0054  89 DA				mov		edx,ebx
0056  89 F8				mov		eax,edi
0058  FF 55 F8				call		dword ptr -0x8[ebp]
005B  85 C0				test		eax,eax
005D  75 04				jne		L$5
005F  89 D8				mov		eax,ebx
0061  EB 02				jmp		L$6
0063				L$5:
0063  31 C0				xor		eax,eax
0065				L$6:
0065  C9				leave		
0066  5F				pop		edi
0067  5E				pop		esi
0068  C2 04 00				ret		0x0004

Routine Size: 107 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

