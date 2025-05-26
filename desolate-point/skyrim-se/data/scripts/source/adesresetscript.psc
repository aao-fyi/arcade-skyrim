Scriptname adesresetscript extends adesspellscript  

Bool Property ADESResetArena = false Auto
Bool Property ADESResetDungeon = false Auto
Bool Property ADESResetChamber = false Auto

Bool Function ADESReset(Quest[] aaQuests, GlobalVariable[] aaCounts, GlobalVariable aaCountMax)
	Int aaQuestsCount = aaQuests.Length
	Int aaCounter = 0

	While aaCounter < aaQuestsCount
		Quest aaQuest = aaQuests[aaCounter]
		GlobalVariable aaCount = aaCounts[aaCounter]
		Int aaAliasStart = 1
		Int aaAliasCounter = aaAliasStart

		While aaAliasCounter <= aaCountMax.GetValueInt()
			ReferenceAlias aaAlias = aaQuest.GetAlias(aaAliasCounter) As ReferenceAlias
			Actor aaAliasRef = aaAlias.GetActorReference()

			ADESRelease(aaAliasRef)
			aaAlias.Clear()

			aaAliasCounter += 1
		EndWhile

		ADESClean(aaQuest, aaCount, aaAliasStart, aaCountMax.GetValueInt(), true)
		aaQuest.Stop()

		aaCounter += 1
	EndWhile
EndFunction

Event OnEffectStart(Actor akTarget, Actor akCaster)
	If (ADESResetArena == true)
		ADESReset(ADESArenaQuestList(), ADESArenaCountList(), ADESArenaMaxCount)
	EndIf
	If (ADESResetDungeon == true)
		ADESReset(ADESDungeonQuestList(), ADESDungeonCountList(), ADESDungeonMaxCount)
	EndIf
	If (ADESResetChamber == true)
		ADESReset(ADESChamberQuestList(), ADESChamberCountList(), ADESChamberMaxCount)
	EndIf
EndEvent