Module: system
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000060 bytes
0000				system_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  55				push		ebp
0004  89 E5				mov		ebp,esp
0006  83 EC 04				sub		esp,0x00000004
0009  89 C2				mov		edx,eax
000B  B8 00 00 00 00			mov		eax,offset DGROUP:L$6
0010  E8 00 00 00 00			call		getenv_
0015  89 C3				mov		ebx,eax
0017  85 D2				test		edx,edx
0019  75 07				jne		L$1
001B  B8 01 00 00 00			mov		eax,0x00000001
0020  EB 37				jmp		L$5
0022				L$1:
0022  B1 01				mov		cl,0x01
0024  85 C0				test		eax,eax
0026  75 05				jne		L$2
0028  BB 08 00 00 00			mov		ebx,offset DGROUP:L$7
002D				L$2:
002D  6A 00				push		0x00000000
002F  52				push		edx
0030  31 D2				xor		edx,edx
0032  8D 45 FC				lea		eax,-0x4[ebp]
0035  88 CA				mov		dl,cl
0037  E8 00 00 00 00			call		__Slash_C_
003C  50				push		eax
003D  84 C9				test		cl,cl
003F  74 07				je		L$3
0041  B8 1C 00 00 00			mov		eax,offset DGROUP:L$8
0046  EB 05				jmp		L$4
0048				L$3:
0048  B8 20 00 00 00			mov		eax,offset DGROUP:L$9
004D				L$4:
004D  50				push		eax
004E  53				push		ebx
004F  6A 00				push		0x00000000
0051  E8 00 00 00 00			call		spawnlp_
0056  83 C4 18				add		esp,0x00000018
0059				L$5:
0059  89 EC				mov		esp,ebp
005B  5D				pop		ebp
005C  5A				pop		edx
005D  59				pop		ecx
005E  5B				pop		ebx
005F  C3				ret		

Routine Size: 96 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000028 bytes
0000				L$6:
0000  43 6F 6D 53 70 65 63 00                         ComSpec.
0008				L$7:
0008  43 4D 44 2E 45 58 45 00 43 4F 4D 4D 41 4E 44 2E CMD.EXE.COMMAND.
0018  43 4F 4D 00                                     COM.
001C				L$8:
001C  43 4D 44 00                                     CMD.
0020				L$9:
0020  43 4F 4D 4D 41 4E 44 00                         COMMAND.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

