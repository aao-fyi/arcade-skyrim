Scriptname adesteleportscript extends activemagiceffect  

ObjectReference Property ADESTeleportArenaMarker Auto
ObjectReference Property ADESTeleportDungeonMarker Auto

Message Property ADESMessageCancel Auto

Message Property ADESTeleportMessageLocSelect Auto
Message Property ADESTeleportMessageLocWrong Auto

Event OnEffectStart(Actor aaTarget, Actor aaCaster)
	Int aaMenu = 0
	aaMenu = ADESTeleportMessageLocSelect.Show()

	If aaMenu == 0 ; Arena
		aaCaster.MoveTo(ADESTeleportArenaMarker)
	ElseIf aaMenu == 1 ; Dungeon
		aaCaster.MoveTo(ADESTeleportDungeonMarker)
	Else ; Cancel
		ADESMessageCancel.Show()
	EndIf
EndEvent