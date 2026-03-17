Scriptname adesarenagatescript extends ObjectReference  

GlobalVariable Property ADESDebug Auto

ObjectReference Property ADESArenaGateMarker Auto

ObjectReference Property ADESArenaDoorTeam01 Auto
ObjectReference Property ADESArenaDoorTeam02 Auto
ObjectReference Property ADESArenaDoorTeam03 Auto
ObjectReference Property ADESArenaDoorTeam04 Auto

Quest Property ADESArena0101Quest Auto
Quest Property ADESArena0102Quest Auto
Quest Property ADESArena0103Quest Auto
Quest Property ADESArena0104Quest Auto

Spell Property ADESArenaOverflowSpell Auto
Spell Property ADESReleaseSelfSpell Auto

Quest[] Function ADESArenaQuestList()
	; Create quest list
	Quest[] akQuests = new Quest[4] ;(0-3)
	; Define quest list
	akQuests[0] = ADESArena0101Quest
	akQuests[1] = ADESArena0102Quest
	akQuests[2] = ADESArena0103Quest
	akQuests[3] = ADESArena0104Quest
	; Return quest list
	Return akQuests
EndFunction

Function ADESOpenGates(Bool OpenState)
	ADESArenaDoorTeam01.SetOpen(OpenState)
	ADESArenaDoorTeam02.SetOpen(OpenState)
	ADESArenaDoorTeam03.SetOpen(OpenState)
	ADESArenaDoorTeam04.SetOpen(OpenState)

	If (OpenState == false)
		ADESArenaDoorTeam01.Lock(true)
		ADESArenaDoorTeam02.Lock(true)
		ADESArenaDoorTeam03.Lock(true)
		ADESArenaDoorTeam04.Lock(true)
	EndIf
EndFunction

Event OnActivate(ObjectReference akActionRef)
	; Disable control marker
	ADESArenaGateMarker.Disable()

	; Open gates
	ADESOpenGates(true)

	; Activate battle package
	Quest[] aaQuests = ADESArenaQuestList()
	Int aaQuestCount = aaQuests.Length
	Int aaCounter = 0

	While aaCounter < aaQuestCount
		Quest aaQuest = aaQuests[aaCounter]
		Int aaWaitMin = 1
		Int aaWaitMax = 6
		Int aaBattleAdd = 6

		While aaWaitMin <= aaWaitMax
			ReferenceAlias aaAliasWait = aaQuest.GetAlias(aaWaitMin) As ReferenceAlias
			Actor aaAliasWaitRef = aaAliasWait.GetActorReference()

			ReferenceAlias aaAliasBattle = aaQuest.GetAlias(aaWaitMin + aaBattleAdd) As ReferenceAlias
			Actor aaAliasBattleRef = aaAliasBattle.GetActorReference()

			If (aaAliasWaitRef != None)
				; If already battle alias, cast overflow spell on self
				If (aaAliasBattleRef != None)
					ADESArenaOverflowSpell.Cast(aaAliasBattleRef)
				EndIf

				; Remove from factions
				If (aaAliasWaitRef.IsEssential() != true)
					aaAliasWaitRef.SetCrimeFaction(None)
					aaAliasWaitRef.RemoveFromAllFactions()
				EndIf

				aaAliasWait.Clear()
				aaAliasBattle.Clear()
				aaAliasBattle.ForceRefTo(aaAliasWaitRef)

				; Enrage - set actor values
				aaAliasWaitRef.ForceActorValue("assistance", 1)
				aaAliasWaitRef.ForceActorValue("aggression", 1)
				aaAliasWaitRef.ForceActorValue("confidence", 4)
				aaAliasWaitRef.ForceActorValue("mood", 1)
				aaAliasWaitRef.ForceActorValue("morality", 0)

				aaAliasWaitRef.EvaluatePackage()
			EndIf

			aaWaitMin += 1
		EndWhile

		aaCounter += 1
	EndWhile

	; Wait
	Utility.Wait(60)

	; Close gates
	ADESOpenGates(false)

	; Enable navcut cubes
	ADESArenaGateMarker.Enable()
EndEvent