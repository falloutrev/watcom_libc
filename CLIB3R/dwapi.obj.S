Module: dwapi
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000086 bytes
0000				_dwDeleteOnClose_:
0000  83 3D 00 00 00 00 00		cmp		dword ptr __WindowsDestroyOnClose,0x00000000
0007  74 11				je		L$1
0009  FF 15 00 00 00 00			call		dword ptr __WindowsIsWindowedHandle
000F  85 C0				test		eax,eax
0011  74 07				je		L$1
0013  FF 15 00 00 00 00			call		dword ptr __WindowsDestroyOnClose
0019  C3				ret		
001A				L$1:
001A  31 C0				xor		eax,eax
001C  C3				ret		

Routine Size: 29 bytes,    Routine Base: _TEXT + 0000

001D				_dwSetAboutDlg_:
001D  83 3D 00 00 00 00 00		cmp		dword ptr __WindowsSetAbout,0x00000000
0024  74 07				je		L$2
0026  FF 15 00 00 00 00			call		dword ptr __WindowsSetAbout
002C  C3				ret		
002D				L$2:
002D  31 C0				xor		eax,eax
002F  C3				ret		

Routine Size: 19 bytes,    Routine Base: _TEXT + 001D

0030				_dwSetAppTitle_:
0030  83 3D 00 00 00 00 00		cmp		dword ptr __WindowsSetAppTitle,0x00000000
0037  74 07				je		L$3
0039  FF 15 00 00 00 00			call		dword ptr __WindowsSetAppTitle
003F  C3				ret		
0040				L$3:
0040  31 C0				xor		eax,eax
0042  C3				ret		

Routine Size: 19 bytes,    Routine Base: _TEXT + 0030

0043				_dwSetConTitle_:
0043  83 3D 00 00 00 00 00		cmp		dword ptr __WindowsSetAppTitle,0x00000000
004A  74 11				je		L$4
004C  FF 15 00 00 00 00			call		dword ptr __WindowsIsWindowedHandle
0052  85 C0				test		eax,eax
0054  74 07				je		L$4
0056  FF 15 00 00 00 00			call		dword ptr __WindowsSetConTitle
005C  C3				ret		
005D				L$4:
005D  31 C0				xor		eax,eax
005F  C3				ret		

Routine Size: 29 bytes,    Routine Base: _TEXT + 0043

0060				_dwYield_:
0060  83 3D 00 00 00 00 00		cmp		dword ptr __WindowsYieldControl,0x00000000
0067  74 07				je		L$5
0069  FF 15 00 00 00 00			call		dword ptr __WindowsYieldControl
006F  C3				ret		
0070				L$5:
0070  31 C0				xor		eax,eax
0072  C3				ret		

Routine Size: 19 bytes,    Routine Base: _TEXT + 0060

0073				_dwShutDown_:
0073  83 3D 00 00 00 00 00		cmp		dword ptr __WindowsShutDown,0x00000000
007A  74 07				je		L$6
007C  FF 15 00 00 00 00			call		dword ptr __WindowsShutDown
0082  C3				ret		
0083				L$6:
0083  31 C0				xor		eax,eax
0085  C3				ret		

Routine Size: 19 bytes,    Routine Base: _TEXT + 0073

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

