Module: stimewnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000DC bytes
0000				_dos_settime_:
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
0026  E9 A7 00 00 00			jmp		L$4
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
0073  66 89 44 24 18			mov		word ptr 0x18[esp],ax
0078  8A 43 01				mov		al,byte ptr 0x1[ebx]
007B  66 89 44 24 1A			mov		word ptr 0x1a[esp],ax
0080  8A 43 02				mov		al,byte ptr 0x2[ebx]
0083  31 D2				xor		edx,edx
0085  66 89 44 24 1C			mov		word ptr 0x1c[esp],ax
008A  8A 53 03				mov		dl,byte ptr 0x3[ebx]
008D  BB 0A 00 00 00			mov		ebx,0x0000000a
0092  89 D0				mov		eax,edx
0094  C1 FA 1F				sar		edx,0x1f
0097  F7 FB				idiv		ebx
0099  66 89 44 24 1E			mov		word ptr 0x1e[esp],ax
009E  8D 44 24 10			lea		eax,0x10[esp]
00A2  50				push		eax
00A3  E8 00 00 00 00			call		_SetLocalTime
00A8  85 C0				test		eax,eax
00AA  74 04				je		L$2
00AC  31 DB				xor		ebx,ebx
00AE  EB 07				jmp		L$3
00B0				L$2:
00B0  E8 00 00 00 00			call		__set_errno_nt_
00B5  89 C3				mov		ebx,eax
00B7				L$3:
00B7  31 FF				xor		edi,edi
00B9  57				push		edi
00BA  57				push		edi
00BB  57				push		edi
00BC  8D 44 24 0C			lea		eax,0xc[esp]
00C0  50				push		eax
00C1  57				push		edi
00C2  8B 6C 24 34			mov		ebp,dword ptr 0x34[esp]
00C6  55				push		ebp
00C7  89 7C 24 24			mov		dword ptr 0x24[esp],edi
00CB  E8 00 00 00 00			call		_AdjustTokenPrivileges
00D0  89 D8				mov		eax,ebx
00D2				L$4:
00D2  83 C4 24				add		esp,0x00000024
00D5  5D				pop		ebp
00D6  5F				pop		edi
00D7  5E				pop		esi
00D8  5A				pop		edx
00D9  59				pop		ecx
00DA  5B				pop		ebx
00DB  C3				ret		

Routine Size: 220 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000016 bytes
0000				L$5:
0000  53 65 53 79 73 74 65 6D 74 69 6D 65 50 72 69 76 SeSystemtimePriv
0010  69 6C 65 67 65 00                               ilege.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

