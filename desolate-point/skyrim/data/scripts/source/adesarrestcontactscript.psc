Scriptname adesarrestcontactscript extends activemagiceffect

GlobalVariable Property ADESArrestEssential Auto
GlobalVariable Property ADESArrestHealth Auto

Spell Property ADESArrestSpell Auto

; Use duration as cooldown

Event OnEffectStart(Actor aaTarget, Actor aaCaster)
	If (!aaTarget)
		; Fail
		Return
	ElseIf (aaTarget.IsEssential()) && (ADESArrestEssential.GetValueInt() != 1)
		; Fail
		Return
	ElseIf (aaTarget.GetActorValuePercentage("Health") <= ADESArrestHealth.GetValue())
		; Success
		ADESArrestSpell.Cast(aaCaster, aaTarget)
	EndIf
EndEvent