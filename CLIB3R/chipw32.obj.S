Module: chipw32
GROUP: 'DGROUP' DATA32,_DATA

Segment: _TEXT DWORD USE32 00000034 bytes
0000				__fpatan_wrap:
0000  50				push		eax
0001  83 EC 76				sub		esp,0x00000076
0004  DB 7C 24 6C			fstp		tbyte ptr 0x6c[esp]
0008  DD 34 24				fnsave		[esp]
000B  DB 6C 24 1C			fld		tbyte ptr 0x1c[esp]
000F  DB 6C 24 6C			fld		tbyte ptr 0x6c[esp]
0013  E8 00 00 00 00			call		__fpatan_chk
0018  DF E0				fnstsw		ax
001A  DB 7C 24 1C			fstp		tbyte ptr 0x1c[esp]
001E  66 25 FF 00			and		ax,0x00ff
0022  66 0B 44 24 04			or		ax,word ptr 0x4[esp]
0027  66 89 44 24 04			mov		word ptr 0x4[esp],ax
002C  DD 24 24				frstor		[esp]
002F  83 C4 76				add		esp,0x00000076
0032  58				pop		eax
0033  C3				ret		

Routine Size: 52 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes

Segment: DATA32 DWORD USE32 00000000 bytes

