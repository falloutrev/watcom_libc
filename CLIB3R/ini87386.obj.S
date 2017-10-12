Module: ini87386
GROUP: 'DGROUP' _DATA

Segment: _TEXT WORD USE32 00000027 bytes
0000				__init_80x87:
0000  66 50				push		ax
0002  9B DB E3				finit		
0005  D9 E8				fld1		
0007  D9 EE				fldz		
0009  DE F9				fdivp		st(1),st
000B  D9 C0				fld		st
000D  D9 E0				fchs		
000F  DE D9				fcompp		
0011  DF E0				fnstsw		ax
0013  B0 02				mov		al,0x02
0015  9E				sahf		
0016  74 02				je		L$1
0018  B0 03				mov		al,0x03
001A				L$1:
001A  9B DB E3				finit		
001D  D9 2C 24				fldcw		word ptr [esp]
0020  66 87 04 24			xchg		word ptr [esp],ax
0024  66 58				pop		ax
0026  C3				ret		

Routine Size: 39 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes

