Scriptname adescheckscript extends ObjectReference  

; Config
; =================================
; Arena Checks
Bool Property CheckArena = false Auto

; Dungeon Checks
Bool Property CheckDungeonBlock01 = false Auto
Bool Property CheckDungeonBlock02 = false Auto
Bool Property CheckDungeonBlock03 = false Auto
Bool Property CheckDungeonBlock04 = false Auto
Bool Property CheckDungeonBlock05 = false Auto
Bool Property CheckDungeonBlock06 = false Auto
; =================================

; Arena
; =================================
FormList Property ADESArenaTeam01OutfitList Auto
FormList Property ADESArenaTeam02OutfitList Auto
FormList Property ADESArenaTeam03OutfitList Auto
FormList Property ADESArenaTeam04OutfitList Auto

GlobalVariable Property ADESArenaMaxCount Auto

Quest Property ADESArena0101Quest Auto
Quest Property ADESArena0102Quest Auto
Quest Property ADESArena0103Quest Auto
Quest Property ADESArena0104Quest Auto
; =================================

; Dungeon
; =================================
FormList Property ADESDungeonOutfitList Auto

GlobalVariable Property ADESDungeonMaxCount Auto

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
; =================================

; Misc
; =================================
FormList Property ADESRemoveItemsList Auto
; =================================

; ADESDevCheck
; =================================
Function ADESDevCheck(Quest aaQuest, Int aaAliasMin, Int aaAliasMax, FormList aaOutfit)
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

Event OnCellAttach()
	Int aaCountMax

	; Arena
	If (CheckArena == true)
		aaCountMax = ADESArenaMaxCount.GetValueInt()

		ADESDevCheck(ADESArena0101Quest, 1, aaCountMax, ADESArenaTeam01OutfitList)
		ADESDevCheck(ADESArena0102Quest, 1, aaCountMax, ADESArenaTeam02OutfitList)
		ADESDevCheck(ADESArena0103Quest, 1, aaCountMax, ADESArenaTeam03OutfitList)
		ADESDevCheck(ADESArena0104Quest, 1, aaCountMax, ADESArenaTeam04OutfitList)
	EndIf

	; Dungeon Block 1
	If (CheckDungeonBlock01 == true)
		aaCountMax = ADESDungeonMaxCount.GetValueInt()

		ADESDevCheck(ADESDungeon0101Quest, 1, aaCountMax, ADESDungeonOutfitList)
		ADESDevCheck(ADESDungeon0102Quest, 1, aaCountMax, ADESDungeonOutfitList)
		ADESDevCheck(ADESDungeon0103Quest, 1, aaCountMax, ADESDungeonOutfitList)
		ADESDevCheck(ADESDungeon0104Quest, 1, aaCountMax, ADESDungeonOutfitList)
		ADESDevCheck(ADESDungeon0105Quest, 1, aaCountMax, ADESDungeonOutfitList)
		ADESDevCheck(ADESDungeon0106Quest, 1, aaCountMax, ADESDungeonOutfitList)
	EndIf

	; Dungeon Block 2
	If (CheckDungeonBlock02 == true)
		aaCountMax = ADESDungeonMaxCount.GetValueInt()

		ADESDevCheck(ADESDungeon0107Quest, 1, aaCountMax, ADESDungeonOutfitList)
		ADESDevCheck(ADESDungeon0108Quest, 1, aaCountMax, ADESDungeonOutfitList)
		ADESDevCheck(ADESDungeon0109Quest, 1, aaCountMax, ADESDungeonOutfitList)
		ADESDevCheck(ADESDungeon0110Quest, 1, aaCountMax, ADESDungeonOutfitList)
		ADESDevCheck(ADESDungeon0111Quest, 1, aaCountMax, ADESDungeonOutfitList)
		ADESDevCheck(ADESDungeon0112Quest, 1, aaCountMax, ADESDungeonOutfitList)
	EndIf

	; Dungeon Block 3
	If (CheckDungeonBlock03 == true)
		aaCountMax = ADESDungeonMaxCount.GetValueInt()

		ADESDevCheck(ADESDungeon0113Quest, 1, aaCountMax, ADESDungeonOutfitList)
		ADESDevCheck(ADESDungeon0114Quest, 1, aaCountMax, ADESDungeonOutfitList)
		ADESDevCheck(ADESDungeon0115Quest, 1, aaCountMax, ADESDungeonOutfitList)
		ADESDevCheck(ADESDungeon0116Quest, 1, aaCountMax, ADESDungeonOutfitList)
		ADESDevCheck(ADESDungeon0117Quest, 1, aaCountMax, ADESDungeonOutfitList)
		ADESDevCheck(ADESDungeon0118Quest, 1, aaCountMax, ADESDungeonOutfitList)
	EndIf

	; Dungeon Block 4
	If (CheckDungeonBlock04 == true)
		aaCountMax = ADESDungeonMaxCount.GetValueInt()

		ADESDevCheck(ADESDungeon0119Quest, 1, aaCountMax, ADESDungeonOutfitList)
		ADESDevCheck(ADESDungeon0120Quest, 1, aaCountMax, ADESDungeonOutfitList)
		ADESDevCheck(ADESDungeon0121Quest, 1, aaCountMax, ADESDungeonOutfitList)
		ADESDevCheck(ADESDungeon0122Quest, 1, aaCountMax, ADESDungeonOutfitList)
		ADESDevCheck(ADESDungeon0123Quest, 1, aaCountMax, ADESDungeonOutfitList)
		ADESDevCheck(ADESDungeon0124Quest, 1, aaCountMax, ADESDungeonOutfitList)
	EndIf

	; Dungeon Block 5
	If (CheckDungeonBlock05 == true)
		aaCountMax = ADESDungeonMaxCount.GetValueInt()

		ADESDevCheck(ADESDungeon0125Quest, 1, aaCountMax, ADESDungeonOutfitList)
		ADESDevCheck(ADESDungeon0126Quest, 1, aaCountMax, ADESDungeonOutfitList)
		ADESDevCheck(ADESDungeon0127Quest, 1, aaCountMax, ADESDungeonOutfitList)
		ADESDevCheck(ADESDungeon0128Quest, 1, aaCountMax, ADESDungeonOutfitList)
		ADESDevCheck(ADESDungeon0129Quest, 1, aaCountMax, ADESDungeonOutfitList)
		ADESDevCheck(ADESDungeon0130Quest, 1, aaCountMax, ADESDungeonOutfitList)
	EndIf

	; Dungeon Block 6
	If (CheckDungeonBlock06 == true)
		aaCountMax = ADESDungeonMaxCount.GetValueInt()

		ADESDevCheck(ADESDungeon0131Quest, 1, aaCountMax, ADESDungeonOutfitList)
		ADESDevCheck(ADESDungeon0132Quest, 1, aaCountMax, ADESDungeonOutfitList)
		ADESDevCheck(ADESDungeon0133Quest, 1, aaCountMax, ADESDungeonOutfitList)
		ADESDevCheck(ADESDungeon0134Quest, 1, aaCountMax, ADESDungeonOutfitList)
		ADESDevCheck(ADESDungeon0135Quest, 1, aaCountMax, ADESDungeonOutfitList)
		ADESDevCheck(ADESDungeon0136Quest, 1, aaCountMax, ADESDungeonOutfitList)
	EndIf
EndEvent