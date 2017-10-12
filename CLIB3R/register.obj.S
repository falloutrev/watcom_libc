Module: register
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000057 bytes
0000				__CInitThread_:
0000  31 C0				xor		eax,eax
0002  C3				ret		

Routine Size: 3 bytes,    Routine Base: _TEXT + 0000

0003				_beginthread_:
0003  FF 15 00 00 00 00			call		dword ptr ___BeginThread
0009  C3				ret		

Routine Size: 7 bytes,    Routine Base: _TEXT + 0003

000A				_endthread_:
000A  FF 15 00 00 00 00			call		dword ptr ___EndThread
0010  C3				ret		

Routine Size: 7 bytes,    Routine Base: _TEXT + 000A

0011				__initthread_:
0011  FF 15 00 00 00 00			call		dword ptr ___InitThread
0017  C3				ret		

Routine Size: 7 bytes,    Routine Base: _TEXT + 0011

0018				__RegisterThreadData_:
0018  51				push		ecx
0019  56				push		esi
001A  85 C0				test		eax,eax
001C  74 10				je		L$1
001E  8B 08				mov		ecx,dword ptr [eax]
0020  8B 35 00 00 00 00			mov		esi,dword ptr ___BeginThread
0026  89 0D 00 00 00 00			mov		dword ptr ___BeginThread,ecx
002C  89 30				mov		dword ptr [eax],esi
002E				L$1:
002E  85 D2				test		edx,edx
0030  74 0F				je		L$2
0032  8B 02				mov		eax,dword ptr [edx]
0034  8B 0D 00 00 00 00			mov		ecx,dword ptr ___EndThread
003A  A3 00 00 00 00			mov		dword ptr ___EndThread,eax
003F  89 0A				mov		dword ptr [edx],ecx
0041				L$2:
0041  85 DB				test		ebx,ebx
0043  74 0F				je		L$3
0045  8B 03				mov		eax,dword ptr [ebx]
0047  8B 15 00 00 00 00			mov		edx,dword ptr ___InitThread
004D  A3 00 00 00 00			mov		dword ptr ___InitThread,eax
0052  89 13				mov		dword ptr [ebx],edx
0054				L$3:
0054  5E				pop		esi
0055  59				pop		ecx
0056  C3				ret		

Routine Size: 63 bytes,    Routine Base: _TEXT + 0018

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 0000000C bytes
0000				___BeginThread:
0000  00 00 00 00                                     DD	offset __CBeginThread_
0004				___EndThread:
0004  00 00 00 00                                     DD	offset __CEndThread_
0008				___InitThread:
0008  00 00 00 00                                     DD	offset __CInitThread_

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

