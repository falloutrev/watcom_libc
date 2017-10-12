Module: stjmp386
GROUP: 'DGROUP' _DATA

Segment: _TEXT WORD USE32 000000C4 bytes
0000				_setjmp_:
0000  89 18				mov		dword ptr [eax],ebx
0002  89 48 04				mov		dword ptr 0x4[eax],ecx
0005  89 50 08				mov		dword ptr 0x8[eax],edx
0008  89 70 0C				mov		dword ptr 0xc[eax],esi
000B  89 78 10				mov		dword ptr 0x10[eax],edi
000E  89 68 14				mov		dword ptr 0x14[eax],ebp
0011  8F 40 18				pop		dword ptr 0x18[eax]
0014  89 60 1C				mov		dword ptr 0x1c[eax],esp
0017  FF 70 18				push		dword ptr 0x18[eax]
001A  66 8C 40 20			mov		word ptr 0x20[eax],es
001E  66 8C 58 22			mov		word ptr 0x22[eax],ds
0022  66 8C 48 24			mov		word ptr 0x24[eax],cs
0026  66 8C 60 26			mov		word ptr 0x26[eax],fs
002A  66 8C 68 28			mov		word ptr 0x28[eax],gs
002E  66 8C 50 2A			mov		word ptr 0x2a[eax],ss
0032  64 FF 35 00 00 00 00		push		dword ptr fs:[0x0]
0039  8F 40 2C				pop		dword ptr 0x2c[eax]
003C  29 C0				sub		eax,eax
003E  C3				ret		

Routine Size: 63 bytes,    Routine Base: _TEXT + 0000

003F				longjmp_:
003F  52				push		edx
0040  50				push		eax
0041  89 E5				mov		ebp,esp
0043  50				push		eax
0044  8B 40 2C				mov		eax,dword ptr 0x2c[eax]
0047  64 3B 05 00 00 00 00		cmp		eax,dword ptr fs:[0x0]
004E  75 02				jne		L$1
0050  EB 0D				jmp		L$2
0052				L$1:
0052  6A 00				push		0x00000000
0054  68 5F 00 00 00			push		offset L$2
0059  50				push		eax
005A  E8 00 00 00 00			call		_RtlUnwind
005F				L$2:
005F  89 EC				mov		esp,ebp
0061  8B 45 00				mov		eax,dword ptr [ebp]
0064  8B 55 04				mov		edx,dword ptr 0x4[ebp]
0067  50				push		eax
0068  52				push		edx
0069  66 8B 50 2A			mov		dx,word ptr 0x2a[eax]
006D  8B 40 1C				mov		eax,dword ptr 0x1c[eax]
0070  FF 15 00 00 00 00			call		dword ptr ___longjmp_handler
0076  5A				pop		edx
0077  58				pop		eax
0078  8E 50 2A				mov		ss,dword ptr 0x2a[eax]
007B  8B 60 1C				mov		esp,dword ptr 0x1c[eax]
007E  FF 70 18				push		dword ptr 0x18[eax]
0081  09 D2				or		edx,edx
0083  75 01				jne		L$3
0085  42				inc		edx
0086				L$3:
0086  52				push		edx
0087  8B 18				mov		ebx,dword ptr [eax]
0089  8B 48 04				mov		ecx,dword ptr 0x4[eax]
008C  8B 70 0C				mov		esi,dword ptr 0xc[eax]
008F  8B 78 10				mov		edi,dword ptr 0x10[eax]
0092  8B 68 14				mov		ebp,dword ptr 0x14[eax]
0095  66 8B 50 20			mov		dx,word ptr 0x20[eax]
0099  0F 00 E2				verr		dx
009C  74 02				je		L$4
009E  29 D2				sub		edx,edx
00A0				L$4:
00A0  8E C2				mov		es,edx
00A2  66 8B 50 26			mov		dx,word ptr 0x26[eax]
00A6  0F 00 E2				verr		dx
00A9  74 02				je		L$5
00AB  29 D2				sub		edx,edx
00AD				L$5:
00AD  8E E2				mov		fs,edx
00AF  66 8B 50 28			mov		dx,word ptr 0x28[eax]
00B3  0F 00 E2				verr		dx
00B6  74 02				je		L$6
00B8  29 D2				sub		edx,edx
00BA				L$6:
00BA  8E EA				mov		gs,edx
00BC  8B 50 08				mov		edx,dword ptr 0x8[eax]
00BF  8E 58 22				mov		ds,dword ptr 0x22[eax]
00C2  58				pop		eax
00C3  C3				ret		

Routine Size: 133 bytes,    Routine Base: _TEXT + 003F

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes

