Scriptname adesteleportscript extends activemagiceffect  

ObjectReference Property ADESTeleportArenaMarker Auto
ObjectReference Property ADESTeleportDungeonMarker Auto
ObjectReference Property ADESTeleportChamberMarker Auto

Message Property ADESMessageCancel Auto

Message Property ADESTeleportMessageLocSelect Auto

Event OnEffectStart(Actor aaTarget, Actor aaCaster)
	Int aaMenu = 0
	aaMenu = ADESTeleportMessageLocSelect.Show()

	If aaMenu == 0 ; Arena
		aaCaster.MoveTo(ADESTeleportArenaMarker)
	ElseIf aaMenu == 1 ; Dungeon
		aaCaster.MoveTo(ADESTeleportDungeonMarker)
	ElseIf aaMenu == 2 ; Chamber
		aaCaster.MoveTo(ADESTeleportChamberMarker)
	Else ; Cancel
		ADESMessageCancel.Show()
	EndIf
EndEvent