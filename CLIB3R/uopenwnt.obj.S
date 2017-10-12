Module: uopenwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001DB bytes
0000				_uopen_:
0000  53				push		ebx
0001  52				push		edx
0002  8D 44 24 14			lea		eax,0x14[esp]
0006  83 C0 04				add		eax,0x00000004
0009  8B 40 FC				mov		eax,dword ptr -0x4[eax]
000C  50				push		eax
000D  6A 00				push		0x00000000
000F  8B 54 24 18			mov		edx,dword ptr 0x18[esp]
0013  52				push		edx
0014  8B 5C 24 18			mov		ebx,dword ptr 0x18[esp]
0018  53				push		ebx
0019  E8 00 00 00 00			call		_usopen_
001E  83 C4 10				add		esp,0x00000010
0021  5A				pop		edx
0022  5B				pop		ebx
0023  C3				ret		

Routine Size: 36 bytes,    Routine Base: _TEXT + 0000

0024				_usopen_:
0024  53				push		ebx
0025  51				push		ecx
0026  52				push		edx
0027  56				push		esi
0028  57				push		edi
0029  55				push		ebp
002A  83 EC 0C				sub		esp,0x0000000c
002D  8B 6C 24 28			mov		ebp,dword ptr 0x28[esp]
0031  E8 00 00 00 00			call		__NTAtMaxFiles_
0036  85 C0				test		eax,eax
0038  74 14				je		L$1
003A  B8 0B 00 00 00			mov		eax,0x0000000b
003F  E8 00 00 00 00			call		__set_errno_
0044  B8 FF FF FF FF			mov		eax,0xffffffff
0049  E9 83 01 00 00			jmp		L$20
004E				L$1:
004E  8B 74 24 2C			mov		esi,dword ptr 0x2c[esp]
0052  8D 5C 24 08			lea		ebx,0x8[esp]
0056  83 E6 07				and		esi,0x00000007
0059  8D 54 24 04			lea		edx,0x4[esp]
005D  89 F0				mov		eax,esi
005F  E8 00 00 00 00			call		__GetNTAccessAttr_
0064  89 E2				mov		edx,esp
0066  8B 44 24 30			mov		eax,dword ptr 0x30[esp]
006A  E8 00 00 00 00			call		__GetNTShareAttr_
006F  8B 15 00 00 00 00			mov		edx,dword ptr __WindowsNewWindow
0075  BB 80 00 00 00			mov		ebx,0x00000080
007A  85 D2				test		edx,edx
007C  74 35				je		L$2
007E  BA 00 00 00 00			mov		edx,offset DGROUP:L$21
0083  89 E8				mov		eax,ebp
0085  E8 00 00 00 00			call		_ustricmp_
008A  85 C0				test		eax,eax
008C  75 25				jne		L$2
008E  E8 00 00 00 00			call		__NTGetFakeHandle_
0093  FF 15 00 00 00 00			call		dword ptr __InitAccessH
0099  6A FF				push		0xffffffff
009B  50				push		eax
009C  6A 00				push		0x00000000
009E  BA 00 20 00 00			mov		edx,0x00002000
00A3  89 C3				mov		ebx,eax
00A5  FF 15 00 00 00 00			call		dword ptr __WindowsNewWindow
00AB  83 C4 0C				add		esp,0x0000000c
00AE  E9 CE 00 00 00			jmp		L$12
00B3				L$2:
00B3  8A 64 24 2C			mov		ah,byte ptr 0x2c[esp]
00B7  F6 C4 20				test		ah,0x20
00BA  74 5C				je		L$7
00BC  8D 44 24 34			lea		eax,0x34[esp]
00C0  83 C0 04				add		eax,0x00000004
00C3  8B 40 FC				mov		eax,dword ptr -0x4[eax]
00C6  89 44 24 08			mov		dword ptr 0x8[esp],eax
00CA  A1 00 00 00 00			mov		eax,dword ptr ___umaskval
00CF  8B 4C 24 08			mov		ecx,dword ptr 0x8[esp]
00D3  F7 D0				not		eax
00D5  21 C1				and		ecx,eax
00D7  89 4C 24 08			mov		dword ptr 0x8[esp],ecx
00DB  F6 44 24 09 01			test		byte ptr 0x9[esp],0x01
00E0  74 0C				je		L$3
00E2  F6 44 24 08 80			test		byte ptr 0x8[esp],0x80
00E7  75 05				jne		L$3
00E9  BB 01 00 00 00			mov		ebx,0x00000001
00EE				L$3:
00EE  F6 44 24 2D 04			test		byte ptr 0x2d[esp],0x04
00F3  74 09				je		L$4
00F5  BF 01 00 00 00			mov		edi,0x00000001
00FA  89 F8				mov		eax,edi
00FC  EB 24				jmp		L$9
00FE				L$4:
00FE  F6 44 24 2C 40			test		byte ptr 0x2c[esp],0x40
0103  74 0C				je		L$6
0105  BF 02 00 00 00			mov		edi,0x00000002
010A				L$5:
010A  B8 05 00 00 00			mov		eax,0x00000005
010F  EB 11				jmp		L$9
0111				L$6:
0111  BF 04 00 00 00			mov		edi,0x00000004
0116  EB 05				jmp		L$8
0118				L$7:
0118  F6 C4 40				test		ah,0x40
011B  75 ED				jne		L$5
011D				L$8:
011D  B8 03 00 00 00			mov		eax,0x00000003
0122				L$9:
0122  6A 00				push		0x00000000
0124  53				push		ebx
0125  50				push		eax
0126  6A 00				push		0x00000000
0128  8B 44 24 10			mov		eax,dword ptr 0x10[esp]
012C  50				push		eax
012D  8B 54 24 18			mov		edx,dword ptr 0x18[esp]
0131  52				push		edx
0132  55				push		ebp
0133  E8 00 00 00 00			call		_CreateFileW
0138  83 F8 FF				cmp		eax,0xffffffff
013B  75 2C				jne		L$11
013D  F6 44 24 2C 20			test		byte ptr 0x2c[esp],0x20
0142  74 16				je		L$10
0144  6A 00				push		0x00000000
0146  53				push		ebx
0147  57				push		edi
0148  6A 00				push		0x00000000
014A  8B 5C 24 10			mov		ebx,dword ptr 0x10[esp]
014E  53				push		ebx
014F  8B 4C 24 18			mov		ecx,dword ptr 0x18[esp]
0153  51				push		ecx
0154  55				push		ebp
0155  E8 00 00 00 00			call		_CreateFileW
015A				L$10:
015A  83 F8 FF				cmp		eax,0xffffffff
015D  75 0A				jne		L$11
015F  E8 00 00 00 00			call		__set_errno_nt_
0164  E9 68 00 00 00			jmp		L$20
0169				L$11:
0169  FF 15 00 00 00 00			call		dword ptr __InitAccessH
016F  89 C3				mov		ebx,eax
0171  E8 00 00 00 00			call		isatty_
0176  31 D2				xor		edx,edx
0178  85 C0				test		eax,eax
017A  74 05				je		L$12
017C  BA 00 20 00 00			mov		edx,0x00002000
0181				L$12:
0181  83 FE 02				cmp		esi,0x00000002
0184  75 05				jne		L$13
0186  80 CA 03				or		dl,0x03
0189  EB 11				jmp		L$15
018B				L$13:
018B  85 F6				test		esi,esi
018D  75 05				jne		L$14
018F  80 CA 01				or		dl,0x01
0192  EB 08				jmp		L$15
0194				L$14:
0194  83 FE 01				cmp		esi,0x00000001
0197  75 03				jne		L$15
0199  80 CA 02				or		dl,0x02
019C				L$15:
019C  F6 44 24 2C 10			test		byte ptr 0x2c[esp],0x10
01A1  74 03				je		L$16
01A3  80 CA 80				or		dl,0x80
01A6				L$16:
01A6  89 D0				mov		eax,edx
01A8  8A 6C 24 2D			mov		ch,byte ptr 0x2d[esp]
01AC  0C 40				or		al,0x40
01AE  F6 C5 03				test		ch,0x03
01B1  74 07				je		L$17
01B3  F6 C5 02				test		ch,0x02
01B6  74 10				je		L$19
01B8  EB 0C				jmp		L$18
01BA				L$17:
01BA  81 3D 00 00 00 00 00 02 00 00
					cmp		dword ptr __fmode,0x00000200
01C4  75 02				jne		L$19
01C6				L$18:
01C6  89 C2				mov		edx,eax
01C8				L$19:
01C8  89 D8				mov		eax,ebx
01CA  E8 00 00 00 00			call		__SetIOMode_
01CF  89 D8				mov		eax,ebx
01D1				L$20:
01D1  83 C4 0C				add		esp,0x0000000c
01D4  5D				pop		ebp
01D5  5F				pop		edi
01D6  5E				pop		esi
01D7  5A				pop		edx
01D8  59				pop		ecx
01D9  5B				pop		ebx
01DA  C3				ret		

Routine Size: 439 bytes,    Routine Base: _TEXT + 0024

No disassembly errors

Segment: CONST DWORD USE32 00000008 bytes
0000				L$21:
0000  63 00 6F 00 6E 00 00 00                         c.o.n...

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

