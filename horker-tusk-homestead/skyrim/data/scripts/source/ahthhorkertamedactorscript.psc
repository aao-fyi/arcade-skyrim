Scriptname ahthhorkertamedactorscript extends ObjectReference  

GlobalVariable Property AHTHHorkerTamedCount Auto

Event OnDeath(Actor aaKiller)
	; Adjust tamed count
	Int aaCount = AHTHHorkerTamedCount.GetValueInt()
	; Decrease count
	aaCount -= 1
	; Fix negative count
	If (aaCount < 0)
		aaCount = 0
	EndIf
	; Set count variable
	AHTHHorkerTamedCount.SetValueInt(aaCount)
endEvent