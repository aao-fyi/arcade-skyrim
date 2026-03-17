Scriptname adesarrestscript extends adesspellscript

Message Property ADESMessageResist Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	; Debug
	If (ADESDebug.GetValueInt() == 1)
		Debug.Notification("Start arrest function.")
	EndIf

	Int aaArrestEssential = ADESArrestEssential.GetValueInt()

	If (akTarget.IsEssential() == true) && (aaArrestEssential != 1)
		; Target is essential but arrest essential is disabled
		ADESMessageResist.Show()
	Else
		; Arrest
		ADESArrestDungeon(akTarget)
	EndIf
EndEvent