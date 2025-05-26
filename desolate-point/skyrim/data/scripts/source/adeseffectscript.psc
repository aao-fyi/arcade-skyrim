Scriptname adeseffectscript extends activemagiceffect  

; Debug
GlobalVariable Property ADESDebug Auto

; Global Variables
GlobalVariable Property ADESArenaMaxCount Auto
GlobalVariable Property ADESDungeonMaxCount Auto
GlobalVariable Property ADESChamberMaxCount Auto
GlobalVariable Property ADESArrestEssential Auto

; Keywords
Keyword Property ADESArenaKeyword Auto
Keyword Property ADESDungeonKeyword Auto
Keyword Property ADESChamberKeyword Auto

; Form Lists
FormList Property ADESArenaTeam01OutfitList Auto
FormList Property ADESArenaTeam02OutfitList Auto
FormList Property ADESArenaTeam03OutfitList Auto
FormList Property ADESArenaTeam04OutfitList Auto
FormList Property ADESArenaTeam05OutfitList Auto
FormList Property ADESDungeonOutfitList Auto
FormList Property ADESReleaseOutfitList Auto
FormList Property ADESRemoveItemsList Auto

; Messages
Message Property ADESMessageCellFull Auto

;References
ObjectReference Property ADESRelease01Marker Auto

; Arena Quests
; =================================
Quest Property ADESArena0101Quest Auto
Quest Property ADESArena0102Quest Auto
Quest Property ADESArena0103Quest Auto
Quest Property ADESArena0104Quest Auto
Quest Property ADESArena0105Quest Auto

; Arena Quest List
; Returns array of arena quests
Quest[] Function ADESArenaQuestList()
	; Create quest list
	Quest[] aaQuests = new Quest[4] ;(0-3)
	; Define quest list
	aaQuests[0] = ADESArena0101Quest
	aaQuests[1] = ADESArena0102Quest
	aaQuests[2] = ADESArena0103Quest
	aaQuests[3] = ADESArena0104Quest
	; Return quest list
	Return aaQuests
EndFunction
; =================================

; Arena Counts
; =================================
GlobalVariable Property ADESArena0101Count Auto
GlobalVariable Property ADESArena0102Count Auto
GlobalVariable Property ADESArena0103Count Auto
GlobalVariable Property ADESArena0104Count Auto
GlobalVariable Property ADESArena0105Count Auto

; Arena Count List
; Returns array of arena counts
GlobalVariable[] Function ADESArenaCountList()
	; Create count list
	GlobalVariable[] aaCounts = new GlobalVariable[4] ;(0-3)
	; Define count list
	aaCounts[0] = ADESArena0101Count
	aaCounts[1] = ADESArena0102Count
	aaCounts[2] = ADESArena0103Count
	aaCounts[3] = ADESArena0104Count
	; Return count list
	Return aaCounts
EndFunction
; =================================

; Dungeon Quests
; =================================
Quest Property ADESDungeon0101Quest Auto
Quest Property ADESDungeon0102Quest Auto
Quest Property ADESDungeon0103Quest Auto
Quest Property ADESDungeon0104Quest Auto
Quest Property ADESDungeon0105Quest Auto
Quest Property ADESDungeon0106Quest Auto
Quest Property ADESDungeon0107Quest Auto
Quest Property ADESDungeon0108Quest Auto
Quest Property ADESDungeon0109Quest Auto
Quest Property ADESDungeon0110Quest Auto
Quest Property ADESDungeon0111Quest Auto
Quest Property ADESDungeon0112Quest Auto
Quest Property ADESDungeon0113Quest Auto
Quest Property ADESDungeon0114Quest Auto
Quest Property ADESDungeon0115Quest Auto
Quest Property ADESDungeon0116Quest Auto
Quest Property ADESDungeon0117Quest Auto
Quest Property ADESDungeon0118Quest Auto
Quest Property ADESDungeon0119Quest Auto
Quest Property ADESDungeon0120Quest Auto
Quest Property ADESDungeon0121Quest Auto
Quest Property ADESDungeon0122Quest Auto
Quest Property ADESDungeon0123Quest Auto
Quest Property ADESDungeon0124Quest Auto
Quest Property ADESDungeon0125Quest Auto
Quest Property ADESDungeon0126Quest Auto
Quest Property ADESDungeon0127Quest Auto
Quest Property ADESDungeon0128Quest Auto
Quest Property ADESDungeon0129Quest Auto
Quest Property ADESDungeon0130Quest Auto
Quest Property ADESDungeon0131Quest Auto
Quest Property ADESDungeon0132Quest Auto
Quest Property ADESDungeon0133Quest Auto
Quest Property ADESDungeon0134Quest Auto
Quest Property ADESDungeon0135Quest Auto
Quest Property ADESDungeon0136Quest Auto

; Dungeon Quest List
; Returns array of dungeon quests
Quest[] Function ADESDungeonQuestList()
	; Create quest list
	Quest[] akQuests = new Quest[36] ;(0-35)
	; Define quest list
	akQuests[0] = ADESDungeon0101Quest
	akQuests[1] = ADESDungeon0102Quest
	akQuests[2] = ADESDungeon0103Quest
	akQuests[3] = ADESDungeon0104Quest
	akQuests[4] = ADESDungeon0105Quest
	akQuests[5] = ADESDungeon0106Quest
	akQuests[6] = ADESDungeon0107Quest
	akQuests[7] = ADESDungeon0108Quest
	akQuests[8] = ADESDungeon0109Quest
	akQuests[9] = ADESDungeon0110Quest
	akQuests[10] = ADESDungeon0111Quest
	akQuests[11] = ADESDungeon0112Quest
	akQuests[12] = ADESDungeon0113Quest
	akQuests[13] = ADESDungeon0114Quest
	akQuests[14] = ADESDungeon0115Quest
	akQuests[15] = ADESDungeon0116Quest
	akQuests[16] = ADESDungeon0117Quest
	akQuests[17] = ADESDungeon0118Quest
	akQuests[18] = ADESDungeon0119Quest
	akQuests[19] = ADESDungeon0120Quest
	akQuests[20] = ADESDungeon0121Quest
	akQuests[21] = ADESDungeon0122Quest
	akQuests[22] = ADESDungeon0123Quest
	akQuests[23] = ADESDungeon0124Quest
	akQuests[24] = ADESDungeon0125Quest
	akQuests[25] = ADESDungeon0126Quest
	akQuests[26] = ADESDungeon0127Quest
	akQuests[27] = ADESDungeon0128Quest
	akQuests[28] = ADESDungeon0129Quest
	akQuests[29] = ADESDungeon0130Quest
	akQuests[30] = ADESDungeon0131Quest
	akQuests[31] = ADESDungeon0132Quest
	akQuests[32] = ADESDungeon0133Quest
	akQuests[33] = ADESDungeon0134Quest
	akQuests[34] = ADESDungeon0135Quest
	akQuests[35] = ADESDungeon0136Quest
	; Return quest list
	Return akQuests
EndFunction
; =================================

; Dungeon Counts
; =================================
GlobalVariable Property ADESDungeon0101Count Auto
GlobalVariable Property ADESDungeon0102Count Auto
GlobalVariable Property ADESDungeon0103Count Auto
GlobalVariable Property ADESDungeon0104Count Auto
GlobalVariable Property ADESDungeon0105Count Auto
GlobalVariable Property ADESDungeon0106Count Auto
GlobalVariable Property ADESDungeon0107Count Auto
GlobalVariable Property ADESDungeon0108Count Auto
GlobalVariable Property ADESDungeon0109Count Auto
GlobalVariable Property ADESDungeon0110Count Auto
GlobalVariable Property ADESDungeon0111Count Auto
GlobalVariable Property ADESDungeon0112Count Auto
GlobalVariable Property ADESDungeon0113Count Auto
GlobalVariable Property ADESDungeon0114Count Auto
GlobalVariable Property ADESDungeon0115Count Auto
GlobalVariable Property ADESDungeon0116Count Auto
GlobalVariable Property ADESDungeon0117Count Auto
GlobalVariable Property ADESDungeon0118Count Auto
GlobalVariable Property ADESDungeon0119Count Auto
GlobalVariable Property ADESDungeon0120Count Auto
GlobalVariable Property ADESDungeon0121Count Auto
GlobalVariable Property ADESDungeon0122Count Auto
GlobalVariable Property ADESDungeon0123Count Auto
GlobalVariable Property ADESDungeon0124Count Auto
GlobalVariable Property ADESDungeon0125Count Auto
GlobalVariable Property ADESDungeon0126Count Auto
GlobalVariable Property ADESDungeon0127Count Auto
GlobalVariable Property ADESDungeon0128Count Auto
GlobalVariable Property ADESDungeon0129Count Auto
GlobalVariable Property ADESDungeon0130Count Auto
GlobalVariable Property ADESDungeon0131Count Auto
GlobalVariable Property ADESDungeon0132Count Auto
GlobalVariable Property ADESDungeon0133Count Auto
GlobalVariable Property ADESDungeon0134Count Auto
GlobalVariable Property ADESDungeon0135Count Auto
GlobalVariable Property ADESDungeon0136Count Auto

; Dungeon Count List
; Returns array of dungeon counts
GlobalVariable[] Function ADESDungeonCountList()
	; Create count list
	GlobalVariable[] akCounts = new GlobalVariable[36] ;(0-35)
	; Define count list
	akCounts[0] = ADESDungeon0101Count
	akCounts[1] = ADESDungeon0102Count
	akCounts[2] = ADESDungeon0103Count
	akCounts[3] = ADESDungeon0104Count
	akCounts[4] = ADESDungeon0105Count
	akCounts[5] = ADESDungeon0106Count
	akCounts[6] = ADESDungeon0107Count
	akCounts[7] = ADESDungeon0108Count
	akCounts[8] = ADESDungeon0109Count
	akCounts[9] = ADESDungeon0110Count
	akCounts[10] = ADESDungeon0111Count
	akCounts[11] = ADESDungeon0112Count
	akCounts[12] = ADESDungeon0113Count
	akCounts[13] = ADESDungeon0114Count
	akCounts[14] = ADESDungeon0115Count
	akCounts[15] = ADESDungeon0116Count
	akCounts[16] = ADESDungeon0117Count
	akCounts[17] = ADESDungeon0118Count
	akCounts[18] = ADESDungeon0119Count
	akCounts[19] = ADESDungeon0120Count
	akCounts[20] = ADESDungeon0121Count
	akCounts[21] = ADESDungeon0122Count
	akCounts[22] = ADESDungeon0123Count
	akCounts[23] = ADESDungeon0124Count
	akCounts[24] = ADESDungeon0125Count
	akCounts[25] = ADESDungeon0126Count
	akCounts[26] = ADESDungeon0127Count
	akCounts[27] = ADESDungeon0128Count
	akCounts[28] = ADESDungeon0129Count
	akCounts[29] = ADESDungeon0130Count
	akCounts[30] = ADESDungeon0131Count
	akCounts[31] = ADESDungeon0132Count
	akCounts[32] = ADESDungeon0133Count
	akCounts[33] = ADESDungeon0134Count
	akCounts[34] = ADESDungeon0135Count
	akCounts[35] = ADESDungeon0136Count
	; Return count list
	Return akCounts
EndFunction
; =================================

; Chamber Quests
; =================================
Quest Property ADESChamber0101Quest Auto
Quest Property ADESChamber0102Quest Auto
Quest Property ADESChamber0103Quest Auto
Quest Property ADESChamber0104Quest Auto

; Chamber Quest List
; Returns array of chamber quests
Quest[] Function ADESChamberQuestList()
	; Create quest list
	Quest[] aaQuests = new Quest[4] ;(0-3)
	; Define quest list
	aaQuests[0] = ADESChamber0101Quest
	aaQuests[1] = ADESChamber0102Quest
	aaQuests[2] = ADESChamber0103Quest
	aaQuests[3] = ADESChamber0104Quest
	; Return quest list
	Return aaQuests
EndFunction
; =================================

; Chamber Counts
; =================================
GlobalVariable Property ADESChamber0101Count Auto
GlobalVariable Property ADESChamber0102Count Auto
GlobalVariable Property ADESChamber0103Count Auto
GlobalVariable Property ADESChamber0104Count Auto

; Chamber Count List
; Returns array of chamber counts
GlobalVariable[] Function ADESChamberCountList()
	; Create count list
	GlobalVariable[] aaCounts = new GlobalVariable[4] ;(0-3)
	; Define count list
	aaCounts[0] = ADESChamber0101Count
	aaCounts[1] = ADESChamber0102Count
	aaCounts[2] = ADESChamber0103Count
	aaCounts[3] = ADESChamber0104Count
	; Return count list
	Return aaCounts
EndFunction
; =================================

; ADES Actor Alias Assign
; Return true if assigned, false if not assigned
; =================================
Function ADESActorAliasAssign(Actor aaActor, ReferenceAlias aaAlias)
	; Assign alias
	aaAlias.Clear()
	aaAlias.ForceRefTo(aaActor)
EndFunction
; =================================

; ADES Actor Alias Find
; Find actor alias in quest, find empty alias if no actor defined
; Return found alias if found, return None if not found
; =================================
Alias Function ADESActorAliasFind(Quest aaQuest, Int aaAliasMin, Int aaAliasMax, Actor aaActor = None)
	Int aaCounter = aaAliasMin
	ReferenceAlias aaAlias
	Actor aaAliasRef

	While aaCounter <= aaAliasMax
		aaAlias = aaQuest.GetAlias(aaCounter) As ReferenceAlias
		aaAliasRef = aaAlias.GetActorReference()

		If (aaAliasRef == aaActor)
			; Debug
			If (ADESDebug.GetValueInt() == 1)
				Debug.Notification("Found actor alias: " + aaAlias)
			EndIf

			; Success
			Return aaAlias
		EndIf

		aaCounter += 1
	EndWhile

	; Debug
	If (ADESDebug.GetValueInt() == 1)
		Debug.Notification("No actor alias found.")
	EndIf

	; Fail
	Return None
EndFunction
; =================================

; ADES Actor Calm
; =================================
Function ADESActorCalm(Actor akActor)
	; Set calm actor values
	akActor.ForceActorValue("assistance", 0)
	akActor.ForceActorValue("aggression", 0)
	akActor.ForceActorValue("confidence", 0)
	akActor.ForceActorValue("mood", 7)
	akActor.ForceActorValue("morality", 0)

	; Stop combat
	akActor.StopCombat()
	akActor.StopCombatAlarm()
EndFunction
; =================================

; ADES Actor Equip List
; =================================
Function ADESActorEquipList(Actor akActor, FormList akEquipList, Bool akForce = false)
	; Determine item count
	Int akEquipListCount = akEquipList.GetSize()
	Int akCounter = 0

	; Unequip current items
	akActor.UnequipAll()

	; Verify added items removed
	akActor.RemoveItem(ADESRemoveItemsList)

	; Equip new items
	While akCounter < akEquipListCount
		Form akItem = akEquipList.GetAt(akCounter)
		; Remove item, to prevent duplicates
		akActor.RemoveItem(akItem)
		; Add item
		akActor.AddItem(akItem)
		; Equip item, twice because skyrim
		akActor.EquipItem(akItem, akForce)
		akActor.EquipItem(akItem, akForce)
		akCounter += 1
	EndWhile
EndFunction
; =================================

; ADES Actor Reset
; =================================
Function ADESActorReset(Actor akActor)
	; Get default actor values
	Int akAssistance = akActor.GetBaseActorValue("assistance") As Int
	Int akAggression = akActor.GetBaseActorValue("aggression") As Int
	Int akConfidence = akActor.GetBaseActorValue("confidence") As Int
	Int akMood = akActor.GetBaseActorValue("mood") As Int
	Int akMorality = akActor.GetBaseActorValue("morality") As Int

	; Set default actor values
	akActor.ForceActorValue("assistance", akAssistance)
	akActor.ForceActorValue("aggression", akAggression)
	akActor.ForceActorValue("confidence", akConfidence)
	akActor.ForceActorValue("mood", akMood)
	akActor.ForceActorValue("morality", akMorality)
EndFunction
; =================================

; ADES Clean
; Clean a quest. Clears aliases that are not actor refs, recounts, updates global variable count, stops quest if void of actor refs.
; =================================
Function ADESClean(Quest akQuest, GlobalVariable akCount, Int akMin, Int akMax, Bool akQuestStop = true)
	Int akCounter = akMin
	Int akAliasCounter = 0
	; Scratch
	ReferenceAlias akAlias
	Actor akAliasRef

	If (akQuest.IsStopped())
		akQuest.Start()
	EndIf

	While akCounter <= akMax
		akAlias = akQuest.GetAlias(akCounter) As ReferenceAlias
		akAliasRef = akAlias.GetActorReference()
		If (akAliasRef == None)
			; Clear alias, to be safe
			akAlias.Clear()
		ElseIf (akAlias != None) && (akAliasRef != None)
			; Increment alias count
			akAliasCounter += 1
		EndIf
		; Next
		akCounter += 1
	EndWhile

	; Stop quest if empty
	If (akAliasCounter == 0) && (akQuestStop == true)
		akQuest.Stop()
	EndIf

	; Debug
	If (ADESDebug.GetValueInt() == 1)
		Debug.Notification("Clean count: " + akAliasCounter)
	EndIf

	; Update counter
	akCount.SetValue(akAliasCounter)
EndFunction
; =================================

; ADES Relocate
; Move actor to object reference, evaluate package, move to package location.
; Apply new packages before using this function.
; =================================
Function ADESRelocate(Actor aaActor, ObjectReference aaLocation)
	aaActor.MoveTo(aaLocation)
	aaActor.EvaluatePackage()
	aaActor.MoveToPackageLocation()
EndFunction
; =================================