Module: ufopen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000029F bytes
0000				__uopen_flags_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  57				push		edi
0005  89 C3				mov		ebx,eax
0007  0F B7 00				movzx		eax,word ptr [eax]
000A  E8 00 00 00 00			call		_utolower_
000F  89 C7				mov		edi,eax
0011  0F B7 C0				movzx		eax,ax
0014  31 D2				xor		edx,edx
0016  83 F8 72				cmp		eax,0x00000072
0019  74 1B				je		L$1
001B  83 F8 77				cmp		eax,0x00000077
001E  74 16				je		L$1
0020  83 F8 61				cmp		eax,0x00000061
0023  74 11				je		L$1
0025  B8 09 00 00 00			mov		eax,0x00000009
002A  E8 00 00 00 00			call		__set_errno_
002F  31 C0				xor		eax,eax
0031  E9 83 00 00 00			jmp		L$12
0036				L$1:
0036  89 D6				mov		esi,edx
0038  0F B7 4B 02			movzx		ecx,word ptr 0x2[ebx]
003C  66 83 CE 03			or		si,0x0003
0040  83 F9 2B				cmp		ecx,0x0000002b
0043  75 24				jne		L$4
0045  89 F2				mov		edx,esi
0047  0F B7 43 04			movzx		eax,word ptr 0x4[ebx]
004B  66 83 CE 40			or		si,0x0040
004F  83 F8 62				cmp		eax,0x00000062
0052  74 11				je		L$3
0054  83 F8 74				cmp		eax,0x00000074
0057  74 44				je		L$8
0059  81 3D 00 00 00 00 00 02 00 00
					cmp		dword ptr __fmode,0x00000200
0063				L$2:
0063  75 38				jne		L$8
0065				L$3:
0065  89 F2				mov		edx,esi
0067  EB 34				jmp		L$8
0069				L$4:
0069  89 D0				mov		eax,edx
006B  0C 40				or		al,0x40
006D  83 F9 62				cmp		ecx,0x00000062
0070  75 0F				jne		L$5
0072  0F B7 5B 04			movzx		ebx,word ptr 0x4[ebx]
0076  89 C2				mov		edx,eax
0078  83 FB 2B				cmp		ebx,0x0000002b
007B  75 20				jne		L$8
007D  0C 03				or		al,0x03
007F  EB 1A				jmp		L$7
0081				L$5:
0081  83 F9 74				cmp		ecx,0x00000074
0084  75 09				jne		L$6
0086  0F B7 43 04			movzx		eax,word ptr 0x4[ebx]
008A  83 F8 2B				cmp		eax,0x0000002b
008D  EB D4				jmp		L$2
008F				L$6:
008F  81 3D 00 00 00 00 00 02 00 00
					cmp		dword ptr __fmode,0x00000200
0099  75 02				jne		L$8
009B				L$7:
009B  89 C2				mov		edx,eax
009D				L$8:
009D  0F B7 C7				movzx		eax,di
00A0  83 F8 77				cmp		eax,0x00000077
00A3  75 05				jne		L$9
00A5  80 CA 02				or		dl,0x02
00A8  EB 0D				jmp		L$11
00AA				L$9:
00AA  83 F8 61				cmp		eax,0x00000061
00AD  75 05				jne		L$10
00AF  80 CA 82				or		dl,0x82
00B2  EB 03				jmp		L$11
00B4				L$10:
00B4  80 CA 01				or		dl,0x01
00B7				L$11:
00B7  89 D0				mov		eax,edx
00B9				L$12:
00B9  5F				pop		edi
00BA  5E				pop		esi
00BB  5A				pop		edx
00BC  59				pop		ecx
00BD  5B				pop		ebx
00BE  C3				ret		
00BF				__udoopen_:
00BF  56				push		esi
00C0  55				push		ebp
00C1  89 E5				mov		ebp,esp
00C3  89 C6				mov		esi,eax
00C5  89 D0				mov		eax,edx
00C7  89 CA				mov		edx,ecx
00C9  8B 4D 0C				mov		ecx,dword ptr 0xc[ebp]
00CC  80 61 0C FC			and		byte ptr 0xc[ecx],0xfc
00D0  0F B7 C0				movzx		eax,ax
00D3  09 59 0C				or		dword ptr 0xc[ecx],ebx
00D6  E8 00 00 00 00			call		_utolower_
00DB  0F B7 C0				movzx		eax,ax
00DE  83 F8 72				cmp		eax,0x00000072
00E1  75 1D				jne		L$16
00E3  31 C0				xor		eax,eax
00E5  F6 C3 02				test		bl,0x02
00E8  74 05				je		L$13
00EA  B8 02 00 00 00			mov		eax,0x00000002
00EF				L$13:
00EF  F6 C3 40				test		bl,0x40
00F2  74 05				je		L$14
00F4  80 CC 02				or		ah,0x02
00F7  EB 03				jmp		L$15
00F9				L$14:
00F9  80 CC 01				or		ah,0x01
00FC				L$15:
00FC  6A 00				push		0x00000000
00FE  EB 29				jmp		L$21
0100				L$16:
0100  F6 C3 01				test		bl,0x01
0103  0F 95 C0				setne		al
0106  0F B6 C0				movzx		eax,al
0109  83 C0 21				add		eax,0x00000021
010C  F6 C3 80				test		bl,0x80
010F  74 04				je		L$17
0111  0C 10				or		al,0x10
0113  EB 02				jmp		L$18
0115				L$17:
0115  0C 40				or		al,0x40
0117				L$18:
0117  F6 C3 40				test		bl,0x40
011A  74 05				je		L$19
011C  80 CC 02				or		ah,0x02
011F  EB 03				jmp		L$20
0121				L$19:
0121  80 CC 01				or		ah,0x01
0124				L$20:
0124  68 80 01 00 00			push		0x00000180
0129				L$21:
0129  52				push		edx
012A  50				push		eax
012B  56				push		esi
012C  E8 00 00 00 00			call		_usopen_
0131  83 C4 10				add		esp,0x00000010
0134  89 41 10				mov		dword ptr 0x10[ecx],eax
0137  83 79 10 FF			cmp		dword ptr 0x10[ecx],0xffffffff
013B  75 0E				jne		L$22
013D  89 C8				mov		eax,ecx
013F  E8 00 00 00 00			call		__freefp_
0144  31 C0				xor		eax,eax
0146  5D				pop		ebp
0147  5E				pop		esi
0148  C2 04 00				ret		0x0004
014B				L$22:
014B  C7 41 04 00 00 00 00		mov		dword ptr 0x4[ecx],0x00000000
0152  C7 41 08 00 00 00 00		mov		dword ptr 0x8[ecx],0x00000000
0159  C7 41 14 00 00 00 00		mov		dword ptr 0x14[ecx],0x00000000
0160  F6 C3 80				test		bl,0x80
0163  74 0E				je		L$23
0165  BB 02 00 00 00			mov		ebx,0x00000002
016A  89 C8				mov		eax,ecx
016C  31 D2				xor		edx,edx
016E  E8 00 00 00 00			call		fseek_
0173				L$23:
0173  89 C8				mov		eax,ecx
0175  E8 00 00 00 00			call		__chktty_
017A  89 C8				mov		eax,ecx
017C  5D				pop		ebp
017D  5E				pop		esi
017E  C2 04 00				ret		0x0004

Routine Size: 385 bytes,    Routine Base: _TEXT + 0000

0181				_u_fsopen_:
0181  51				push		ecx
0182  56				push		esi
0183  57				push		edi
0184  89 C6				mov		esi,eax
0186  89 D9				mov		ecx,ebx
0188  89 D0				mov		eax,edx
018A  E8 00 00 00 00			call		__uopen_flags_
018F  89 C3				mov		ebx,eax
0191  85 C0				test		eax,eax
0193  74 1C				je		L$25
0195  31 C0				xor		eax,eax
0197  E8 00 00 00 00			call		__allocfp_
019C  89 C7				mov		edi,eax
019E  85 C0				test		eax,eax
01A0  74 0D				je		L$24
01A2  50				push		eax
01A3  0F B7 12				movzx		edx,word ptr [edx]
01A6  89 F0				mov		eax,esi
01A8  E8 00 00 00 00			call		__udoopen_
01AD  89 C7				mov		edi,eax
01AF				L$24:
01AF  89 F8				mov		eax,edi
01B1				L$25:
01B1  5F				pop		edi
01B2  5E				pop		esi
01B3  59				pop		ecx
01B4  C3				ret		

Routine Size: 52 bytes,    Routine Base: _TEXT + 0181

01B5				_ufopen_:
01B5  53				push		ebx
01B6  31 DB				xor		ebx,ebx
01B8  E8 00 00 00 00			call		_u_fsopen_
01BD  5B				pop		ebx
01BE  C3				ret		
01BF				close_file_:
01BF  53				push		ebx
01C0  51				push		ecx
01C1  52				push		edx
01C2  89 C3				mov		ebx,eax
01C4  FF 15 00 00 00 00			call		dword ptr __AccessIOB
01CA  A1 00 00 00 00			mov		eax,dword ptr ___OpenStreams
01CF				L$26:
01CF  85 C0				test		eax,eax
01D1  74 27				je		L$29
01D3  3B 58 04				cmp		ebx,dword ptr 0x4[eax]
01D6  75 1E				jne		L$28
01D8  F6 43 0C 03			test		byte ptr 0xc[ebx],0x03
01DC  74 0C				je		L$27
01DE  BA 01 00 00 00			mov		edx,0x00000001
01E3  89 D8				mov		eax,ebx
01E5  E8 00 00 00 00			call		__doclose_
01EA				L$27:
01EA  FF 15 00 00 00 00			call		dword ptr __ReleaseIOB
01F0  89 D8				mov		eax,ebx
01F2  5A				pop		edx
01F3  59				pop		ecx
01F4  5B				pop		ebx
01F5  C3				ret		
01F6				L$28:
01F6  8B 00				mov		eax,dword ptr [eax]
01F8  EB D5				jmp		L$26
01FA				L$29:
01FA  BA 00 00 00 00			mov		edx,offset ___ClosedStreams
01FF				L$30:
01FF  8B 02				mov		eax,dword ptr [edx]
0201  85 C0				test		eax,eax
0203  74 1C				je		L$32
0205  3B 58 04				cmp		ebx,dword ptr 0x4[eax]
0208  75 13				jne		L$31
020A  8B 08				mov		ecx,dword ptr [eax]
020C  89 0A				mov		dword ptr [edx],ecx
020E  8B 15 00 00 00 00			mov		edx,dword ptr ___OpenStreams
0214  A3 00 00 00 00			mov		dword ptr ___OpenStreams,eax
0219  89 10				mov		dword ptr [eax],edx
021B  EB CD				jmp		L$27
021D				L$31:
021D  89 C2				mov		edx,eax
021F  EB DE				jmp		L$30
0221				L$32:
0221  B8 04 00 00 00			mov		eax,0x00000004
0226  E8 00 00 00 00			call		__set_errno_
022B  FF 15 00 00 00 00			call		dword ptr __ReleaseIOB
0231  31 C0				xor		eax,eax
0233  5A				pop		edx
0234  59				pop		ecx
0235  5B				pop		ebx
0236  C3				ret		

Routine Size: 130 bytes,    Routine Base: _TEXT + 01B5

0237				_ufreopen_:
0237  51				push		ecx
0238  56				push		esi
0239  57				push		edi
023A  C8 04 00 00			enter		0x0004,0x00
023E  89 C7				mov		edi,eax
0240  89 D0				mov		eax,edx
0242  E8 00 00 00 00			call		__uopen_flags_
0247  89 45 FC				mov		dword ptr -0x4[ebp],eax
024A  85 C0				test		eax,eax
024C  74 4C				je		L$35
024E  8B 73 10				mov		esi,dword ptr 0x10[ebx]
0251  89 F0				mov		eax,esi
0253  FF 15 00 00 00 00			call		dword ptr __AccessFileH
0259  83 3D 00 00 00 00 00		cmp		dword ptr __WindowsRemoveWindowedHandle,0x00000000
0260  74 08				je		L$33
0262  89 F0				mov		eax,esi
0264  FF 15 00 00 00 00			call		dword ptr __WindowsRemoveWindowedHandle
026A				L$33:
026A  89 D8				mov		eax,ebx
026C  E8 00 00 00 00			call		close_file_
0271  89 C3				mov		ebx,eax
0273  85 C0				test		eax,eax
0275  74 19				je		L$34
0277  8B 5D FC				mov		ebx,dword ptr -0x4[ebp]
027A  50				push		eax
027B  31 C9				xor		ecx,ecx
027D  81 60 0C 00 40 00 00		and		dword ptr 0xc[eax],0x00004000
0284  89 F8				mov		eax,edi
0286  0F B7 12				movzx		edx,word ptr [edx]
0289  E8 00 00 00 00			call		__udoopen_
028E  89 C3				mov		ebx,eax
0290				L$34:
0290  89 F0				mov		eax,esi
0292  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
0298  89 D8				mov		eax,ebx
029A				L$35:
029A  C9				leave		
029B  5F				pop		edi
029C  5E				pop		esi
029D  59				pop		ecx
029E  C3				ret		

Routine Size: 104 bytes,    Routine Base: _TEXT + 0237

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

