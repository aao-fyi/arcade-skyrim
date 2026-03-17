Scriptname adesspellscript extends adeseffectscript

;Shiv
Weapon Property ADESShivGuardDialogueFaction Auto
Weapon Property ADESShivIsGuardFaction Auto
Faction Property GuardDialogueFaction Auto
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
	GlobalVariable[] aaCounts = ADESArenaCountList()
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

Bool Function ADESArrestDungeon(Actor aaActor, Int aaQuestMin = 0, Int aaQuestMax = 0)
	Quest[] aaQuests = ADESDungeonQuestList()
	GlobalVariable[] aaCounts = ADESDungeonCountList()
	Int aaQuestsCount = aaQuests.Length
	Int aaCountMax = ADESDungeonMaxCount.GetValueInt()
	Int aaCounter = 0

	; Optional min override (array value)
	If (aaQuestMin > 0)
		aaCounter = aaQuestMin
	EndIf
	; Optional max override (array value)
	If (aaQuestMax > 0)
		aaQuestsCount = aaQuestMax
	EndIf

	While aaCounter < aaQuestsCount
		Quest aaQuest = aaQuests[aaCounter]
		GlobalVariable aaCount = aaCounts[aaCounter]
		Bool aaArrest = false

		ADESClean(aaQuest, aaCount, 1, aaCountMax, true)

		; Trust count (scary)
		If aaCount.GetValueInt() < aaCountMax
			aaArrest = ADESArrest(aaActor, aaQuest, aaCount, aaCountMax, ADESDungeonOutfitList, 0, 1, true)
		EndIf

		If (aaArrest == true)
			; Success
			aaCounter = aaQuestsCount
			Return true
		EndIf

		aaCounter += 1
	EndWhile

	; Fail
	Return false
EndFunction

Bool Function ADESArrestChamber(Actor aaActor)
	Quest[] aaQuests = ADESChamberQuestList()
	GlobalVariable[] aaCounts = ADESChamberCountList()
	Int aaQuestsCount = aaQuests.Length
	Int aaCountMax = ADESChamberMaxCount.GetValueInt()
	Int aaCounter = 0

	While aaCounter < aaQuestsCount
		Quest aaQuest = aaQuests[aaCounter]
		GlobalVariable aaCount = aaCounts[aaCounter]
		Bool aaArrest = false

		ADESClean(aaQuest, aaCount, 1, aaCountMax, true)

		; Trust count (still scary, more now)
		If aaCount.GetValueInt() < aaCountMax
			aaArrest = ADESArrest(aaActor, aaQuest, aaCount, aaCountMax, ADESDungeonOutfitList, 0, 1, true)
		EndIf

		If (aaArrest == true)
			; Success
			aaCounter = aaQuestsCount
			Return true
		EndIf

		aaCounter += 1
	EndWhile

	;  Fail
	Return false
EndFunction

Bool Function ADESArrestMine(Actor aaActor)
	Bool aaArrest = false
	Int aaCountMax = ADESMineMaxCount.GetValueInt()

	ADESClean(ADESMine01Quest, ADESMine01Count, 1, aaCountMax, true)

	If (ADESDebug.GetValueInt() == 1)
		Debug.Notification("Arrest mine")
	EndIf

	; Trust count (scare level unknown)
	If ADESMine01Count.GetValueInt() < aaCountMax
		aaArrest = ADESArrest(aaActor, ADESMine01Quest, ADESMine01Count, aaCountMax, ADESDungeonOutfitList, 0, 1, true)
	EndIf

	Return aaArrest
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
	ElseIf (aaActor.HasKeyword(ADESChamberKeyword) == true)
		; Actor in chamber
		aaQuests = ADESChamberQuestList()
		aaCounts = ADESChamberCountList()
		aaCountMax = ADESChamberMaxCount
		aaAliasMin = 1
		aaAliasMax = aaCountMax.GetValueInt()
		aaStopEmptyQuest = true
	ElseIf (aaActor.HasKeyword(ADESMineKeyword) == true)
		; Actor in mine
		aaQuests = ADESMineQuestList()
		aaCounts = ADESMineCountList()
		aaCountMax = ADESMineMaxCount
		aaAliasMin = 1
		aaAliasMax = aaCountMax.GetValueInt()
		aaStopEmptyQuest = true
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
				; Unassign
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
	; GuardDialogueFaction
	If (aaActor.IsInFaction(GuardDialogueFaction))
		aaActor.AddItem(ADESShivGuardDialogueFaction, 1)
		aaActor.RemoveFromFaction(GuardDialogueFaction)
	EndIf
	; IsGuardFaction
	If (aaActor.IsInFaction(IsGuardFaction))
		aaActor.AddItem(ADESShivIsGuardFaction, 1)
		aaActor.RemoveFromFaction(IsGuardFaction)
	EndIf
EndFunction

Bool Function ADESShivRemove(Actor aaActor)
	; GuardDialogueFaction
	If (aaActor.GetItemCount(ADESShivGuardDialogueFaction) >= 1)
		aaActor.AddToFaction(GuardDialogueFaction)
		aaActor.RemoveItem(ADESShivGuardDialogueFaction)
	EndIf
	; IsGuardFaction
	If (aaActor.GetItemCount(ADESShivIsGuardFaction) >= 1)
		aaActor.AddToFaction(IsGuardFaction)
		aaActor.RemoveItem(ADESShivIsGuardFaction)
	EndIf
EndFunction