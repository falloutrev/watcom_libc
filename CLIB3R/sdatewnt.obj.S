Module: sdatewnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000D1 bytes
0000				_dos_setdate_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  57				push		edi
0005  55				push		ebp
0006  83 EC 24				sub		esp,0x00000024
0009  89 C3				mov		ebx,eax
000B  8D 44 24 20			lea		eax,0x20[esp]
000F  50				push		eax
0010  6A 28				push		0x00000028
0012  E8 00 00 00 00			call		_GetCurrentProcess
0017  50				push		eax
0018  E8 00 00 00 00			call		_OpenProcessToken
001D  85 C0				test		eax,eax
001F  75 0A				jne		L$1
0021  E8 00 00 00 00			call		__set_errno_nt_
0026  E9 9C 00 00 00			jmp		L$4
002B				L$1:
002B  8D 44 24 04			lea		eax,0x4[esp]
002F  50				push		eax
0030  68 00 00 00 00			push		offset DGROUP:L$5
0035  6A 00				push		0x00000000
0037  E8 00 00 00 00			call		_LookupPrivilegeValueA
003C  6A 00				push		0x00000000
003E  6A 00				push		0x00000000
0040  6A 00				push		0x00000000
0042  8D 44 24 0C			lea		eax,0xc[esp]
0046  50				push		eax
0047  BA 01 00 00 00			mov		edx,0x00000001
004C  6A 00				push		0x00000000
004E  8B 74 24 34			mov		esi,dword ptr 0x34[esp]
0052  B9 02 00 00 00			mov		ecx,0x00000002
0057  56				push		esi
0058  89 54 24 18			mov		dword ptr 0x18[esp],edx
005C  89 4C 24 24			mov		dword ptr 0x24[esp],ecx
0060  E8 00 00 00 00			call		_AdjustTokenPrivileges
0065  8D 44 24 10			lea		eax,0x10[esp]
0069  50				push		eax
006A  E8 00 00 00 00			call		_GetLocalTime
006F  30 E4				xor		ah,ah
0071  8A 03				mov		al,byte ptr [ebx]
0073  66 89 44 24 16			mov		word ptr 0x16[esp],ax
0078  8A 43 01				mov		al,byte ptr 0x1[ebx]
007B  66 89 44 24 12			mov		word ptr 0x12[esp],ax
0080  66 8B 43 02			mov		ax,word ptr 0x2[ebx]
0084  66 89 44 24 10			mov		word ptr 0x10[esp],ax
0089  30 E4				xor		ah,ah
008B  8A 43 04				mov		al,byte ptr 0x4[ebx]
008E  66 89 44 24 14			mov		word ptr 0x14[esp],ax
0093  8D 44 24 10			lea		eax,0x10[esp]
0097  50				push		eax
0098  E8 00 00 00 00			call		_SetLocalTime
009D  85 C0				test		eax,eax
009F  74 04				je		L$2
00A1  31 DB				xor		ebx,ebx
00A3  EB 07				jmp		L$3
00A5				L$2:
00A5  E8 00 00 00 00			call		__set_errno_nt_
00AA  89 C3				mov		ebx,eax
00AC				L$3:
00AC  31 FF				xor		edi,edi
00AE  57				push		edi
00AF  57				push		edi
00B0  57				push		edi
00B1  8D 44 24 0C			lea		eax,0xc[esp]
00B5  50				push		eax
00B6  57				push		edi
00B7  8B 6C 24 34			mov		ebp,dword ptr 0x34[esp]
00BB  55				push		ebp
00BC  89 7C 24 24			mov		dword ptr 0x24[esp],edi
00C0  E8 00 00 00 00			call		_AdjustTokenPrivileges
00C5  89 D8				mov		eax,ebx
00C7				L$4:
00C7  83 C4 24				add		esp,0x00000024
00CA  5D				pop		ebp
00CB  5F				pop		edi
00CC  5E				pop		esi
00CD  5A				pop		edx
00CE  59				pop		ecx
00CF  5B				pop		ebx
00D0  C3				ret		

Routine Size: 209 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000016 bytes
0000				L$5:
0000  53 65 53 79 73 74 65 6D 74 69 6D 65 50 72 69 76 SeSystemtimePriv
0010  69 6C 65 67 65 00                               ilege.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

