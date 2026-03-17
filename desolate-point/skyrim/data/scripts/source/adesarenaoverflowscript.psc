Scriptname adesarenaoverflowscript extends adesspellscript

Spell Property ADESReleaseSelfSpell Auto

Event OnEffectStart(Actor aaTarget, Actor aaCaster)
	Bool aaOverflowAssign = ADESArrestArena(aaTarget, 5)

	If (aaOverflowAssign == false)
		If (aaTarget.IsEssential())
			ADESReleaseSelfSpell.Cast(aaTarget)
		EndIf
		aaTarget.Kill()
	EndIf
EndEvent