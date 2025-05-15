Scriptname ahthhorkertamereffectscript extends activemagiceffect  

ActorBase Property AHTHHorkerTamed Auto

GlobalVariable Property AHTHHorkerTamedCount Auto

Quest Property AHTHHorkerTamedQuest Auto

Race Property HorkerRace Auto

Event OnEffectStart(Actor aaTarget, Actor aaCaster)
	If (aaTarget.GetRace() == HorkerRace) && (aaCaster == Game.GetPlayer())
		; Remove target horker
		aaTarget.Kill()
		aaTarget.Disable()

		; Spawn tamed horker
		aaTarget.PlaceActorAtMe(AHTHHorkerTamed)

		; Start tamed horker quest
		AHTHHorkerTamedQuest.Start()

		; Adjust tamed count
		Int aaCount = AHTHHorkerTamedCount.GetValueInt()
		; Fix negative count
		If (aaCount < 0)
			aaCount = 0
		EndIf
		; Increment count
		aaCount += 1
		; Set count variable
		AHTHHorkerTamedCount.SetValueInt(aaCount)
	EndIf
EndEvent