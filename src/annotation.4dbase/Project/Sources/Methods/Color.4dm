//%attributes = {"invisible":true}
C_LONGINT:C283($1; $2)
C_LONGINT:C283($0)

$color:=$1%0x0100

If (Count parameters:C259>1)
	$paletteType:=$2
Else 
	$paletteType:=0
End if 

Case of 
	: ($paletteType=0)
		
		Case of 
			: ($1=0)
				$0:=0x00FFFFFF
			: ($1=1)
				$0:=0x00FFFF00
			: ($1=2)
				$0:=0x00FF6600
			: ($1=3)
				$0:=0x00EE0000
			: ($1=4)
				$0:=0x00FF0099
			: ($1=5)
				$0:=0x0099
			: ($1=6)
				$0:=0x00FF
			: ($1=7)
				$0:=0x99FF
			: ($1=8)
				$0:=0xBB00
			: ($1=9)
				$0:=0x9900
			: ($1=10)
				$0:=0x00663300
			: ($1=11)
				$0:=0x00444444
			: ($1=12)
				$0:=0x00DDDDDD
			: ($1=13)
				$0:=0x00996600
			: ($1=14)
				$0:=0x00AAAAAA
			: ($1=15)
				$0:=0x0000
			: ($1=16)
				$0:=0x00FF005E
			: ($1=17)
				$0:=0x00FF0456
			: ($1=18)
				$0:=0x00FF0048
			: ($1=19)
				$0:=0x00FF004B
			: ($1=20)
				$0:=0x00FF0032
			: ($1=21)
				$0:=0x00FF0027
			: ($1=22)
				$0:=0x00FF001C
			: ($1=23)
				$0:=0x00FF0011
			: ($1=24)
				$0:=0x00FF0006
			: ($1=25)
				$0:=0x00FF0400
			: ($1=26)
				$0:=0x00FF0F00
			: ($1=27)
				$0:=0x00FF1A00
			: ($1=28)
				$0:=0x00FF2500
			: ($1=29)
				$0:=0x00FF3000
			: ($1=30)
				$0:=0x00FF3B00
			: ($1=31)
				$0:=0x00FF4600
			: ($1=32)
				$0:=0x00FF4D00
			: ($1=33)
				$0:=0x00FF5400
			: ($1=34)
				$0:=0x00FF5B00
			: ($1=35)
				$0:=0x00FF6200
			: ($1=36)
				$0:=0x00FF6900
			: ($1=37)
				$0:=0x00FF7203
			: ($1=38)
				$0:=0x00FF7C04
			: ($1=39)
				$0:=0x00FF8202
			: ($1=40)
				$0:=0x00FF8A06
			: ($1=41)
				$0:=0x00FF9203
			: ($1=42)
				$0:=0x00FF9902
			: ($1=43)
				$0:=0x00FFA003
			: ($1=44)
				$0:=0x00FF9F00
			: ($1=45)
				$0:=0x00FFAE10
			: ($1=46)
				$0:=0x00FFB107
			: ($1=47)
				$0:=0x00FFB804
			: ($1=48)
				$0:=0x00FFC000
			: ($1=49)
				$0:=0x00FFC704
			: ($1=50)
				$0:=0x00FFCE00
			: ($1=51)
				$0:=0x00FFD700
			: ($1=52)
				$0:=0x00FFDF03
			: ($1=53)
				$0:=0x00FFE605
			: ($1=54)
				$0:=0x00FFEF0A
			: ($1=55)
				$0:=0x00FFF604
			: ($1=56)
				$0:=0x00FFFD06
			: ($1=57)
				$0:=0x00F9FF00
			: ($1=58)
				$0:=0x00F2FF04
			: ($1=59)
				$0:=0x00EBFF00
			: ($1=60)
				$0:=0x00E2FF00
			: ($1=61)
				$0:=0x00D3FF00
			: ($1=62)
				$0:=0x00CAFF00
			: ($1=63)
				$0:=0x00C3FF00
			: ($1=64)
				$0:=0x00BCFF00
			: ($1=65)
				$0:=0x00A6FF00
			: ($1=66)
				$0:=0x0090FF00
			: ($1=67)
				$0:=0x007AFF00
			: ($1=68)
				$0:=0x0064FF00
			: ($1=69)
				$0:=0x004FFF00
			: ($1=70)
				$0:=0x003CFF03
			: ($1=71)
				$0:=0x000CFF00
			: ($1=72)
				$0:=0x0003FF0C
			: ($1=73)
				$0:=0x0004FF23
			: ($1=74)
				$0:=0xFF35
			: ($1=75)
				$0:=0xFF4B
			: ($1=76)
				$0:=0xFF60
			: ($1=77)
				$0:=0xFF76
			: ($1=78)
				$0:=0xFF8C
			: ($1=79)
				$0:=0xFFA7
			: ($1=80)
				$0:=0xFFA7
			: ($1=81)
				$0:=0xFFB1
			: ($1=82)
				$0:=0xFFBB
			: ($1=83)
				$0:=0xFFC5
			: ($1=84)
				$0:=0xFFD0
			: ($1=85)
				$0:=0xFFDA
			: ($1=86)
				$0:=0xFFE4
			: ($1=87)
				$0:=0xFFEE
			: ($1=88)
				$0:=0xFFF8
			: ($1=89)
				$0:=0xFDFF
			: ($1=90)
				$0:=0xF3FF
			: ($1=91)
				$0:=0xE9FF
			: ($1=92)
				$0:=0xE0FF
			: ($1=93)
				$0:=0xD5FF
			: ($1=94)
				$0:=0xCBFF
			: ($1=95)
				$0:=0xC1FF
			: ($1=96)
				$0:=0xB4FF
			: ($1=97)
				$0:=0xA1FF
			: ($1=98)
				$0:=0x8EFF
			: ($1=99)
				$0:=0x7CFF
			: ($1=100)
				$0:=0x69FF
			: ($1=101)
				$0:=0x56FF
			: ($1=102)
				$0:=0x43FF
			: ($1=103)
				$0:=0x000128FF
			: ($1=104)
				$0:=0x1EFF
			: ($1=105)
				$0:=0x0BFF
			: ($1=106)
				$0:=0x000700FF
			: ($1=107)
				$0:=0x001900FF
			: ($1=108)
				$0:=0x002C00FF
			: ($1=109)
				$0:=0x003F00FF
			: ($1=110)
				$0:=0x005200FF
			: ($1=111)
				$0:=0x006500FF
			: ($1=112)
				$0:=0x007800FF
			: ($1=113)
				$0:=0x008B00FF
			: ($1=114)
				$0:=0x009E00FF
			: ($1=115)
				$0:=0x00B100FF
			: ($1=116)
				$0:=0x00C400FF
			: ($1=117)
				$0:=0x00D700FF
			: ($1=118)
				$0:=0x00EA00FF
			: ($1=119)
				$0:=0x00FD00FF
			: ($1=120)
				$0:=0x00FF03EF
			: ($1=121)
				$0:=0x00FF00DC
			: ($1=122)
				$0:=0x00FF00C9
			: ($1=123)
				$0:=0x00FF00B6
			: ($1=124)
				$0:=0x00FF00A3
			: ($1=125)
				$0:=0x00FF0090
			: ($1=126)
				$0:=0x00FF007D
			: ($1=127)
				$0:=0x00FF006A
			: ($1=128)
				$0:=0x00FFE0E0
			: ($1=129)
				$0:=0x00FFC0C0
			: ($1=130)
				$0:=0x00FFA0A0
			: ($1=131)
				$0:=0x00FF7F7F
			: ($1=132)
				$0:=0x00FF5F5F
			: ($1=133)
				$0:=0x00FF4040
			: ($1=134)
				$0:=0x00FF2020
			: ($1=135)
				$0:=0x00FF0000
			: ($1=136)
				$0:=0x00EC0F00
			: ($1=137)
				$0:=0x00D80000
			: ($1=138)
				$0:=0x00CF0000
			: ($1=139)
				$0:=0x00B00000
			: ($1=140)
				$0:=0x009C0000
			: ($1=141)
				$0:=0x00880000
			: ($1=142)
				$0:=0x00740000
			: ($1=143)
				$0:=0x00600000
			: ($1=144)
				$0:=0x00FFF0DF
			: ($1=145)
				$0:=0x00FFE0C0
			: ($1=146)
				$0:=0x00FFCFA0
			: ($1=147)
				$0:=0x00FFBE7F
			: ($1=148)
				$0:=0x00FFB05F
			: ($1=149)
				$0:=0x00FFA140
			: ($1=150)
				$0:=0x00FF9120
			: ($1=151)
				$0:=0x00FF8100
			: ($1=152)
				$0:=0x00EC7700
			: ($1=153)
				$0:=0x00D86D00
			: ($1=154)
				$0:=0x00C46300
			: ($1=155)
				$0:=0x00B05900
			: ($1=156)
				$0:=0x009C5200
			: ($1=157)
				$0:=0x00884500
			: ($1=158)
				$0:=0x00743B00
			: ($1=159)
				$0:=0x00603000
			: ($1=160)
				$0:=0x00FFFFDF
			: ($1=161)
				$0:=0x00FFFFC0
			: ($1=162)
				$0:=0x00FFFFA0
			: ($1=163)
				$0:=0x00FFFF7F
			: ($1=164)
				$0:=0x00FEFF5F
			: ($1=165)
				$0:=0x00FEFF40
			: ($1=166)
				$0:=0x00FEFF20
			: ($1=167)
				$0:=0x00FEFF00
			: ($1=168)
				$0:=0x00EAEC00
			: ($1=169)
				$0:=0x00D6D700
			: ($1=170)
				$0:=0x00C2C300
			: ($1=171)
				$0:=0x00AEAF00
			: ($1=172)
				$0:=0x009E9F00
			: ($1=173)
				$0:=0x00878800
			: ($1=174)
				$0:=0x00737400
			: ($1=175)
				$0:=0x005F6000
			: ($1=176)
				$0:=0x00E2FFDF
			: ($1=177)
				$0:=0x00C5FFC0
			: ($1=178)
				$0:=0x00A7FFA0
			: ($1=179)
				$0:=0x0089FF7F
			: ($1=180)
				$0:=0x006CFF5F
			: ($1=181)
				$0:=0x004FFF40
			: ($1=182)
				$0:=0x0031FF20
			: ($1=183)
				$0:=0x0013FF00
			: ($1=184)
				$0:=0x0012EC00
			: ($1=185)
				$0:=0x0010D800
			: ($1=186)
				$0:=0x000FC400
			: ($1=187)
				$0:=0x000DB000
			: ($1=188)
				$0:=0x000C9C00
			: ($1=189)
				$0:=0x000A8800
			: ($1=190)
				$0:=0x00097400
			: ($1=191)
				$0:=0x00076000
			: ($1=192)
				$0:=0x00DFFFFF
			: ($1=193)
				$0:=0x00C0FFFF
			: ($1=194)
				$0:=0x00A0FFFF
			: ($1=195)
				$0:=0x007FFEFF
			: ($1=196)
				$0:=0x005FFEFF
			: ($1=197)
				$0:=0x0040FEFF
			: ($1=198)
				$0:=0x0020FDFF
			: ($1=199)
				$0:=0xFDFF
			: ($1=200)
				$0:=0xE9EC
			: ($1=201)
				$0:=0xD6D8
			: ($1=202)
				$0:=0xC2C4
			: ($1=203)
				$0:=0xAEB0
			: ($1=204)
				$0:=0x9B9C
			: ($1=205)
				$0:=0x8788
			: ($1=206)
				$0:=0x7374
			: ($1=207)
				$0:=0x5F60
			: ($1=208)
				$0:=0x00DFE4FF
			: ($1=209)
				$0:=0x00C0CAFF
			: ($1=210)
				$0:=0x00A0AFFF
			: ($1=211)
				$0:=0x007F93FF
			: ($1=212)
				$0:=0x005F78FF
			: ($1=213)
				$0:=0x00405EFF
			: ($1=214)
				$0:=0x002042FF
			: ($1=215)
				$0:=0x27FF
			: ($1=216)
				$0:=0x24EC
			: ($1=217)
				$0:=0x21D8
			: ($1=218)
				$0:=0x20CF
			: ($1=219)
				$0:=0x1BB0
			: ($1=220)
				$0:=0x189C
			: ($1=221)
				$0:=0x1588
			: ($1=222)
				$0:=0x1274
			: ($1=223)
				$0:=0x0E60
			: ($1=224)
				$0:=0x00FFDFFF
			: ($1=225)
				$0:=0x00FFC0FF
			: ($1=226)
				$0:=0x00FFA0FF
			: ($1=227)
				$0:=0x00FF7FFF
			: ($1=228)
				$0:=0x00FF5FFF
			: ($1=229)
				$0:=0x00FF40FF
			: ($1=230)
				$0:=0x00FF20FF
			: ($1=231)
				$0:=0x00FF00FF
			: ($1=232)
				$0:=0x00EB00EC
			: ($1=233)
				$0:=0x00D700D8
			: ($1=234)
				$0:=0x00CF00CF
			: ($1=235)
				$0:=0x00B000B0
			: ($1=236)
				$0:=0x009C009C
			: ($1=237)
				$0:=0x00880088
			: ($1=238)
				$0:=0x00740074
			: ($1=239)
				$0:=0x00600060
			: ($1=240)
				$0:=0x00FFFFFF
			: ($1=241)
				$0:=0x00EEEEEE
			: ($1=242)
				$0:=0x00DDDDDD
			: ($1=243)
				$0:=0x00CCCCCC
			: ($1=244)
				$0:=0x00C0C0C0
			: ($1=245)
				$0:=0x00AAAAAA
			: ($1=246)
				$0:=0x00999999
			: ($1=247)
				$0:=0x00888888
			: ($1=248)
				$0:=0x00777777
			: ($1=249)
				$0:=0x00666666
			: ($1=250)
				$0:=0x00555555
			: ($1=251)
				$0:=0x00404040
			: ($1=252)
				$0:=0x00333333
			: ($1=253)
				$0:=0x00222222
			: ($1=254)
				$0:=0x00111111
			: ($1=255)
				$0:=0x0000
		End case 
		
	: ($paletteType=1)
		Case of 
			: ($color=0)
				$0:=0x00FFFFFF
			: ($color=1)
				$0:=0xFFFF
			: ($color=2)
				$0:=0x66FF
			: ($color=3)
				$0:=0x00EE
			: ($color=4)
				$0:=0x009900FF
			: ($color=5)
				$0:=0x00990000
			: ($color=6)
				$0:=0x00FF0000
			: ($color=7)
				$0:=0x00FF9900
			: ($color=8)
				$0:=0xBB00
			: ($color=9)
				$0:=0x9900
			: ($color=10)
				$0:=0x3366
			: ($color=11)
				$0:=0x00444444
			: ($color=12)
				$0:=0x00DDDDDD
			: ($color=13)
				$0:=0x6699
			: ($color=14)
				$0:=0x00AAAAAA
			: ($color=15)
				$0:=0x0000
			: ($color=16)
				$0:=0x005E00FF
			: ($color=17)
				$0:=0x005604FF
			: ($color=18)
				$0:=0x004800FF
			: ($color=19)
				$0:=0x004B00FF
			: ($color=20)
				$0:=0x003200FF
			: ($color=21)
				$0:=0x002700FF
			: ($color=22)
				$0:=0x001C00FF
			: ($color=23)
				$0:=0x001100FF
			: ($color=24)
				$0:=0x000600FF
			: ($color=25)
				$0:=0x04FF
			: ($color=26)
				$0:=0x0FFF
			: ($color=27)
				$0:=0x1AFF
			: ($color=28)
				$0:=0x25FF
			: ($color=29)
				$0:=0x30FF
			: ($color=30)
				$0:=0x3BFF
			: ($color=31)
				$0:=0x46FF
			: ($color=32)
				$0:=0x4DFF
			: ($color=33)
				$0:=0x54FF
			: ($color=34)
				$0:=0x5BFF
			: ($color=35)
				$0:=0x62FF
			: ($color=36)
				$0:=0x69FF
			: ($color=37)
				$0:=0x000372FF
			: ($color=38)
				$0:=0x00047CFF
			: ($color=39)
				$0:=0x000282FF
			: ($color=40)
				$0:=0x00068AFF
			: ($color=41)
				$0:=0x000392FF
			: ($color=42)
				$0:=0x000299FF
			: ($color=43)
				$0:=0x0003A0FF
			: ($color=44)
				$0:=0x9FFF
			: ($color=45)
				$0:=0x0010AEFF
			: ($color=46)
				$0:=0x0007B1FF
			: ($color=47)
				$0:=0x0004B8FF
			: ($color=48)
				$0:=0xC0FF
			: ($color=49)
				$0:=0x0004C7FF
			: ($color=50)
				$0:=0xCEFF
			: ($color=51)
				$0:=0xD7FF
			: ($color=52)
				$0:=0x0003DFFF
			: ($color=53)
				$0:=0x0005E6FF
			: ($color=54)
				$0:=0x000AEFFF
			: ($color=55)
				$0:=0x0004F6FF
			: ($color=56)
				$0:=0x0006FDFF
			: ($color=57)
				$0:=0xFFF9
			: ($color=58)
				$0:=0x0004FFF2
			: ($color=59)
				$0:=0xFFEB
			: ($color=60)
				$0:=0xFFE2
			: ($color=61)
				$0:=0xFFD3
			: ($color=62)
				$0:=0xFFCA
			: ($color=63)
				$0:=0xFFC3
			: ($color=64)
				$0:=0xFFBC
			: ($color=65)
				$0:=0xFFA6
			: ($color=66)
				$0:=0xFF90
			: ($color=67)
				$0:=0xFF7A
			: ($color=68)
				$0:=0xFF64
			: ($color=69)
				$0:=0xFF4F
			: ($color=70)
				$0:=0x0003FF3C
			: ($color=71)
				$0:=0xFF0C
			: ($color=72)
				$0:=0x000CFF03
			: ($color=73)
				$0:=0x0023FF04
			: ($color=74)
				$0:=0x0035FF00
			: ($color=75)
				$0:=0x004BFF00
			: ($color=76)
				$0:=0x0060FF00
			: ($color=77)
				$0:=0x0076FF00
			: ($color=78)
				$0:=0x008CFF00
			: ($color=79)
				$0:=0x00A7FF00
			: ($color=80)
				$0:=0x00A7FF00
			: ($color=81)
				$0:=0x00B1FF00
			: ($color=82)
				$0:=0x00BBFF00
			: ($color=83)
				$0:=0x00C5FF00
			: ($color=84)
				$0:=0x00D0FF00
			: ($color=85)
				$0:=0x00DAFF00
			: ($color=86)
				$0:=0x00E4FF00
			: ($color=87)
				$0:=0x00EEFF00
			: ($color=88)
				$0:=0x00F8FF00
			: ($color=89)
				$0:=0x00FFFD00
			: ($color=90)
				$0:=0x00FFF300
			: ($color=91)
				$0:=0x00FFE900
			: ($color=92)
				$0:=0x00FFE000
			: ($color=93)
				$0:=0x00FFD500
			: ($color=94)
				$0:=0x00FFCB00
			: ($color=95)
				$0:=0x00FFC100
			: ($color=96)
				$0:=0x00FFB400
			: ($color=97)
				$0:=0x00FFA100
			: ($color=98)
				$0:=0x00FF8E00
			: ($color=99)
				$0:=0x00FF7C00
			: ($color=100)
				$0:=0x00FF6900
			: ($color=101)
				$0:=0x00FF5600
			: ($color=102)
				$0:=0x00FF4300
			: ($color=103)
				$0:=0x00FF2801
			: ($color=104)
				$0:=0x00FF1E00
			: ($color=105)
				$0:=0x00FF0B00
			: ($color=106)
				$0:=0x00FF0007
			: ($color=107)
				$0:=0x00FF0019
			: ($color=108)
				$0:=0x00FF002C
			: ($color=109)
				$0:=0x00FF003F
			: ($color=110)
				$0:=0x00FF0052
			: ($color=111)
				$0:=0x00FF0065
			: ($color=112)
				$0:=0x00FF0078
			: ($color=113)
				$0:=0x00FF008B
			: ($color=114)
				$0:=0x00FF009E
			: ($color=115)
				$0:=0x00FF00B1
			: ($color=116)
				$0:=0x00FF00C4
			: ($color=117)
				$0:=0x00FF00D7
			: ($color=118)
				$0:=0x00FF00EA
			: ($color=119)
				$0:=0x00FF00FD
			: ($color=120)
				$0:=0x00EF03FF
			: ($color=121)
				$0:=0x00DC00FF
			: ($color=122)
				$0:=0x00C900FF
			: ($color=123)
				$0:=0x00B600FF
			: ($color=124)
				$0:=0x00A300FF
			: ($color=125)
				$0:=0x009000FF
			: ($color=126)
				$0:=0x007D00FF
			: ($color=127)
				$0:=0x006A00FF
			: ($color=128)
				$0:=0x00E0E0FF
			: ($color=129)
				$0:=0x00C0C0FF
			: ($color=130)
				$0:=0x00A0A0FF
			: ($color=131)
				$0:=0x007F7FFF
			: ($color=132)
				$0:=0x005F5FFF
			: ($color=133)
				$0:=0x004040FF
			: ($color=134)
				$0:=0x002020FF
			: ($color=135)
				$0:=0x00FF
			: ($color=136)
				$0:=0x0FEC
			: ($color=137)
				$0:=0x00D8
			: ($color=138)
				$0:=0x00CF
			: ($color=139)
				$0:=0x00B0
			: ($color=140)
				$0:=0x009C
			: ($color=141)
				$0:=0x0088
			: ($color=142)
				$0:=0x0074
			: ($color=143)
				$0:=0x0060
			: ($color=144)
				$0:=0x00DFF0FF
			: ($color=145)
				$0:=0x00C0E0FF
			: ($color=146)
				$0:=0x00A0CFFF
			: ($color=147)
				$0:=0x007FBEFF
			: ($color=148)
				$0:=0x005FB0FF
			: ($color=149)
				$0:=0x0040A1FF
			: ($color=150)
				$0:=0x002091FF
			: ($color=151)
				$0:=0x81FF
			: ($color=152)
				$0:=0x77EC
			: ($color=153)
				$0:=0x6DD8
			: ($color=154)
				$0:=0x63C4
			: ($color=155)
				$0:=0x59B0
			: ($color=156)
				$0:=0x529C
			: ($color=157)
				$0:=0x4588
			: ($color=158)
				$0:=0x3B74
			: ($color=159)
				$0:=0x3060
			: ($color=160)
				$0:=0x00DFFFFF
			: ($color=161)
				$0:=0x00C0FFFF
			: ($color=162)
				$0:=0x00A0FFFF
			: ($color=163)
				$0:=0x007FFFFF
			: ($color=164)
				$0:=0x005FFFFE
			: ($color=165)
				$0:=0x0040FFFE
			: ($color=166)
				$0:=0x0020FFFE
			: ($color=167)
				$0:=0xFFFE
			: ($color=168)
				$0:=0xECEA
			: ($color=169)
				$0:=0xD7D6
			: ($color=170)
				$0:=0xC3C2
			: ($color=171)
				$0:=0xAFAE
			: ($color=172)
				$0:=0x9F9E
			: ($color=173)
				$0:=0x8887
			: ($color=174)
				$0:=0x7473
			: ($color=175)
				$0:=0x605F
			: ($color=176)
				$0:=0x00DFFFE2
			: ($color=177)
				$0:=0x00C0FFC5
			: ($color=178)
				$0:=0x00A0FFA7
			: ($color=179)
				$0:=0x007FFF89
			: ($color=180)
				$0:=0x005FFF6C
			: ($color=181)
				$0:=0x0040FF4F
			: ($color=182)
				$0:=0x0020FF31
			: ($color=183)
				$0:=0xFF13
			: ($color=184)
				$0:=0xEC12
			: ($color=185)
				$0:=0xD810
			: ($color=186)
				$0:=0xC40F
			: ($color=187)
				$0:=0xB00D
			: ($color=188)
				$0:=0x9C0C
			: ($color=189)
				$0:=0x880A
			: ($color=190)
				$0:=0x7409
			: ($color=191)
				$0:=0x6007
			: ($color=192)
				$0:=0x00FFFFDF
			: ($color=193)
				$0:=0x00FFFFC0
			: ($color=194)
				$0:=0x00FFFFA0
			: ($color=195)
				$0:=0x00FFFE7F
			: ($color=196)
				$0:=0x00FFFE5F
			: ($color=197)
				$0:=0x00FFFE40
			: ($color=198)
				$0:=0x00FFFD20
			: ($color=199)
				$0:=0x00FFFD00
			: ($color=200)
				$0:=0x00ECE900
			: ($color=201)
				$0:=0x00D8D600
			: ($color=202)
				$0:=0x00C4C200
			: ($color=203)
				$0:=0x00B0AE00
			: ($color=204)
				$0:=0x009C9B00
			: ($color=205)
				$0:=0x00888700
			: ($color=206)
				$0:=0x00747300
			: ($color=207)
				$0:=0x00605F00
			: ($color=208)
				$0:=0x00FFE4DF
			: ($color=209)
				$0:=0x00FFCAC0
			: ($color=210)
				$0:=0x00FFAFA0
			: ($color=211)
				$0:=0x00FF937F
			: ($color=212)
				$0:=0x00FF785F
			: ($color=213)
				$0:=0x00FF5E40
			: ($color=214)
				$0:=0x00FF4220
			: ($color=215)
				$0:=0x00FF2700
			: ($color=216)
				$0:=0x00EC2400
			: ($color=217)
				$0:=0x00D82100
			: ($color=218)
				$0:=0x00CF2000
			: ($color=219)
				$0:=0x00B01B00
			: ($color=220)
				$0:=0x009C1800
			: ($color=221)
				$0:=0x00881500
			: ($color=222)
				$0:=0x00741200
			: ($color=223)
				$0:=0x00600E00
			: ($color=224)
				$0:=0x00FFDFFF
			: ($color=225)
				$0:=0x00FFC0FF
			: ($color=226)
				$0:=0x00FFA0FF
			: ($color=227)
				$0:=0x00FF7FFF
			: ($color=228)
				$0:=0x00FF5FFF
			: ($color=229)
				$0:=0x00FF40FF
			: ($color=230)
				$0:=0x00FF20FF
			: ($color=231)
				$0:=0x00FF00FF
			: ($color=232)
				$0:=0x00EC00EB
			: ($color=233)
				$0:=0x00D800D7
			: ($color=234)
				$0:=0x00CF00CF
			: ($color=235)
				$0:=0x00B000B0
			: ($color=236)
				$0:=0x009C009C
			: ($color=237)
				$0:=0x00880088
			: ($color=238)
				$0:=0x00740074
			: ($color=239)
				$0:=0x00600060
			: ($color=240)
				$0:=0x00FFFFFF
			: ($color=241)
				$0:=0x00EEEEEE
			: ($color=242)
				$0:=0x00DDDDDD
			: ($color=243)
				$0:=0x00CCCCCC
			: ($color=244)
				$0:=0x00C0C0C0
			: ($color=245)
				$0:=0x00AAAAAA
			: ($color=246)
				$0:=0x00999999
			: ($color=247)
				$0:=0x00888888
			: ($color=248)
				$0:=0x00777777
			: ($color=249)
				$0:=0x00666666
			: ($color=250)
				$0:=0x00555555
			: ($color=251)
				$0:=0x00404040
			: ($color=252)
				$0:=0x00333333
			: ($color=253)
				$0:=0x00222222
			: ($color=254)
				$0:=0x00111111
			: ($color=255)
				$0:=0x0000
		End case 
		
End case 