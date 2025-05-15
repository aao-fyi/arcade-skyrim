Scriptname adesspellscript extends adeseffectscript  

;Shiv
Weapon Property ADESShivIsGuardFaction Auto
Faction Property IsGuardFaction Auto

Bool Function ADESArrest(Actor aaActor, Quest aaQuest, GlobalVariable aaCount, Int aaCountMax, FormList aaOutfit, Int aaAliasLocation = 0, Int aaAliasStart = 1, Bool aaStopEmptyQuest = true)
	; Verify quest running
	ADESClean(aaQuest, aaCount,  aaAliasStart, aaCountMax, false)

	; Check if quest has an empty alias
	ReferenceAlias aaAliasTarget = ADESActorAliasFind(aaQuest, aaAliasStart, aaCountMax, None) As ReferenceAlias

	; Assign to alias if alias found
	If (aaAliasTarget != None)
		; Release if already arrest or in arena
		ADESRelease(aaActor)

		; Assign actor to alias
		ADESActorAliasAssign(aaActor, aaAliasTarget)

		; Relocate
		ReferenceAlias aaAliasLocationRef = aaQuest.GetAlias(aaAliasLocation) As ReferenceAlias
		ADESRelocate(aaActor, aaAliasLocationRef.GetReference())

		; Modify
		ADESActorEquipList(aaActor, aaOutfit, true)
		ADESActorCalm(aaActor)
		ADESShivAdd(aaActor)

		; Clean
		ADESClean(aaQuest, aaCount, aaAliasStart, aaCountMax, aaStopEmptyQuest)

		; Success
		Return true
	EndIf

	; Fail
	Return false
EndFunction

Bool Function ADESArrestArena(Actor aaActor, Int aaTeam)
	; Debug
	If (ADESDebug.GetValueInt() == 1)
		Debug.Notification("Start ADESArrestArena: " + aaTeam)
	EndIf

	Quest[] aaQuests = ADESArenaQuestList()
	GlobalVariable[] aaCounts = ADESDungeonCountList()
	Int aaQuestsCount = aaQuests.Length
	Int aaCountMax = ADESArenaMaxCount.GetValueInt()
	Int aaCounter = 0

	FormList aaOutfit

	If (aaTeam == 1)
		aaOutfit = ADESArenaTeam01OutfitList
	ElseIf (aaTeam == 2)
		aaOutfit = ADESArenaTeam02OutfitList
	ElseIf (aaTeam == 3)
		aaOutfit = ADESArenaTeam03OutfitList
	ElseIf (aaTeam == 4)
		aaOutfit = ADESArenaTeam04OutfitList
	ElseIf (aaTeam == 5)
		aaOutfit = ADESArenaTeam05OutfitList
		aaCountMax = 12
		ADESArrest(aaActor, ADESArena0105Quest, ADESArena0105Count, aaCountMax, aaOutfit, 0, 1, false)
		; Success
		Return true
	Else
		; Fail
		Return false
	EndIf

	ADESArrest(aaActor, aaQuests[aaTeam - 1], aaCounts[aaTeam - 1], aaCountMax, aaOutfit, 0, 1, false)
	; Success
	Return true
EndFunction

Bool Function ADESArrestDungeon(Actor akActor, Int akQuestMin = 0, Int akQuestMax = 0)
	Quest[] akQuests = ADESDungeonQuestList()
	GlobalVariable[] akCounts = ADESDungeonCountList()
	Int akQuestsCount = akQuests.Length
	Int akCountMax = ADESDungeonMaxCount.GetValueInt()
	Int akCounter = 0

	; Optional min override (array value)
	If (akQuestMin > 0)
		akCounter = akQuestMin
	EndIf
	; Optional max override (array value)
	If (akQuestMax > 0)
		akQuestsCount = akQuestMax
	EndIf

	While akCounter < akQuestsCount
		Quest akQuest = akQuests[akCounter]
		GlobalVariable akCount = akCounts[akCounter]
		Bool aaArrest

		; Trust count (scary)
		If akCount.GetValueInt() < akCountMax
			aaArrest = ADESArrest(akActor, akQuest, akCount, akCountMax, ADESDungeonOutfitList, 0, 1, true)
		EndIf

		If (aaArrest == true)
			; Success
			akCounter = akQuestsCount
			Return true
		EndIf

		akCounter += 1
	EndWhile

	; Fail
	Return false
EndFunction

Bool Function ADESRelease(Actor aaActor)
	Quest[] aaQuests
	GlobalVariable[] aaCounts
	GlobalVariable aaCountMax
	Bool aaStopEmptyQuest
	Int aaAliasMin
	Int aaAliasMax

	If (aaActor.HasKeyword(ADESDungeonKeyword) == true)
		; Actor in dungeon
		aaQuests = ADESDungeonQuestList()
		aaCounts = ADESDungeonCountList()
		aaCountMax = ADESDungeonMaxCount
		aaAliasMin = 1
		aaAliasMax = aaCountMax.GetValueInt()
		aaStopEmptyQuest = true
	ElseIf (aaActor.HasKeyword(ADESArenaKeyword) == true)
		; Actor in arena
		aaQuests = ADESArenaQuestList()
		aaCounts = ADESArenaCountList()
		aaCountMax = ADESArenaMaxCount
		aaAliasMin = 1
		aaAliasMax = aaCountMax.GetValueInt() * 2
		aaStopEmptyQuest = false
	Else
		; Fail
		Return false
	EndIf

	Int aaQuestsCount = aaQuests.Length
	Int aaCounter = 0

	While aaCounter < aaQuestsCount
		Quest aaQuest = aaQuests[aaCounter]
		GlobalVariable aaCount = aaCounts[aaCounter]

		; Skip iteration if quest stopped
		If (aaQuest.IsStopped() != true)
			; Check if quest has actor as alias
			ReferenceAlias aaAliasTarget = ADESActorAliasFind(aaQuest, aaAliasMin, aaAliasMax, aaActor) As ReferenceAlias

			; Unassign the actor
			If (aaAliasTarget != None)
				;Unassign
                    				aaAliasTarget.Clear()

				; Modify
				ADESActorReset(aaActor)
				ADESActorEquipList(aaActor, ADESReleaseOutfitList, false)
				ADESShivRemove(aaActor)

				; Relocate
				ADESRelocate(aaActor, ADESRelease01Marker)

				; Success
				aaCounter = aaQuestsCount
				Return true
			EndIf
		EndIf

		; Next iteration
		aaCounter += 1
	EndWhile
EndFunction

Bool Function ADESShivAdd(Actor aaActor)
	If (aaActor.IsInFaction(IsGuardFaction))
		aaActor.AddItem(ADESShivIsGuardFaction, 1)
		aaActor.RemoveFromFaction(IsGuardFaction)
	EndIf
EndFunction

Bool Function ADESShivRemove(Actor aaActor)
	If (aaActor.GetItemCount(ADESShivIsGuardFaction) >= 1)
		aaActor.AddToFaction(IsGuardFaction)
		aaActor.RemoveItem(ADESShivIsGuardFaction)
	EndIf
EndFunction