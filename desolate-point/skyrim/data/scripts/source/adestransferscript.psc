Scriptname adestransferscript extends adesspellscript  

Message Property ADESMessageCancel Auto
Message Property ADESMessageTransferCategories Auto
Message Property ADESMessageTransferArena Auto
Message Property ADESMessageTransferDungeon Auto

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	Int akMenu = 0
	akMenu = ADESMessageTransferCategories.Show()

	If akMenu == 0 ; Arena
		akMenu = ADESMessageTransferArena.Show()

		If akMenu == 0 ; Team 1
			ADESArrestArena(akTarget, 1)
		ElseIf akMenu == 1 ; Team 2
			ADESArrestArena(akTarget, 2)
		ElseIf akMenu == 2 ; Team 3
			ADESArrestArena(akTarget, 3)
		ElseIf akMenu == 3 ; Team 4
			ADESArrestArena(akTarget, 4)
		Else ; Cancel
			ADESMessageCancel.Show()
		EndIf
	ElseIf akMenu == 1 ; Dungeon
		akMenu = ADESMessageTransferDungeon.Show()

		If akMenu == 0 ; Cell Block 1
			ADESArrestDungeon(akTarget, 0, 5)
		ElseIf akMenu == 1 ; Cell Block 2
			ADESArrestDungeon(akTarget, 6, 11)
		ElseIf akMenu == 2 ; Cell Block 3
			ADESArrestDungeon(akTarget, 12, 17)
		ElseIf akMenu == 3 ; Cell Block 4
			ADESArrestDungeon(akTarget, 18, 23)
		ElseIf akMenu == 4 ; Cell Block 5
			ADESArrestDungeon(akTarget, 24, 29)
		ElseIf akMenu == 5 ; Cell Block 6
			ADESArrestDungeon(akTarget, 30, 35)
		Else ; Cancel
			ADESMessageCancel.Show()
		EndIf
	Else ; Cancel
		ADESMessageCancel.Show()
	EndIf
EndEvent