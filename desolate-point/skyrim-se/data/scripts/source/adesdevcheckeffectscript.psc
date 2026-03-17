Scriptname adesdevcheckeffectscript extends adeseffectscript  

; Arena Checks
Bool Property CheckArena = false Auto

; Dungeon Checks
Bool Property CheckDungeon = false Auto

Function ADESDevCheck(Quest aaQuest, GlobalVariable aaCount, Int aaAliasMin, Int aaAliasMax, FormList aaOutfit)
	Int aaCounter = aaAliasMin

	While aaCounter <= aaAliasMax
		ReferenceAlias aaAlias = aaQuest.GetAlias(aaCounter) As ReferenceAlias
		Actor aaAliasRef = aaAlias.GetActorReference()

		If (aaAlias != None) && (aaAliasRef != None)
			ADESActorEquipList(aaAliasRef, aaOutfit, true)
		EndIf

		aaCounter += 1
	EndWhile
EndFunction

Event OnEffectStart(Actor aaTarget, Actor aaCaster)
	Quest[] aaQuests
	GlobalVariable[] aaCounts

	; Arena Checks
	If (CheckArena == true)
		Int aaCountMax = ADESArenaMaxCount.GetValueInt()

		ADESDevCheck(ADESArena0101Quest, ADESArena0101Count, 1, aaCountMax, ADESArenaTeam01OutfitList)
		ADESDevCheck(ADESArena0102Quest, ADESArena0102Count, 1, aaCountMax, ADESArenaTeam02OutfitList)
		ADESDevCheck(ADESArena0103Quest, ADESArena0103Count, 1, aaCountMax, ADESArenaTeam03OutfitList)
		ADESDevCheck(ADESArena0104Quest, ADESArena0104Count, 1, aaCountMax, ADESArenaTeam04OutfitList)
	EndIf

	; DungeonChecks
	If (CheckDungeon == true)
		aaQuests = ADESDungeonQuestList()
		aaCounts = ADESDungeonCountList()
		Int aaQuestsCount = aaQuests.Length
		Int aaCountMax = ADESDungeonMaxCount.GetValueInt()
		Int aaCounter = 0

		While aaCounter < aaQuestsCount
			Quest aaQuest = aaQuests[aaCounter]
			GlobalVariable aaCount = aaCounts[aaCounter]

			ADESDevCheck(aaQuest, aaCount, 1, aaCountMax, ADESDungeonOutfitList)

			aaCounter += 1
		EndWhile
	EndIf
EndEvent